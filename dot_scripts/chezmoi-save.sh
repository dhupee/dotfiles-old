#!/usr/bin/bash

# status: operational

dir_array=(
    "$HOME/.backup-bottles/"
    "$HOME/.scripts/"
    "$HOME/.config/htop/"
    "$HOME/.config/btop/"
    "$HOME/.config/neofetch/"
    "$HOME/Wallpapers/"
    "$HOME/.fonts/"
    "$HOME/.completion_zsh/"
    "$HOME/.config/micro/"
    "$HOME/.config/nvim/"
    "$HOME/.config/nvchad.bak/"
    "$HOME/.config/PrusaSlicer/"
    "$HOME/.config/obs-studio/basic/"
)

file_array=(
    "$HOME/.zshrc"
    "$HOME/.gitconfig"
    "$HOME/.p10k.zsh"
    "$HOME/.bashrc"
    "$HOME/.nanorc"
    "$HOME/.aliases.sh"
    "$HOME/.fonts.conf"	
    "$HOME/.config/spicetify/config-xpui.ini"
    "$HOME/.config/obs-studio/global.ini"
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

echo " "

#---------------------------COMMIT TO GIT----------------------

# pushing to github
cd $HOME/.local/share/chezmoi
git add .
# git commit -m "automated update by dhupee"
git commit -m "automated update by dhupee, at $(date +'%H:%M %d/%m/%Y')"
git push
sleep 3
echo " "

# if no-konsave flag then dont save konsave profiles
if [ "$1" != "--no-konsave" ]; then
    # pushing the big files to google drive
    echo "Pushing konsave profiles to gdrive"
    rclone delete gdrive-dh:konsave-profiles/
    rclone copy "$HOME/.konsave-profiles/" gdrive-dh:konsave-profiles/ -P  
fi