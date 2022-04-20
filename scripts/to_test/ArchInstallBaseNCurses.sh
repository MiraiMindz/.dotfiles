#!/usr/bin/env bash

######################################################################################################
# ┌──────────────┬──────────────┬──────────────────────────────────────────────────────────────────┐ #
# │ [x] CLI Auto │ [x] TUI Auto │ [x] TUI Guided │                       STEPS          ┌──────────┤ #
# │     [x]      │      [x]     │       [x]      │  01 - Load keys                      │ SCRIPT 1 │ #
# │     [x]      │      [x]     │       [x]      │  02 - Update system clock            │ SCRIPT 1 │ #
# │     [x]      │      [x]     │       [x]      │  03 - Install base packages          │ SCRIPT 1 │ #
# │     [x]      │      [x]     │       [x]      │  04 - Generate FSTab                 │ SCRIPT 1 │ #
# │     [x]      │      [x]     │       [x]      │  05 - Check FSTab                    │ SCRIPT 1 │ #
# │     [x]      │      [x]     │       [x]      │  06 - Chroot                         │ SCRIPT 1 │ #
# │     [x]      │      [x]     │       [x]      │  07 - Update ZoneInfo                └──────────┤ #
# │     [x]      │      [x]     │       [x]      │  08 - Sync hardware clock                       │ #
# │     [x]      │      [x]     │       [x]      │  09 - Generate locales                          │ #
# │     [x]      │      [x]     │       [x]      │  10 - Save Locales                              │ #
# │     [x]      │      [x]     │       [x]      │  11 - Save keyboard layout                      │ #
# │     [x]      │      [x]     │       [x]      │  12 - Set hostname                              │ #
# │     [x]      │      [x]     │       [x]      │  13 - Hosts file and custom hosts               │ #
# │     [x]      │      [x]     │       [x]      │  14 - Root password                             │ #
# │     [x]      │      [x]     │       [x]      │  15 - Processor micro-code                      │ #
# │     [x]      │      [x]     │       [x]      │  16 - Download bootloader and more              │ #
# │     [x]      │      [x]     │       [x]      │  17 - Install bootloader                        │ #
# └────────────────────────────────────────────────────────────────────────────────────────────────┘ #
######################################################################################################

### Variables
DARK_BLACK='\033[30m'
DARK_RED='\033[31m'
DARK_GREEN='\033[32m'
DARK_YELLOW='\033[33m'
DARK_BLUE='\033[34m'
DARK_PURPLE='\033[35m'
DARK_CYAN='\033[36m'
DARK_WHITE='\033[37m'
LIGHT_BLACK='\033[90m'
LIGHT_RED='\033[91m'
LIGHT_GREEN='\033[92m'
LIGHT_YELLOW='\033[93m'
LIGHT_BLUE='\033[94m'
LIGHT_PURPLE='\033[95m'
LIGHT_CYAN='\033[96m'
LIGHT_WHITE='\033[97m'
TEXTBOLD_ON='\033[1m'
TEXTFAINT_ON='\033[2m'
TEXTITALIC_ON='\033[3m'
TEXTUNDERLN_ON='\033[4m'
TEXTBLINK_ON='\033[5m'
TEXTHIGHLT_ON='\033[7m'
TEXTHIDDEN_ON='\033[8m'
TEXTSTRIKE_ON='\033[9m'
TEXTBOLD_OFF='\033[21m'
TEXTFAINT_OFF='\033[22m'
TEXTITALIC_OFF='\033[23m'
TEXTUNDERLN_OFF='\033[24m'
TEXTBLINK_OFF='\033[25m'
TEXTHIGHLT_OFF='\033[27m'
TEXTHIDDEN_OFF='\033[28m'
TEXTSTRIKE_OFF='\033[29m'
NOCOLOR='\033[39m'
TEXTRESETALL='\033[m'
steps="17"
default_title="Arch Linux Mirai Install"
WelcomeBox="┌────────────────────────────────────────────────────────────────────────────────────┐
│                    Welcome to Mirai's Arch Linux Install Script                    │
│ This is the BEFORE FIRST BOOT Script                                               │
│ This script was made to make my life easy when installing Arch Linux               │
│ It will install base packages for MY USE CASE, in this part                        │
│ On the After First Boot Script, that script will install my rice and my packages   │
│ Before using this one you will need to set some stuff, here is the list:           │
│    - Network Connection                                                            │
│    - Partitions                                                                    │
│ Here is some reminders of my personal pre-config                                   │
│ PARTITIONS:                                                                        │
│ NAME      SIZE            TYPE    MOUNTPOINT          FILESYSTEM                   │
│ sdX       FULL-DISK       disk                                                     │
│ ├─sdXY    4GB~12GB        part    [SWAP]              LINUX-SWAP                   │
│ ├─sdXY    30GB            part    /home/\${username}   EXT4                         │
│ ├─sdXY    50GB            part    /                   EXT4                         │
│ └─sdXY    REST-OF-DISK    part    /media/Arquivos     EXT4                         │
│                                                                                    │
│                   So without further ado, let's start this script                  │
└────────────────────────────────────────────────────────────────────────────────────┘"
installmtd=""

### Functions
cliInstall() {
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

    mv -v ./archInstallNCRS2.sh /mnt
    printf "CHRooting to installation\n"
    arch-chroot /mnt bash -c 'sh ./archInstallNCRS2.sh'
    rm -v /mnt/archInstallNCRS2.sh
}

ncursesAutoInstall() {
    dialog --title "$default_title" --msgbox "\n${WelcomeBox}" 25 90 && clear
    dialog --title "$default_title 1/$steps" --msgbox "\nLoading br-abnt2 keys" 7 30 && clear
    loadkeys br-abnt2
    dialog --title "$default_title 2/$steps" --msgbox "\nUpdating the system clock" 7 34 && clear
    timedatectl set-ntp true

    counter=0;
    pacstrap /mnt base linux linux-firmware nano &;
    pid=$!;
    trap "kill $pid 2> /dev/null" EXIT;
    while kill -0 $pid 2> /dev/null; do
        (( counter+=1 ))
        echo $counter | dialog --title "$default_title 3/$steps" --gauge "Installing base packages" 7 50 0;
        sleep 0.1
    done;
    trap - EXIT
    counter=100
    echo $counter | dialog --title "$default_title 3/$steps" --gauge "Installing base packages" 7 50 0
    clear

    dialog --title "$default_title 4/$steps" --msgbox "\nGenerating FSTab" 7 34 && clear
    genfstab -U /mnt >> /mnt/etc/fstab
    dialog --title "$default_title 5/$steps" --msgbox "\nChecking FSTab" 7 34 && clear
    if dialog --title "Is this correct?" --yesno "$(while read -r line; do echo "$line"; done </etc/fstab)" 22 94; then
        dialog --title "$default_title" --msgbox "Proceeding" 7 30
    else
        dialog --title "$default_title" --msgbox "Please fix the fstab and run this script again" 7 44
        clear
        printf "%s\n" "Please fix the fstab and run this script again"
        exit
    fi

    mv -v ./archInstallNCRS2.sh /mnt
    dialog --title "$default_title 6/$steps" --msgbox "\nChrooting" 7 34 && clear
    arch-chroot /mnt bash -c 'sh ./archInstallNCRS2.sh'
    rm -v /mnt/archInstallNCRS2.sh

}

