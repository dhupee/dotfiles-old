#!/usr/bin/env bash

# status: operational

dir_array=(
    "$HOME/.backup_bottles/"
    "$HOME/.scripts/"
    "$HOME/.config/btop/"
)

file_array=(
    "$HOME/.zshrc"
    "$HOME/.gitconfig"
    "$HOME/.p10k.zsh"
    "$HOME/.bashrc"
)

#----------------------SAVING FILES AND DIRS----------------------

for d in "${dir_array[@]}";do
    if [ -d $d ];then
                
        # echo "$d exists"
        echo "adding $d"
    else
        echo "$d is not exists"
        read -p "Would you like to make one? (y/n)?" choice
        case "$choice" in 
        y|Y ) echo "yes, creating directory $d" && echo "boo!";;
        n|N ) echo "skipping";;
        * ) echo "invalid";;
        esac

    fi
    chezmoi add $d
done

for f in "${file_array[@]}";do
    if [ -f $f ];then
        echo "adding $f"
    else
        echo "$f is not exists"
        echo ""
    fi

    chezmoi add $f
done

#---------------------------COMMIT TO GIT----------------------

# pushing to github
cd $HOME/.local/share/chezmoi
git add .
git commit -m "auto update"
git push
