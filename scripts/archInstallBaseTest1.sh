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
printf "│ └─sdXY\t\tREST-OF-DISK\tpart\t/media/Arquivos\t\t\tBTRFS\t   │\n"
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

#printf "CHRooting to installation\n"
#arch-chroot /mnt
exit
