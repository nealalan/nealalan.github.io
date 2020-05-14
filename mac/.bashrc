

#  D O   N O T   U P L O A D  -  P R I V A T E   K E Y
#  D O   N O T   U P L O A D  -  P R I V A T E   K E Y

#######################################################################################################################
# FROM 2019-08-14 ON MBP
# EDITED 2020-05-14 updated cli from WORK MBP
#######################################################################################################################
#  Description:  This file holds all my BASH configurations and aliases
#  1.  Environment Configuration
#  2.  Make Terminal Better (remapping defaults and adding functionality)
#  3.  File and Folder Management
#  4.  Searching
#  5.  Process Management
#  6.  Networking
#  7.  System Operations & Information
#  8.  RUN AT LAUNCH OF TERMINAL SESSION
#######################################################################################################################
#   1. ENVIRONMENT CONFIGURATION
#######################################################################################################################
# get current branch in git repo
function parse_git_branch() {
 BRANCH=`git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/'`
 if [ ! "${BRANCH}" == "" ]
 then
   STAT=`parse_git_dirty`
   echo "[${BRANCH}${STAT}]"
 else
   echo ""
 fi
}
# get current status of git repo
function parse_git_dirty {
 status=`git status 2>&1 | tee`
 dirty=`echo -n "${status}" 2> /dev/null | grep "modified:" &> /dev/null; echo "$?"`
 untracked=`echo -n "${status}" 2> /dev/null | grep "Untracked files" &> /dev/null; echo "$?"`
 ahead=`echo -n "${status}" 2> /dev/null | grep "Your branch is ahead of" &> /dev/null; echo "$?
"`
 newfile=`echo -n "${status}" 2> /dev/null | grep "new file:" &> /dev/null; echo "$?"`
 renamed=`echo -n "${status}" 2> /dev/null | grep "renamed:" &> /dev/null; echo "$?"`
 deleted=`echo -n "${status}" 2> /dev/null | grep "deleted:" &> /dev/null; echo "$?"`
 bits=''
 if [ "${renamed}" == "0" ]; then
   bits=">${bits}"
 fi
 if [ "${ahead}" == "0" ]; then
   bits="*${bits}"
 fi
 if [ "${newfile}" == "0" ]; then
   bits="+${bits}"
 fi
 if [ "${untracked}" == "0" ]; then
   bits="?${bits}"
 fi
 if [ "${deleted}" == "0" ]; then
   bits="x${bits}"
 fi
 if [ "${dirty}" == "0" ]; then
   bits="!${bits}"
 fi
 if [ ! "${bits}" == "" ]; then
   echo " ${bits}"
 else
   echo ""
 fi
}
#export PS1="\[\033[36m\]\u\[\033[m\]@\[\033[32m\]\h:\[\033[33;1m\]\w\[\033[m\]\$ "
#export PS1="\[\033[36m\]\u\[\033[m\]@\[\033[32m\]\h:\[\033[33;1m\]\w\[\033[m\]\[\e[32m\]\`parse_git_branch\`\[\e[m\]$ "

