#!/usr/bin/bash

compile_cpp() {
    g++ "$1" -o "$2"
}

compile_c() {
    gcc "$1" -o "$2"
}

compile_java() {
    javac "$1"
}

cleanup() {
    tput cnorm
}

trap cleanup EXIT
tput civis
clear

file_extension1="${2##*.}"
file_extension2="${3##*.}"

compile_files() {
    case "$1" in
        cpp)
            compile_cpp "$2" "$3"
            ;;
        c)
            compile_c "$2" "$3"
            ;;
        java)
            # compile_java "$2"
            ;;
        *)
            echo "Unsupported file extension: $1"
            exit 1
            ;;
    esac
}

compile_files "$file_extension1" "$2" "a"
compile_files "$file_extension2" "$3" "b"
compile_cpp "$4" "gen"

mkdir ccmp
inpu="ccmp/input.txt"
aout="ccmp/a_output.txt"
bout="ccmp/b_output.txt"

rm $aout $bout
touch $aout $bout

progressBar=''
i=1
prev_perc=0
curr_perc=0

while diff $aout $bout
do
    ((curr_perc=i*100/$1))

    case "$file_extension1" in
        cpp|c)
            ./gen > $inpu
            ./a < $inpu > $aout
            ;;
        java)
            java $2 < $inpu > $aout
            ;;
    esac

    case "$file_extension2" in
        cpp|c)
            ./b < $inpu > $bout
            ;;
        java)
            java $3 < $inpu > $bout
            ;;
    esac

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

rm gen

if [ $file_extension1 != "java" ]; then
    rm a
fi

if [ $file_extension2 != "java" ]; then
    rm b
fi

if [ $i == $1 ]; then
    rm -rf ccmp/
fi