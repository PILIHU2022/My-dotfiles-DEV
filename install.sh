#!/bin/bash
# Written in bash by PILIHU with Republic-Of-Lunar's help
clear
# 声明
echo '------声明------'
echo "本install.sh用于安装PILIHU2022/My-dotfiles"
echo '本install.sh是默认您使用Arch Linux系统'
echo '为了防止脚本误操作，请您先创建快照！'
echo '若你想手动安装，请执行完本脚本第一步之后退出脚本！'
echo '------End------'
# echo ''
read -p '同意请按"y"以继续，不同意请按"n"退出脚本 ' press
# y/n
# y=y
# n=n
# 函数:用户已同意
#user_yes(){
    # 用户同意以后
# }
# 确认用户是否同意
if [[ $press == 'y' ]]; then
    echo "感谢支持！"
else
    exit
fi
clear
# 询问是否安装Git
read -p '是否安装Git：y/n' install_git
if [[ $install_git == 'y' ]]; then
    sudo pacman -S git
else
    echo '执行下一步'
fi
'''
# 设置默认克隆路径
path=$HOME
'''
# 询问克隆路径
# read -p '正在克隆本仓库(默认为~/.cache)：' path
echo '正在克隆仓库(默认为~/.cache)'
if [[ $path == 'h' ]]; then
    cd ~/.cache && git clone https://mirror.ghproxy.com/github.com/PILIHU2022/My-dotfiles.git && cd My-dotfiles
fi
clear
# 询问用户是否手动安装
read -p '克隆完毕，若手动安装请退出脚本(exit)！' install_manual_or_auto
if [[ $install_manual_or_auto == 'exit' ]]; then
    exit
else
    echo '开始安装，将会询问是否复制文件！'
fi
# 复制doas文件
read -p '是否复制doas配置文件(y)' install_doas
if [[ $install_doas == 'y' ]]; then
    sudo pacman -S --needed opendoas && sudo mkdir /etc/doas && sudo cp ./doas.conf /etc/doas && sudo chown -c root:root /etc/doas.conf && sudo chmod -c 0400 /etc/doas.conf
else
    sleep 0.01
fi
# 复制pacman.conf
read -p '是否复制pacman配置文件(y)' install_pacman
if [[ $install_pacman == 'y' ]]; then
    sudo cp ./pacman.conf /etc/pacman
else
    sleep 0.01
fi
# 复制Hyprland配置文件
read -p '是否复制Hyprland配置文件(y)' install_hyprland
