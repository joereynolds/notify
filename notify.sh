# Pings my phone when certain shit hits certain fans

curl -s https://joereynolds.uk/ | grep -q Joe || curl -H "Title: joereynolds.uk is down" -d "" ntfy.sh/joe-reynolds-general-dump
curl -s https://kingleech.uk/ | grep -q Joe || curl -H "Title: kingleech.uk is down" -d "" ntfy.sh/joe-reynolds-general-dump
curl -s https://ragaoftheweek.com/ | grep -q weeks || curl -H "Title: ragaoftheweek is down" -d "" ntfy.sh/joe-reynolds-general-dump
curl -s https://thegoodgamefactory.com/ | grep -q evidence || curl -H "Title: thegoodgamefactory is down" -d "" ntfy.sh/joe-reynolds-general-dump

# TODO - Notify when a thing has finished downloading
# TODO - notify when someone SSHs into my box(es)
# TODO - notify when VPN has ran out of credits
# TODO - random cat picture at 12
# TODO - low disk space
# TODO - High cpu load
