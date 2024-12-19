#!/bin/sh

FLAGS=""

#sets start flags
[ ! -z "$TS_PORT" ] && echo "TS_PORT: $TS_PORT" && FLAGS="${FLAGS} --port ${TS_PORT}"
[ ! -z "$TS_PATH" ] && echo "TS_PATH: $TS_PATH" && FLAGS="${FLAGS} --path ${TS_PATH}"
[ ! -z "$TS_LOGPATHDIR" ] && echo "TS_LOGPATHDIR: $TS_LOGPATHDIR" && FLAGS="${FLAGS}"
[ ! -z "$TS_LOGFILE" ] && echo "TS_LOGFILE: $TS_LOGPATHDIR/$TS_LOGFILE" && FLAGS="${FLAGS} --logpath $TS_LOGPATHDIR/${TS_LOGFILE}"
[ ! -z "$TS_WEBLOGFILE" ] && echo "TS_WEBLOGFILE: $TS_LOGPATHDIR/$TS_WEBLOGFILE" && FLAGS="${FLAGS} --weblogpath $TS_LOGPATHDIR/${TS_WEBLOGFILE}"
[ ! -z "$TS_RDB" ] | [ "$TS_RDB" = "true" ] && echo "TS_RDB: $TS_RDB" && FLAGS="${FLAGS} --rdb"
[ ! -z "$TS_HTTPAUTH" ] && echo "TS_HTTPAUTH: $TS_HTTPAUTH" && FLAGS="${FLAGS} --httpauth"
[ ! -z "$TS_DONTKILL" ] && echo "TS_DONTKILL: $TS_DONTKILL" && FLAGS="${FLAGS} --dontkill"
[ ! -z "$TS_TORRENTSDIR" ] && echo "TS_TORRENTSDIR: $TS_TORRENTSDIR" && FLAGS="${FLAGS} --torrentsdir ${TS_TORRENTSDIR}"
[ ! -z "$TS_TORRENTADDR" ] && echo "TS_TORRENTADDR: $TS_TORRENTADDR" && FLAGS="${FLAGS} --torrentaddr ${TS_TORRENTADDR}"
[ ! -z "$TS_PUBIPV4" ] && echo "TS_PUBIPV4: $TS_PUBIPV4" && FLAGS="${FLAGS} --pubipv4 ${TS_PUBIPV4}"
[ ! -z "$TS_PUBIPV6" ] && echo "TS_PUBIPV6: $TS_PUBIPV6" && FLAGS="${FLAGS} --pubipv6 ${TS_PUBIPV6}"
[ ! -z "$TS_SEARCHWA" ]&& echo "TS_SEARCHWA: $TS_SEARCHWA" && FLAGS="${FLAGS} --searchwa"

#make directories
[ ! -z "$TS_PATH" ] && [ ! -d "$TS_PATH" ] && mkdir -p $TS_PATH
[ ! -z "$TS_LOGPATHDIR" ] && [ ! -d "$TS_LOGPATHDIR" ] && mkdir -p $TS_LOGPATHDIR
[ ! -z "$TS_TORRENTSDIR" ] && [ ! -d "$TS_TORRENTSDIR" ] && mkdir $TS_TORRENTSDIR

echo "Running with: ${FLAGS}"

exec torrserver $FLAGS
