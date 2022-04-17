#!/usr/bin/env bash

#############################################################################
#                          BEFORE FIRST BOOT SCRIPT                         #
#############################################################################
#    This script was made to make my life easy when installing Arch Linux   #
# It will install base packages for MY USE CASE, and apply the Rice install #
#    Before using it you will need to set some stuff, here is the list:     #
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

printf "┌──────────────────────────────────────────────────────────────────────────────────────────┐\n"
printf "│                       Welcome to Mirai's Arch Linux Install Script                       │\n"
printf "│ This is the ${DARK_YELLOW}BEFORE FIRST BOOT${NOCOLOR} Script\t\t\t\t\t\t\t   │\n"
printf "│ This script was made to make my life easy when installing Arch Linux\t\t\t   │\n"
printf "│ It will install base packages for MY USE CASE, in this part\t\t\t\t   │\n"
printf "│ On the After First Boot Script, that script will install my rice and my packages\t   │\n"
printf "│ Before using this one you will need to set some stuff, here is the list:\t\t   │\n"
printf "│\t- Network Connection\t\t\t\t\t\t\t\t   │\n"
printf "│\t- Partitions\t\t\t\t\t\t\t\t\t   │\n"
printf "│ Here is some reminders of my personal pre-config\t\t\t\t\t   │\n"
printf "│ PARTITIONS:\t\t\t\t\t\t\t\t\t\t   │\n"
printf "│ NAME\t\t\tSIZE\t\tTYPE\tMOUNTPOINT\t\t\tFILESYSTEM │\n"
printf "│ sdX\t\t\tFULL-DISK\tdisk\t\t\t\t\t\t   │\n"
printf "│ ├─sdXY\t\t4GB~12GB\tpart\t[SWAP]\t\t\t\tLINUX-SWAP │\n"
printf "│ ├─sdXY\t\t30GB\t\tpart\t/home/\${username}\t\tEXT4\t   │\n"
printf "│ ├─sdXY\t\t50GB\t\tpart\t/\t\t\t\tEXT4\t   │\n"
printf "│ └─sdXY\t\tREST-OF-DISK\tpart\t/media/Arquivos\t\t\tEXT4\t   │\n"
printf "│                     So without further ado, let's start this script                      │\n"
printf "└──────────────────────────────────────────────────────────────────────────────────────────┘\n"

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

##########################################################
#                                                        #
#  ##############  #######  ###########  ##############  #
#  ##############  #######  ###########  ##############  #
#       ####       ##       #####             ####       #
#       ####       #######    #####           ####       #
#       ####       #######      #####         ####       #
#       ####       ##             #####       ####       #
#       ####       #######  ###########       ####       #
#       ####       #######  ###########       ####       #
#                                                        #
##########################################################

