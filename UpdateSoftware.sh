#!/bin/sh

# homebrew
echo "Checking homebrew packages..."
sudo -u mowi6001 brew update > /dev/null;
new_packages=$(brew outdated --quiet)
num_packages=$(echo $new_packages | wc -w)

if [ $num_packages -gt 0 ]; then
    echo "New package updates available:"
    for package in $new_packages; do
	echo "   * $package";
    done
else
    echo "No new package updates available."
fi

# install Brew Packages
echo "Update Brew Packages? [y/n]"
read answer
if [ $answer = "y" ]
	then
	sudo -u mowi6001 brew upgrade
	sudo -u mowi6001 brew update
fi

# macOS
echo "Checking macOS updates..."
sudo -u mowi6001 softwareupdate -l

# Update Mac Software
echo "Update Mac Software? [y/n]"
read answer
if [ answer = "y" ]
	then
	softwareupdate -i -a
fi