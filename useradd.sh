#!/bin/bash

# This script creates a new user on the local system.
# You will be prompted to enter the username (login), the person name, and the password.

# Ask for the username.
read -p 'Enter the username to create: ' username

# Ask for the real name.
read -p 'Enter the real name of the user: ' realname

# Ask for the group name.
read -p 'Enter the group name of the user: ' groupname

# Create the user with the input information and set the group.
useradd -c "${realname}" -g "${groupname}" "${username}"

# Check to see if the useradd command succeeded.
if [ "${?}" -ne 0 ]
then
  echo 'The account could not be created.'
  exit 1
fi

# Display the username, password, and host where the user was created.
echo "The account for ${realname} with username ${username} was created successfully."
