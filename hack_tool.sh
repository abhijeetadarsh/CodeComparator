#!/usr/bin/bash

g++ $2 -o a
g++ $3 -o b
g++ $4 -o gen
# java Main.java < $inpu > $bout

mkdir ccmp
inpu="ccmp/input.txt"
aout="ccmp/a_output.txt"
bout="ccmp/b_output.txt"

rm $aout $bout
touch $aout $bout
function cleanup() {
    tput cnorm
}
trap cleanup EXIT


tput civis
clear
progressBar=''
i=1
prev_perc=0
curr_perc=0
while diff $aout $bout
do
    ((curr_perc=i*100/$1))
    ./gen > $inpu
    ./a < $inpu > $aout
    ./b < $inpu > $bout
    if [ $prev_perc != $curr_perc ]; then
        progressBar+='#'
    fi
    clear
    echo "$curr_perc%"
    echo $progressBar


    if [ $i == $1 ]; then
        break
    fi
    ((i++))
    ((prev_perc=curr_perc))
done

rm a b gen
if [ $i == $1 ]; then
    rm -rf ccmp/
fi