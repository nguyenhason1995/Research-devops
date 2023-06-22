
#!/bin/bash

#This script generates a random password.
# This user can set the password length with -l and add a special charater with -s
# Verbose mod can be enabled with -v

# Set a default password length
LENGTH=48

while getopts vl:s OPTION
