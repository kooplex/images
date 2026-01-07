#! /bin/bash
# Author: Stéger, József
# Summary: walks through directories in the cert folder, which correspond to FQDN, and 
#          checks if a https handshake is possible, and whether the certificate is expired
#          in STDERR it reports how many days are left until expiry
#          in STDOUT it reports the list of FQDN expired

wd=/etc/letsencrypt/live
now=$(date +%s)

echo "Walking in $wd..." >&2

tabs 60 >&2

for f in $wd/* ; do
    [ -d $f ] || continue
    domain=$(basename $f)
    echo -n -e "    -> TESTING ${domain}\t" >&2
    timeout 2 openssl s_client -connect ${domain}:443 -servername ${domain} < /dev/null 2> /dev/null > /dev/null
    EXIT=$?
    if [ $EXIT -eq 0 ] ; then
        expiry=$(openssl s_client -connect ${domain}:443 -servername ${domain} < /dev/null 2> /dev/null | openssl x509 -noout  -dates | grep ^notAfter | cut -f2 -d=)
        unixts=$(date -d "${expiry}" +%s)
        if [ $now -lt $unixts ] ; then
            s=$(( $unixts - $now ))
            d=$(( $s / 86400 ))
            echo "OKAY left: $d days" >&2
        else
            echo "EXPIRED ($EXIT)" >&2
            echo $domain
        fi
    else
        echo "UNABLE TO CONNECT ($EXIT)" >&2
    fi
done

