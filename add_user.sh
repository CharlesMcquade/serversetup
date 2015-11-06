#!/bin/bash



if [ -z "$1" ] || [ -z "$2" ]; then
  echo "Usage: $0 USER PUB_KEY_FILE"
  echo "Example: $0 /path/to/foo"
  exit 1
fi

USER="$1"
$PUB_KEY_FILE="$2"

# create user`
adduser --shell /bin/bash --gecos "User" --home /home/$USER $USER
adduser $USER sudo



# Copy the public key to the non-root user
mkdir /home/$USER/.ssh
cat $PUB_KEY_FILE >> /home/$USER/.ssh/authorized_keys
chown -R $USER:$USER /home/$USER/.ssh