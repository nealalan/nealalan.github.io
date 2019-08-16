# [nealalan.github.io](https://nealalan.github.io)/[python-notes](https://nealalan.github.io/python-notes) ([repo](https://github.com/nealalan/python-notes))

## Python 3 for System Admins Notes

### SETUP in CentOS
1. Launch CentOS
2. Installs
```bash
$ sudo su -
$ yum update
$ yum groupinstall -y "development tools"
# git, wget, which, words (need file at /usr/share/dict/words), lsof, text editor of your choice, python 3.6.5
$ yum install -y lsof wget vim-enhanced words which
$ exit
```
3. Setup git, vim, bash
```bash
$ git config --global user.name "name"
$ git config --global user.email "email"
$ curl https://raw.githubusercontent.com/linuxacademy/content-python3-sysadmin/master/helpers/bashrc -o ~/.bashrc
$ curl https://raw.githubusercontent.com/linuxacademy/content-python3-sysadmin/master/helpers/vimrc -o ~/.vimrc
$ exec $SHELL
```
4. Install Python 3 in CentOS 7
```bash
$ sudo su -
$ yum install -y libffi-devel zlib-devel bzip2-devel openssl-devel ncurses-devel \
sqlite-devel tk-devel gdbm-devel db4-devel libpcap-devel xz-devel expat-devel
$ wget https://www.python.org/ftp/python/3.7.2/Python-3.7.2.tgz
$ tar xf Python-3.7.2.tgz
$ cd Python-3.7.2
$ ./configure --enable-optimizations
# make a new version of python3 executable
$ make altinstall
$ exit
# verify install
$ python3.7
# upgrade pip
$ sudo pip3.7 install --upgrade pip
```



[[EDIT](https://github.com/nealalan/python-notes/edit/master/README.md)]
