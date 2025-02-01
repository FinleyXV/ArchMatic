#!/usr/bin/env bash
#-------------------------------------------------------------------------
#      _          _    __  __      _   _
#     /_\  _ _ __| |_ |  \/  |__ _| |_(_)__
#    / _ \| '_/ _| ' \| |\/| / _` |  _| / _|
#   /_/ \_\_| \__|_||_|_|  |_\__,_|\__|_\__|
#  Arch Linux Post Install Setup and Config
#-------------------------------------------------------------------------

echo -e "\nINSTALLING AUR SOFTWARE\n"
# You can solve users running this script as root with this and then doing the same for the next for statement. However I will leave this up to you.

echo "CLONING: YAY"
cd ~
git clone "https://aur.archlinux.org/yay.git"
cd ${HOME}/yay
makepkg -si --noconfirm
cd ~
touch "$HOME/.cache/zshhistory"
git clone "https://github.com/ChrisTitusTech/zsh"
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git $HOME/powerlevel10k
ln -s "$HOME/zsh/.zshrc" $HOME/.zshrc


cat <<EOF >> /home/$(whoami)/.config/mpv/mpv.conf
vo=vdpau
profile=opengl-hq
hwdec=vdpau
hwdec-codecs=all
scale=ewa_lanczossharp
cscale=ewa_lanczossharp
interpolation
tscale=oversample
EOF

export PATH=$PATH:~/.local/bin
cp -r $HOME/ArchMatic/dotfiles/* $HOME/.config/
pip install konsave
konsave -i $HOME/ArchMatic/kde.knsv
sleep 1
konsave -a kde

echo -e "\nDone!\n"
exit
