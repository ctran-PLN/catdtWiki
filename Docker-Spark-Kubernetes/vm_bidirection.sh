#Login as ubuntu;
#Click on Applications/System/Terminal (or on Applications/Terminal, if you are using the 6.06.1 Dapper Drake release);
#Update your APT database with sudo apt-get update, and typing your password, if requested;
#Install the latest security updates with sudo apt-get upgrade;
sudo apt-get install build-essential module-assistant
sudo m-a prepare

#Click on Install Guest Additions… from the Devices menu, then choose to browse the content of the CD when requested.
#Run sudo sh /media/cdrom/VBoxLinuxAdditions.run,
