#!/bin/bash

# Put this on your Droplet or whatever. It'll notify you 
# when someone sshs in

# List of IPs to ignore (Ploi workers and monitors)
IGNORE_IPS=("94.237.47.71" "94.237.51.22" "5.22.210.148" "209.50.49.15" "95.111.198.27" "94.237.42.145" "94.237.102.252")

# Check if the current login IP is in our ignore list
for IP in "${IGNORE_IPS[@]}"; do
    if [ "$PAM_RHOST" == "$IP" ]; then
        exit 0
    fi
done

# Standard filters: skip logout and internal system tasks (empty RHOST)
if [ "$PAM_TYPE" != "close_session" ] && [ -n "$PAM_RHOST" ]; then
    HOST=$(hostname)
    USER=$PAM_USER
    IP=$PAM_RHOST

    URL="ntfy.sh/xxx"

    curl -H "Title: Login on $HOST" \
         -d "User $USER connected from $IP" \
         $URL > /dev/null 2>&1
fi

# Add this line to /etc/pam.d/sshd for it to work
# session optional pam_exec.so seteuid /usr/local/bin/login-notify.sh
