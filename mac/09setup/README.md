# [nealalan.github.io](https://nealalan.github.io)/[mac](https://nealalan.github.io/mac)/[setup](https://nealalan.github.io/mac/setup)
# MacBookPro Format/Reinstall

My object here is to take my old MBP and use it for pen testing, CTF, etc. I'm going to start with wiping it down to a basic install and then installing only what I need.

## The Machine
- Mid-2009 MacBook Pro (MacBookPro5,5) 
- Intel Core 2 Duo 2.26 Ghz
- 8 GB memory
- NVIDIA GeForce 9400M & LCD display 1280x800
- Samsung SSD 850 EVO 250GB
- New hard drive cable
- New battery (which ended up being a piece of junk)
- Lots of stickers

Unfortunately I have the Broadcom BCM4321 wifi chip, which will not work past OS X El Capitan (10.11.6) so I'm stuck with not being able to [hack an upgrade to OS X Sierra](https://www.macworld.co.uk/how-to/mac-software/how-install-macos-sierra-on-older-mac-3654960/).

## OS Setup
- We want to startup from [MacOS Recovery](https://support.apple.com/en-us/HT204904).
- Turn on or restart your Mac, then immediately hold down Command (⌘)-R.
- Release the keys when you see the Apple logo or a spinning globe.
- When you see the macOS Utilities window, select Disk Utility to erase the disk. 
    - This will also be an opportunity to partition your drive if you want to. 
    - One use case is to put all Google Drive sync data onto a separate drive and encrypt that drive.
        - Encrypted, it can not be accessed without a password each time the maching is booted. 
        - Don't store the encrypted drive password in the Keychain, just to make sure Google Drive data is as safe and secure as possible. 
        - Worst case, someone gets into your Google Drive and deletes it all.
        - Best case, you have Google Drive synced the multiple computers and also those computers backed up onto a Time Machine and onto another Cloud Backup service.
    - Second use case (mine) is to use the partition for Kali Linux.
- Restart and go through all the typical setup. I use the same login and password I use on my other Macs just to make interconnectivity simpler. 
![](https://github.com/nealalan/nealalan.github.io/blob/master/mac/09setup/Screen%20Shot%202018-09-20%20at%201.07.21%20PM.png?raw=true)
- One thing I noticed, when I signed into iCloud, a bunch of things were brought over from my other MacBookPro.
- Out of the box, not connected to Wifi yet, I went to Activity Monitor and see I already have 207 processes running and over 2 GB memory used! By the time I screenshotted them all, I was up to 217! I'll consider stopping some of these unnecessary processes in the future.
- ![[images]]()
![](https://github.com/nealalan/nealalan.github.io/blob/master/mac/09setup/Screen%20Shot%202018-09-20%20at%201.16.49%20PM.png)
![](https://github.com/nealalan/nealalan.github.io/blob/master/mac/09setup/Screen%20Shot%202018-09-20%20at%201.17.05%20PM.png)
![](https://github.com/nealalan/nealalan.github.io/blob/master/mac/09setup/Screen%20Shot%202018-09-20%20at%201.17.23%20PM.png)
![](https://github.com/nealalan/nealalan.github.io/blob/master/mac/09setup/Screen%20Shot%202018-09-20%20at%201.17.38%20PM.png)
![](https://github.com/nealalan/nealalan.github.io/blob/master/mac/09setup/Screen%20Shot%202018-09-20%20at%201.17.53%20PM.png)
![](https://github.com/nealalan/nealalan.github.io/blob/master/mac/09setup/Screen%20Shot%202018-09-20%20at%201.18.30%20PM.png)
![](https://github.com/nealalan/nealalan.github.io/blob/master/mac/09setup/Screen%20Shot%202018-09-20%20at%201.18.41%20PM.png)
![](https://github.com/nealalan/nealalan.github.io/blob/master/mac/09setup/Screen%20Shot%202018-09-20%20at%201.19.04%20PM.png)
- Turn off a bunch of the agents that start automatically. By dropping the following commands into Terminal, followed by a restart, I'm down to 159 processes at startup and 1.27 GB memory used. (Including Activity Monitor, that's > 20MB itself.
```bash
$ launchctl unload -w /System/Library/LaunchAgents/com.apple.AirPlayUIAgent.plist 
$ launchctl unload -w /System/Library/LaunchAgents/com.apple.CalendarAgent.plist 
$ launchctl unload -w /System/Library/LaunchAgents/com.apple.CallHistoryPluginHelper.plist
$ launchctl unload -w /System/Library/LaunchAgents/com.apple.CallHistorySyncHelper.plist
$ launchctl unload -w /System/Library/LaunchAgents/com.apple.AddressBook.AssistantService.plist
$ launchctl unload -w /System/Library/LaunchAgents/com.apple.AddressBook.SourceSync.plist
$ launchctl unload -w /System/Library/LaunchAgents/com.apple.AddressBook.abd.plist 
$ launchctl unload -w /System/Library/LaunchAgents/com.apple.CloudPhotosConfiguration
$ launchctl unload -w /System/Library/LaunchAgents/com.apple.SafariCloudHistoryPushAgent.plist
$ launchctl unload -w /System/Library/LaunchAgents/com.apple.SafariNotificationAgent.plist
$ launchctl unload -w /System/Library/LaunchAgents/com.apple.SafariPlugInUpdateNotifier.plist
$ launchctl unload -w /System/Library/LaunchAgents/com.apple.Safari.SafeBrowsing.Service.plist
$ launchctl unload -w /System/Library/LaunchAgents/com.apple.Maps.pushdaemon.plist
$ launchctl unload -w /System/Library/LaunchAgents/com.apple.photolibraryd.plist
$ launchctl unload -w /System/Library/LaunchAgents/com.apple.cloudphotosd.plist
$ launchctl unload -w /System/Library/LaunchAgents/com.apple.SocialPushAgent.plist 
$ launchctl unload -w /System/Library/LaunchAgents/com.apple.notificationcenterui.plist 
$ launchctl unload -w /System/Library/LaunchAgents/ com.apple.softwareupdate_notify_agent.plist
$ launchctl unload -w /System/Library/LaunchAgents/com.apple.safaridavclient.plist
$ launchctl unload -w /System/Library/LaunchAgents/com.apple.IMLoggingAgent.plist
```
And one to add so you can use the 'locate' command on the command line...
```bash
$ sudo launchctl load -w /System/Library/LaunchDaemons/com.apple.locate.plist
```
- WHEW! Startup seems way faster!!!

### Operation not permitted while System Integrity Protection is engaged

This is an error I encountered when running the above *launchctl* commands on another machine. [Here's how to fix it](https://www.technipages.com/macos-system-integrity-protection):
- From the Apple menu, choose “Restart…” > “Restart“.
- Simultaneously press and hold the “Command” and “R” buttons. This will start you in Recovery Mode.
- Select “Utilities” > “Terminal“.
- Type one of the following, then press “Enter“:
```bash
# Disable System Integrity Protection: 
$ csrutil disable
# Enable System Integrity Protection: 
$ csrutil enable
```
- Restart the computer again, and the change will be made.
- It's probably a best practice to enable this either now (after running the *launchctl* commands or later.

## The Tools and Customizing the setup
### OS Config
- Turn off guest account!
    - System Pref > Users & Groups > Click padlock > Click Guest User > Uncheck "Allow guests to log in..." > Click the lock
- Appearances & System Pref
    - System Pref > General > 
        - Check "Use dark menu bar and Dock" & Check "Automatically hide and show the menu bar"
        - Change Highlight color to Green
        - Change Sidebar icon size to Small
        - Change Recent items: to None
        - Check "Ask to keep changes when closing documents
    - System Pref > Desktop & Screen Saver > Desktop "tab"
        - Change Picture > Every Minute & Check "Random order"
    - System Pref > Desktop & Screen Saver > Screen Saver "tab"
        - "Word of the Day" & Check "Show with clock"
        - Hot Corners... > Bottom right "Desktop" & Top right "Mission Control" & Bottom left "Start Screen Saver"
    - System Pref > Dock > Position on screen: Left & Check "Automatically hide..."
    - System Pref > Lang & Region > Check "24-hour Time"
    - System Pref > Security & Privacy > General "tab"
        - Require password "5 seconds"
        - Click the padlock if it's locked and select "Allow apps downloaded from: Anywhere"
        - Click to lock the padlock - just a good habit to always lock after you unlock it
     - System Pref > Security & Privacy > Privacy "tab"
        - Ensure "Send diagnostics & usage data to Apple" is UNCHECKED
        
    - System Pref > Security & Privacy > FileVault "tab" > Click the lock
        - "Turn on FireValue" and "Allow my iCloud account to unlock my disk" (can use a recovery key if you'd like) > Restart. My understanding of the difference between the options are, using a recovery key, the key is not stored in your keychain. Allowing to unlock with iCloud stores the recovery key in your keychain.
        - The hard drive will encrypt so this will take a minute after restart, but since it's a fresh install, shouldn't take too long (when i restarted it said "44 days remaining", then went to 47 minutes and actually took about an hour.
    - System Pref > Spotlight > Search Results "tab" > Uncheck pretty much everything except Applications, Calculator, Definition, Events & Reminders, Folders, System Pref
    - System Pref > Notifications >
        - A lot to do here... I go into each option and turn off nearly everything
        - Every time you install an App you will want to go in here and set the notifications.
        - I set the "Do Not Disturb" from midnight to 8AM
        - Calendar: I leave on Alerts for my main machine, but this machine has all off
        - Facetime: I only allow "Play sound for notifications" 
        - Mail: I only leave on "Badge app icon"
        - Messages: I only allow "Play sound for notifications"
        - Reminders: This is up to you. I "Play sound for notifications"
    - System Pref > CDs > Set all to "Ignore" since if I stick it in, I will choose what to do!!!
    - System Pref > Energy Saver > Power Adapter > Computer Sleep "Never" & "Display sleep "1 hr"
    - System Pref > Trackpad > Point & Click > Secondary Click select "Click in bottom right corner"
    - System Pref > Trackpad > More Gestures > 
        - Swipe between full-screen apps select "with four fingers"
        - Swipe between pages select "with three fingers"    
    - System Pref > Sound > Check "Show volume in menu bar"
    - System Pref > iCloud > I uncheck everything except "Keychain" and "Find my Mac" since I use Google for everything else
    - System Pref > Accounts > Everything here is set "Inactive" except iCloud and my primary email "Contacts"
    - System Pref > Bluetooth > Check "Show Bluetooth in menu bar"
    - System Pref > Sharing > 
        - Check "Screen Sharing" for Administrators" which will allow you to screenshare to anyone in your address book
        - Check "Bluetooth Sharing" so you can do AirDrop on occasion
    - System Pref > App Store > 
        - Uncheck "Automatically check for updates" but remember, when there are updates, you may manually want to update them
    - System Pref > Date & Time > 
        - Select Digital, Check "Display time with seconds", "Flash the time separators", "Use a 24-hour clock", "Show the day of the week" and "Show date"
        - Optional: Check "Announe the time: On the hour" and Customize voice to "Zarvox"
    - Finder > In a finder window, right click on the tool bar > Select "Customize Toolbar
        ![image](https://github.com/nealalan/nealalan.github.io/blob/master/mac/09setup/Screen%20Shot%202018-09-20%20at%2015.26.13.png)
        - Drag off the toolbar: Edit Tags, Share = I never use these! 
        - Drag onto the toolbar: Path, New Folder, Delete, Get Info, Quick Look
        ![image](https://github.com/nealalan/nealalan.github.io/blob/master/mac/09setup/Screen%20Shot%202018-09-20%20at%2015.28.29.png)
    - Finder > Preferences > 
        - General tab > check "Hard dirks" and "Connected servers"
        - Sidebar tab > check "Pictures", "User name", "Hard disks" and uncheck "Recent tags"
    - Remove Dock Icons... Right click on them > Options > Remove from Dock, to get rid of some
        - I remove: iBooks, iTunes, Facetime, Photos, Maps, Reminders, Launchpad
    - Add Dock Icons... I will add them as I install software
        - Native apps to add: Activity Monitor, Terminal (we will replace with iTerm eventually)
    - Remove Findr Sidebar icons...
        - I find "All my files" to be useless, so I remove it. 
        - To add a folder to the Sidebar, you just drag it where you want it! 
        ![](https://github.com/nealalan/nealalan.github.io/blob/master/mac/09setup/Screen%20Shot%202018-09-20%20at%2016.18.06.jpg)
### Software I wanted to avoid on this install that others may want
- Anything that runs agents that kill CPU cycles
- Adobe
- IDrive (while I use this for my main machines, this will have nothing I need to backup that I can't throw over onto Google Drive
- Google Chrome - this is a freaking hog! For daily browsing, cool. For this machine - no.
- Microsoft products

### Software
- Cloud - [Google Backup and Sync](https://www.google.com/drive/download/backup-and-sync/)
    - My primary account has all my cloud stored files. I don't want to risk it being compromised! So.... I will use a totally separate Google Drive account for this system! 
    - Everything I work on will be in a cloud synced folders.
    - Google Sync is good at not running when you don't start it. So I will make sure it doesn't start by default.
    - Install > Download > Double click > Drag to Applications > Launch from "Applications" folder
        - Uncheck the folders selected already in "My MacBook Pro" - Desktop, Documents, Pictures - we will use another better method
        - Select what you want to Sync between your Google Drive onto your machine. For me, I have a folder called "Screenshots", "DEV" and "PICTURES".
    - Open Terminal and enter the following commands:
       - To give some explanation here, I want all my Project folders to seamlessly be on my laptop and my other machines
       - I want any PHOTOS I scan or pull onto this computer to be synced onto Google Drive
       - I want any Screenshots I take to be in JPG format and save to my Global Screenshots folder. And within seconds, all the screenshots I dragged into the folder are synced to all my computers.
       ![](https://github.com/nealalan/nealalan.github.io/blob/master/mac/09setup/Screen%20Shot%202018-09-20%20at%2016.08.47.jpg)

```bash
# On my MacBookPro I wanted a folder called ~/Projects/ to point to my ~/Google Drive/DEV folder
$ ln -s '/Users/neal/Google Drive/DEV/' ~/Projects
# And my ~/Pictures/ to point to ~/Google Drive/PHOTOS/
$ sudo rm -rf ~/Pictures/
$ ln -s '/Users/neal/Google Drive/PHOTOS/' ~/Pictures
# And my ~/Desktop/Screenshots/ to point to ~/Google Drive/PHOTOS/Screenshots/
$ ln -s '/Users/neal/Google Drive/PHOTOS/Screenshots/' ~/Desktop/Screenshots
$ defaults write com.apple.screencapture location ~/Desktop/Screenshots
$ defaults write com.apple.screencapture type jpg && killall SystemUIServer
```
- Browser - [Chromium](https://www.chromium.org/)
    - Download Chromium. Once it is completed, you can find it in Downloads. Drag the chromium icon into the Applications folder. 
    - Navigate to Applications and double click Chromium.
    - Choose "Set as Default" if prompted.
    - Chromium > Preferences (will navigate to chrome://settings) > "Sign in to Chromium"
        - I used the same email address I used to setup Google Cloud, to keep this machine intentionally separate from my personal account.
- Browser - [TOR](https://torproject.org/download/download)
    - Download Tor Browser. 
    - Drag the Tor Browser icon into Applications.
    - Double click Applications. Double click Tor Browser. Open.
- Editor - [Atom]()
    - TBD

- Shell / Command line - [iTerm2](https://www.iterm2.com/)
    - Note the version of OS X you have. Currently, iTerm2 3.2.0 will only work on OS X 10.12+, which El Capitan is NOT.
    - OS X El Capitan 10.11.6 (15G22010) / July 9, 2018 requires iTerm 2 3.1.7
    - Double click the install and allow it to move the program to "Applications"  
    - To setup a nice command shell, you need to find a [.bashrc file](http://bashrcgenerator.com/) and download it. From Terminal:
```bash
# if you have a file somewhere online, you can pull it down using:
$ cd
$ curl https://bashrc.file ~/.bashrc
# OR to create your own:
$ cd
$ atom ~/.bashrc
````
- Configure iTerm2 with your ~/.bashrc
    - iTerm2 > Preferences > 
- Update the Mac OS X - I forgot to do this earlier. 
    - App Store > Updates > Update All
    - This updated me from 10.11.4 to 10.11.6
    - Restarted
    - Security Update reqired also. Always do them - I watch the updates when they come out and Apple is great and playing down a major security update!

- Keybase
- Virtual Box
- VPN 
  - [Tunnelblick](https://tunnelblick.net/) - Free open source OpenVPN VPN client server software ...
  - [PIA VPN]()
- Slack

### And command line time
#### Install package managers
```bash
# INSTALL APPLE XCODE COMMAND LINE DEV TOOLS
$ xcode-select --install
# INSTALL [HOMEBREW](https://brew.sh/) / BREW
$ ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
# CHECK STATUS OF BREW
$ brew doctor
```
#### Install github
```bash
# CREATE SSH KEY TO ADD TO GITHUB
$ ssh-keygen -t rsa -C "neal@email.com"

# TEST OUT THE SSH CONNECTION ON YOUR BOX
$ ssh -T git@github.com

# SET AN HTTPS CLONE TO AN SSH PUSH
# so i pulled down something before I setup ssh and made a bunch of changes 
# i wanted to push back. so I used this command to changed it to SSH push
$ git remote set-url origin git@github.com:nealalan/nealalan.com.git
```




```bash
# INSTALL IFTOP
$ brew install iftop

# Photo - [exif tools]() - Used to edit the metadata on images and movies
$ brew install exiftool 
```

I found a great article on at [eForensics Magazine](https://eforensicsmag.com/): [Use The Mac OS X Hackers Toolbox by Phillip Wylie](https://eforensicsmag.com/macoshackers/)</td></tr>



## Last: Time Machine!


## Extras 

```bash
$ brew install speedtest-cli toilet cmatrix

# speedtest-cli = quick way to check connection
$ speedtest 
# toilet = TOIlet text formatter
$ curl -s4 ifconfig.co | toilet -w 120 -f mono12
# cmatrix = matrix chars on screen (CPU hog = DON'T RUN ON AWS!!!!)
$ cmatrix -s

```

## [VSCode](https://code.visualstudio.com/docs/setup/mac)
- Install Visual Studio Code
- Add Code to the $PATH
- Install [Python Extension](https://marketplace.visualstudio.com/items?itemName=ms-python.python)
- Install pylint `$ pip install pylint`
- Check if Node is installed `$ node --version`
- Update to the latest version of npm `$ npm install -g npm@latest`
- Install [testem](https://github.com/testem/testem) using `npm install testem -g`

#### the end.
