#!/usr/bin/env bash

# This script will install the 3rd party script installer
# for the Controller Tools Menu.

# These Controller Tools are to be used on a Raspberry Pi / RetroPie build

# Download Scripts

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

# Move files to proper directory

if [[ -d "/home/pi/RetroPie/retropiemenu/Controllertools" ]]; then
echo "exists" > /dev/null
else
    mkdir /home/pi/RetroPie/retropiemenu/Controllertools
fi

cd /home/pi/RetroPie/retropiemenu/Controllertools
sudo wget -O control_updater_menu.sh https://github.com/CrashCortez/RetroMPV/blob/master/controllertools.png
sudo chmod 777 control_updater_menu.sh
cd 

# Update RetroPie gamelist.xml to add new entry
cd /home/pi/RetroPie/retropiemenu/icons
sudo wget -O https://github.com/CrashCortez/RetroMPV/blob/master/controllertools.png
cd

cp /opt/retropie/configs/all/emulationstation/gamelists/retropie/gamelist.xml /opt/retropie/configs/all/emulationstation/gamelists/retropie/gamelist.xml.bkp
cp /opt/retropie/configs/all/emulationstation/gamelists/retropie/gamelist.xml /tmp

cat /tmp/gamelist.xml |grep -v "</gameList>" > /tmp/templist.xml

ifexist=`cat /tmp/templist.xml |grep "Controllertools" |wc -l`
if [[ ${ifexist} > 0 ]]; then
  echo "already in gamelist.xml" > /tmp/exists
else

  echo "	<game>" >> /tmp/templist.xml
  echo "		<path>./Controllertools</path>" >> /tmp/templist.xml
  echo "		<name>Controller Tools</name>" >> /tmp/templist.xml
  echo "		<desc>Install, or update Controller Tools Menu.</desc>" >> /tmp/templist.xml
  echo "		<image>./icons/controllertools.png</image>" >> /tmp/templist.xml
  echo "		<playcount>1</playcount>" >> /tmp/templist.xml
  echo "		<lastplayed></lastplayed>" >> /tmp/templist.xml
  echo "	</game>" >> /tmp/templist.xml
  echo "</gameList>" >> /tmp/templist.xml
  cp /tmp/templist.xml /opt/retropie/configs/all/emulationstation/gamelists/retropie/gamelist.xml
fi
cp /opt/retropie/configs/all/emulationstation/gamelists/retropie/gamelist.xml /opt/retropie/configs/all/emulationstation/gamelists/retropie/gamelist.xml.bkp
cp /opt/retropie/configs/all/emulationstation/gamelists/retropie/gamelist.xml /tmp

cat /tmp/gamelist.xml |grep -v "</gameList>" > /tmp/templist.xml

ifexist=`cat /tmp/templist.xml |grep "Controllertools/controler_update_menu.sh" |wc -l`
if [[ ${ifexist} > 0 ]]; then
  echo "already in gamelist.xml" > /tmp/exists
else

  echo "	<game>" >> /tmp/templist.xml
  echo "		<path>./Controllertools/controler_update_menu.sh</path>" >> /tmp/templist.xml
  echo "		<name>Controller Tools</name>" >> /tmp/templist.xml
  echo "		<desc>Install, or update Controller Tools Menu.</desc>" >> /tmp/templist.xml
  echo "		<image>./icons/controllertools.png</image>" >> /tmp/templist.xml
  echo "		<playcount>1</playcount>" >> /tmp/templist.xml
  echo "		<lastplayed></lastplayed>" >> /tmp/templist.xml
  echo "	</game>" >> /tmp/templist.xml
  echo "</gameList>" >> /tmp/templist.xml
  cp /tmp/templist.xml /opt/retropie/configs/all/emulationstation/gamelists/retropie/gamelist.xml
fi
