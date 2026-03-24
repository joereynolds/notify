# Pings my phone when certain shit hits certain fans
# Change topic to your topic obvs
TOPIC="https://ntfy.sh/xxx"

check_website() {
    curl -Is https://$1 | head -n 1 | grep "200" || curl -H "Title: $1 is down" -d "" $TOPIC
}

check_disk_space() {
    THRESHOLD=85
    USAGE=$(df "$1" | grep / | awk '{ print $5 }' | sed 's/%//g')

    if [ "$USAGE" -gt "$THRESHOLD" ]; then
        curl -H "Title: Disk Space Low" \
             -d "Disk is ${USAGE}% full on $(hostname): $1" \
             $TOPIC
    fi
}

check_website "joereynolds.uk"
check_website "kingleech.uk"
check_website "ragaoftheweek.com"
check_website "thegoodgamefactory.com"

check_disk_space /
# check_disk_space /dev/sda2 # only on my debian box

# TODO - random cat picture at 12
