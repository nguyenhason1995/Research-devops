#!/bin/bash

log() {
# This function sends a message to syslog and to standard output if VERBOSE is true.

  local MESSAGE="${@}"
  if [[ "${VERBOSE}" = 'true' ]]
  then
    echo "${MESSAGE}"
  fi
  logger -t luser-demo10.sh "${MESSAGE}"
}

readonly VERBOSE='true'
log 'Hello'
log 'This is funtion'

backup_file() {
# This fuction creates a backup of a file. Returns non-zero status on error
 local FILE="${1}"
# Make sure the file exists.
 if [[ -f "${FILE}" ]]
 then
   local BACKUP_FILE="/var/tmp/$(basename ${FILE}).$(date +%F-%N)"
#basename: loai bo duong dan, chi ghi ten tep
# F: viet tat ngay day du va no hien thi nam, thang, ngay
   
   log "Backing up ${FILE} to ${BACKUP_FILE}."
# the exit status of the function will be the exit status of the cp command
   cp -p ${FILE} ${BACKUP_FILE}
  else
# The file does not exist, so return a non-zero exit status
    return 1
   fi
}

# bien local giup cho cac bien,ky tu chi hoat dong trong ham
 
backup_file '/etc/passwd'

