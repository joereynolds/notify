#!/bin/bash

# Put this on your Droplet or whatever. It'll notify you 
# when someone sshs in

# Only run on "open_session" (login), skip on "close_session" (logout)
if [ "$PAM_TYPE" != "close_session" ]; then
    HOST=$(hostname)
    USER=$PAM_USER
    IP=$PAM_RHOST

    URL="ntfy.sh/joe-reynolds-general-dump"

    curl -H "Login into Droplet" \
         -d "Login detected on $HOST: User $USER from $IP" \
         $URL > /dev/null 2>&1
fi

# Add this line to /etc/pam.d/sshd for it to work
# session optional pam_exec.so seteuid /usr/local/bin/login-notify.sh
