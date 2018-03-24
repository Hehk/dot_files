#!/bin/sh

dir=~/dot_files
old_dir=~/dot_files/old
error_file=~/dot_files/.install_errors
files=".bashrc .vimrc .vim .gitconfig .tmux.conf"

printf "Creating $old_dir for backup of any existing dotfiles\n"
mkdir -p $old_dir 2>> $error_file
printf "...done\n\n"

printf "Changing to the $dir directory\n"
cd $dir 2>> $error_file
printf "...done\n\n"


printf "Moving any existing dotfiles from ~ to $olddir\n\n"
for file in $files; do
	printf "=> Archiving old $file\n"
	mv ~/$file $old_dir 2>> $error_file
	printf "=> Creating sumlink to $file in home directory\n\n"
	ln -s $dir/$file ~/$file 2>> $error_file
done
printf "...done\n"

source ~/.bashrc 2>> $error_file
source ~/.vimrc 2>> $error_file

# Add terminal config for italics
tic "$dir/xterm-256color-italic.terminfo"
tic "$dir/tmux-256color-italic.terminfo"

# Add global gitignore
git config --global core.excludesfile $dir/.gitignore_global

if grep -q Ubuntu /etc/*release; then
  printf "=> Running custom commands for ubuntu"

  # updates to repository that has vim 8
  add-apt-repository ppa:jonathonf/vim
  apt update
  apt install -y vim

  # add repository with node 8
  curl -sL https://deb.nodesource.com/setup_8.x | sudo -E bash -
  apt-get install -y nodejs
fi

# Running OS specific config
if uname -s | grep -q Darwin; then
  bash ./install-mac.sh
fi
