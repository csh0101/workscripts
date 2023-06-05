#!/bin/bash

# This script creates a new user on the local system.
# You will be prompted to enter the username (login) and the group name.

# Ask for the username.
read -p 'Enter the username to create: ' username

# Ask for the group name.
read -p 'Enter the group name of the user: ' groupname

# Check if the group exists, create it if it doesn't.
if ! grep -q "^${groupname}:" /etc/group
then
  groupadd "${groupname}"
  echo "Group ${groupname} has been created."
fi

# Create the user with the input information, set the group, and disable shell login.
useradd -M -s /sbin/nologin -g "${groupname}" "${username}"

# Check to see if the useradd command succeeded.
if [ "${?}" -ne 0 ]
then
  echo 'The account could not be created.'
  exit 1
fi

# Display the username, group name, and host where the user was created.
echo "The account for ${username} with group ${groupname} was created successfully."
