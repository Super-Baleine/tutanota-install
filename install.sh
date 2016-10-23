#!/usr/bin/env bash
read -p "Enter the path you wanna see the webapp installed
> " tutapath
if [[ -d ../$tutapath ]]; then
	cd $tutapath
else
	cd /home/$USER;
	mkdir Tutanota
	cd Tutanota
fi
apt-get update
apt-get install git nodejs npm
git clone https://github.com/tutao/tutanota.git
npm install -g gulp
npm install
gulp dist
cd build
unset tutapath
read -p "Do you wanna launch now ? (y|n)" nyes
if [[ $nyes = "y" ]]; then
	firefox index.html
	exit 0;
fi
