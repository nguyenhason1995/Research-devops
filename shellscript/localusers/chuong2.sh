#Giai bai tap chuong 2:
#!/bin/bash
#This script creates a new user on the local system.
# You must supply a username as an argument to the script.
# Optionally, you can also provide a comment for the account as an argument
# A password will be automatically generated for the account.
# The username, password, and host for the account will be displayed.
#trên là hind

# Make sure the script is being executed with superuser privileges.

if [[ "${UID}" -ne 0 ]]
then
 echo 'Please run with sudo or as root.'
 exit 1
fi
# If they don't supply at least one argument, then give them help
if [[ "${#}" -lt 1 ]]
then
  echo "Usage: ${0} USER_NAME [COMMENT]..."
  echo 'Create an account on the local system with the name of USER_NAME and a comments field of COMMENT.'
  exit 1
fi

# The first parameter is the user name
USER_NAME="${1}
# The rest of the parameters are for the account comment.
shift
COMMENT="${@}"

# Generate a password

PASSWORD=$(date +%s%N | sha256sum | head -c48)
# Create the user with the password.
useradd -c "${COMMENT}" -m ${USER_NAME}
# Check to see if the useradd command succeeded
# We don't want to tell the user that an account was created when it hasnt been.
if [[ "${?}" -ne 0 ]]
then
  echo 'The account could not be create.'
  exit 1
fi

# Set the password.
echo ${PASSWORD} | passwd stdin ${USER_NAME}

# Check to see if the passwd command succeeded.
if [[ "${?}" -ne 0]]
then
  echo 'The passwd for the account could not be set.'
  exit 1
fi
# Force passwd change on first login
passwd -e ${USER_NAME}
# Display the username,passwd, and the host where the user was created.
echo
echo 'username:'
echo 
echo 'password:'
echo 
#echo 'host:'
#echo "${HOSTNAME}"
exit 0
 

