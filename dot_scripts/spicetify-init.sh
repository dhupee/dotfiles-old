#!/bin/bash

cd $HOME
# downloading the themes i used
if [ -d "$HOME/.config/spicetify/Themes/" ]; then
	if [ -d "/tmp/spicetify-themes/" ]; then
		echo "Spicetify Themes already exist"
	else
		echo "Downloading Spicetify Themes"
		git clone --depth=1 https://github.com/spicetify/spicetify-themes.git /tmp/spicetify-themes
	fi	
	cd /tmp/spicetify-themes
	cp -r * ~/.config/spicetify/Themes
	echo "success initialized Spicetify Themes"
else
	echo "downloading Spicetify Themes failed"
fi

cd $HOME
if [ -d "$HOME/.config/spicetify/Extensions/" ]; then
	if [ -d "/tmp/spicetify-extensions/" ]; then
		echo "Spicetify Extensions already exist"
	else
		echo "Downloading Spicetify Extensions"
		git clone --depth=1 https://github.com/CharlieS1103/spicetify-extensions.git /tmp/spicetify-extensions
	fi	
	cd /tmp/spicetify-extensions
	find /tmp/spicetify-extensions -type f -name "*.js" | xargs -I {} cp {} ~/.config/spicetify/Extensions
	echo "success initialized Spicetify Extensions"
else
	echo "downloading Spicetify Extensions failed"
fi
cd $HOME
