#!/bin/sh

FLAGS="--path $TS_PATH --logpath $TS_LOGPATHDIR --port $TS_PORT"

[ ! -z "$TS_WEBLOGFILE" ] && echo "TS_WEBLOGFILE: $TS_LOGPATHDIR/$TS_WEBLOGFILE" && FLAGS="${FLAGS} --weblogpath $TS_LOGPATHDIR/${TS_WEBLOGFILE}"
[ ! -z "$TS_RDB" ] | [ "$TS_RDB" = "true" ] && echo "TS_RDB: $TS_RDB" && FLAGS="${FLAGS} --rdb"
[ ! -z "$TS_HTTPAUTH" ] && echo "TS_HTTPAUTH: $TS_HTTPAUTH" && FLAGS="${FLAGS} --httpauth"
[ ! -z "$TS_DONTKILL" ] && echo "TS_DONTKILL: $TS_DONTKILL" && FLAGS="${FLAGS} --dontkill"
[ ! -z "$TS_TORRENTSDIR" ] && echo "TS_TORRENTSDIR: $TS_TORRENTSDIR" && FLAGS="${FLAGS} --torrentsdir ${TS_TORRENTSDIR}"
[ ! -z "$TS_TORRENTADDR" ] && echo "TS_TORRENTADDR: $TS_TORRENTADDR" && FLAGS="${FLAGS} --torrentaddr ${TS_TORRENTADDR}"
[ ! -z "$TS_PUBIPV4" ] && echo "TS_PUBIPV4: $TS_PUBIPV4" && FLAGS="${FLAGS} --pubipv4 ${TS_PUBIPV4}"
[ ! -z "$TS_PUBIPV6" ] && echo "TS_PUBIPV6: $TS_PUBIPV6" && FLAGS="${FLAGS} --pubipv6 ${TS_PUBIPV6}"
[ ! -z "$TS_SEARCHWA" ]&& echo "TS_SEARCHWA: $TS_SEARCHWA" && FLAGS="${FLAGS} --searchwa"

if [ ! -d $TS_PATH ]; then
  mkdir -p $TS_PATH
fi

if [ ! -d $TS_TORRENTSDIR ]; then
  mkdir -p $TS_TORRENTSDIR
fi

if [ ! -f $TS_LOGPATHDIR ]; then
  mkdir -p $TS_LOGPATHDIR
fi

echo "Running with: ${FLAGS}"

exec torrserver $FLAGS
