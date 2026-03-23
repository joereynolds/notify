# Pings my phone when certain shit hits certain fans

check_website() {
    curl -Is https://$1 | head -n 1 | grep "200" || curl -H "Title: $1 is down" -d "" ntfy.sh/joe-reynolds-general-dump
}

check_website "joereynolds.uk"
check_website "kingleech.uk"
check_website "ragaoftheweek.com"
check_website "thegoodgamefactory.com"


# TODO - Notify when a thing has finished downloading
# TODO - notify when someone SSHs into my box(es)
# TODO - notify when VPN has ran out of credits
# TODO - random cat picture at 12
# TODO - low disk space
# TODO - High cpu load
