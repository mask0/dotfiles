CURRENTUSER=`whoami`

sudo echo "apt-get"
sudo apt-get -y update
sudo apt-get -y upgrade

#
#utilities
#
echo "install linux utilities"
sudo apt-get -y install zsh nkf gcc emacs24 emacs24-el emacs-mozc git ibus-mozc cinnamon
sudo apt-get -y install $(check-language-support)
sudo apt-get -y autoclean
sudo apt-get -y autoremove

#
#config
#
git config --global user.name "mask0"
git config --global user.email "takashi.higasa@gmail.com"

#
#make dotfiles
#
cd ${HOME}
mkdir dotfiles
cd dotfiles
git init
#git remote add dotfiles http://github.com/mask0/dotfiles.git
#git pull dotfiles master
cd ${HOME}

#
#symbolic link
#
ln -s dotfiles/.emacs.d
ln -s dotfiles/zsh/.zshenv
ln -s dotfiles/zsh/.zshrc
#ln -s dotfiles/.screenrc
ln -s dotfiles/.dir_colors

ZSH_PATH=`which zsh`
sudo chsh -s ${ZSH_PATH} ${CURRENTUSER}
im-config -n fcitx
echo -e "\e[31mcomplete\e[m"

