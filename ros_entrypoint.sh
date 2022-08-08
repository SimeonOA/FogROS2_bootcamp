#!/bin/bash                                                                                                                                         
set -e

if [[ -z "$USER" || -z "$HOME" || -z "$USER_ID" || -z "$GROUP_ID" || -z "$WORKDIR" ]] ; then
    echo "One or more required environment variables is not defined."
    exit 1
fi

echo "Starting with USER: $USER, UID: $USER_ID, GID: $GROUP_ID"
useradd -s /bin/bash -d "$HOME" -u "$USER_ID" -g "$GROUP_ID" -G sudo -N -o -c "local user" -M "$USER"

# Fix up permissions for all parent directories of WORKDIR so that
# they're owned by the user we just created.  All directories between
# / or $HOME and $WORKDIR will be created automatically, but with the
# wrong user.
dir="$WORKDIR"
while [[ "$dir" != "/" && "$dir" != "$HOME" ]] ; do
    chown "$USER_ID:$GROUP_ID" "$dir"
    dir="$(dirname -- "$dir")"
done

# On the chance that $WORKDIR is not in $HOME, we need to create $HOME
mkdir -p "$HOME"

chown "$USER_ID:$GROUP_ID" "$HOME"

gosu "$USER_ID:$GROUP_ID" cp -rT /etc/skel "$HOME"

# setup ros2 environment
echo 'source "/opt/ros/$ROS_DISTRO/setup.bash" --' >> "$HOME/.bashrc"
exec gosu "$USER_ID:$GROUP_ID" "$@"
