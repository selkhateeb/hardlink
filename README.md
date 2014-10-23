# hardlink-osx
a simple command-line utility that implements directory hardlinks on Mac OSX

to link: `hardlink-osx source destination`  
to unlink: `hardlink-osx -u destination`

## Motivation
I was trying to patch a third-party library and make the files available in our
code directory without having to copy the files every time I patch it.

I got the idea from some [stackoverflow](http://stackoverflow.com/questions/80875/what-is-the-bash-command-to-create-a-hardlink-to-a-directory-in-os-x)
questions.. and decided to create a lib out if it that everybody can use

## Requirements
- You need [xCode](https://developer.apple.com/technologies/mac/#xcode) command line tools installed to use `make` command

## Installation
- `brew install hardlink-osx`

- Or withouit homebrew

- `git clone git@github.com:jasonsyoung/hardlink-osx.git`
- `cd hardlink-osx`
- `make`
- `[sudo] make install`

Note: in case you get error `directory /usr/local/bin does not exist`, just copy hardlink app into `/usr/bin` instead

## Usage
To create a hard link:
- `hardlink-osx source destination`

To remove the link:
- `hardlink-osx -u destination`


## Limitations
Hardlink can not be created under the same directory root.
If you try to `hardlink-osx` source directory to target directory under the same root you will get an error.
```
operation not permitted
```
to avoid that you should create additonal directory level
```
- /directory_root/
   |-  /source_directory
   |-  /parent_directory/
         |- target_directory
```

