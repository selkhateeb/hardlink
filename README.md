# hardlink-osx
A simple command-line utility that implements directory hardlinks on Mac OSX

to link: `hln source destination`
to unlink: `hln -u destination`

## Motivation
I was trying to patch a third-party library and make the files available in our
code directory without having to copy the files every time I patch it.

I got the idea from the  [stackoverflow](http://stackoverflow.com/questions/80875/what-is-the-bash-command-to-create-a-hardlink-to-a-directory-in-os-x)
question here and decided to create a lib out if it that anybody can use.

## A note about the the `hln` binary name:
The binary is named `hln` due to a naming conflict. It's also just easier to type and does not conflict with any other system I have checked.

## Requirements
- You will need [xCode](https://developer.apple.com/technologies/mac/#xcode) command line tools installed to use `make` command

## Installation
### Using Homebrew
After installing [homebrew](http://brew.sh/), you can simply issue this command in your terminal and hardlink will automatically install with:

- `brew install hardlink-osx`

### Manually compiling
- `git clone https://github.com/selkhateeb/hardlink.git`
- `cd hardlink`
- `make`
- `[sudo] make install`

Note: If you get the error `directory /usr/local/bin does not exist`, just copy hardlink app into `/usr/bin` instead.

## Usage
To create a hard link:
- `hln source destination`

To remove the link:
- `hln -u destination`

## Limitations
Hardlink can not be created under the same directory root.
If you try to `hln` source directory to target directory under the same root you will get an error.
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
