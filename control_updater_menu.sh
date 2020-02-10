#!/bin/bash

#=============================================================================
#title:         menu.sh
#description:   Menu which allows multiple items to be selected, for the Controls for RetroPie
#author:        Crash
#created:       June 24 2019
#updated:       N/A
#version:       1.0
#usage:         ./menu.sh
#==============================================================================
export NCURSES_NO_UTF8_ACS=1
#IFS=';'

# Welcome
 #dialog --backtitle "Controls MENU" --title "The Controls Menu Utility" \
 #   --yesno "\nDo you want to proceed?" \
 #   28 110 2>&1 > /dev/tty \
 #   || exit

function main_menu() {
    local choice

    while true; do
        choice=$(dialog --backtitle "$BACKTITLE" --title " MAIN MENU " \
            --ok-label OK --cancel-label Exit \
            --menu "What action would you like to perform?" 25 75 20 \
            1 "Update Controls XBOX 360" \
            2 "Update Controls PS3" \
            3 "Update Controls PS4" \
            4 "Update Controls GPi" \
            5 "Update Controls AUTO" \
            6 "Update Controls TEST" \
            7 "Update this menu" \
            8 "System Reboot" \
            9 "System Shutdown" \
            2>&1 > /dev/tty)

        case "$choice" in
            1) update_controls_xbox_360  ;;
            2) controls_ps3  ;;
            3) controls_ps4  ;;
            4) controls_gpi ;;
            5) controls_auto ;; 
            6) controls_test ;;
            7) update_menu  ;;
            8) system_reboot  ;;
            9) system_shutdown  ;;
            *)  break ;;
        esac
    done
}

######################
# Functions for menu #
######################

function validate_url(){
    if [[ `wget -S --spider $1  2>&1 | grep 'HTTP/1.1 200 OK'` ]]; then
        return 0
    else
        return 1
    fi
}

