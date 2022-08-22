#!/usr/bin/env bash

# status: not done yet

dir_array=(
    "$HOME/.backup_bottles/"
    "$HOME/.backup_nothing/"
)

file_array=(
    "$HOME/.zshrc"
    "$HOME/.anyfile"
)

for d in "${dir_array[@]}";do
    if [ -d $d ];then
                
        echo "$d exists"
        echo ""
    else
        echo "$d is not exists"
        read -p "Would you like to make one? (y/n)?" choice
        case "$choice" in 
        y|Y ) echo "yes, creating directory $d" && echo "boo!";;
        n|N ) echo "skipping";;
        * ) echo "invalid";;
        esac
    fi
done

for f in "${file_array[@]}";do
    if [ -f $f ];then
        echo "$f exists"
        echo ""
    else
        echo "$f is not exists"
        echo ""
    fi
done