printf "Updating the ZoneInfo to America/Sao_Paulo\n"
ln -sf /usr/share/zoneinfo/America/Sao_Paulo /etc/localtime

printf "Syncronizing the hardware clock to the system clock\n"
hwclock --systohc

printf "Editing /etc/locale.gen to pt_BR.UTF-8\n"
sed -i "s/#pt_BR.UTF-8 UTF-8/pt_BR.UTF-8 UTF-8/" /etc/locale.gen
locale-gen
printf "Saving the locale in /etc/locale.conf\n"
if [ -e /etc/locale.conf ]; then
    echo "LANG=pt_BR.UTF-8" >> /etc/locale.conf
else
    touch /etc/locale.conf
    echo "LANG=pt_BR.UTF-8" >> /etc/locale.conf
fi
printf "Saving the keyboard layout in /etc/vconsole.conf\n"
if [ -e /etc/vconsole.conf ]; then
    echo "KEYMAP=br-abnt2" >> /etc/vconsole.conf
else
    touch /etc/vconsole.conf
    echo "KEYMAP=br-abnt2" >> /etc/vconsole.conf
fi

printf "Generating the hostname file\n"
read -e -p "Enter this machine hostname: " HSTNM
if [[ -e /etc/hostname ]]; then
    echo $HSTNM >> /etc/hostname
else
    touch /etc/hostname
    echo $HSTNM >> /etc/hostname
fi

printf "Generating the hosts file\n"
echo "# =====================================" >> /etc/hosts
echo "# IPv4	Config" >> /etc/hosts
echo "127.0.0.1	localhost" >> /etc/hosts
echo "::1		localhost" >> /etc/hosts
echo "127.0.1.1	${HSTNM}.localdomain	${HSTNM}" >> /etc/hosts
echo "127.0.0.1	local" > /etc/Hosts
echo "# =====================================" >> /etc/hosts
echo "::1		ip6-localhost" >> /etc/hosts
echo "::1		ip6-loopback" >> /etc/hosts
echo "fe80::1%lo0 	localhost" >> /etc/hosts
echo "ff00::0		ip6-localnet" >> /etc/hosts
echo "ff00::0		ip6-mcastprefix" >> /etc/hosts
echo "ff02::1		ip6-allnodes" >> /etc/hosts
echo "ff02::2		ip6-allrouters" >> /etc/hosts
echo "ff02::3		ip6-allhosts" >> /etc/hosts
echo "0.0.0.0		0.0.0.0" >> /etc/hosts

echo -e -n "Do you want to add Custom Hosts to this file too (y/n)? "
old_stty_cfg=$(stty -g)
stty raw -echo
answer=$( while ! head -c 1 | grep -i '[ny]' ;do true ;done )
stty $old_stty_cfg
if echo "$answer" | grep -iq "^y" ;then
    printf "Adding custom hosts\n"
    curl -fL "https://raw.githubusercontent.com/MiraiMindz/.dotfiles/main/MiraiHosts.txt" >> /etc/hosts
else
    printf "Proceeding with the installation\n"
fi

printf "Setting up the root password\n"
passwd

echo -e -n "What is your processor ${DARK_BLUE}I${NOCOLOR}ntel or ${DARK_RED}A${NOCOLOR}MD (${DARK_BLUE}i${NOCOLOR}/${DARK_RED}a${NOCOLOR})? "
old_stty_cfg=$(stty -g)
stty raw -echo
answer=$( while ! head -c 1 | grep -i '[ny]' ;do true ;done )
stty $old_stty_cfg
if echo "$answer" | grep -iq "^y" ;then
    pacman -S intel-ucode
else
    pacman -S amd-ucode
fi

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
printf "Run the new script with: ${DARK_YELLOW}sh archInstallAfter.sh${NOCOLOR}\n"
printf "${DARK_GREEN}Good Luck${NOCOLOR}! \n"
exit
