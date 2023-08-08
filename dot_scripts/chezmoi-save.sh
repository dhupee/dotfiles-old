#!/usr/bin/bash

# status: operational

dir_array=(
    "$HOME/.backup_bottles/"
    "$HOME/.scripts/"
    "$HOME/.config/htop/"
    "$HOME/.config/neofetch/"
    "$HOME/.local/share/wallpapers/"
    "$HOME/.fonts/"
	"$HOME/.config/micro/"
	"$HOME/.config/PrusaSlicer/"	
)

file_array=(
    "$HOME/.zshrc"
    "$HOME/.gitconfig"
    "$HOME/.p10k.zsh"
    "$HOME/.bashrc"
    "$HOME/.nanorc"
    "$HOME/.aliases.sh"
    "$HOME/.fonts.conf"	
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
        y|Y ) echo "yes, creating directory $d" && mkdir $d;;
        n|N ) echo "skipping";;
        * ) echo "choice is invalid";;
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
git commit -m "automated update by dhupee"
git push
