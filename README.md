# SYSTEM SCRIPTS

Quick setup just for get notifications

# Requirements
* lm-sensors
* postfix

## disk-space script

For ubuntu subsystems, create a .desktop file with these content, on `~/.config/autostart` folder:

```
[Desktop Entry]
Encoding=UTF-8
Name=Sctipt
Exec=YOUR_SCRIPT_PATH
Terminal=false
X-MultipleArgs=false
Type=Application
StartupNotify=true
```
To get a main disk use percentage on every user login

## sensors script

Obviously change paths.
Configure a crontab:

*/10 * * * * bash YOUR_SCRIPT_PATH/sensors.sh