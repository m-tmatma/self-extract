#! /bin/bash -x
DESTINATION=/tmp/outdir

rm -rf $DESTINATION
mkdir -p $DESTINATION

ENDLINE=$(grep --line-number --text "^##ENDLINE$" $0 | sed 's/:.*//') 
tail --lines=+$(($ENDLINE + 1)) $0 \
| gzip --decompress --to-stdout    \
| tar --extract --directory $DESTINATION

########## INSTALL_PROCESS ##########
## ln -sやcpでリソースファイルを設置する.
## リソースファイルは$DESTINATIONに格納されています。
#####################################

find $DESTINATION

rm -rf $DESTINATION

exit
##ENDLINE
