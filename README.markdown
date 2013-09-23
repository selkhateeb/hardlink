# hardlink
a simple command-line utility that implements directory hardlinks on Mac OsX

to link: `hardlink source destination`  
to unlink: `hardlink -u destination`

## Motivation
I was trying to patch a third-party library and make the files available in our
code directory without having to copy the files every time I patch it.

I got the idea from some [stackoverflow](http://stackoverflow.com/questions/80875/what-is-the-bash-command-to-create-a-hardlink-to-a-directory-in-os-x)
questions.. and decided to create a lib out if it that everybody can use

## Requirements
- You need [xCode](https://developer.apple.com/technologies/mac/#xcode) command line tools installed to use `make` command

## Installation
- `git clone git://github.com/selkhateeb/hardlink.git`
- `make`
- `sudo make install`

Note: in case you get error `directory /usr/local/bin does not exist`, just copy hardlink app into `/usr/bin` instead

## Usage
To create a hard link:
- `hardlink source destination`

To remove the link:
- `hardlink -u destination`


[![Bitdeli Badge](https://d2weczhvl823v0.cloudfront.net/selkhateeb/hardlink/trend.png)](https://bitdeli.com/free "Bitdeli Badge")