echo "sleep 5" >> archBaseInstall2.sh
echo "printf \"Updating the ZoneInfo to America/Sao_Paulo\n\"" >> archBaseInstall2.sh
echo "ln -sf /usr/share/zoneinfo/America/Sao_Paulo /etc/localtime" >> archBaseInstall2.sh
echo "" >> archBaseInstall2.sh
echo "printf \"Syncronizing the hardware clock to the system clock\n\"" >> archBaseInstall2.sh
echo "hwclock --systohc" >> archBaseInstall2.sh
echo "" >> archBaseInstall2.sh
echo "printf \"Editing /etc/locale.gen to pt_BR.UTF-8\n\"" >> archBaseInstall2.sh
echo "sed -i \"s/#pt_BR.UTF-8 UTF-8/pt_BR.UTF-8 UTF-8/\" /etc/locale.gen" >> archBaseInstall2.sh
echo "locale-gen" >> archBaseInstall2.sh
echo "printf \"Saving the locale in /etc/locale.conf\n\"" >> archBaseInstall2.sh
echo "if [ -e /etc/locale.conf ]; then" >> archBaseInstall2.sh
echo "    echo \"LANG=pt_BR.UTF-8\" >> /etc/locale.conf" >> archBaseInstall2.sh
echo "else" >> archBaseInstall2.sh
echo "    touch /etc/locale.conf" >> archBaseInstall2.sh
echo "    echo \"LANG=pt_BR.UTF-8\" >> /etc/locale.conf" >> archBaseInstall2.sh
echo "fi" >> archBaseInstall2.sh
echo "printf \"Saving the keyboard layout in /etc/vconsole.conf\n\"" >> archBaseInstall2.sh
echo "if [ -e /etc/vconsole.conf ]; then" >> archBaseInstall2.sh
echo "    echo \"KEYMAP=br-abnt2\" >> /etc/vconsole.conf" >> archBaseInstall2.sh
echo "else" >> archBaseInstall2.sh
echo "    touch /etc/vconsole.conf" >> archBaseInstall2.sh
echo "    echo \"KEYMAP=br-abnt2\" >> /etc/vconsole.conf" >> archBaseInstall2.sh
echo "fi" >> archBaseInstall2.sh
echo "" >> archBaseInstall2.sh
echo "printf \"Generating the hostname file\n\"" >> archBaseInstall2.sh
echo "read -e -p \"Enter this machine hostname: \" HSTNM" >> archBaseInstall2.sh
echo "if [[ -e /etc/hostname ]]; then" >> archBaseInstall2.sh
echo "    echo \$HSTNM >> /etc/hostname" >> archBaseInstall2.sh
echo "else" >> archBaseInstall2.sh
echo "    touch /etc/hostname" >> archBaseInstall2.sh
echo "    echo \$HSTNM >> /etc/hostname" >> archBaseInstall2.sh
echo "fi" >> archBaseInstall2.sh
echo "" >> archBaseInstall2.sh
echo "printf \"Generating the hosts file\n\"" >> archBaseInstall2.sh
echo "echo \"# =====================================\" >> /etc/hosts" >> archBaseInstall2.sh
echo "echo \"# IPv4	Config\" >> /etc/hosts" >> archBaseInstall2.sh
echo "echo \"127.0.0.1	localhost\" >> /etc/hosts" >> archBaseInstall2.sh
echo "echo \"::1		localhost\" >> /etc/hosts" >> archBaseInstall2.sh
echo "echo \"127.0.1.1	\${HSTNM}.localdomain	\${HSTNM}\" >> /etc/hosts" >> archBaseInstall2.sh
echo "echo \"127.0.0.1	local\" > /etc/Hosts" >> archBaseInstall2.sh
echo "echo \"# =====================================\" >> /etc/hosts" >> archBaseInstall2.sh
echo "echo \"::1		ip6-localhost\" >> /etc/hosts" >> archBaseInstall2.sh
echo "echo \"::1		ip6-loopback\" >> /etc/hosts" >> archBaseInstall2.sh
echo "echo \"fe80::1%lo0 	localhost\" >> /etc/hosts" >> archBaseInstall2.sh
echo "echo \"ff00::0		ip6-localnet\" >> /etc/hosts" >> archBaseInstall2.sh
echo "echo \"ff00::0		ip6-mcastprefix\" >> /etc/hosts" >> archBaseInstall2.sh
echo "echo \"ff02::1		ip6-allnodes\" >> /etc/hosts" >> archBaseInstall2.sh
echo "echo \"ff02::2		ip6-allrouters\" >> /etc/hosts" >> archBaseInstall2.sh
echo "echo \"ff02::3		ip6-allhosts\" >> /etc/hosts" >> archBaseInstall2.sh
echo "echo \"0.0.0.0		0.0.0.0\" >> /etc/hosts" >> archBaseInstall2.sh
echo "" >> archBaseInstall2.sh
echo "echo -e -n \"Do you want to add Custom Hosts to this file too (y/n)? \"" >> archBaseInstall2.sh
echo "old_stty_cfg=\$(stty -g)" >> archBaseInstall2.sh
echo "stty raw -echo" >> archBaseInstall2.sh
echo "answer=\$( while ! head -c 1 | grep -i '[ny]' ;do true ;done )" >> archBaseInstall2.sh
echo "stty \$old_stty_cfg" >> archBaseInstall2.sh
echo "if echo \"\$answer\" | grep -iq \"^y\" ;then" >> archBaseInstall2.sh
echo "    printf \"Adding custom hosts\n\"" >> archBaseInstall2.sh
echo "    curl -fL \"https://raw.githubusercontent.com/MiraiMindz/.dotfiles/main/misc/MiraiHosts.txt\" >> /etc/hosts" >> archBaseInstall2.sh
echo "else" >> archBaseInstall2.sh
echo "    printf \"Proceeding with the installation\n\"" >> archBaseInstall2.sh
echo "fi" >> archBaseInstall2.sh
echo "" >> archBaseInstall2.sh
echo "printf \"Setting up the root password\n\"" >> archBaseInstall2.sh
echo "passwd" >> archBaseInstall2.sh
echo "" >> archBaseInstall2.sh
echo "echo -e -n \"What is your processor \${DARK_BLUE}I\${NOCOLOR}ntel or \${DARK_RED}A\${NOCOLOR}MD (\${DARK_BLUE}i\${NOCOLOR}/\${DARK_RED}a\${NOCOLOR})? \"" >> archBaseInstall2.sh
echo "old_stty_cfg=\$(stty -g)" >> archBaseInstall2.sh
echo "stty raw -echo" >> archBaseInstall2.sh
echo "answer=\$( while ! head -c 1 | grep -i '[ai]' ;do true ;done )" >> archBaseInstall2.sh
echo "stty \$old_stty_cfg" >> archBaseInstall2.sh
echo "if echo \"\$answer\" | grep -iq \"^i\" ;then" >> archBaseInstall2.sh
echo "    pacman -S intel-ucode" >> archBaseInstall2.sh
echo "else" >> archBaseInstall2.sh
echo "    pacman -S amd-ucode" >> archBaseInstall2.sh
echo "fi" >> archBaseInstall2.sh
echo "" >> archBaseInstall2.sh
echo "printf \"Downloading bootloader and other packages\n\"" >> archBaseInstall2.sh
echo "pacman -S grub networkmanager dialog wireless_tools wpa_supplicant os-prober mtools dosfstools base-devel linux-headers iwd dhcpcd" >> archBaseInstall2.sh
echo "" >> archBaseInstall2.sh
echo "printf \"Installing bootloader\n\"" >> archBaseInstall2.sh
echo "printf \"Please answer the following question with the full name (/dev/sdX)\n\"" >> archBaseInstall2.sh
echo "read -e -p \"What is the name of your disk: \" DSKNM" >> archBaseInstall2.sh
echo "grub-install --target=i386-pc \$DSKNM" >> archBaseInstall2.sh
echo "grub-mkconfig -o /boot/grub/grub.cfg" >> archBaseInstall2.sh
echo "" >> archBaseInstall2.sh
echo "printf \"INSTRUCTIONS READ BEFORE DOING\n\"" >> archBaseInstall2.sh
echo "printf \"Please exit the installation media by typing: \${DARK_YELLOW}exit\${NOCOLOR}\n\"" >> archBaseInstall2.sh
echo "printf \"unmount the partition by typing: \${DARK_YELLOW}umount -a\${NOCOLOR}\n\"" >> archBaseInstall2.sh
echo "printf \"reboot your system by typing: \${DARK_YELLOW}reboot\${NOCOLOR}\n\"" >> archBaseInstall2.sh
echo "printf \"after the reboot activate the internet with this command:\n\"" >> archBaseInstall2.sh
echo "printf \"\${DARK_YELLOW}systemctl start NetworkManager\${NOCOLOR}\n\"" >> archBaseInstall2.sh
echo "printf \"if you are on Wi-Fi you can connect using this command: \${DARK_YELLOW}iwctl\${NOCOLOR}\n\"" >> archBaseInstall2.sh
echo "printf \"on the [iwd]# shell you will do the following to connect into a network:\n\"" >> archBaseInstall2.sh
echo "printf \"list wireless devices names with: \${DARK_YELLOW}device list\${NOCOLOR}\n\"" >> archBaseInstall2.sh
echo "printf \"scan for networks with: \${DARK_YELLOW}station \${device} scan\${NOCOLOR}\n\"" >> archBaseInstall2.sh
echo "printf \"list all available networks with: \${DARK_YELLOW}station \${device} get-networks\${NOCOLOR}\n\"" >> archBaseInstall2.sh
echo "printf \"to connect to a network type: \${DARK_YELLOW}station \${device} connect \${SSID}\${NOCOLOR}\n\"" >> archBaseInstall2.sh
echo "printf \"clone the After First Boot script with this command:\n\"" >> archBaseInstall2.sh
echo "printf \"\${DARK_YELLOW}curl -fLo archInstallAfter.sh \\\"https://raw.githubusercontent.com/MiraiMindz/.dotfiles/main/archInstallAfter.sh\\\"\${NOCOLOR}\n\"" >> archBaseInstall2.sh
echo "printf \"Run the new script with: \${DARK_YELLOW}sh archInstallAfter.sh\${NOCOLOR}\n\"" >> archBaseInstall2.sh
echo "printf \"\${DARK_GREEN}Good Luck\${NOCOLOR}! \n\"" >> archBaseInstall2.sh
echo "exit" >> archBaseInstall2.sh
echo "" >> archBaseInstall2.sh

mv -v ./archBaseInstall2.sh /mnt

printf "CHRooting to installation\n"
arch-chroot /mnt bash -c 'sh ./archBaseInstall2.sh'
rm -v /mnt/archBaseInstall2.sh
exit
