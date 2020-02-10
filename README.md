# RetroMPV - Contol MVP with Xboxdvr 

### This is a Test build for Xbox 360. This is Test github to add controller "support" for Playing videos from ES as if they were roms for non-Gpi retropie setups. This is not ready for release. do not try as of 2/7/2020 will update the page once I have tested it on a few pi with different controllers.

These xboxdrv controller scripts greatly enhance the capabilities of your RetroPie. They can provide many virtual buttons using a button as a modifier. It also helps by mapping controls to keyboard keys for emulators that lack the ability to interface with the RetroPie controls (some of the standalone non-libretro cores and programs).

# To migrate to or to install the new framework:

## Install Script

```shell
wget -O control_updater_menu.sh https://raw.githubusercontent.com/CrashCortez/RetroMPV/master/install.sh && sudo chmod 777 install.sh && sudo ./install.sh
```

## Then run this command

```shell
 sudo /home/pi/RetroPie/retropiemenu/Controllertools/control_updater_menu.sh
```
## Choose Your Controller type then after you recieved a Success,  Reboot the system from the menu

### Done.

You also need to have xboxdrv installed (if it isn't already).  [See the Guide here](https://sinisterspatula.github.io/RetroflagGpiGuides/Controls_Updater_Menu)

### You will also need my [Gpivideo](https://github.com/CrashCortez/Gpivideo) setup installed you can install it with the following (it will reboot after install):
```shell
wget https://raw.githubusercontent.com/CrashCortez/Gpivideo/master/setup.sh && sudo chmod a+x setup.sh && sudo ./setup.sh
```

## Want to provide feedback?  Found a bug?

* If you have suggestions for improving these control maps, please add your comments or questions.