ncursesManualInstall() {
    usrkymp=$(dialog --title "$default_title 1/$steps" --output-fd 1 --inputbox "Type 'MENU' to use a menu selection\nYour desired keymap: \nExample: br-abnt2" 25 50); clear
    lwcs_usrkymp=$(echo "$usrkymp" | tr '[:upper:]' '[:lower:]')
    if [[ "$lwcs_usrkymp" == "menu" ]]; then # big menu
        usrkymp=$(dialog --title "$default_title 1/$steps" --no-tags --output-fd 1 --menu "Select your desired keymap: " 7 60 0 "amiga-de" "amiga-de" "amiga-us" "amiga-us" "atari-de" "atari-de" "atari-se" "atari-se" "atari-uk-falcon" "atari-uk-falcon" "atari-us" "atari-us" "mac-euro" "mac-euro" "mac-euro2" "mac-euro2" "apple-a1048-sv" "apple-a1048-sv" "apple-a1243-sv-fn-reverse" "apple-a1243-sv-fn-reverse" "apple-a1243-sv" "apple-a1243-sv" "apple-internal-0x0253-sv-fn-reverse" "apple-internal-0x0253-sv-fn-reverse" "apple-internal-0x0253-sv" "apple-internal-0x0253-sv" "mac-be" "mac-be" "mac-de-latin1-nodeadkeys" "mac-de-latin1-nodeadkeys" "mac-de-latin1" "mac-de-latin1" "mac-de_CH" "mac-de_CH" "mac-dk-latin1" "mac-dk-latin1" "mac-dvorak" "mac-dvorak" "mac-es" "mac-es" "mac-fi-latin1" "mac-fi-latin1" "mac-fr" "mac-fr" "mac-fr_CH-latin1" "mac-fr_CH-latin1" "mac-it" "mac-it" "mac-no-latin1" "mac-no-latin1" "mac-pl" "mac-pl" "mac-pt-latin1" "mac-pt-latin1" "mac-se" "mac-se" "mac-template" "mac-template" "mac-uk" "mac-uk" "mac-us" "mac-us" "sun-pl-altgraph" "sun-pl-altgraph" "sun-pl" "sun-pl" "sundvorak" "sundvorak" "sunkeymap" "sunkeymap" "sunt4-es" "sunt4-es" "sunt4-fi-latin1" "sunt4-fi-latin1" "sunt4-no-latin1" "sunt4-no-latin1" "sunt5-cz-us" "sunt5-cz-us" "sunt5-de-latin1" "sunt5-de-latin1" "sunt5-es" "sunt5-es" "sunt5-fi-latin1" "sunt5-fi-latin1" "sunt5-fr-latin1" "sunt5-fr-latin1" "sunt5-ru" "sunt5-ru" "sunt5-uk" "sunt5-uk" "sunt5-us-cz" "sunt5-us-cz" "sunt6-uk" "sunt6-uk" "sv-latin1" "sv-latin1" "tj_alt-UTF8" "tj_alt-UTF8" "tr_q-latin5" "tr_q-latin5" "tralt" "tralt" "trf" "trf" "trq" "trq" "ttwin_alt-UTF-8" "ttwin_alt-UTF-8" "ttwin_cplk-UTF-8" "ttwin_cplk-UTF-8" "ttwin_ct_sh-UTF-8" "ttwin_ct_sh-UTF-8" "ttwin_ctrl-UTF-8" "ttwin_ctrl-UTF-8" "ua-cp1251" "ua-cp1251" "ua-utf-ws" "ua-utf-ws" "ua-utf" "ua-utf" "ua-ws" "ua-ws" "ua" "ua" "uk" "uk" "us-acentos" "us-acentos" "us" "us" "us1" "us1" "mk-cp1251" "mk-cp1251" "mk-utf" "mk-utf" "mk" "mk" "mk0" "mk0" "nl" "nl" "nl2" "nl2" "no-latin1" "no-latin1" "no" "no" "pc110" "pc110" "pl" "pl" "pl1" "pl1" "pl2" "pl2" "pl3" "pl3" "pl4" "pl4" "pt-latin1" "pt-latin1" "pt-latin9" "pt-latin9" "ro" "ro" "ro_std" "ro_std" "ro_win" "ro_win" "ru-cp1251" "ru-cp1251" "ru-ms" "ru-ms" "ru-yawerty" "ru-yawerty" "ru" "ru" "ru1" "ru1" "ru2" "ru2" "ru3" "ru3" "ru4" "ru4" "ru_win" "ru_win" "ruwin_alt-CP1251" "ruwin_alt-CP1251" "ruwin_alt-KOI8-R" "ruwin_alt-KOI8-R" "ruwin_alt-UTF-8" "ruwin_alt-UTF-8" "ruwin_alt_sh-UTF-8" "ruwin_alt_sh-UTF-8" "ruwin_cplk-CP1251" "ruwin_cplk-CP1251" "ruwin_cplk-KOI8-R" "ruwin_cplk-KOI8-R" "ruwin_cplk-UTF-8" "ruwin_cplk-UTF-8" "ruwin_ct_sh-CP1251" "ruwin_ct_sh-CP1251" "ruwin_ct_sh-KOI8-R" "ruwin_ct_sh-KOI8-R" "ruwin_ct_sh-UTF-8" "ruwin_ct_sh-UTF-8" "ruwin_ctrl-CP1251" "ruwin_ctrl-CP1251" "ruwin_ctrl-KOI8-R" "ruwin_ctrl-KOI8-R" "ruwin_ctrl-UTF-8" "ruwin_ctrl-UTF-8" "se-fi-ir209" "se-fi-ir209" "se-fi-lat6" "se-fi-lat6" "se-ir209" "se-ir209" "se-lat6" "se-lat6" "sg-latin1-lk450" "sg-latin1-lk450" "sg-latin1" "sg-latin1" "sg" "sg" "sk-prog-qwerty" "sk-prog-qwerty" "sk-prog-qwertz" "sk-prog-qwertz" "sk-qwerty" "sk-qwerty" "sk-qwertz" "sk-qwertz" "slovene" "slovene" "sr-cy" "sr-cy" "sr-latin" "sr-latin" "bashkir" "bashkir" "bg-cp1251" "bg-cp1251" "bg-cp855" "bg-cp855" "bg_bds-cp1251" "bg_bds-cp1251" "bg_bds-utf8" "bg_bds-utf8" "bg_pho-cp1251" "bg_pho-cp1251" "bg_pho-utf8" "bg_pho-utf8" "br-abnt" "br-abnt" "br-abnt2" "br-abnt2" "br-latin1-abnt2" "br-latin1-abnt2" "br-latin1-us" "br-latin1-us" "by-cp1251" "by-cp1251" "by" "by" "bywin-cp1251" "bywin-cp1251" "ca" "ca" "cf" "cf" "croat" "croat" "cz-cp1250" "cz-cp1250" "cz-lat2-prog" "cz-lat2-prog" "cz-lat2" "cz-lat2" "cz-qwertz" "cz-qwertz" "cz-us-qwertz" "cz-us-qwertz" "cz" "cz" "de-latin1-nodeadkeys" "de-latin1-nodeadkeys" "de-latin1" "de-latin1" "de-mobii" "de-mobii" "de" "de" "de_alt_UTF-8" "de_alt_UTF-8" "de_CH-latin1" "de_CH-latin1" "defkeymap" "defkeymap" "defkeymap_V1" "defkeymap_V1" "dk-latin1" "dk-latin1" "dk" "dk" "emacs" "emacs" "emacs2" "emacs2" "es-cp850" "es-cp850" "es" "es" "et-nodeadkeys" "et-nodeadkeys" "et" "et" "fa" "fa" "fi" "fi" "fr_CH-latin1" "fr_CH-latin1" "fr_CH" "fr_CH" "gr-pc" "gr-pc" "gr" "gr" "hu" "hu" "hu101" "hu101" "il-heb" "il-heb" "il-phonetic" "il-phonetic" "il" "il" "is-latin1-us" "is-latin1-us" "is-latin1" "is-latin1" "it-ibm" "it-ibm" "it" "it" "it2" "it2" "jp106" "jp106" "kazakh" "kazakh" "ky_alt_sh-UTF-8" "ky_alt_sh-UTF-8" "kyrgyz" "kyrgyz" "la-latin1" "la-latin1" "lt" "lt" "lt" "lt" "lt" "lt" "lv-tilde" "lv-tilde" "lv" "lv" "applkey" "applkey" "unicode" "unicode" "windowkeys" "windowkeys" "backspace" "backspace" "ctrl" "ctrl" "euro" "euro" "euro1" "euro1" "euro2" "euro2" "keypad" "keypad" "wangbe" "wangbe" "wangbe2" "wangbe2" "azerty" "azerty" "be-latin1" "be-latin1" "fr-latin1" "fr-latin1" "fr-latin9" "fr-latin9" "fr-pc" "fr-pc" "fr" "fr" "adnw" "adnw" "neo" "neo" "neoqwertz" "neoqwertz" "bone" "bone" "koy" "koy" "pt-olpc" "pt-olpc" "es-olpc" "es-olpc" "fr-bepo-latin9" "fr-bepo-latin9" "fr-bepo" "fr-bepo" "ANSI-dvorak" "ANSI-dvorak" "dvorak-ca-fr" "dvorak-ca-fr" "dvorak-es" "dvorak-es" "dvorak-fr" "dvorak-fr" "dvorak-l" "dvorak-l" "dvorak-la" "dvorak-la" "dvorak-no" "dvorak-no" "dvorak-programmer" "dvorak-programmer" "dvorak-r" "dvorak-r" "dvorak-ru" "dvorak-ru" "dvorak-sv-a1" "dvorak-sv-a1" "dvorak-sv-a5" "dvorak-sv-a5" "dvorak-uk" "dvorak-uk" "dvorak-ukp" "dvorak-ukp" "dvorak" "dvorak" "colemak" "colemak" "carpalx-full" "carpalx-full" "carpalx" "carpalx" "tr_f-latin5" "tr_f-latin5" "trf-fgGIod" "trf-fgGIod"); clear
        loadkeys $usrkymp
    else
        loadkeys $usrkymp
    fi

    dialog --title "$default_title 2/$steps" --infobox "Updating system clock" 20 40
    timedatectl set-ntp true

    bspkgs=$(dialog --title "$default_title 3/$steps" --output-fd 1 --inputbox "Type \"AUTO\" to install the packages from the auto installation\nAUTO=base linux linux-firmware nano\nEnter the packages that you want to install:" 25 75); clear
    lwcs_bspkgs=$(echo "$bspkgs" | tr '[:upper:]' '[:lower:]')
    if [[ "$lwcs_bspkgs" == "auto" ]]; then
        counter=0;
        pacstrap /mnt base linux linux-firmware nano &;
        pid=$!;
        trap "kill $pid 2> /dev/null" EXIT;
        while kill -0 $pid 2> /dev/null; do
            (( counter+=1 ))
            echo $counter | dialog --title "$default_title 3/$steps" --gauge "Installing base packages" 7 50 0;
            sleep 0.1
        done;
        trap - EXIT
        counter=100
        echo $counter | dialog --title "$default_title 3/$steps" --gauge "Installing base packages" 7 50 0
        clear
    else
        counter=0;
        pacstrap /mnt "$bspkgs" &
        pid=$!;
        trap "kill $pid 2> /dev/null" EXIT;
        while kill -0 $pid 2> /dev/null; do
            (( counter+=1 ))
            echo $counter | dialog --title "$default_title 3/$steps" --gauge "Installing base packages" 7 50 0;
            sleep 0.1
        done;
        trap - EXIT
        counter=100
        echo $counter | dialog --title "$default_title 3/$steps" --gauge "Installing base packages" 7 50 0
        clear
    fi
    dialog --title "$default_title 4/$steps" --infobox "\nGenerating FSTab" 7 34 && clear
    dialog --title "$default_title 5/$steps" --infobox "\nChecking FSTab" 7 34 && clear
    if dialog --title "Is this correct?" --yesno "$(while read -r line; do echo "$line"; done </etc/fstab)" 22 94; then
        dialog --title "$default_title" --infobox "Proceeding" 7 30
    else
        dialog --title "$default_title" --infobox "Please fix the fstab and run this script again" 7 44
        clear
        printf "%s\n" "Please fix the fstab and run this script again"
        exit
    fi
    mv -v ./archInstallNCRS2.sh /mnt
    dialog --title "$default_title 6/$steps" --msgbox "\nChrooting" 7 34 && clear
    arch-chroot /mnt bash -c 'sh ./archInstallNCRS2.sh'
    rm -v /mnt/archInstallNCRS2.sh
}

