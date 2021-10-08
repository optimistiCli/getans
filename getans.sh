#!/bin/bash

if [ "$1" = '-h' -o "$1" = '--help' ] ; then
cat <<EOF
Usage: ${0##*/} [<prompt>] [<default>]
  prompt  - A yes or no question; for example: 'Exit now?'
  default - Default choice if user hits Enter; valid values: y and n
EOF
exit
fi

if [ -n "$1" ] ; then
    PROMPT="$1"
else
    PROMPT='What would it be?'
fi

case "$2" in
    [yY]*)
        TR_S1='\n\rYN'
        TR_S2='yyyn'
        YN='[Y/n]'
        ;;
    [nN]*)
        TR_S1='\n\rYN'
        TR_S2='nnyn'
        YN='[y/N]'
        ;;
    *)
        TR_S1='YN'
        TR_S2='yn'
        YN='[y/n]'
        ;;
esac

while true ; do 
    IFS='' read -rs -d '' -n 1 -p "$PROMPT $YN : " INP
    ANS="$(printf %s "$INP" | tr "$TR_S1" "$TR_S2")"
    if [ "$ANS" == 'y' -o "$ANS" == 'n' ] ; then 
        echo "$ANS"
        break
    fi
    printf %s $'\r'
done

if [ "$ANS" == 'y' ] ; then
    exit 0
else
    exit 1
fi


