# [nealalan.github.io](https://nealalan.github.io)/[mac](https://nealalan.github.io/mac)

### Some tools I use
- [lastpass](https://lastpass.com) passwd mgmt
- ScanSnap Manager for Fujitsu ScanSnap ix500 - love my ScanSnap scanner - scanned over 10,000 pages with it
- [iMazing HEIC converter](https://itunes.apple.com/us/app/imazing-heic-converter/id1292198261?mt=12)
- [NetSpot](https://www.netspotapp.com/download-mac.html) - wireless analysis and site surveys
- [VMware Workstation Player](https://www.vmware.com/go/downloadworkstationplayer) = Free for personal and educational use
- [Little Snitch](https://www.obdev.at/products/littlesnitch) firewall - deleted because it was really annoying me about getting a license. Like CONSTANTLY.
- [Google Takeout](https://takeout.google.com) - extract all your data from your google account & convert google drive/docs to Office format documents

### 2017 MBP Setup Logs

Used from 2019-07-21 past 2019-10-23. Objective is to have everything on the machine synced with either Google Drive or on GitHub. Anything in the Downloads folder or Desktop will need to be manually saved.

- Installed MacOS Mojave 10.14.5
- encrypted hard drive

#### Configuration
- set trackpad controls
- turn on hot corners
- set dock preferences, Mission control, lock screen, desktop
- customize touch bar
- land and region set to 24hr
- firewall turned on
- turned off a bunch in Notifications
- set energy saver 
- turn on sharing
- announce time on hour using Zarvox
- set finder preferences and toolbar +new folder, delete, ingo, quick look
- general: auto hide toolbar
- copies VirtualBox VMs from flash drive (actually a waste of space)
- Setup Mail for multiple email addresses
- set Audio and BlueTooth to show up in Menu Bar
- iTunes: Preferences: Devices: Prevent from launching....

#### Configuration & Setup Commands
- setup for use of locate command
```
$ sudo launchctl load -w /System/Library/LaunchDaemons/com.apple.locate.plist
```
- screenshots
```
$ defaults write com.apple.screencapture location ~/Desktop/Screenshots
$ defaults write com.apple.screencapture type jpg && killall SystemUIServer
```
- hide desktop files
```
$ defaults write com.apple.finder CreateDesktop -bool false && killall Finder
```
- always show Library
```
$ chflags nohidden ~/Library/
```
- expand save panel
```
$ defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode -bool true
$ defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode2 -bool true
```
- xcode dev tools
```
$ xcode-select --install
```
- install homebrew
```
$ ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
```
- install media player
```
$ brew install mpv
```
- install youtube-dl not using package manager because it's not always the latest ver
- when youtube-dl breaks, run this again!
```
$ sudo curl -L https://yt-dl.org/downloads/latest/youtube-dl -o /ur/local/bin/youtube-dl
$ sudo chmod a+rx /usr/local/bin/youtube-dl
```
- Download & Install Backup and Synch by Google, select specific folders pointed to ~/Google Drive
        - set ~/Music/MUSIC VIDEOS folder as a symbolic link to ~/Google Drive/MUSIC/MUSIC VIDEOS/
        - set ~/Projects folder as a symbolic link to ~/Google Drive/DEV/
        - set ~/Pictures/Screenshots as a symbolic link to ~/Google Drive/PHOTOS/Screenshots/
- install https://github.com/fcambus/ansiweather
- setup ~/.ansiweatherrc with: 
```
        location:4887398
        units:imperial
        show_daylight:true
        delimiter:\033[35m
        dashes:\033[34m
        symbols:true
        forecast:0
        greeting_text: 
```
- install node, npm, n
```
$ brew install n
$ sudo n lts
```
- setup github ssh
- CREATE SSH KEY TO ADD TO GITHUB
```
$ ssh-keygen -t rsa -C "neal@email.com"
$ eval "$(ssh-agent -s)"
$ ssh-add -K ~/.ssh/id_rsa
```
- COPY THE ID_RSA and PASTE INTO https://github.com/settings/keys
- TEST OUT THE SSH CONNECTION ON YOUR BOX
```
$ ssh -T git@github.com
```
- install terraform - *terraform version issues* 
```
$ brew install terraform
```
- install speedtest-cli and ftp client
```
$ brew install speedtest-cli
$ brew install vsftpd
```
- install python3 flask
```
$ brew install pip3
$ pip install flask
```
- install virtualenv and activate
```
$ pip3 install virtualenv
$ virtualenv venv-abc
$ source venv-abc/bin/activate
$ deactivate
```

#### To install iMovie 
I had to go to App Store: Account: Purchased and it somehow let me download it.


#### Coding bootcamp stuff to install (if needed)
- install testem (for coding bootcamp)
```
$ npm install testem -g
$ ln -s /usr/local/Cellar/node/12.4.0/bin/testem testemw
```
- install and config ESLINT (for coding bootcamp)
```
$ npm install -g eslint eslint-config-fullstack eslint-plugin-react babel-eslint
$ touch ~/.eslintrc.json

        {
        "extends": "fullstack"
        }
```
- Note: Of course, this wasn't working because the npm packages installed globally weren't found... I installed them locally and they started working

#### AWS CLI Setup
- install awscli
```
$ brew install awscli
$ chmod 755 /usr/local/lib/pkgconfig
# TEST IT
$ aws help
```

- setup the AWS CLI access keys. 
(These are found in AWS Console: IAM: Users: (username): Security credentials: Create Access Key)
```
$ aws configure
# region I use is us-east-1 or us-east-2
# SHOW THE KEY WE JUST ADDED!
$ aws iam list-access-keys
# describing an instance and grepping the output is easier if it's in TEXT output (default is JSON)
$ aws ec2 describe-instances --output text --region us-east-2
$ aws ec2 describe-instances --output table --region us-east-2
```

#### Software
- Chrome, install LastPass Extension, ublock origin
- iterm2, setup to: profiles>command>bash, font to 13
  - copy in ~/.bashrc
- Malwarebytes - free version
- Visual Studio Code
  - Python by MS
  - bashling
  - terraform
  - ESLint
  - Pylint
- iDrive
- Wireshark
- FireFox
- Keybase
- PIA
- iMovie
- HWSensors - HWMonitor
- Skype
- VirtualBox-6.0.12-133076-OSX
- Android share (never could get this to work) - spyware? IDK
- Microsoft Remote Desktop 10 (RDP)
- PyCharm - recomended better for writing and testing python, particularly flask from localhost

#### From APP STORE
- Slack
- LastPass Mac App 4.29
- KeyNote
- WhatsApp Desktop




<br><br>
[edit](https://github.com/nealalan/nealalan.github.io/edit/master/mac/README.md)

