#!/usr/bin/env bash

#############################################################################
#                          BEFORE FIRST BOOT SCRIPT                         #
#############################################################################
#    This script was made to make my life easy when installing Arch Linux   #
# It will install base packages for MY USE CASE, and apply the Rice install #
# Before using it you will need to set some stuff before, here is the list: #
#   - Network Connection                                                    #
#   - Partitions                                                            #
#                                                                           #
#                 So without further ado, let's get into it                 #
#############################################################################
# TODO LIST:                                                                #
#   [x] Configure Keyboard Layout                                           #
#   [x] Configure hardware clock                                            #
#   [x] Configure Locale | Maybe export it idk                              #
#   [x] Install Essential Packages                                          #
#   [x] Gen the FSTab                                                       #
#   [x] ChRoot                                                              #
#   [x] Timezone & Sync Hardware Clock                                      #
#   [x] Create locale.conf                                                  #
#   [x] Create vconsole.conf keymap                                         #
#   [x] Hosts | Prompt for Custom                                           #
#   [x] Root Password                                                       #
#   [x] Bootloader                                                          #
#   [x] Reboot System                                                       #
#############################################################################
# NOTES:                                                                    #
#   Maybe I will need to split this into "Before and After First Boot"      #
#############################################################################

DARK_BLACK='\e[30m'
DARK_RED='\e[31m'
DARK_GREEN='\e[32m'
DARK_YELLOW='\e[33m'
DARK_BLUE='\e[34m'
DARK_PURPLE='\e[35m'
DARK_CYAN='\e[36m'
DARK_WHITE='\e[37m'
LIGHT_BLACK='\e[90m'
LIGHT_RED='\e[91m'
LIGHT_GREEN='\e[92m'
LIGHT_YELLOW='\e[93m'
LIGHT_BLUE='\e[94m'
LIGHT_PURPLE='\e[95m'
LIGHT_CYAN='\e[96m'
LIGHT_WHITE='\e[97m'
TEXTBOLD_ON='\e[1m'
TEXTFAINT_ON='\e[2m'
TEXTITALIC_ON='\e[3m'
TEXTUNDERLN_ON='\e[4m'
TEXTBLINK_ON='\e[5m'
TEXTHIGHLT_ON='\e[7m'
TEXTHIDDEN_ON='\e[8m'
TEXTSTRIKE_ON='\e[9m'
TEXTBOLD_OFF='\e[21m'
TEXTFAINT_OFF='\e[22m'
TEXTITALIC_OFF='\e[23m'
TEXTUNDERLN_OFF='\e[24m'
TEXTBLINK_OFF='\e[25m'
TEXTHIGHLT_OFF='\e[27m'
TEXTHIDDEN_OFF='\e[28m'
TEXTSTRIKE_OFF='\e[29m'
NOCOLOR='\e[39m'
TEXTRESETALL='\e[m'

printf "Welcome to Mirai's Arch Linux Install Script\n"
printf "This is the ${DARK_YELLOW}BEFORE FIRST BOOT${NOCOLOR} Script\n"
printf "This script was made to make my life easy when installing Arch Linux\n"
printf "It will install base packages for MY USE CASE, in this part\n"
printf "On the After First Boot Script, that script will install my rice and my packages\n"
printf "Before using this one you will need to set some stuff before, here is the list:\n"
printf "    - Network Connection\n"
printf "    - Partitions\n"
printf "Here is some reminders of my personal pre-config\n"
printf "PARTITIONS:\n"
printf "NAME            SIZE            TYPE    MOUNTPOINT          FILESYSTEM\n"
printf "sdX             FULL-DISK       disk    \n"
printf "├─sdXY          4GB~12GB        part    [SWAP]              LINUX-SWAP\n"
printf "├─sdXY          30GB            part    /home/\${username}  EXT4\n"
printf "├─sdXY          50GB            part    /                   EXT4\n"
printf "└─sdXY          REST-OF-DISK    part    /media/Arquivos     BTRFS\n"
printf "So without further ado, let's start this script\n"

printf "Loading keyboard layout\n"
loadkeys br-abnt2

printf "Updating the system clock\n"
timedatectl set-ntp true

printf "Installing base packages\n"
pacstrap /mnt base linux linux-firmware nano

printf "Generating FSTab\n"
genfstab -U /mnt >> /mnt/etc/fstab
printf "Checking FSTab\n"
cat /mnt/etc/fstab
echo -e -n "Is this correct (y/n)? "
old_stty_cfg=$(stty -g)
stty raw -echo
answer=$( while ! head -c 1 | grep -i '[ny]' ;do true ;done )
stty $old_stty_cfg
if echo "$answer" | grep -iq "^y" ;then
    printf "Proceeding\n"
else
    printf "Aborting\n"
    printf "Please Fix the partitioning and re-run this script"
    exit
fi

printf "CHRooting to installation\n"
arch-chroot /mnt

