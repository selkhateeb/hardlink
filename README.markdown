# hardlink
a simple application that implements hardlinks on Mac OsX

to link: `hardlink source destination`
to unlink: `hardlink -u destination`

## Motivation
I was trying to patch a third-party library and make the files available in our
code directory without having to copy the files every time I patch it.

I got the idea from some [stackoverflow](http://stackoverflow.com/questions/80875/what-is-the-bash-command-to-create-a-hardlink-to-a-directory-in-os-x)
questions.. and decided to create a lib out if it that everybody can use

## Installation
- `git clone git://github.com/selkhateeb/hardlink.git`
- `make`
- `sudo make install`

## Usage
To create a hard link:
- `hardlink source destination`

To remove the link:
- `hardlink -u destination`
