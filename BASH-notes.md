

## LinkedIn inLearning: [Learning BASH Scripting](https://www.linkedin.com/learning/learning-bash-scripting)

- Use nano text editor
- Recomend system: 
  - DigitalOcean VM for a quick Ubuntu server
  - I'd prefer [Google Cloud Shell](https://cloud.google.com/shell/) or 
  - Ubuntu instance on AWS EC2
- Bourne Again Shell (Bash) - 1989 for GNU project
- MacOS ships with older 3.2
- Current ver is 4.4

### 1. Working with the Command Line

```bash
$ man
$ man bash

$ echo $BASH_VERSION
$ tree -C

$ pwd
$ ls
# see other tutorial for permissions explanation

$ mk fruit
$ rmdir <dir>
$ cp source_file dest_file
$ rm source_file
$ cat source_file
# paginate cat
$ more source_file
$ head source_file
# handy for log files
$ tail source_file
# tilde extension
$ cd ~/fruit
$ touch {apple,banana,cherria}
# create the 100 files using touch, padding zeros
$ touch file_{01..100}
$ echo {1..10}
# use **range expansion** to skip
$ echo {1..10..2}
$ echo {A..z}
$ echo {A..Z..2}
# combine them all (note: in reverse order, creates i reverse order)
$ touch {apple,banana,cherry}_{01..10}{W..D}
# see how many files were created
$ ls -1 | wc -l

```

#### Redirection

```bash
$ ls | more
# using stdinput, stdoutput, stderror - recirect to files
$ rm ../otherfolder/
# sent to separate files
$ cp -v * ../otherfolder/ 1>../success.txt 2> ../error.txt
# sent to one log file
$ cp -v * ../otherfolder/ &>../log.txt
# display only errors buy sending stdoutput to /dev/null
$ cp -v * ../otherfolder/ 1>/dev/null
```

#### Manipulating Output with grep, awk, cut
- handy to find just single piece of info

```bash
$ export GREP_OPTIONS='--color=auto'
$ grep ubuntu /var/log/auth.log

- find case-insensitive term 'publickey' in auth log and display user and IP
```bash
$ grep -i publickey /var/log/auth.log | awk {'print $9 $11'}
```
- example of running a ping using cut delimiter '=' and finding the '4th' instance
```bash
$ ping -c 4 localhost | grep 'bytes from' | cut -d= -f4
```
#### Understand bash script syntax

- scripts contain variables, argument and flow-control logic
- scirpts must contain a __hashbang__ followed by path to bash executable
```bash
#!/bin/bash
```

- .sh at end of filename indicates a script
- document, document, document
- create my.sh and make executable
```bash
#!/bin/bash
ls
```

- to run the file, change permission to executable
```bash
$ chmod +x my.sh
# run the file (need the ./ because the current folder isn't part of the $PATH)
$ ./my.sh
# if you copied the shell the /usr/bin you could exect it using just the name
```

### 2. Building Bash Scripts

#### displaying with echo

```bash
$ export greeting="hell0"
$ echo $greeting