function update_controls_xbox_360() {
    if validate_url https://raw.githubusercontent.com/CrashCortez/RetroMPV/master/xboxdrvstart.sh; then
        cd
        cd /opt/retropie/configs/all
        sudo wget -O xboxdrvend.sh https://raw.githubusercontent.com/CrashCortez/RetroMPV/master/xboxdrvend.sh
        sudo wget -O xboxdrvstart.sh https://raw.githubusercontent.com/CrashCortez/RetroMPV/master/xboxdrvstart.sh
        sudo chmod 644 *.sh
        sudo chown pi:pi runcommand-on*
        cd
        cd /opt/retropie/supplementary/xboxdrv/bin
        sudo wget -O quit.sh https://raw.githubusercontent.com/CrashCortez/RetroMPV/master/quit.sh
        sudo chmod a+x quit.sh
        echo "---------------"
        echo "|| Success!  ||"
        echo "---------------"
        sleep 5s
    else
        echo "@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"
        echo ".                                      ."
        echo ".FAILED! File not available or wifi off."
        echo ".                                      ."
        echo "@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"
        sleep 10s
    fi
}
function controls_ps4() {
    if validate_url https://raw.githubusercontent.com/CrashCortez/RetroMPV/PS4/xboxdrvstart.sh; then
        cd
        cd /opt/retropie/configs/all
        sudo wget -O xboxdrvend.sh https://raw.githubusercontent.com/CrashCortez/RetroMPV/PS4/xboxdrvend.sh
        sudo wget -O xboxdrvstart.sh https://raw.githubusercontent.com/CrashCortez/RetroMPV/PS4/xboxdrvstart.sh
        sudo chmod 644 *.sh
        cd
        cd /opt/retropie/supplementary/xboxdrv/bin
        sudo wget -O quit.sh https://raw.githubusercontent.com/CrashCortez/RetroMPV/PS4/quit.sh
        sudo chmod a+x quit.sh
        echo "---------------"
        echo "|| Success!  ||"
        echo "---------------"
        sleep 5s
    else
        echo "@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"
        echo ".                                      ."
        echo ".FAILED! File not available or wifi off."
        echo ".                                      ."
        echo "@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"
        sleep 10s
    fi
}
function controls_ps3() {
    if validate_url https://raw.githubusercontent.com/CrashCortez/RetroMPV/PS3/xboxdrvstart.sh; then
        cd
        cd /opt/retropie/configs/all
        sudo wget -O xboxdrvend.sh https://raw.githubusercontent.com/CrashCortez/RetroMPV/PS3/xboxdrvend.sh
        sudo wget -O xboxdrvstart.sh https://raw.githubusercontent.com/CrashCortez/RetroMPV/PS3/xboxdrvstart.sh
        sudo chmod 644 *.sh
        cd
        cd /opt/retropie/supplementary/xboxdrv/bin
        sudo wget -O quit.sh https://raw.githubusercontent.com/CrashCortez/RetroMPV/PS3/quit.sh
        sudo chmod a+x quit.sh
        echo "---------------"
        echo "|| Success!  ||"
        echo "---------------"
        sleep 5s
    else
        echo "@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"
        echo ".                                      ."
        echo ".FAILED! File not available or wifi off."
        echo ".                                      ."
        echo "@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"
        sleep 10s
    fi
}
function controls_gpi() {
    if validate_url https://raw.githubusercontent.com/CrashCortez/RetroMPV/GPi/xboxdrvstart.sh; then
        cd
        cd /opt/retropie/configs/all
        sudo wget -O xboxdrvend.sh https://raw.githubusercontent.com/CrashCortez/RetroMPV/Gpi/xboxdrvend.sh
        sudo wget -O xboxdrvstart.sh https://raw.githubusercontent.com/CrashCortez/RetroMPV/GPi/xboxdrvstart.sh
        sudo chmod 644 *.sh
        cd
        cd /opt/retropie/supplementary/xboxdrv/bin
        sudo wget -O quit.sh https://raw.githubusercontent.com/CrashCortez/RetroMPV/GPi/quit.sh
        sudo chmod a+x quit.sh
        cd
        cd /home/pi/RetroPie/retropiemenu/icons
        sudo wget -O controllertools.png https://github.com/CrashCortez/RetroMPV/blob/Gpi/gpitools.png
        echo "---------------"
        echo "|| Success!  ||"
        echo "---------------"
        sleep 5s
    else
        echo "@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"
        echo ".                                      ."
        echo ".FAILED! File not available or wifi off."
        echo ".                                      ."
        echo "@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"
        sleep 10s
    fi
}
function controls_auto() {
    if validate_url https://raw.githubusercontent.com/CrashCortez/RetroMPV/auto/xboxdrvstart.sh; then
        cd
        cd /opt/retropie/configs/all
        sudo wget -O xboxdrvend.sh https://raw.githubusercontent.com/CrashCortez/RetroMPV/auto/xboxdrvend.sh
        sudo wget -O xboxdrvstart.sh https://raw.githubusercontent.com/CrashCortez/RetroMPV/auto/xboxdrvstart.sh
        sudo chmod 644 *.sh
        cd
        cd /opt/retropie/supplementary/xboxdrv/bin
        sudo wget -O quit.sh https://raw.githubusercontent.com/CrashCortez/RetroMPV/GPi/quit.sh
        sudo chmod a+x quit.sh
        echo "---------------"
        echo "|| Success!  ||"
        echo "---------------"
        sleep 5s
    else
        echo "@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"
        echo ".                                      ."
        echo ".FAILED! File not available or wifi off."
        echo ".                                      ."
        echo "@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"
        sleep 10s
    fi
}
function controls_test() {
    if validate_url https://raw.githubusercontent.com/CrashCortez/RetroMPV/test/xboxdrvstart.sh; then
        cd
        cd /opt/retropie/configs/all
        sudo wget -O xboxdrvend.sh https://raw.githubusercontent.com/CrashCortez/RetroMPV/test/xboxdrvend.sh
        sudo wget -O xboxdrvstart.sh https://raw.githubusercontent.com/CrashCortez/RetroMPV/test/xboxdrvstart.sh
        sudo chmod 644 *.sh
        cd
        cd /opt/retropie/supplementary/xboxdrv/bin
        sudo wget -O quit.sh https://raw.githubusercontent.com/CrashCortez/RetroMPV/test/quit.sh
        sudo chmod a+x quit.sh
        echo "---------------"
        echo "|| Success!  ||"
        echo "---------------"
        sleep 5s
    else
        echo "@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"
        echo ".                                      ."
        echo ".FAILED! File not available or wifi off."
        echo ".                                      ."
        echo "@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"
        sleep 10s
    fi
}

function system_shutdown() {
    sudo shutdown -P now
}

function system_reboot() {
    sudo reboot
}

function update_menu() {
    if validate_url https://raw.githubusercontent.com/CrashCortez/RetroMPV/master/control_updater_menu.sh; then
        sudo mkdir -p ~/RetroPie/retropiemenu/Controllertools
        cd
        cd ~/RetroPie/retropiemenu/Controllertools
        sudo wget -O control_updater_menu.sh https://raw.githubusercontent.com/CrashCortez/RetroMPV/master/control_updater_menu.sh
        sudo chmod 777 control_updater_menu.sh
        sudo chmod a+x *.sh
        cd ..
        sudo rm control_updater_menu.sh
        echo "---------------"
        echo "|| Success!  ||"
        echo "---------------"
        sleep 5s
        $0
        exit 1
    else
        echo "@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"
        echo ".                                      ."
        echo ".FAILED! File not available or wifi off."
        echo ".                                      ."
        echo "@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"
        sleep 10s
    fi
}

# Main
main_menu