printf "Updating the ZoneInfo to America/Sao_Paulo\n"
ln -sf /usr/share/zoneinfo/America/Sao_Paulo /etc/localtime

printf "Syncronizing the hardware clock to the system clock\n"
hwclock --systohc

printf "Editing /etc/locale.gen to pt_BR.UTF-8\n"
sed -i "s/#pt_BR.UTF-8 UTF-8/pt_BR.UTF-8 UTF-8/" /etc/locale.gen
locale-gen
printf "Saving the locale in /etc/locale.conf\n"
if [ -e /etc/locale.conf ]; then
    echo "LANG=pt_BR.UTF-8" > /etc/locale.conf
else
    touch /etc/locale.conf
    echo "LANG=pt_BR.UTF-8" > /etc/locale.conf
if
printf "Saving the keyboard layout in /etc/locale.conf\n"
if [ -e /etc/vconsole.conf ]; then
    echo "KEYMAP=br-abnt2" > /etc/vconsole.conf
else
    touch /etc/vconsole.conf
    echo "KEYMAP=br-abnt2" > /etc/vconsole.conf
if

printf "Generating the hostname file\n"
read -e -p "Enter this machine hostname: " HSTNM
echo $HSTNM > /etc/hostname

printf "Generating the hosts file\n"
echo "# =====================================" > /etc/hosts
echo "# IPv4	Config" > /etc/hosts
echo "127.0.0.1	localhost" > /etc/hosts
echo "::1		localhost" > /etc/hosts
echo "127.0.1.1	${HSTNM}.localdomain	${HSTNM}" > /etc/hosts
echo "127.0.0.1	local" > /etc/Hosts
echo "# =====================================" > /etc/Hosts
echo "::1		ip6-localhost" > /etc/Hosts
echo "::1		ip6-loopback" > /etc/Hosts
echo "fe80::1%lo0 	localhost" > /etc/Hosts
echo "ff00::0		ip6-localnet" > /etc/Hosts
echo "ff00::0		ip6-mcastprefix" > /etc/Hosts
echo "ff02::1		ip6-allnodes" > /etc/Hosts
echo "ff02::2		ip6-allrouters" > /etc/Hosts
echo "ff02::3		ip6-allhosts" > /etc/Hosts
echo "0.0.0.0		0.0.0.0" > /etc/Hosts

echo -e -n "Do you want to add Custom Hosts to this file too (y/n)? "
old_stty_cfg=$(stty -g)
stty raw -echo
answer=$( while ! head -c 1 | grep -i '[ny]' ;do true ;done )
stty $old_stty_cfg
if echo "$answer" | grep -iq "^y" ;then
    printf "Adding custom hosts\n"
    curl -fL "https://raw.githubusercontent.com/MiraiMindz/.dotfiles/main/MiraiHosts.txt" > /etc/Hosts
else
    printf "Proceeding with the installation\n"
fi

printf "Setting up the root password\n"
passwd

printf "Downloading bootloader and other packages\n"
pacman -S grub networkmanager network-manager-applet dialog wireless_tools wpa_supplicant os-prober mtools dosfstools base-devel linux-headers

printf "Installing bootloader\n"
printf "Please answer the following question with the full name (/dev/sdX)\n"
read -e -p "What is the name of your disk: " DSKNM
grub-install --target=i386-pc $DSKNM
grub-mkconfig -o /boot/grub/grub.cfg

printf "INSTRUCTIONS READ BEFORE DOING\n"
printf "Please exit the installation media by typing: ${DARK_YELLOW}exit${NOCOLOR}\n"
printf "unmount the partition by typing: ${DARK_YELLOW}umount -a${NOCOLOR}\n"
printf "reboot your system by typing: ${DARK_YELLOW}reboot${NOCOLOR}\n"
printf "after the reboot activate the internet with this command:\n"
printf "${DARK_YELLOW}systemctl start NetworkManager${NOCOLOR}\n"
printf "if you are on Wi-Fi you can connect using this command: ${DARK_YELLOW}iwctl${NOCOLOR}\n"
printf "on the [iwd]# shell you will do the following to connect into a network:\n"
printf "list wireless devices names with: ${DARK_YELLOW}device list${NOCOLOR}\n"
printf "scan for networks with: ${DARK_YELLOW}station \${device} scan${NOCOLOR}\n"
printf "list all available networks with: ${DARK_YELLOW}station \${device} get-networks${NOCOLOR}\n"
printf "to connect to a network type: ${DARK_YELLOW}station \${device} connect \${SSID}${NOCOLOR}\n"
printf "clone the After First Boot script with this command:\n"
printf "${DARK_YELLOW}curl -fLo archInstallAfter.sh \"https://raw.githubusercontent.com/MiraiMindz/.dotfiles/main/archInstallAfter.sh\"${NOCOLOR}\n"
printf "Activate internet and run the new script with: ${DARK_YELLOW}sh archInstallAfter.sh${NOCOLOR}\n"
printf "${DARK_GREEN}Good Luck${NOCOLOR}!\n"
exit
