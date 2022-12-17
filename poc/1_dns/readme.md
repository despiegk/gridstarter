
# local coredns

- install coredns
- there is a test in the run.sh to show the record
- info: https://coredns.io/plugins/log/

## ansible (not really needed)

see https://github.com/cloudalchemy/ansible-coredns

## format dns

- https://en.wikipedia.org/wiki/Zone_file#Example_file

# to test

- https://www.nslookup.io/domains/threefold.com/dns-records/soa/
- https://www.whatsmydns.net/dns-lookup?query=play.refit.earth&server=opendns

# example to configure subdomain


```
A       nsplay.refit.earth      195.192.213.92
NS      play.refit.earth        nsplay.refit.earth

```

NS record points to an exsing A record for the play domain