echo "installmtd=\"$installmtd\"" >> archInstallNCRS2.sh
echo "usrkymp=\"$usrkymp\"" >> archInstallNCRS2.sh
echo "default_title=\"Arch Linux Mirai Install\"" >> archInstallNCRS2.sh
echo "steps=\"17\"" >> archInstallNCRS2.sh
echo "" >> archInstallNCRS2.sh
echo "cliInstall() {" >> archInstallNCRS2.sh
echo "    sleep 5" >> archInstallNCRS2.sh
echo "    printf \"Updating the ZoneInfo to America/Sao_Paulo\n\"" >> archInstallNCRS2.sh
echo "    ln -sf /usr/share/zoneinfo/America/Sao_Paulo /etc/localtime" >> archInstallNCRS2.sh
echo "" >> archInstallNCRS2.sh
echo "    printf \"Syncronizing the hardware clock to the system clock\n\"" >> archInstallNCRS2.sh
echo "    hwclock --systohc" >> archInstallNCRS2.sh
echo "" >> archInstallNCRS2.sh
echo "    printf \"Editing /etc/locale.gen to pt_BR.UTF-8\n\"" >> archInstallNCRS2.sh
echo "    sed -i \"s/#pt_BR.UTF-8 UTF-8/pt_BR.UTF-8 UTF-8/\" /etc/locale.gen" >> archInstallNCRS2.sh
echo "    locale-gen" >> archInstallNCRS2.sh
echo "    printf \"Saving the locale in /etc/locale.conf\n\"" >> archInstallNCRS2.sh
echo "    if [ -e /etc/locale.conf ]; then" >> archInstallNCRS2.sh
echo "        echo \"LANG=pt_BR.UTF-8\" >> /etc/locale.conf" >> archInstallNCRS2.sh
echo "    else" >> archInstallNCRS2.sh
echo "        touch /etc/locale.conf" >> archInstallNCRS2.sh
echo "        echo \"LANG=pt_BR.UTF-8\" >> /etc/locale.conf" >> archInstallNCRS2.sh
echo "    fi" >> archInstallNCRS2.sh
echo "    printf \"Saving the keyboard layout in /etc/vconsole.conf\n\"" >> archInstallNCRS2.sh
echo "    if [ -e /etc/vconsole.conf ]; then" >> archInstallNCRS2.sh
echo "        echo \"KEYMAP=br-abnt2\" >> /etc/vconsole.conf" >> archInstallNCRS2.sh
echo "    else" >> archInstallNCRS2.sh
echo "        touch /etc/vconsole.conf" >> archInstallNCRS2.sh
echo "        echo \"KEYMAP=br-abnt2\" >> /etc/vconsole.conf" >> archInstallNCRS2.sh
echo "    fi" >> archInstallNCRS2.sh
echo "" >> archInstallNCRS2.sh
echo "    printf \"Generating the hostname file\n\"" >> archInstallNCRS2.sh
echo "    read -e -p \"Enter this machine hostname: \" hstnm" >> archInstallNCRS2.sh
echo "    if [[ -e /etc/hostname ]]; then" >> archInstallNCRS2.sh
echo "        echo \$hstnm >> /etc/hostname" >> archInstallNCRS2.sh
echo "    else" >> archInstallNCRS2.sh
echo "        touch /etc/hostname" >> archInstallNCRS2.sh
echo "        echo \$hstnm >> /etc/hostname" >> archInstallNCRS2.sh
echo "    fi" >> archInstallNCRS2.sh
echo "" >> archInstallNCRS2.sh
echo "    printf \"Generating the hosts file\n\"" >> archInstallNCRS2.sh
echo "    echo \"# =====================================\" >> /etc/hosts" >> archInstallNCRS2.sh
echo "    echo \"# IPv4	Config\" >> /etc/hosts" >> archInstallNCRS2.sh
echo "    echo \"127.0.0.1	localhost\" >> /etc/hosts" >> archInstallNCRS2.sh
echo "    echo \"::1		localhost\" >> /etc/hosts" >> archInstallNCRS2.sh
echo "    echo \"127.0.1.1	\${hstnm}.localdomain	\${hstnm}\" >> /etc/hosts" >> archInstallNCRS2.sh
echo "    echo \"127.0.0.1	local\" > /etc/Hosts" >> archInstallNCRS2.sh
echo "    echo \"# =====================================\" >> /etc/hosts" >> archInstallNCRS2.sh
echo "    echo \"::1		ip6-localhost\" >> /etc/hosts" >> archInstallNCRS2.sh
echo "    echo \"::1		ip6-loopback\" >> /etc/hosts" >> archInstallNCRS2.sh
echo "    echo \"fe80::1%lo0 	localhost\" >> /etc/hosts" >> archInstallNCRS2.sh
echo "    echo \"ff00::0		ip6-localnet\" >> /etc/hosts" >> archInstallNCRS2.sh
echo "    echo \"ff00::0		ip6-mcastprefix\" >> /etc/hosts" >> archInstallNCRS2.sh
echo "    echo \"ff02::1		ip6-allnodes\" >> /etc/hosts" >> archInstallNCRS2.sh
echo "    echo \"ff02::2		ip6-allrouters\" >> /etc/hosts" >> archInstallNCRS2.sh
echo "    echo \"ff02::3		ip6-allhosts\" >> /etc/hosts" >> archInstallNCRS2.sh
echo "    echo \"0.0.0.0		0.0.0.0\" >> /etc/hosts" >> archInstallNCRS2.sh
echo "" >> archInstallNCRS2.sh
echo "    echo -e -n \"Do you want to add Custom Hosts to this file too (y/n)? \"" >> archInstallNCRS2.sh
echo "    old_stty_cfg=\$(stty -g)" >> archInstallNCRS2.sh
echo "    stty raw -echo" >> archInstallNCRS2.sh
echo "    answer=\$( while ! head -c 1 | grep -i '[ny]' ;do true ;done )" >> archInstallNCRS2.sh
echo "    stty \$old_stty_cfg" >> archInstallNCRS2.sh
echo "    if echo \"\$answer\" | grep -iq \"^y\" ;then" >> archInstallNCRS2.sh
echo "        printf \"Adding custom hosts\n\"" >> archInstallNCRS2.sh
echo "        curl -fL \"https://raw.githubusercontent.com/MiraiMindz/.dotfiles/main/misc/MiraiHosts.txt\" >> /etc/hosts" >> archInstallNCRS2.sh
echo "    else" >> archInstallNCRS2.sh
echo "        printf \"Proceeding with the installation\n\"" >> archInstallNCRS2.sh
echo "    fi" >> archInstallNCRS2.sh
echo "" >> archInstallNCRS2.sh
echo "    printf \"Setting up the root password\n\"" >> archInstallNCRS2.sh
echo "    passwd" >> archInstallNCRS2.sh
echo "" >> archInstallNCRS2.sh
echo "    echo -e -n \"What is your processor \${DARK_BLUE}I\${NOCOLOR}ntel or \${DARK_RED}A\${NOCOLOR}MD (\${DARK_BLUE}i\${NOCOLOR}/\${DARK_RED}\${NOCOLOR})? \"" >> archInstallNCRS2.sh
echo "    old_stty_cfg=\$(stty -g)" >> archInstallNCRS2.sh
echo "    stty raw -echo" >> archInstallNCRS2.sh
echo "    answer=\$( while ! head -c 1 | grep -i '[ai]' ;do true ;done )" >> archInstallNCRS2.sh
echo "    stty \$old_stty_cfg" >> archInstallNCRS2.sh
echo "    if echo \"\$answer\" | grep -iq \"^i\" ;then" >> archInstallNCRS2.sh
echo "        pacman -S intel-ucode" >> archInstallNCRS2.sh
echo "    else" >> archInstallNCRS2.sh
echo "        pacman -S amd-ucode" >> archInstallNCRS2.sh
echo "    fi" >> archInstallNCRS2.sh
echo "" >> archInstallNCRS2.sh
echo "    printf \"Downloading bootloader and other packages\n\"" >> archInstallNCRS2.sh
echo "    pacman -S grub networkmanager dialog wireless_tools wpa_supplicant os-prober mtools dosfstools base-devel linux-headers iwd dhcpcd" >> archInstallNCRS2.sh
echo "" >> archInstallNCRS2.sh
echo "    printf \"Installing bootloader\n\"" >> archInstallNCRS2.sh
echo "    printf \"Please answer the following question with the full name (/dev/sdX)\n\"" >> archInstallNCRS2.sh
echo "    read -e -p \"What is the name of your disk: \" dsknm" >> archInstallNCRS2.sh
echo "    grub-install --target=i386-pc \$dsknm" >> archInstallNCRS2.sh
echo "    grub-mkconfig -o /boot/grub/grub.cfg" >> archInstallNCRS2.sh
echo "" >> archInstallNCRS2.sh
echo "}" >> archInstallNCRS2.sh
echo "" >> archInstallNCRS2.sh
echo "ncursesAutoInstall2() {" >> archInstallNCRS2.sh
echo "    sleep 5" >> archInstallNCRS2.sh
echo "    dialog --title \"\$default_title 7/\$steps\" --msgbox \"\nUpdating the ZoneInfo to America/Sao_Paulo\" 25 90 && clear" >> archInstallNCRS2.sh
echo "    ln -sf /usr/share/zoneinfo/America/Sao_Paulo /etc/localtime" >> archInstallNCRS2.sh
echo "" >> archInstallNCRS2.sh
echo "    dialog --title \"\$default_title 8/\$steps\" --msgbox \"\nSyncronizing the hardware clock to the system clock\" 25 90 && clear" >> archInstallNCRS2.sh
echo "    hwclock --systohc" >> archInstallNCRS2.sh
echo "" >> archInstallNCRS2.sh
echo "    dialog --title \"\$default_title 9/\$steps\" --msgbox \"\nEditing /etc/locale.gen to pt_BR.UTF-8\" 25 90 && clear" >> archInstallNCRS2.sh
echo "    sed -i \"s/#pt_BR.UTF-8 UTF-8/pt_BR.UTF-8 UTF-8/\" /etc/locale.gen" >> archInstallNCRS2.sh
echo "    locale-gen" >> archInstallNCRS2.sh
echo "    dialog --title \"\$default_title 10/\$steps\" --msgbox \"\nSaving the locale in /etc/locale.conf\" 25 90 && clear" >> archInstallNCRS2.sh
echo "    if [ -e /etc/locale.conf ]; then" >> archInstallNCRS2.sh
echo "        echo \"LANG=pt_BR.UTF-8\" >> /etc/locale.conf" >> archInstallNCRS2.sh
echo "    else" >> archInstallNCRS2.sh
echo "        touch /etc/locale.conf" >> archInstallNCRS2.sh
echo "        echo \"LANG=pt_BR.UTF-8\" >> /etc/locale.conf" >> archInstallNCRS2.sh
echo "    fi" >> archInstallNCRS2.sh
echo "    dialog --title \"\$default_title 11/\$steps\" --msgbox \"\nSaving the keyboard layout in /etc/vconsole.conf\" 25 90 && clear" >> archInstallNCRS2.sh
echo "    if [ -e /etc/vconsole.conf ]; then" >> archInstallNCRS2.sh
echo "        echo \"KEYMAP=br-abnt2\" >> /etc/vconsole.conf" >> archInstallNCRS2.sh
echo "    else" >> archInstallNCRS2.sh
echo "        touch /etc/vconsole.conf" >> archInstallNCRS2.sh
echo "        echo \"KEYMAP=br-abnt2\" >> /etc/vconsole.conf" >> archInstallNCRS2.sh
echo "    fi" >> archInstallNCRS2.sh
echo "" >> archInstallNCRS2.sh
echo "    hstnm=\$(dialog --title \"\$default_title 12/\$steps\" --output-fd 1 --inputbox \"Enter this machine hostname: \" 25 90); clear" >> archInstallNCRS2.sh
echo "    if [[ -e /etc/hostname ]]; then" >> archInstallNCRS2.sh
echo "        echo \$hstnm >> /etc/hostname" >> archInstallNCRS2.sh
echo "    else" >> archInstallNCRS2.sh
echo "        touch /etc/hostname" >> archInstallNCRS2.sh
echo "        echo \$hstnm >> /etc/hostname" >> archInstallNCRS2.sh
echo "    fi" >> archInstallNCRS2.sh
echo "" >> archInstallNCRS2.sh
echo "    dialog --title \"\$default_title 13/\$steps\" --msgbox \"\nGenerating the hosts file\" 25 90 && clear" >> archInstallNCRS2.sh
echo "    echo \"# =====================================\" >> /etc/hosts" >> archInstallNCRS2.sh
echo "    echo \"# IPv4	Config\" >> /etc/hosts" >> archInstallNCRS2.sh
echo "    echo \"127.0.0.1	localhost\" >> /etc/hosts" >> archInstallNCRS2.sh
echo "    echo \"::1		localhost\" >> /etc/hosts" >> archInstallNCRS2.sh
echo "    echo \"127.0.1.1	\${hstnm}.localdomain	\${hstnm}\" >> /etc/hosts" >> archInstallNCRS2.sh
echo "    echo \"127.0.0.1	local\" > /etc/Hosts" >> archInstallNCRS2.sh
echo "    echo \"# =====================================\" >> /etc/hosts" >> archInstallNCRS2.sh
echo "    echo \"::1		ip6-localhost\" >> /etc/hosts" >> archInstallNCRS2.sh
echo "    echo \"::1		ip6-loopback\" >> /etc/hosts" >> archInstallNCRS2.sh
echo "    echo \"fe80::1%lo0 	localhost\" >> /etc/hosts" >> archInstallNCRS2.sh
echo "    echo \"ff00::0		ip6-localnet\" >> /etc/hosts" >> archInstallNCRS2.sh
echo "    echo \"ff00::0		ip6-mcastprefix\" >> /etc/hosts" >> archInstallNCRS2.sh
echo "    echo \"ff02::1		ip6-allnodes\" >> /etc/hosts" >> archInstallNCRS2.sh
echo "    echo \"ff02::2		ip6-allrouters\" >> /etc/hosts" >> archInstallNCRS2.sh
echo "    echo \"ff02::3		ip6-allhosts\" >> /etc/hosts" >> archInstallNCRS2.sh
echo "    echo \"0.0.0.0		0.0.0.0\" >> /etc/hosts" >> archInstallNCRS2.sh
echo "" >> archInstallNCRS2.sh
echo "    if dialog --title \"\$default_title 13/\$steps\" --yes-label \"Yes, add\" --no-label \"No, don't add\" --yesno \"\nDo you want to add Custom Hosts to this file too?\" 7 64; then" >> archInstallNCRS2.sh
echo "        clear" >> archInstallNCRS2.sh
echo "        counter=0;" >> archInstallNCRS2.sh
echo "        curl -fL \"https://raw.githubusercontent.com/MiraiMindz/.dotfiles/main/misc/MiraiHosts.txt\" >> /etc/hosts" >> archInstallNCRS2.sh
echo "        pid=\$!;" >> archInstallNCRS2.sh
echo "        trap \"kill \$pid 2> /dev/null\" EXIT;" >> archInstallNCRS2.sh
echo "        while kill -0 \$pid 2> /dev/null; do" >> archInstallNCRS2.sh
echo "            (( counter+=1 ))" >> archInstallNCRS2.sh
echo "            echo \$counter | dialog --title \"\$default_title 13/\$steps\" --gauge \"Adding custom hosts\" 7 50 0;" >> archInstallNCRS2.sh
echo "            sleep 0.1" >> archInstallNCRS2.sh
echo "        done;" >> archInstallNCRS2.sh
echo "        trap - EXIT" >> archInstallNCRS2.sh
echo "        counter=100" >> archInstallNCRS2.sh
echo "        echo \$counter | dialog --title \"\$default_title 13/\$steps\" --gauge \"Adding custom hosts\" 7 50 0" >> archInstallNCRS2.sh
echo "        clear" >> archInstallNCRS2.sh
echo "    else" >> archInstallNCRS2.sh
echo "        dialog --title \"\$default_title 13/\$steps\" --msgbox \"\nProceeding with the installation\" 5 12 && clear" >> archInstallNCRS2.sh
echo "    fi" >> archInstallNCRS2.sh
echo "" >> archInstallNCRS2.sh
echo "    rtpass=\$(dialog --title \"\$default_title 14/\$steps\" --output-fd 1 --passwordbox \"Enter the root password: \" 12 50); clear" >> archInstallNCRS2.sh
echo "    echo -e \"\$rtpass\n\$rtpass\" | sudo passwd -q" >> archInstallNCRS2.sh
echo "" >> archInstallNCRS2.sh
echo "    if dialog --title \"\$default_title 15/\$steps\" --yes-label \"Intel\" --no-label \"AMD\" --yesno \"\nIs your processor Intel or AMD?\" 7 64; then" >> archInstallNCRS2.sh
echo "        pacman -S intel-ucode" >> archInstallNCRS2.sh
echo "    else" >> archInstallNCRS2.sh
echo "        pacman -S amd-ucode" >> archInstallNCRS2.sh
echo "    fi" >> archInstallNCRS2.sh
echo "" >> archInstallNCRS2.sh
echo "    counter=0;" >> archInstallNCRS2.sh
echo "    pacman -S grub networkmanager dialog wireless_tools wpa_supplicant os-prober mtools dosfstools base-devel linux-headers iwd dhcpcd" >> archInstallNCRS2.sh
echo "    pid=\$!;" >> archInstallNCRS2.sh
echo "    trap \"kill \$pid 2> /dev/null\" EXIT;" >> archInstallNCRS2.sh
echo "    while kill -0 \$pid 2> /dev/null; do" >> archInstallNCRS2.sh
echo "        (( counter+=1 ))" >> archInstallNCRS2.sh
echo "        echo \$counter | dialog --title \"\$default_title 16/\$steps\" --gauge \"Downloading bootloader and other packages\" 7 50 0;" >> archInstallNCRS2.sh
echo "        sleep 0.1" >> archInstallNCRS2.sh
echo "    done;" >> archInstallNCRS2.sh
echo "    trap - EXIT" >> archInstallNCRS2.sh
echo "    counter=100" >> archInstallNCRS2.sh
echo "    echo \$counter | dialog --title \"\$default_title 16/\$steps\" --gauge \"Downloading bootloader and other packages\" 7 50 0" >> archInstallNCRS2.sh
echo "    clear" >> archInstallNCRS2.sh
echo "" >> archInstallNCRS2.sh
echo "    printf \"Installing bootloader\n\"" >> archInstallNCRS2.sh
echo "    dsknm=\$(dialog --title \"\$default_title 17/\$steps\" --output-fd 1 --inputbox \"What is the full name of your disk (/dev/sdX): \" 25 90);" clear >> archInstallNCRS2.sh
echo "    grub-install --target=i386-pc \$dsknm" >> archInstallNCRS2.sh
echo "    grub-mkconfig -o /boot/grub/grub.cfg" >> archInstallNCRS2.sh
echo "" >> archInstallNCRS2.sh
echo "}" >> archInstallNCRS2.sh
echo "" >> archInstallNCRS2.sh
echo "ncursesManualInstall2() {" >> archInstallNCRS2.sh
echo "    sleep 5" >> archInstallNCRS2.sh
echo "    localtmzn=\$(dialog --title \"\$default_title 8/\$steps\" --output-fd 1 --inputbox \"Type 'MENU' to use a menu selection\nEnter the location of your timezone:\nExample: America/Sao_Paulo\" 25 50); clear" >> archInstallNCRS2.sh
echo "    lwcs_localtmzn=\$(echo \"\$localtmzn\" | tr '[:upper:]' '[:lower:]')" >> archInstallNCRS2.sh
echo "    if [[ \"\$lwcs_localtmzn\" == \"menu\" ]]; then" >> archInstallNCRS2.sh
echo "        localtmzn=\$(dialog --title \"Mirai Arch\" --no-tags --output-fd 1 --menu \"Select your timezone\" 20 50 0 \"Africa/Abidjan\" \"Africa/Abidjan\" \"Africa/Accra\" \"Africa/Accra\" \"Africa/Addis_Ababa\" \"Africa/Addis_Ababa\" \"Africa/Algiers\" \"Africa/Algiers\" \"Africa/Asmara\" \"Africa/Asmara\" \"Africa/Asmera\" \"Africa/Asmera\" \"Africa/Bamako\" \"Africa/Bamako\" \"Africa/Bangui\" \"Africa/Bangui\" \"Africa/Banjul\" \"Africa/Banjul\" \"Africa/Bissau\" \"Africa/Bissau\" \"Africa/Blantyre\" \"Africa/Blantyre\" \"Africa/Brazzaville\" \"Africa/Brazzaville\" \"Africa/Bujumbura\" \"Africa/Bujumbura\" \"Africa/Cairo\" \"Africa/Cairo\" \"Africa/Casablanca\" \"Africa/Casablanca\" \"Africa/Ceuta\" \"Africa/Ceuta\" \"Africa/Conakry\" \"Africa/Conakry\" \"Africa/Dakar\" \"Africa/Dakar\" \"Africa/Dar_es_Salaam\" \"Africa/Dar_es_Salaam\" \"Africa/Djibouti\" \"Africa/Djibouti\" \"Africa/Douala\" \"Africa/Douala\" \"Africa/El_Aaiun\" \"Africa/El_Aaiun\" \"Africa/Freetown\" \"Africa/Freetown\" \"Africa/Gaborone\" \"Africa/Gaborone\" \"Africa/Harare\" \"Africa/Harare\" \"Africa/Johannesburg\" \"Africa/Johannesburg\" \"Africa/Juba\" \"Africa/Juba\" \"Africa/Kampala\" \"Africa/Kampala\" \"Africa/Khartoum\" \"Africa/Khartoum\" \"Africa/Kigali\" \"Africa/Kigali\" \"Africa/Kinshasa\" \"Africa/Kinshasa\" \"Africa/Lagos\" \"Africa/Lagos\" \"Africa/Libreville\" \"Africa/Libreville\" \"Africa/Lome\" \"Africa/Lome\" \"Africa/Luanda\" \"Africa/Luanda\" \"Africa/Lubumbashi\" \"Africa/Lubumbashi\" \"Africa/Lusaka\" \"Africa/Lusaka\" \"Africa/Malabo\" \"Africa/Malabo\" \"Africa/Maputo\" \"Africa/Maputo\" \"Africa/Maseru\" \"Africa/Maseru\" \"Africa/Mbabane\" \"Africa/Mbabane\" \"Africa/Mogadishu\" \"Africa/Mogadishu\" \"Africa/Monrovia\" \"Africa/Monrovia\" \"Africa/Nairobi\" \"Africa/Nairobi\" \"Africa/Ndjamena\" \"Africa/Ndjamena\" \"Africa/Niamey\" \"Africa/Niamey\" \"Africa/Nouakchott\" \"Africa/Nouakchott\" \"Africa/Ouagadougou\" \"Africa/Ouagadougou\" \"Africa/Porto-Novo\" \"Africa/Porto-Novo\" \"Africa/Sao_Tome\" \"Africa/Sao_Tome\" \"Africa/Timbuktu\" \"Africa/Timbuktu\" \"Africa/Tripoli\" \"Africa/Tripoli\" \"Africa/Tunis\" \"Africa/Tunis\" \"Africa/Windhoek\" \"Africa/Windhoek\" \"America/Adak\" \"America/Adak\" \"America/Anchorage\" \"America/Anchorage\" \"America/Anguilla\" \"America/Anguilla\" \"America/Antigua\" \"America/Antigua\" \"America/Araguaina\" \"America/Araguaina\" \"America/Argentina/Buenos_Aires\" \"America/Argentina/Buenos_Aires\" \"America/Argentina/Catamarca\" \"America/Argentina/Catamarca\" \"America/Argentina/ComodRivadavia\" \"America/Argentina/ComodRivadavia\" \"America/Argentina/Cordoba\" \"America/Argentina/Cordoba\" \"America/Argentina/Jujuy\" \"America/Argentina/Jujuy\" \"America/Argentina/La_Rioja\" \"America/Argentina/La_Rioja\" \"America/Argentina/Mendoza\" \"America/Argentina/Mendoza\" \"America/Argentina/Rio_Gallegos\" \"America/Argentina/Rio_Gallegos\" \"America/Argentina/Salta\" \"America/Argentina/Salta\" \"America/Argentina/San_Juan\" \"America/Argentina/San_Juan\" \"America/Argentina/San_Luis\" \"America/Argentina/San_Luis\" \"America/Argentina/Tucuman\" \"America/Argentina/Tucuman\" \"America/Argentina/Ushuaia\" \"America/Argentina/Ushuaia\" \"America/Aruba\" \"America/Aruba\" \"America/Asuncion\" \"America/Asuncion\" \"America/Atikokan\" \"America/Atikokan\" \"America/Atka\" \"America/Atka\" \"America/Bahia\" \"America/Bahia\" \"America/Bahia_Banderas\" \"America/Bahia_Banderas\" \"America/Barbados\" \"America/Barbados\" \"America/Belem\" \"America/Belem\" \"America/Belize\" \"America/Belize\" \"America/Blanc-Sablon\" \"America/Blanc-Sablon\" \"America/Boa_Vista\" \"America/Boa_Vista\" \"America/Bogota\" \"America/Bogota\" \"America/Boise\" \"America/Boise\" \"America/Buenos_Aires\" \"America/Buenos_Aires\" \"America/Cambridge_Bay\" \"America/Cambridge_Bay\" \"America/Campo_Grande\" \"America/Campo_Grande\" \"America/Cancun\" \"America/Cancun\" \"America/Caracas\" \"America/Caracas\" \"America/Catamarca\" \"America/Catamarca\" \"America/Cayenne\" \"America/Cayenne\" \"America/Cayman\" \"America/Cayman\" \"America/Chicago\" \"America/Chicago\" \"America/Chihuahua\" \"America/Chihuahua\" \"America/Coral_Harbour\" \"America/Coral_Harbour\" \"America/Cordoba\" \"America/Cordoba\" \"America/Costa_Rica\" \"America/Costa_Rica\" \"America/Creston\" \"America/Creston\" \"America/Cuiaba\" \"America/Cuiaba\" \"America/Curacao\" \"America/Curacao\" \"America/Danmarkshavn\" \"America/Danmarkshavn\" \"America/Dawson\" \"America/Dawson\" \"America/Dawson_Creek\" \"America/Dawson_Creek\" \"America/Denver\" \"America/Denver\" \"America/Detroit\" \"America/Detroit\" \"America/Dominica\" \"America/Dominica\" \"America/Edmonton\" \"America/Edmonton\" \"America/Eirunepe\" \"America/Eirunepe\" \"America/El_Salvador\" \"America/El_Salvador\" \"America/Ensenada\" \"America/Ensenada\" \"America/Fort_Nelson\" \"America/Fort_Nelson\" \"America/Fort_Wayne\" \"America/Fort_Wayne\" \"America/Fortaleza\" \"America/Fortaleza\" \"America/Glace_Bay\" \"America/Glace_Bay\" \"America/Godthab\" \"America/Godthab\" \"America/Goose_Bay\" \"America/Goose_Bay\" \"America/Grand_Turk\" \"America/Grand_Turk\" \"America/Grenada\" \"America/Grenada\" \"America/Guadeloupe\" \"America/Guadeloupe\" \"America/Guatemala\" \"America/Guatemala\" \"America/Guayaquil\" \"America/Guayaquil\" \"America/Guyana\" \"America/Guyana\" \"America/Halifax\" \"America/Halifax\" \"America/Havana\" \"America/Havana\" \"America/Hermosillo\" \"America/Hermosillo\" \"America/Indiana/Indianapolis\" \"America/Indiana/Indianapolis\" \"America/Indiana/Knox\" \"America/Indiana/Knox\" \"America/Indiana/Marengo\" \"America/Indiana/Marengo\" \"America/Indiana/Petersburg\" \"America/Indiana/Petersburg\" \"America/Indiana/Tell_City\" \"America/Indiana/Tell_City\" \"America/Indiana/Vevay\" \"America/Indiana/Vevay\" \"America/Indiana/Vincennes\" \"America/Indiana/Vincennes\" \"America/Indiana/Winamac\" \"America/Indiana/Winamac\" \"America/Indianapolis\" \"America/Indianapolis\" \"America/Inuvik\" \"America/Inuvik\" \"America/Iqaluit\" \"America/Iqaluit\" \"America/Jamaica\" \"America/Jamaica\" \"America/Jujuy\" \"America/Jujuy\" \"America/Juneau\" \"America/Juneau\" \"America/Kentucky/Louisville\" \"America/Kentucky/Louisville\" \"America/Kentucky/Monticello\" \"America/Kentucky/Monticello\" \"America/Knox_IN\" \"America/Knox_IN\" \"America/Kralendijk\" \"America/Kralendijk\" \"America/La_Paz\" \"America/La_Paz\" \"America/Lima\" \"America/Lima\" \"America/Los_Angeles\" \"America/Los_Angeles\" \"America/Louisville\" \"America/Louisville\" \"America/Lower_Princes\" \"America/Lower_Princes\" \"America/Maceio\" \"America/Maceio\" \"America/Managua\" \"America/Managua\" \"America/Manaus\" \"America/Manaus\" \"America/Marigot\" \"America/Marigot\" \"America/Martinique\" \"America/Martinique\" \"America/Matamoros\" \"America/Matamoros\" \"America/Mazatlan\" \"America/Mazatlan\" \"America/Mendoza\" \"America/Mendoza\" \"America/Menominee\" \"America/Menominee\" \"America/Merida\" \"America/Merida\" \"America/Metlakatla\" \"America/Metlakatla\" \"America/Mexico_City\" \"America/Mexico_City\" \"America/Miquelon\" \"America/Miquelon\" \"America/Moncton\" \"America/Moncton\" \"America/Monterrey\" \"America/Monterrey\" \"America/Montevideo\" \"America/Montevideo\" \"America/Montreal\" \"America/Montreal\" \"America/Montserrat\" \"America/Montserrat\" \"America/Nassau\" \"America/Nassau\" \"America/New_York\" \"America/New_York\" \"America/Nipigon\" \"America/Nipigon\" \"America/Nome\" \"America/Nome\" \"America/Noronha\" \"America/Noronha\" \"America/North_Dakota/Beulah\" \"America/North_Dakota/Beulah\" \"America/North_Dakota/Center\" \"America/North_Dakota/Center\" \"America/North_Dakota/New_Salem\" \"America/North_Dakota/New_Salem\" \"America/Nuuk\" \"America/Nuuk\" \"America/Ojinaga\" \"America/Ojinaga\" \"America/Panama\" \"America/Panama\" \"America/Pangnirtung\" \"America/Pangnirtung\" \"America/Paramaribo\" \"America/Paramaribo\" \"America/Phoenix\" \"America/Phoenix\" \"America/Port-au-Prince\" \"America/Port-au-Prince\" \"America/Port_of_Spain\" \"America/Port_of_Spain\" \"America/Porto_Acre\" \"America/Porto_Acre\" \"America/Porto_Velho\" \"America/Porto_Velho\" \"America/Puerto_Rico\" \"America/Puerto_Rico\" \"America/Punta_Arenas\" \"America/Punta_Arenas\" \"America/Rainy_River\" \"America/Rainy_River\" \"America/Rankin_Inlet\" \"America/Rankin_Inlet\" \"America/Recife\" \"America/Recife\" \"America/Regina\" \"America/Regina\" \"America/Resolute\" \"America/Resolute\" \"America/Rio_Branco\" \"America/Rio_Branco\" \"America/Rosario\" \"America/Rosario\" \"America/Santa_Isabel\" \"America/Santa_Isabel\" \"America/Santarem\" \"America/Santarem\" \"America/Santiago\" \"America/Santiago\" \"America/Santo_Domingo\" \"America/Santo_Domingo\" \"America/Sao_Paulo\" \"America/Sao_Paulo\" \"America/Scoresbysund\" \"America/Scoresbysund\" \"America/Shiprock\" \"America/Shiprock\" \"America/Sitka\" \"America/Sitka\" \"America/St_Barthelemy\" \"America/St_Barthelemy\" \"America/St_Johns\" \"America/St_Johns\" \"America/St_Kitts\" \"America/St_Kitts\" \"America/St_Lucia\" \"America/St_Lucia\" \"America/St_Thomas\" \"America/St_Thomas\" \"America/St_Vincent\" \"America/St_Vincent\" \"America/Swift_Current\" \"America/Swift_Current\" \"America/Tegucigalpa\" \"America/Tegucigalpa\" \"America/Thule\" \"America/Thule\" \"America/Thunder_Bay\" \"America/Thunder_Bay\" \"America/Tijuana\" \"America/Tijuana\" \"America/Toronto\" \"America/Toronto\" \"America/Tortola\" \"America/Tortola\" \"America/Vancouver\" \"America/Vancouver\" \"America/Virgin\" \"America/Virgin\" \"America/Whitehorse\" \"America/Whitehorse\" \"America/Winnipeg\" \"America/Winnipeg\" \"America/Yakutat\" \"America/Yakutat\" \"America/Yellowknife\" \"America/Yellowknife\" \"Antarctica/Casey\" \"Antarctica/Casey\" \"Antarctica/Davis\" \"Antarctica/Davis\" \"Antarctica/DumontDUrville\" \"Antarctica/DumontDUrville\" \"Antarctica/Macquarie\" \"Antarctica/Macquarie\" \"Antarctica/Mawson\" \"Antarctica/Mawson\" \"Antarctica/McMurdo\" \"Antarctica/McMurdo\" \"Antarctica/Palmer\" \"Antarctica/Palmer\" \"Antarctica/Rothera\" \"Antarctica/Rothera\" \"Antarctica/South_Pole\" \"Antarctica/South_Pole\" \"Antarctica/Syowa\" \"Antarctica/Syowa\" \"Antarctica/Troll\" \"Antarctica/Troll\" \"Antarctica/Vostok\" \"Antarctica/Vostok\" \"Arctic/Longyearbyen\" \"Arctic/Longyearbyen\" \"Asia/Aden\" \"Asia/Aden\" \"Asia/Almaty\" \"Asia/Almaty\" \"Asia/Amman\" \"Asia/Amman\" \"Asia/Anadyr\" \"Asia/Anadyr\" \"Asia/Aqtau\" \"Asia/Aqtau\" \"Asia/Aqtobe\" \"Asia/Aqtobe\" \"Asia/Ashgabat\" \"Asia/Ashgabat\" \"Asia/Ashkhabad\" \"Asia/Ashkhabad\" \"Asia/Atyrau\" \"Asia/Atyrau\" \"Asia/Baghdad\" \"Asia/Baghdad\" \"Asia/Bahrain\" \"Asia/Bahrain\" \"Asia/Baku\" \"Asia/Baku\" \"Asia/Bangkok\" \"Asia/Bangkok\" \"Asia/Barnaul\" \"Asia/Barnaul\" \"Asia/Beirut\" \"Asia/Beirut\" \"Asia/Bishkek\" \"Asia/Bishkek\" \"Asia/Brunei\" \"Asia/Brunei\" \"Asia/Calcutta\" \"Asia/Calcutta\" \"Asia/Chita\" \"Asia/Chita\" \"Asia/Choibalsan\" \"Asia/Choibalsan\" \"Asia/Chongqing\" \"Asia/Chongqing\" \"Asia/Chungking\" \"Asia/Chungking\" \"Asia/Colombo\" \"Asia/Colombo\" \"Asia/Dacca\" \"Asia/Dacca\" \"Asia/Damascus\" \"Asia/Damascus\" \"Asia/Dhaka\" \"Asia/Dhaka\" \"Asia/Dili\" \"Asia/Dili\" \"Asia/Dubai\" \"Asia/Dubai\" \"Asia/Dushanbe\" \"Asia/Dushanbe\" \"Asia/Famagusta\" \"Asia/Famagusta\" \"Asia/Gaza\" \"Asia/Gaza\" \"Asia/Harbin\" \"Asia/Harbin\" \"Asia/Hebron\" \"Asia/Hebron\" \"Asia/Ho_Chi_Minh\" \"Asia/Ho_Chi_Minh\" \"Asia/Hong_Kong\" \"Asia/Hong_Kong\" \"Asia/Hovd\" \"Asia/Hovd\" \"Asia/Irkutsk\" \"Asia/Irkutsk\" \"Asia/Istanbul\" \"Asia/Istanbul\" \"Asia/Jakarta\" \"Asia/Jakarta\" \"Asia/Jayapura\" \"Asia/Jayapura\" \"Asia/Jerusalem\" \"Asia/Jerusalem\" \"Asia/Kabul\" \"Asia/Kabul\" \"Asia/Kamchatka\" \"Asia/Kamchatka\" \"Asia/Karachi\" \"Asia/Karachi\" \"Asia/Kashgar\" \"Asia/Kashgar\" \"Asia/Kathmandu\" \"Asia/Kathmandu\" \"Asia/Katmandu\" \"Asia/Katmandu\" \"Asia/Khandyga\" \"Asia/Khandyga\" \"Asia/Kolkata\" \"Asia/Kolkata\" \"Asia/Krasnoyarsk\" \"Asia/Krasnoyarsk\" \"Asia/Kuala_Lumpur\" \"Asia/Kuala_Lumpur\" \"Asia/Kuching\" \"Asia/Kuching\" \"Asia/Kuwait\" \"Asia/Kuwait\" \"Asia/Macao\" \"Asia/Macao\" \"Asia/Macau\" \"Asia/Macau\" \"Asia/Magadan\" \"Asia/Magadan\" \"Asia/Makassar\" \"Asia/Makassar\" \"Asia/Manila\" \"Asia/Manila\" \"Asia/Muscat\" \"Asia/Muscat\" \"Asia/Nicosia\" \"Asia/Nicosia\" \"Asia/Novokuznetsk\" \"Asia/Novokuznetsk\" \"Asia/Novosibirsk\" \"Asia/Novosibirsk\" \"Asia/Omsk\" \"Asia/Omsk\" \"Asia/Oral\" \"Asia/Oral\" \"Asia/Phnom_Penh\" \"Asia/Phnom_Penh\" \"Asia/Pontianak\" \"Asia/Pontianak\" \"Asia/Pyongyang\" \"Asia/Pyongyang\" \"Asia/Qatar\" \"Asia/Qatar\" \"Asia/Qostanay\" \"Asia/Qostanay\" \"Asia/Qyzylorda\" \"Asia/Qyzylorda\" \"Asia/Rangoon\" \"Asia/Rangoon\" \"Asia/Riyadh\" \"Asia/Riyadh\" \"Asia/Saigon\" \"Asia/Saigon\" \"Asia/Sakhalin\" \"Asia/Sakhalin\" \"Asia/Samarkand\" \"Asia/Samarkand\" \"Asia/Seoul\" \"Asia/Seoul\" \"Asia/Shanghai\" \"Asia/Shanghai\" \"Asia/Singapore\" \"Asia/Singapore\" \"Asia/Srednekolymsk\" \"Asia/Srednekolymsk\" \"Asia/Taipei\" \"Asia/Taipei\" \"Asia/Tashkent\" \"Asia/Tashkent\" \"Asia/Tbilisi\" \"Asia/Tbilisi\" \"Asia/Tehran\" \"Asia/Tehran\" \"Asia/Tel_Aviv\" \"Asia/Tel_Aviv\" \"Asia/Thimbu\" \"Asia/Thimbu\" \"Asia/Thimphu\" \"Asia/Thimphu\" \"Asia/Tokyo\" \"Asia/Tokyo\" \"Asia/Tomsk\" \"Asia/Tomsk\" \"Asia/Ujung_Pandang\" \"Asia/Ujung_Pandang\" \"Asia/Ulaanbaatar\" \"Asia/Ulaanbaatar\" \"Asia/Ulan_Bator\" \"Asia/Ulan_Bator\" \"Asia/Urumqi\" \"Asia/Urumqi\" \"Asia/Ust-Nera\" \"Asia/Ust-Nera\" \"Asia/Vientiane\" \"Asia/Vientiane\" \"Asia/Vladivostok\" \"Asia/Vladivostok\" \"Asia/Yakutsk\" \"Asia/Yakutsk\" \"Asia/Yangon\" \"Asia/Yangon\" \"Asia/Yekaterinburg\" \"Asia/Yekaterinburg\" \"Asia/Yerevan\" \"Asia/Yerevan\" \"Atlantic/Azores\" \"Atlantic/Azores\" \"Atlantic/Bermuda\" \"Atlantic/Bermuda\" \"Atlantic/Canary\" \"Atlantic/Canary\" \"Atlantic/Cape_Verde\" \"Atlantic/Cape_Verde\" \"Atlantic/Faeroe\" \"Atlantic/Faeroe\" \"Atlantic/Faroe\" \"Atlantic/Faroe\" \"Atlantic/Jan_Mayen\" \"Atlantic/Jan_Mayen\" \"Atlantic/Madeira\" \"Atlantic/Madeira\" \"Atlantic/Reykjavik\" \"Atlantic/Reykjavik\" \"Atlantic/South_Georgia\" \"Atlantic/South_Georgia\" \"Atlantic/St_Helena\" \"Atlantic/St_Helena\" \"Atlantic/Stanley\" \"Atlantic/Stanley\" \"Australia/ACT\" \"Australia/ACT\" \"Australia/Adelaide\" \"Australia/Adelaide\" \"Australia/Brisbane\" \"Australia/Brisbane\" \"Australia/Broken_Hill\" \"Australia/Broken_Hill\" \"Australia/Canberra\" \"Australia/Canberra\" \"Australia/Currie\" \"Australia/Currie\" \"Australia/Darwin\" \"Australia/Darwin\" \"Australia/Eucla\" \"Australia/Eucla\" \"Australia/Hobart\" \"Australia/Hobart\" \"Australia/LHI\" \"Australia/LHI\" \"Australia/Lindeman\" \"Australia/Lindeman\" \"Australia/Lord_Howe\" \"Australia/Lord_Howe\" \"Australia/Melbourne\" \"Australia/Melbourne\" \"Australia/NSW\" \"Australia/NSW\" \"Australia/North\" \"Australia/North\" \"Australia/Perth\" \"Australia/Perth\" \"Australia/Queensland\" \"Australia/Queensland\" \"Australia/South\" \"Australia/South\" \"Australia/Sydney\" \"Australia/Sydney\" \"Australia/Tasmania\" \"Australia/Tasmania\" \"Australia/Victoria\" \"Australia/Victoria\" \"Australia/West\" \"Australia/West\" \"Australia/Yancowinna\" \"Australia/Yancowinna\" \"Brazil/Acre\" \"Brazil/Acre\" \"Brazil/DeNoronha\" \"Brazil/DeNoronha\" \"Brazil/East\" \"Brazil/East\" \"Brazil/West\" \"Brazil/West\" \"CET\" \"CET\" \"CST6CDT\" \"CST6CDT\" \"Canada/Atlantic\" \"Canada/Atlantic\" \"Canada/Central\" \"Canada/Central\" \"Canada/Eastern\" \"Canada/Eastern\" \"Canada/Mountain\" \"Canada/Mountain\" \"Canada/Newfoundland\" \"Canada/Newfoundland\" \"Canada/Pacific\" \"Canada/Pacific\" \"Canada/Saskatchewan\" \"Canada/Saskatchewan\" \"Canada/Yukon\" \"Canada/Yukon\" \"Chile/Continental\" \"Chile/Continental\" \"Chile/EasterIsland\" \"Chile/EasterIsland\" \"Cuba\" \"Cuba\" \"EET\" \"EET\" \"EST\" \"EST\" \"EST5EDT\" \"EST5EDT\" \"Egypt\" \"Egypt\" \"Eire\" \"Eire\" \"Etc/GMT\" \"Etc/GMT\" \"Etc/GMT+0\" \"Etc/GMT+0\" \"Etc/GMT+1\" \"Etc/GMT+1\" \"Etc/GMT+10\" \"Etc/GMT+10\" \"Etc/GMT+11\" \"Etc/GMT+11\" \"Etc/GMT+12\" \"Etc/GMT+12\" \"Etc/GMT+2\" \"Etc/GMT+2\" \"Etc/GMT+3\" \"Etc/GMT+3\" \"Etc/GMT+4\" \"Etc/GMT+4\" \"Etc/GMT+5\" \"Etc/GMT+5\" \"Etc/GMT+6\" \"Etc/GMT+6\" \"Etc/GMT+7\" \"Etc/GMT+7\" \"Etc/GMT+8\" \"Etc/GMT+8\" \"Etc/GMT+9\" \"Etc/GMT+9\" \"Etc/GMT-0\" \"Etc/GMT-0\" \"Etc/GMT-1\" \"Etc/GMT-1\" \"Etc/GMT-10\" \"Etc/GMT-10\" \"Etc/GMT-11\" \"Etc/GMT-11\" \"Etc/GMT-12\" \"Etc/GMT-12\" \"Etc/GMT-13\" \"Etc/GMT-13\" \"Etc/GMT-14\" \"Etc/GMT-14\" \"Etc/GMT-2\" \"Etc/GMT-2\" \"Etc/GMT-3\" \"Etc/GMT-3\" \"Etc/GMT-4\" \"Etc/GMT-4\" \"Etc/GMT-5\" \"Etc/GMT-5\" \"Etc/GMT-6\" \"Etc/GMT-6\" \"Etc/GMT-7\" \"Etc/GMT-7\" \"Etc/GMT-8\" \"Etc/GMT-8\" \"Etc/GMT-9\" \"Etc/GMT-9\" \"Etc/GMT0\" \"Etc/GMT0\" \"Etc/Greenwich\" \"Etc/Greenwich\" \"Etc/UCT\" \"Etc/UCT\" \"Etc/UTC\" \"Etc/UTC\" \"Etc/Universal\" \"Etc/Universal\" \"Etc/Zulu\" \"Etc/Zulu\" \"Europe/Amsterdam\" \"Europe/Amsterdam\" \"Europe/Andorra\" \"Europe/Andorra\" \"Europe/Astrakhan\" \"Europe/Astrakhan\" \"Europe/Athens\" \"Europe/Athens\" \"Europe/Belfast\" \"Europe/Belfast\" \"Europe/Belgrade\" \"Europe/Belgrade\" \"Europe/Berlin\" \"Europe/Berlin\" \"Europe/Bratislava\" \"Europe/Bratislava\" \"Europe/Brussels\" \"Europe/Brussels\" \"Europe/Bucharest\" \"Europe/Bucharest\" \"Europe/Budapest\" \"Europe/Budapest\" \"Europe/Busingen\" \"Europe/Busingen\" \"Europe/Chisinau\" \"Europe/Chisinau\" \"Europe/Copenhagen\" \"Europe/Copenhagen\" \"Europe/Dublin\" \"Europe/Dublin\" \"Europe/Gibraltar\" \"Europe/Gibraltar\" \"Europe/Guernsey\" \"Europe/Guernsey\" \"Europe/Helsinki\" \"Europe/Helsinki\" \"Europe/Isle_of_Man\" \"Europe/Isle_of_Man\" \"Europe/Istanbul\" \"Europe/Istanbul\" \"Europe/Jersey\" \"Europe/Jersey\" \"Europe/Kaliningrad\" \"Europe/Kaliningrad\" \"Europe/Kiev\" \"Europe/Kiev\" \"Europe/Kirov\" \"Europe/Kirov\" \"Europe/Lisbon\" \"Europe/Lisbon\" \"Europe/Ljubljana\" \"Europe/Ljubljana\" \"Europe/London\" \"Europe/London\" \"Europe/Luxembourg\" \"Europe/Luxembourg\" \"Europe/Madrid\" \"Europe/Madrid\" \"Europe/Malta\" \"Europe/Malta\" \"Europe/Mariehamn\" \"Europe/Mariehamn\" \"Europe/Minsk\" \"Europe/Minsk\" \"Europe/Monaco\" \"Europe/Monaco\" \"Europe/Moscow\" \"Europe/Moscow\" \"Europe/Nicosia\" \"Europe/Nicosia\" \"Europe/Oslo\" \"Europe/Oslo\" \"Europe/Paris\" \"Europe/Paris\" \"Europe/Podgorica\" \"Europe/Podgorica\" \"Europe/Prague\" \"Europe/Prague\" \"Europe/Riga\" \"Europe/Riga\" \"Europe/Rome\" \"Europe/Rome\" \"Europe/Samara\" \"Europe/Samara\" \"Europe/San_Marino\" \"Europe/San_Marino\" \"Europe/Sarajevo\" \"Europe/Sarajevo\" \"Europe/Saratov\" \"Europe/Saratov\" \"Europe/Simferopol\" \"Europe/Simferopol\" \"Europe/Skopje\" \"Europe/Skopje\" \"Europe/Sofia\" \"Europe/Sofia\" \"Europe/Stockholm\" \"Europe/Stockholm\" \"Europe/Tallinn\" \"Europe/Tallinn\" \"Europe/Tirane\" \"Europe/Tirane\" \"Europe/Tiraspol\" \"Europe/Tiraspol\" \"Europe/Ulyanovsk\" \"Europe/Ulyanovsk\" \"Europe/Uzhgorod\" \"Europe/Uzhgorod\" \"Europe/Vaduz\" \"Europe/Vaduz\" \"Europe/Vatican\" \"Europe/Vatican\" \"Europe/Vienna\" \"Europe/Vienna\" \"Europe/Vilnius\" \"Europe/Vilnius\" \"Europe/Volgograd\" \"Europe/Volgograd\" \"Europe/Warsaw\" \"Europe/Warsaw\" \"Europe/Zagreb\" \"Europe/Zagreb\" \"Europe/Zaporozhye\" \"Europe/Zaporozhye\" \"Europe/Zurich\" \"Europe/Zurich\" \"Factory\" \"Factory\" \"GB\" \"GB\" \"GB-Eire\" \"GB-Eire\" \"GMT\" \"GMT\" \"GMT+0\" \"GMT+0\" \"GMT-0\" \"GMT-0\" \"GMT0\" \"GMT0\" \"Greenwich\" \"Greenwich\" \"HST\" \"HST\" \"Hongkong\" \"Hongkong\" \"Iceland\" \"Iceland\" \"Indian/Antananarivo\" \"Indian/Antananarivo\" \"Indian/Chagos\" \"Indian/Chagos\" \"Indian/Christmas\" \"Indian/Christmas\" \"Indian/Cocos\" \"Indian/Cocos\" \"Indian/Comoro\" \"Indian/Comoro\" \"Indian/Kerguelen\" \"Indian/Kerguelen\" \"Indian/Mahe\" \"Indian/Mahe\" \"Indian/Maldives\" \"Indian/Maldives\" \"Indian/Mauritius\" \"Indian/Mauritius\" \"Indian/Mayotte\" \"Indian/Mayotte\" \"Indian/Reunion\" \"Indian/Reunion\" \"Iran\" \"Iran\" \"Israel\" \"Israel\" \"Jamaica\" \"Jamaica\" \"Japan\" \"Japan\" \"Kwajalein\" \"Kwajalein\" \"Libya\" \"Libya\" \"MET\" \"MET\" \"MST\" \"MST\" \"MST7MDT\" \"MST7MDT\" \"Mexico/BajaNorte\" \"Mexico/BajaNorte\" \"Mexico/BajaSur\" \"Mexico/BajaSur\" \"Mexico/General\" \"Mexico/General\" \"NZ\" \"NZ\" \"NZ-CHAT\" \"NZ-CHAT\" \"Navajo\" \"Navajo\" \"PRC\" \"PRC\" \"PST8PDT\" \"PST8PDT\" \"Pacific/Apia\" \"Pacific/Apia\" \"Pacific/Auckland\" \"Pacific/Auckland\" \"Pacific/Bougainville\" \"Pacific/Bougainville\" \"Pacific/Chatham\" \"Pacific/Chatham\" \"Pacific/Chuuk\" \"Pacific/Chuuk\" \"Pacific/Easter\" \"Pacific/Easter\" \"Pacific/Efate\" \"Pacific/Efate\" \"Pacific/Enderbury\" \"Pacific/Enderbury\" \"Pacific/Fakaofo\" \"Pacific/Fakaofo\" \"Pacific/Fiji\" \"Pacific/Fiji\" \"Pacific/Funafuti\" \"Pacific/Funafuti\" \"Pacific/Galapagos\" \"Pacific/Galapagos\" \"Pacific/Gambier\" \"Pacific/Gambier\" \"Pacific/Guadalcanal\" \"Pacific/Guadalcanal\" \"Pacific/Guam\" \"Pacific/Guam\" \"Pacific/Honolulu\" \"Pacific/Honolulu\" \"Pacific/Johnston\" \"Pacific/Johnston\" \"Pacific/Kanton\" \"Pacific/Kanton\" \"Pacific/Kiritimati\" \"Pacific/Kiritimati\" \"Pacific/Kosrae\" \"Pacific/Kosrae\" \"Pacific/Kwajalein\" \"Pacific/Kwajalein\" \"Pacific/Majuro\" \"Pacific/Majuro\" \"Pacific/Marquesas\" \"Pacific/Marquesas\" \"Pacific/Midway\" \"Pacific/Midway\" \"Pacific/Nauru\" \"Pacific/Nauru\" \"Pacific/Niue\" \"Pacific/Niue\" \"Pacific/Norfolk\" \"Pacific/Norfolk\" \"Pacific/Noumea\" \"Pacific/Noumea\" \"Pacific/Pago_Pago\" \"Pacific/Pago_Pago\" \"Pacific/Palau\" \"Pacific/Palau\" \"Pacific/Pitcairn\" \"Pacific/Pitcairn\" \"Pacific/Pohnpei\" \"Pacific/Pohnpei\" \"Pacific/Ponape\" \"Pacific/Ponape\" \"Pacific/Port_Moresby\" \"Pacific/Port_Moresby\" \"Pacific/Rarotonga\" \"Pacific/Rarotonga\" \"Pacific/Saipan\" \"Pacific/Saipan\" \"Pacific/Samoa\" \"Pacific/Samoa\" \"Pacific/Tahiti\" \"Pacific/Tahiti\" \"Pacific/Tarawa\" \"Pacific/Tarawa\" \"Pacific/Tongatapu\" \"Pacific/Tongatapu\" \"Pacific/Truk\" \"Pacific/Truk\" \"Pacific/Wake\" \"Pacific/Wake\" \"Pacific/Wallis\" \"Pacific/Wallis\" \"Pacific/Yap\" \"Pacific/Yap\" \"Poland\" \"Poland\" \"Portugal\" \"Portugal\" \"ROC\" \"ROC\" \"ROK\" \"ROK\" \"Singapore\" \"Singapore\" \"Turkey\" \"Turkey\" \"UCT\" \"UCT\" \"US/Alaska\" \"US/Alaska\" \"US/Aleutian\" \"US/Aleutian\" \"US/Arizona\" \"US/Arizona\" \"US/Central\" \"US/Central\" \"US/East-Indiana\" \"US/East-Indiana\" \"US/Eastern\" \"US/Eastern\" \"US/Hawaii\" \"US/Hawaii\" \"US/Indiana-Starke\" \"US/Indiana-Starke\" \"US/Michigan\" \"US/Michigan\" \"US/Mountain\" \"US/Mountain\" \"US/Pacific\" \"US/Pacific\" \"US/Samoa\" \"US/Samoa\" \"UTC\" \"UTC\" \"Universal\" \"Universal\" \"W-SU\" \"W-SU\" \"WET\" \"WET\" \"Zulu\" \"Zulu\"); clear" >> archInstallNCRS2.sh
echo "    else" >> archInstallNCRS2.sh
echo "        if [[ \"\$localtmzn\" =~ .*\"/usr/share/zoneinfo/\".* ]]; then" >> archInstallNCRS2.sh
echo "            tmzn=\$(echo \"\$localtmzn\" | cut -d/ -f5-)" >> archInstallNCRS2.sh
echo "        else" >> archInstallNCRS2.sh
echo "            tmzn=\$localtmzn" >> archInstallNCRS2.sh
echo "        fi" >> archInstallNCRS2.sh
echo "    fi" >> archInstallNCRS2.sh
echo "    ln -sf /usr/share/zoneinfo/\$tmzn /etc/localtime" >> archInstallNCRS2.sh
echo "" >> archInstallNCRS2.sh
echo "    dialog --title \"\$default_title 9/\$steps\" --infobox \"\nSyncronizing the hardware clock to the system clock\" 25 90 && clear" >> archInstallNCRS2.sh
echo "    hwclock --systohc" >> archInstallNCRS2.sh
echo "" >> archInstallNCRS2.sh
echo "    localelang=\$(dialog --title \"\$default_title 10/\$steps\" --output-fd 1 --inputbox \"Type 'MENU' to use a menu selection\nEnter the languages that you want to use on your system:\nNOTE: They need to be separated by comma (,) without spaces in between\nExample: pt_BR.UTF-8 UTF-8,en_US ISO-8859-1\" 25 75); clear" >> archInstallNCRS2.sh
echo "    IFS=',' read -r -a splt_localelang <<< \"\$localelang\"" >> archInstallNCRS2.sh
echo "    usrlocaleslist=()" >> archInstallNCRS2.sh
echo "    for element in \"\${splt_localelang[@]}\"; do" >> archInstallNCRS2.sh
echo "        sed -i \"s/#\$element/\$element/\" /etc/locale.gen" >> archInstallNCRS2.sh
echo "        usrlocaleslist+=\"\\\"\$element\\\" \\\"\$element\\\" \"" >> archInstallNCRS2.sh
echo "    done" >> archInstallNCRS2.sh
echo "    cmd=(\"dialog --title \\\"Mirai Arch\\\" --no-tags --output-fd 1 --menu \\\"Select the language that you will use on your system\\\" 25 75 0\")" >> archInstallNCRS2.sh
echo "    _cmd=\$(echo \"\${cmd[@]}\" \"\${usrlocaleslist[@]}\")" >> archInstallNCRS2.sh
echo "    usrlocale=\$(bash -c \"\$_cmd\")" >> archInstallNCRS2.sh
echo "    clear" >> archInstallNCRS2.sh
echo "    dialog --title \"\$default_title 10/\$steps\" --infobox \"Saving the locale in /etc/locale.conf\" 25 90 && clear" >> archInstallNCRS2.sh
echo "    if [ -e /etc/locale.conf ]; then" >> archInstallNCRS2.sh
echo "        echo \"LANG=\$usrlocale\" >> /etc/locale.conf" >> archInstallNCRS2.sh
echo "    else" >> archInstallNCRS2.sh
echo "        touch /etc/locale.conf" >> archInstallNCRS2.sh
echo "        echo \"LANG=\$usrlocale\" >> /etc/locale.conf" >> archInstallNCRS2.sh
echo "    fi" >> archInstallNCRS2.sh
echo "" >> archInstallNCRS2.sh
echo "    dialog --title \"\$default_title 11/\$steps\" --infobox \"Saving the keymap in /etc/vconsole.conf\" 25 90 && clear" >> archInstallNCRS2.sh
echo "    if [ -e /etc/vconsole.conf ]; then" >> archInstallNCRS2.sh
echo "        echo \"KEYMAP=\$usrkymp\" >> /etc/vconsole.conf" >> archInstallNCRS2.sh
echo "    else" >> archInstallNCRS2.sh
echo "        touch /etc/vconsole.conf" >> archInstallNCRS2.sh
echo "        echo \"KEYMAP=\$usrkymp\" >> /etc/vconsole.conf" >> archInstallNCRS2.sh
echo "    fi" >> archInstallNCRS2.sh
echo "" >> archInstallNCRS2.sh
echo "    hstnm=\$(dialog --title \"\$default_title 12/\$steps\" --output-fd 1 --inputbox \"Enter your hostname:\" 25 75); clear" >> archInstallNCRS2.sh
echo "    if [ -e /etc/hostname ]; then" >> archInstallNCRS2.sh
echo "        echo \$hstnm >> /etc/hostname" >> archInstallNCRS2.sh
echo "    else" >> archInstallNCRS2.sh
echo "        touch /etc/hostname" >> archInstallNCRS2.sh
echo "        echo \$hstnm >> /etc/hostname" >> archInstallNCRS2.sh
echo "    fi" >> archInstallNCRS2.sh
echo "" >> archInstallNCRS2.sh
echo "    echo \"# =====================================\" >> /etc/hosts" >> archInstallNCRS2.sh
echo "    echo \"# IPv4	Config\" >> /etc/hosts" >> archInstallNCRS2.sh
echo "    echo \"127.0.0.1	localhost\" >> /etc/hosts" >> archInstallNCRS2.sh
echo "    echo \"::1		localhost\" >> /etc/hosts" >> archInstallNCRS2.sh
echo "    echo \"127.0.1.1	\${hstnm}.localdomain	\${hstnm}\" >> /etc/hosts" >> archInstallNCRS2.sh
echo "    echo \"127.0.0.1	local\" > /etc/Hosts" >> archInstallNCRS2.sh
echo "    echo \"# =====================================\" >> /etc/hosts" >> archInstallNCRS2.sh
echo "    echo \"::1		ip6-localhost\" >> /etc/hosts" >> archInstallNCRS2.sh
echo "    echo \"::1		ip6-loopback\" >> /etc/hosts" >> archInstallNCRS2.sh
echo "    echo \"fe80::1%lo0 	localhost\" >> /etc/hosts" >> archInstallNCRS2.sh
echo "    echo \"ff00::0		ip6-localnet\" >> /etc/hosts" >> archInstallNCRS2.sh
echo "    echo \"ff00::0		ip6-mcastprefix\" >> /etc/hosts" >> archInstallNCRS2.sh
echo "    echo \"ff02::1		ip6-allnodes\" >> /etc/hosts" >> archInstallNCRS2.sh
echo "    echo \"ff02::2		ip6-allrouters\" >> /etc/hosts" >> archInstallNCRS2.sh
echo "    echo \"ff02::3		ip6-allhosts\" >> /etc/hosts" >> archInstallNCRS2.sh
echo "    echo \"0.0.0.0		0.0.0.0\" >> /etc/hosts" >> archInstallNCRS2.sh
echo "    if dialog --title \"\$default_title 13/\$steps\" --yes-label \"Yes\" --no-label \"No\" --yesno \"Creating hosts files\nDo you want to add custom hosts to it?\" 7 64; then" >> archInstallNCRS2.sh
echo "        clear" >> archInstallNCRS2.sh
echo "        counter=0;" >> archInstallNCRS2.sh
echo "        curl -fL \"https://raw.githubusercontent.com/MiraiMindz/.dotfiles/main/misc/MiraiHosts.txt\" >> /etc/hosts" >> archInstallNCRS2.sh
echo "        pid=\$!;" >> archInstallNCRS2.sh
echo "        trap \"kill \$pid 2> /dev/null\" EXIT;" >> archInstallNCRS2.sh
echo "        while kill -0 \$pid 2> /dev/null; do" >> archInstallNCRS2.sh
echo "            (( counter+=1 ))" >> archInstallNCRS2.sh
echo "            echo \$counter | dialog --title \"\$default_title 13/\$steps\" --gauge \"Adding custom hosts\" 7 50 0;" >> archInstallNCRS2.sh
echo "            sleep 0.1" >> archInstallNCRS2.sh
echo "        done;" >> archInstallNCRS2.sh
echo "        trap - EXIT" >> archInstallNCRS2.sh
echo "        counter=100" >> archInstallNCRS2.sh
echo "        echo \$counter | dialog --title \"\$default_title 13/\$steps\" --gauge \"Adding custom hosts\" 7 50 0" >> archInstallNCRS2.sh
echo "        clear" >> archInstallNCRS2.sh
echo "    fi" >> archInstallNCRS2.sh
echo "" >> archInstallNCRS2.sh
echo "    rtpass=\$(dialog --title \"\$default_title 14/\$steps\" --output-fd 1 --passwordbox \"Enter the root password: \" 12 50); clear" >> archInstallNCRS2.sh
echo "    echo -e \"\$rtpass\n\$rtpass\" | sudo passwd -q" >> archInstallNCRS2.sh
echo "" >> archInstallNCRS2.sh
echo "    if dialog --title \"\$default_title 15/\$steps\" --yes-label \"Intel\" --no-label \"AMD\" --yesno \"Is your processor Intel or AMD?\" 7 64; then" >> archInstallNCRS2.sh
echo "        pacman -S intel-ucode" >> archInstallNCRS2.sh
echo "    else" >> archInstallNCRS2.sh
echo "        pacman -S amd-ucode" >> archInstallNCRS2.sh
echo "    fi" >> archInstallNCRS2.sh
echo "" >> archInstallNCRS2.sh
echo "    instpkgs=\$(dialog --title \"\$default_title 16/\$steps\" --output-fd 1 --inputbox \"Type \\\"AUTO\\\" to install the packages from the auto installation\nAUTO=grub networkmanager dialog wireless_tools wpa_supplicant os-prober mtools dosfstools base-devel linux-headers iwd dhcpcd\nEnter the packages that you want to install:\" 25 75); clear" >> archInstallNCRS2.sh
echo "    lwcs_instpkgs=\$(echo \"\$instpkgs\" | tr '[:upper:]' '[:lower:]')" >> archInstallNCRS2.sh
echo "    if [[ \"\$lwcs_instpkgs\" == \"auto\" ]]; then" >> archInstallNCRS2.sh
echo "        pacman -S grub networkmanager dialog wireless_tools wpa_supplicant os-prober mtools dosfstools base-devel linux-headers iwd dhcpcd" >> archInstallNCRS2.sh
echo "    else" >> archInstallNCRS2.sh
echo "        pacman -S \"\$instpkgs\"" >> archInstallNCRS2.sh
echo "    fi" >> archInstallNCRS2.sh
echo "" >> archInstallNCRS2.sh
echo "    if [[ -e \$(command -v grub) ]]; then" >> archInstallNCRS2.sh
echo "        tgt_plat=\$(dialog --title \"\$default_title 17/\$steps\" --no-tags --output-fd 1 --menu \"Select your desired platform to install GRUB: \" 7 60 0 \"arm-coreboot\" \"arm-coreboot\" \"arm-efi\" \"arm-efi\" \"arm-uboot\" \"arm-uboot\" \"arm64-efi\" \"arm64-efi\" \"i386-coreboot\" \"i386-coreboot\" \"i386-efi\" \"i386-efi\" \"i386-ieee1275\" \"i386-ieee1275\" \"i386-multiboot\" \"i386-multiboot\" \"i386-pc\" \"i386-pc\" \"i386-qemu\" \"i386-qemu\" \"i386-xen\" \"i386-xen\" \"i386-xen_pvh\" \"i386-xen_pvh\" \"ia64-efi\" \"ia64-efi\" \"mips-arc\" \"mips-arc\" \"mips-qemu_mips\" \"mips-qemu_mips\" \"mipsel-arc\" \"mipsel-arc\" \"mipsel-loongson\" \"mipsel-loongson\" \"mipsel-qemu_mips\" \"mipsel-qemu_mips\" \"powerpc-ieee1275\" \"powerpc-ieee1275\" \"riscv32-efi\" \"riscv32-efi\" \"riscv64-efi\" \"riscv64-efi\" \"sparc64-ieee1275\" \"sparc64-ieee1275\" \"x86_64-efi\" \"x86_64-efi\" \"x86_64-xen\" \"x86_64-xen\"); clear" >> archInstallNCRS2.sh
echo "        _grb_dsk=\$(dialog --title \"\$default_title 17/\$steps\" --output-fd 1 --inputbox \"Enter the name of the disk to install GRUB:\" 25 75); clear" >> archInstallNCRS2.sh
echo "        if [[ \"\$_grb_dsk\" =~ .*\"/dev/\".* ]]; then" >> archInstallNCRS2.sh
echo "            grb_dsk=\$(echo \"\$_grb_dsk\" | cut -d/ -f3-)" >> archInstallNCRS2.sh
echo "        else" >> archInstallNCRS2.sh
echo "            grb_dsk=\$_grb_dsk" >> archInstallNCRS2.sh
echo "        fi" >> archInstallNCRS2.sh
echo "        grub-install -v --target=\$tgt_plat /dev/\$grb_dsk" >> archInstallNCRS2.sh
echo "        grub-mkconfig -o /boot/grub/grub.cfg" >> archInstallNCRS2.sh
echo "    else" >> archInstallNCRS2.sh
echo "        othr_btmgr=\$(dialog --title \"\$default_title 17/\$steps\" --output-fd 1 --inputbox \"Please provide the command to install your custom bootloader:\" 25 75); clear" >> archInstallNCRS2.sh
echo "        \$othr_btmgr" >> archInstallNCRS2.sh
echo "    fi" >> archInstallNCRS2.sh
echo "}" >> archInstallNCRS2.sh
echo "" >> archInstallNCRS2.sh
echo "# Checks if dialog exists, if not go with default cli installation" >> archInstallNCRS2.sh
echo "if [[ ! -e \$(command -v dialog) || ! -f /usr/bin/dialog || ! -f /bin/dialog ]]; then" >> archInstallNCRS2.sh
echo "    printf \"%s\n\" \"dialog not found, proceeding with default cli installation\"" >> archInstallNCRS2.sh
echo "    cliInstall" >> archInstallNCRS2.sh
echo "fi" >> archInstallNCRS2.sh
echo "" >> archInstallNCRS2.sh
echo "# Checks the method used in the first script" >> archInstallNCRS2.sh
echo "if [[ \"\$installmtd\" == \"auto\" ]]; then" >> archInstallNCRS2.sh
echo "    ncursesAutoInstall2" >> archInstallNCRS2.sh
echo "elif [[ \"\$installmtd\" == \"manu\" ]]; then" >> archInstallNCRS2.sh
echo "    ncursesManualInstall2" >> archInstallNCRS2.sh
echo "else" >> archInstallNCRS2.sh
echo "    if [[ -e \$(command -v dialog) || -f /usr/bin/dialog || -f /bin/dialog ]]; then" >> archInstallNCRS2.sh
echo "        if dialog --title \"\$default_title\" --yes-label \"Automated\" --no-label \"Manual\" --yesno \"\nPrevious install method not found\nDo you want the Automated Install or the Manual Install?\" 7 64; then" >> archInstallNCRS2.sh
echo "            clear" >> archInstallNCRS2.sh
echo "            ncursesAutoInstall2" >> archInstallNCRS2.sh
echo "        else" >> archInstallNCRS2.sh
echo "            clear" >> archInstallNCRS2.sh
echo "            ncursesManualInstall2" >> archInstallNCRS2.sh
echo "        fi" >> archInstallNCRS2.sh
echo "    fi" >> archInstallNCRS2.sh
echo "fi" >> archInstallNCRS2.sh
echo "" >> archInstallNCRS2.sh
echo "exit" >> archInstallNCRS2.sh
echo "" >> archInstallNCRS2.sh

### Installation
# Checks if dialog exists, if not go with default cli installation
if [[ ! -e $(command -v dialog) || ! -f /usr/bin/dialog || ! -f /bin/dialog ]]; then
    printf "%s\n" "dialog not found, proceeding with default cli installation"
    cliInstall
fi

if dialog --title "$default_title" --yes-label "Automated" --no-label "Manual" --yesno "\nWelcome to my install script using ncurses/dialog utility\nDo you want the Automated Install or the Manual Install?" 7 64; then
    installmtd="auto"
    clear
    ncursesAutoInstall
else
    installmtd="manu"
    clear
    ncursesManualInstall
fi

# Clear the screen after dialog script ends
clear
exit
