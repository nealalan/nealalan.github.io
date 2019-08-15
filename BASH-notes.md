

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
| exponentiation | $a ** $b |
| multiplication | $a * $b |
| division | $a / $b | 
| mod | $a % $b |
| addition | $a + $b |
| subtraction | $a - $b |
| increment | $a++ |
| decrement | $a-- |
| combination assignments | ((b+=5)) |
| comparison (not ints) | [[ $a == $b ] |
| true / SUCCESS | 0 |
| false | 1 |
| comparison (ints) | [[ $a -lt $b ]] |
| greater than | [[ $a -gt $b ]] |
| less than or equal to | [[ $a -le $b ]] |
| greater than or equal to | [[ $a -ge $b ]] |
| equal | [[ $a -eq $b ]] |
| not equal | [[ $a -ne $b ]] |


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
```






[[edit](https://github.com/nealalan/nealalan.github.io/edit/master/BASH-notes.md)]
