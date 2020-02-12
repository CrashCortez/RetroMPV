# RetroMPV - Contol MVP with Xboxdvr from EmulationStation (RetroPie)

# Do not use yet
-------

### This is a Test build for Xbox 360. This is Test github to add controller "support" for Playing videos from ES as if they were roms for non-Gpi retropie setups. This is not ready for release. do not try as of 2/7/2020 will update the page once I have tested it on a few pi with different controllers.

These xboxdrv controller scripts greatly enhance the capabilities of your RetroPie. They can provide many virtual buttons using a button as a modifier. It also helps by mapping controls to keyboard keys for emulators that lack the ability to interface with the RetroPie controls (some of the standalone non-libretro cores and programs).

# To migrate to or to install the new framework:

## Install Script

```shell
wget -O https://raw.githubusercontent.com/CrashCortez/RetroMPV/master/install.sh && sudo chmod 777 install.sh && sudo ./install.sh
```
or 

```shell
wget -O https://raw.githubusercontent.com/CrashCortez/RetroMPV/master/install2.sh && sudo chmod a+x install2.sh && sudo ./install2.sh
```
## Then run this command

```shell
 sudo /home/pi/RetroPie/retropiemenu/Controllertools/control_updater_menu.sh
```
Choose Your Controller type then after you recieved a Success,  Reboot the system from the menu

## You will need to have xboxdrv installed (if it isn't already). 

First, we need to make sure xboxdrv is installed. This can be done from the 'RetroPie Setup' listing in the 'RetroPie' menu of EmulationStation. once in navigate to 'Manage Packages' -> 'Driver Packages' -> 'xboxdrv - XBox / XBox360 gamepad driver'-> install from 'source'. you are done you do not need to enable it.

[See the Guide here](https://sinisterspatula.github.io/RetroflagGpiGuides/Controls_Updater_Menu)

You Can also enter teh setup via terminal.

```shell
 sudo ./RetroPie-Setup/retropie_setup.sh.sh
```

### You will also need my [Gpivideo](https://github.com/CrashCortez/Gpivideo) setup installed you can install it with the following (it will reboot after install):

```shell
wget https://raw.githubusercontent.com/CrashCortez/Gpivideo/master/setup.sh && sudo chmod a+x setup.sh && sudo ./setup.sh
```
### Done.

## Want to provide feedback?  Found a bug?

* If you have suggestions for improving these control maps, please add your comments or questions.



FAQ
----
### Q: My controller is still not working, what can I do?

### A: you can change the even number in you xboxdvrstart.sh

First get your event number from your devices.
```shell
cat /proc/bus/input/devices
```
Note what the event# is for the controller you want to use.

Then edit your xboxdvrstart.sh
```shell
sudo nano /opt/retropie/configs/all/xboxdvrstart.sh
```
Change the event number on 
```shell
line 29:     --evdev /dev/input/event0 \
```
Changeing only the number right after event , with the info you recieved from the Cat Call

for example if your cat call said the event# is event17 then change it to:
```shell
line 29:     --evdev /dev/input/event17 \
```