# You must use a backslash to escape special characters
$ echo $greeting world \(planet\)
# single quote is literal and doesn't handle the variable
$ echo '$greeting world (planet)'
# double quote handles both the variable and text
$ echo "$greeting, world (planet)"
# you can escape this also
$ echo "\$greeting, world (planet)"
# empty lines 
$ echo
```

#### variables

- variables can not contain spaces!!!
- if string has spaces, put it in quotes
- you can use declare to make a variable a specific type
```
# int
declare -i d=123
# read only
declare -r e=456
# lower and upper case
declare -l f="LOLCats"
declate -u g="LOLCats"
```
- special vars / [internal variables](https://www.tldp.org/LDP/abs/html/internalvariables.html)
```bash
$HOME
$PWD
$MACHTYPE
$HOSTNAME
$BASH_VERSION
$SECONDS = shows long long script has been running
```

#### command substitution
- vary useful in scripts!
```bash
h=$(pwd)
echo $h
```
- finding response time from server
```bash
#!/bin/bash
# This is a basic bash script
response_time=$(ping -c 1 localhost | grep 'bytes from' | cut -d = -f 4)
echo "The ping time was $response_time"
```

#### working with numbers and comparing values
- double wrap (( expression ))
- Bash supports operators:

| Operation | Operator |
|------|:---------:|
| exponentiation | (($a ** $b)) |
| multiplication | (($a * $b)) |
| division | (($a / $b)) | 
| mod | (($a % $b)) |
| addition | (($a + $b)) |
| subtraction | (($a - $b)) |
| increment | (($a++)) |
| decrement | (($a--)) |
| combination assignments | ((b+=5)) |
| comparison (not ints) | [[ $a == $b ] |
| true / SUCCESS | 0 |
| false / FAILED | 1 |
| comparison (ints) | [[ $a -lt $b ]] |
| greater than | [[ $a -gt $b ]] |
| less than or equal to | [[ $a -le $b ]] |
| greater than or equal to | [[ $a -ge $b ]] |
| equal | [[ $a -eq $b ]] |
| not equal | [[ $a -ne $b ]] |
| logical AND | [[ $a && $b ]] |
| logical OR | [[ $a || $b ]] |
| logical NOT | [[ ! $a ]] |
| Is NULL? | [[ -z $a ]] |
| Is NOT NULL? | [[ -n $a ]] |


- Note: Bash math only works with ints (1/3 == 0), not floating point 
- use `bc` - arbitrary precision calculator

```bash
echo $((1/3))
echo $(echo 1/3 | bc -l)
```

- comparison example

```bash
#!/bin/bash
# This is a basic bash script
echo '[[ "cat" ==  "cat" ]]'
[[ "cat" == "cat" ]]
echo $?
echo '[[ "cat" == "dog" ]]'
[[ "cat" == "dog" ]]
echo $?
echo '[[ a == b ]] LETTERS'
[[ a == b ]]
echo $?
echo '[[ 20 > 1000 ]] WRONG'
[[ 20 > 1000 ]]
echo $?
echo '[[ 20 -gt 1000 ]] RIGHT'
[[ 20 -gt 1000 ]]
echo $?
echo '[[ -z "" && -n "cat" ]] SUCCESS'
[[ -z "" && -n "cat" ]]
echo $?
```

#### working with strings

```bash
$ a="hello"
$ b="world"
$ c=$a$b
$ echo $c
# Return the length of the string
$ echo ${#c}
# substring starting at 0, 3 to end
$ d=${c:3}
# substring piece, at 3 for 4 places
$ e=${c:3:4}
# last 4 letters
$ echo ${c: -4}
# first 3 letters of the last 4 letters
$ echo ${c: -4:3}

```
 - replacing text
 
```bash
$ fruit="apple banana banana cherry"
# replace first banana with durian
$ echo ${fruit/banana/durian}
# replace all banana with durian
$ echo ${fruit//banana/durian}
# replace only if at very beginning of string
$ echo ${fruit/#apple/durian}
$ echo ${fruit/#banana/durian}
# replace only if at end of string
$ echo ${fruit/%cherry/durian}
$ echo ${fruit/%apple/durian}
# replace with wildcards
# echo ${fruit/c*/orange}
```

### coloring and styling text

```bash
$ echo -e '\033[34;42mColor Text\033[0m'
```

- use `echo -e` for escape characters
- use `\033[34;42m` as the escape sequence
- enter text to print out
- use another escape string to resent the colors `\033[0m`

[Styling Options foreground and background colors](https://misc.flogisoft.com/bash/tip_colors_and_formatting)

```bash
#!/bin/bash
    
echo 'https://misc.flogisoft.com/bash/tip_colors_and_formatting'
echo
echo 'USING 256 COLORS...'
echo

# This program is free software. It comes without any warranty, to
# the extent permitted by applicable law. You can redistribute it
# and/or modify it under the terms of the Do What The Fuck You Want
# To Public License, Version 2, as published by Sam Hocevar. See
# http://sam.zoy.org/wtfpl/COPYING for more details.
    
for fgbg in 38 48 ; do # Foreground / Background
    for color in {0..255} ; do # Colors
        # Display the color
        printf "\e[${fgbg};5;%sm  %3s  \e[0m" $color $color
        # Display 6 colors per lines
        if [ $((($color + 1) % 6)) == 4 ] ; then
            echo # New line
        fi
    done
    echo # New line
done
    
echo
echo  'USING 16 COLORS...';
echo


# This program is free software. It comes without any warranty, to
# the extent permitted by applicable law. You can redistribute it
# and/or modify it under the terms of the Do What The Fuck You Want
# To Public License, Version 2, as published by Sam Hocevar. See
# http://sam.zoy.org/wtfpl/COPYING for more details.
    
#Background
for clbg in {40..47} {100..107} 49 ; do
    #Foreground
    for clfg in {30..37} {90..97} 39 ; do
        #Formatting
        for attr in 0 1 2 4 5 7 ; do
            #Print the result
            #echo -en "\e[${attr};${clbg};${clfg}m ^[${attr};${clbg};${clfg}m \e[0m"
            printf "\e[${attr};${clbg};${clfg}m ^[${attr};${clbg};${clfg}m \e[0m"
        done
        echo #Newline
    done
done
    
exit 0
```
- you pretty much have 8 general colors to use
- Top use case is error codes - this will blash on some sessions

```bash
#!/bin/bash
echo -e "\033[5;31;40mERROR:\033[0m \033[31;40mSomething went wrong\!\033[0m"
```

- optionally you can use variables to store the escape codes

```bash
#!/bin/bash
flashred="\033[5;31;40m"
red="\033[31;40m"
resetcolor="\033[0m"
echo -e $flashred"ERROR: "$resetcolor$red"Something went wrong\!"$resetcolor
```

- Another utility to do this is __tput__ and use command substitution
- See `$ man terminfo` for all options avail

```bash
#!/bin/bash
flashred=$(tput setab 0; tput setaf tput blink)
red=$(tput setab 0; tput setaf 1)
resetcolor=$(tput sgr0)
echo -e $flashred"ERROR: "$resetcolor$red"Something went wrong\!"$resetcolor
```

- `date` command

```bash
$ date +"%d-%m-%Y %H:%M:%S"
```

- `printf` command gives a lot of options
- use a `\t` for tab alignment
- use a `\n` for new line
- use a `%04d` to specify four place digit

```bash
$ printf "Name:\t%s\nID:\t%04d\n" "Scott" "12"
```

So, putting all of this together, we can write the script

```bash
#!/bin/bash

today=$(date +"%d-%m-%Y)
time=$(date +"%H:%M:%S")
# assign the output to a variable __d__
printf -v d "Current User:\t%s\nDate:\t\t%s @ %s\n" $USER $today $time
# use echo to preserve the new line and apply the variables
echo "$d"
```

#### working with ARRAYS in bash

```bash
#!/bin/bash

a=()
b=("apple" "banana" "cherry")

echo ${b[2]}
b[5]="kiwi"

# add to end of array
b+=("mango")
# print the whole array
echo ${b[@]}
# print the last element in the array
echo ${b[@]: -1}

# associative arrays (bash 4+)
declare -A myarray
myarray[color]=blue
myarray["office building"]="HQ West"

echo ${myarray["office building"]} is ${myarray[color]}
```

#### reading and writing text files
- if you want to work with binary files, you're better off using C/C++

```bash
# overwrite
$ echo "Some text" > file.txt
$ > file.txt

# add to the end of a file
$ echo "Some text" > file.txt
$ echo "Some more text" >> file.txt
```

#### read a file, line by line using a do-while loop

```bash
#!/bin/bash

while read f; do
  echo "Line $i: $f"
  ((i++))
done < file.txt
```

#### here document 
- pass data into a file

```bash
#!/bin/bash

cat << EndOfText
This is a 
multiline
text string
EndOfText
```

- add a <<- to string out the leading tab
- go out and get a file on an FTP server
```bash
#!/bin/bash

ftp -n <<- DoneWithThis
    open mirrors.xmission.com
    user anonymous nothinghere
    ascii
    cd gutenberg
    get GUTINDEX.01
    bye
DoneWithThis
```

#### Challenger: Made a script that generates a system report

- create a script that uses: 
  - some variables, 
  - command substitution
  - string formatting
  - make a summary of some system information
  - print the result to the screen and 
  - write some info to a file
  
```bash
#!/bin/bash

freespace=$(df -H / | grep -E "\/$" | awk '{print $4}')
logdate=$(date +"%Y%m%d")
logtime=$(date +"%H%M%S")
logdateUS=$(date +"%m/%d/%y")
logfile=system_report_"$logdate"_"$logtime".log
uptimeArray=$(uptime -p)
filecount=$(ls -R ~ | wc -l)
theIP=$(curl -s ifconfig.co)
GREEN="\033[32m"
BOLD="\033[1m"
NORMAL="\033[0m"


echo -e $BOLD"System report for "$GREEN$HOSTNAME$NORMAL$BOLD "on" $GREEN$logdateUS$NORMAL
printf "\tSystem type:\t%s\n" $MACHTYPE
printf "\tBash Version:\t%s\n" $BASH_VERSION
printf "\tUptime:\t\t%s\n" "${uptimeArray[*]}"
printf "\tFree Space:\t%s\n" $freespace
printf "\tFiles in ~:\t%s\n" $filecount
printf "\tPublic IP:\t%s\n" $theIP
echo -e "\n$BOLD""A summary of this info has been saved to: $GREEN$logfile$NORMAL"

cat <<- EOF > $logfile
	This report was automatically generated by a bash script.
	It contains a brief summary of some system information.

EOF

echo -e "System report for $HOSTNAME on $logdateUS" >> $logfile
printf "\tSystem type:\t%s\n" $MACHTYPE >> $logfile
printf "\tBash Version:\t%s\n" $BASH_VERSION >> $logfile
printf "\tUptime:\t\t%s\n" "${uptimeArray[*]}" >> $logfile
printf "\tFree Space:\t%s\n" $freespace >> $logfile
printf "\tFiles in ~:\t%s\n" $filecount >> $logfile
printf "\tPublic IP:\t%s\n" $theIP >> $logfile
```




[[edit](https://github.com/nealalan/nealalan.github.io/edit/master/BASH-notes.md)]