BWHITE='\[\033[01;37m\]'
BGREEN='\[\033[01;32m\]'
GREEN='\[\033[00;32m\]'
TEAL='\[\033[01;36m\]'
RED='\[\033[01;31m\]'
YELLOW='\[\033[01;33m\]'
ENDCOL='\[\e[m\]'
#export PS1="${BWHITE}[${BGREEN}\D{%Y.%m.%d} \t${BWHITE}] ${TEAL}\u${RED}@${GREEN}\h${BWHITE}:${YELLOW}\w\[\033[m\]\[\e[32m\]\`parse_git_branch\`${BWHITE}$ ${ENDCOL}"
export PS1="${BWHITE}•${BGREEN}\D{%Y.%m.%d} \t${BWHITE}• ${TEAL}\u${RED}@${GREEN}\h${BWHITE}:${YELLOW}\w${GREEN}\`parse_git_branch\`${BWHITE}$ ${ENDCOL}"
export CLICOLOR=1
export LSCOLORS=ExFxBxDxCxegedabagacad
export PATH="/usr/local/bin:/usr/local/:/usr/local/sbin:/Applications/Visual Studio Code.app/Contents/Resources/app/bin:$PATH"
export EDITOR=/usr/bin/nano
export BLOCKSIZE=1k
#######################################################################################################################
#   2. MAKE TERMINAL BETTER
#######################################################################################################################
alias f='open -a Finder ./'                 # f:            Opens current directory in MacOS Finder
alias ~="cd ~"                              # ~:            Go Home
alias c='clear'                             # c:            Clear terminal displayalias ls='ls -GFh'
alias cp='cp -iv'                           # Preferred 'cp' implementation
alias mv='mv -iv'                           # Preferred 'mv' implementation
alias mkdir='mkdir -pv'                     # Preferred 'mkdir' implementation
alias ll='ls -FGlAhp'                       # Preferred 'ls' implementation
alias less='less -FSRXc'                    # Preferred 'less' implementation
cd() { builtin cd "$@"; ll; }               # Always list directory contents upon 'cd'
alias cd..='cd ../'                         # Go back 1 directory level (for fast typers)
alias ..='cd ../'                           # Go back 1 directory level
alias ...='cd ../../'                       # Go back 2 directory levels
alias .3='cd ../../../'                     # Go back 3 directory levels
alias .4='cd ../../../../'                  # Go back 4 directory levels
alias .5='cd ../../../../../'               # Go back 5 directory levels
alias .6='cd ../../../../../../'            # Go back 6 directory levels
#alias edit='subl'                           # edit:         Opens any file in sublime editor
alias edit='atom'
alias which='type -all'                     # which:        Find executables
alias path='echo -e ${PATH//:/\\n}'         # path:         Echo all executable Paths
alias show_options='shopt'                  # Show_options: display bash options settings
alias fix_stty='stty sane'                  # fix_stty:     Restore terminal settings when screwed up
alias cic='set completion-ignore-case On'   # cic:          Make tab-completion case-insensitive
mcd () { mkdir -p "$1" && cd "$1"; }        # mcd:          Makes new Dir and jumps inside
trash () { command mv "$@" ~/.Trash ; }     # trash:        Moves a file to the MacOS trash
ql () { qlmanage -p "$*" >& /dev/null; }    # ql:           Opens any file in MacOS Quicklook Preview
alias DT='tee ~/Desktop/terminalOut.txt'    # DT:           Pipe content to file on MacOS Desktop
###   lr:  Full Recursive Directory Listing
alias lr='ls -R | grep ":$" | sed -e '\''s/:$//'\'' -e '\''s/[^-][^\/]*\//--/g'\'' -e '\''s/^/   /'\'' -e '\''s/-/|/'\'' | less'
#######################################################################################################################
#   3. FILE AND FOLDER MANAGEMENT
#######################################################################################################################
alias finderShowHidden='defaults write com.apple.finder ShowAllFiles TRUE'
alias finderHideHidden='defaults write com.apple.finder ShowAllFiles FALSE'
zipf () { zip -r "$1".zip "$1" ; }          # zipf:         To create a ZIP archive of a folder
alias numFiles='echo $(ls -1 | wc -l)'      # numFiles:     Count of non-hidden files in current dir
alias make1mb='mkfile 1m ./1MB.dat'         # make1mb:      Creates a file of 1mb size (all zeros)
alias make5mb='mkfile 5m ./5MB.dat'         # make5mb:      Creates a file of 5mb size (all zeros)
alias make10mb='mkfile 10m ./10MB.dat'      # make10mb:     Creates a file of 10mb size (all zeros)
###   cdf:  'Cd's to frontmost window of MacOS Finder
   cdf () {
       currFolderPath=$( /usr/bin/osascript <<EOT
           tell application "Finder"
               try
           set currFolder to (folder of the front window as alias)
               on error
           set currFolder to (path to desktop folder as alias)
               end try
               POSIX path of currFolder
           end tell
EOT
       )
       echo "cd to \"$currFolderPath\""
       cd "$currFolderPath"
   }
