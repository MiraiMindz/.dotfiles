#!/usr/bin/env sh

#############################################################################
#                          BEFORE FIRST BOOT SCRIPT                         #
#############################################################################
#    This script was made to make my life easy when installing Arch Linux   #
# It will install base packages for MY USE CASE, and apply the Rice install #
# Before using it you will need to set some stuff before, here is the list: #
#   - Partitions                                                            #
#   - Network Connection                                                    #
#                                                                           #
#                 So without further ado, let's get into it                 #
#############################################################################
# TODO LIST:                                                                #
#   Configure Keyboard Layout                                               #
#   Configure hardware clock                                                #
#   Configure Locale | Maybe export it idk                                  #
#   Install Essential Packages                                              #
#   Gen the FSTab                                                           #
#   ChRoot                                                                  #
#   Timezone & Sync Hardware Clock                                          #
#   Create locale.conf                                                      #
#   Create vconsole.conf keymap                                             #
#   Hosts | Prompt for Custom                                               #
#   Root Password                                                           #
#   Bootloader                                                              #
#   Reboot System                                                           #
#############################################################################
# NOTES:                                                                    #
#   Maybe I will need to split this into "Before and After First Boot"      #
####################                                     ####################
#                             HOSTS BASE CONFIG                             #
####################                                     ####################
#   # Static table lookup for hostnames.                                    #
#   # See hosts(5) for details.                                             #
#   # =====================================                                 #
#   # IPv4	Config                                                          #
#   127.0.0.1	localhost                                                   #
#   ::1		localhost                                                       #
#   127.0.1.1	${localhostname}.localdomain	${localhostname}            #
#   127.0.0.1	local                                                       #
#   # =====================================                                 #
#   # IPv6	Config                                                          #
#   ::1		ip6-localhost                                                   #
#   ::1		ip6-loopback                                                    #
#   fe80::1%lo0 	localhost                                               #
#   ff00::0		ip6-localnet                                                #
#   ff00::0		ip6-mcastprefix                                             #
#   ff02::1		ip6-allnodes                                                #
#   ff02::2		ip6-allrouters                                              #
#   ff02::3		ip6-allhosts                                                #
#   0.0.0.0		0.0.0.0                                                     #
#                                                                           #
# After setting up this ask to do `cat MiraiHosts.txt > /etc/hosts`         #
###################################       ###################################
####################                Mirai                ####################
#############################################################################
