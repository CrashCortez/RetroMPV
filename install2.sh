#!/usr/bin/env bash

# This script will install the 3rd party script installer
# for the Controller Tools Menu.

# These Controller Tools are to be used on a Raspberry Pi / RetroPie build

# Download Scripts

        get clone https://github.com/CrashCortez/RetroMPV.git
		
# Move files to proper directory

	cd RetroMPV
	sudo chmod a+x *.sh
	sudo chown pi:pi *.sh
	cp xboxdrvend.sh /opt/retropie/configs/all
	cp xboxdrvstart.sh /opt/retropie/configs/all
	cp runcommand-onend.sh /opt/retropie/configs/all
	cp runcommand-onstart.sh /opt/retropie/configs/all
	cd
	cd RetroMPV
	cp quit.sh /opt/retropie/supplementary/xboxdrv/bin
	clear
	if [[ -d "/home/pi/RetroPie/retropiemenu/Controllertools" ]]; then
		echo "exists" > /dev/null
		else
		sudo mkdir /home/pi/RetroPie/retropiemenu/Controllertools
	fi
	cp control_updater_menu.sh /home/pi/RetroPie/retropiemenu/Controllertools
	cp controllertools.png /home/pi/RetroPie/retropiemenu/icons
	cd
	#echo "---------------"
    #echo "|| Success!  ||"
    #echo "---------------"
    #sleep 5s


# Update RetroPie gamelist.xml to add new entry

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

ifexist=`cat /tmp/templist.xml |grep "Controllertools/control_update_menu.sh" |wc -l`
if [[ ${ifexist} > 0 ]]; then
  echo "already in gamelist.xml" > /tmp/exists
else

  echo "	<game>" >> /tmp/templist.xml
  echo "		<path>./Controllertools/controler_update_menu.sh</path>" >> /tmp/templist.xml
  echo "		<name>Controller Tools Menu</name>" >> /tmp/templist.xml
  echo "		<desc>Controller Tools Menu.</desc>" >> /tmp/templist.xml
  echo "		<image>./icons/controllertools.png</image>" >> /tmp/templist.xml
  echo "		<playcount>1</playcount>" >> /tmp/templist.xml
  echo "		<lastplayed></lastplayed>" >> /tmp/templist.xml
  echo "	</game>" >> /tmp/templist.xml
  echo "</gameList>" >> /tmp/templist.xml
  cp /tmp/templist.xml /opt/retropie/configs/all/emulationstation/gamelists/retropie/gamelist.xml

fi
  
  clear
  echo "---------------"
  echo "|| Success!  ||"
  echo "---------------"
  sleep 5s