###   extract:  Extract most know archives with one command
extract () {
       if [ -f $1 ] ; then
         case $1 in
           *.tar.bz2)   tar xjf $1     ;;
           *.tar.gz)    tar xzf $1     ;;
           *.bz2)       bunzip2 $1     ;;
           *.rar)       unrar e $1     ;;
           *.gz)        gunzip $1      ;;
           *.tar)       tar xf $1      ;;
           *.tbz2)      tar xjf $1     ;;
           *.tgz)       tar xzf $1     ;;
           *.zip)       unzip $1       ;;
           *.Z)         uncompress $1  ;;
           *.7z)        7z x $1        ;;
           *)     echo "'$1' cannot be extracted via extract()" ;;
            esac
        else
            echo "'$1' is not a valid file"
        fi
}
#######################################################################################################################
#   4. SEARCHING
#######################################################################################################################
###   mans:   Search manpage given in agument '1' for term given in argument '2'
###   displays paginated result with colored search terms and two lines surrounding each hit.            Example: mans mplayer codec
mans () {
   man $1 | grep -iC2 --color=always $2 | less
}
###   showa: to remind yourself of an alias (given some part of it)
showa () {
   /usr/bin/grep --color=always -i -a1 $@ ~/Library/init/bash/aliases.bash | grep -v '^\s*$' | less -FSRXc ;
}
alias qfind="find . -name "                 # qfind:    Quickly search for file
ff () { /usr/bin/find . -name "$@" ; }      # ff:       Find file under the current directory
ffs () { /usr/bin/find . -name "$@"'*' ; }  # ffs:      Find file whose name starts with a given string
ffe () { /usr/bin/find . -name '*'"$@" ; }  # ffe:      Find file whose name ends with a given string
###   spotlight: Search for a file using MacOS Spotlight's metadata
spotlight () { mdfind "kMDItemDisplayName == '$@'wc"; }
export GREP_OPTIONS='--color=auto'
#######################################################################################################################
#   5. PROCESS MANAGEMENT
#######################################################################################################################
###   findPid: find out the pid of a specified process
###       Note that the command name can be specified via a regex
###       E.g. findPid '/d$/' finds pids of all processes with names ending in 'd'
###
###       Without the 'sudo' it will only find processes of the current user
findPid () { lsof -t -c "$@" ; }
alias memHogsTop='top -l 1 -o rsize | head -20'
alias memHogsPs='ps wwaxm -o pid,stat,vsize,rss,time,command | head -10'
alias cpu_hogs='ps wwaxr -o pid,stat,%cpu,time,command | head -10'
###   ttop:  Recommended 'top' invocation to minimize resources  http://www.macosxhints.com/article.php?story=20060816123853639
alias ttop="top -R -F -s 10 -o rsize"
###   my_ps() { ps $@ -u $USER -o pid,%cpu,%mem,start,time,bsdtime,command ; }
#######################################################################################################################
#   6. NETWORKING
#######################################################################################################################
alias myip='curl ifconfig.co'                       # myip:         Public facing IP Address
alias netCons='lsof -i'                             # netCons:      Show all open TCP/IP sockets
alias flushDNS='dscacheutil -flushcache'            # flushDNS:     Flush out the DNS Cache
alias lsock='sudo /usr/sbin/lsof -i -P'             # lsock:        Display open sockets
alias lsockU='sudo /usr/sbin/lsof -nP | grep UDP'   # lsockU:       Display only open UDP sockets
alias lsockT='sudo /usr/sbin/lsof -nP | grep TCP'   # lsockT:       Display only open TCP sockets
alias ipInfo0='ipconfig getpacket en0'              # ipInfo0:      Get info on connections for en0
alias ipInfo1='ipconfig getpacket en1'              # ipInfo1:      Get info on connections for en1
alias openPorts='sudo lsof -i | grep LISTEN'        # openPorts:    All listening connections
alias showBlocked='sudo ipfw list'                  # showBlocked:  All ipfw rules inc/ blocked IPs
#######################################################################################################################
#   7. SYSTEMS OPERATIONS & INFORMATION
#######################################################################################################################
alias mountReadWrite='/sbin/mount -uw /'    # mountReadWrite:   For use when booted into single-user
#   cleanupLS:  Clean up LaunchServices to remove duplicates in the "Open With" menu
alias cleanupLS="/System/Library/Frameworks/CoreServices.framework/Frameworks/LaunchServices.framework/Support/lsregister -kill -r -domain local -domain system -domain user && killall Finder"
alias screensaverDesktop='/System/Library/Frameworks/ScreenSaver.framework/Resources/ScreenSaverEngine.app/Contents/MacOS/ScreenSaverEngine -background'

#######################################################################################################################
#   8. RUN AT LAUNCH OF TERMINAL SESSION
#######################################################################################################################
echo -e "\033[01;31m" && uname -a 
echo -e "\033[01;36m" && uptime
echo -e "\033[01;32mPublic facing IP Address :$NC " && curl -4 ifconfig.co && ansiweather
echo -e "\033[01;37mZen (curl wttr.in):" ; curl https://api.github.com/zen
echo -e "\n"
