# My Arch Setup
This is a personnel guide to setup Arch Linux on a new installation. 

## Introduction
The guide goes over everything I need to do, to have a full working Arch distribution with i3 and in sync with other devices. The guide is chronological. The guide assumes that Arch Linux is successfully installed with internet access.

## Initial setup
In this chapter, the essential setup to have a working operating system is explained. 

### Users
First create an autologin (group used for autologin)
`groupadd -r autologin`
First thing to do is setup a sudo user. To setup the new jfs user, write,
`useradd -g users -G wheel,audio,autologin -m NAME`
and setup the password
`passwd NAME`
You may need to add additional groups to the user, if needed (after -G). [Here an explanation of the typical ones are given](https://wiki.archlinux.org/index.php/users_and_groups).
Next, the wheel group has to allow for sudo commands without password. To do so, write,
`visudo`
And uncomment the line. 
`%wheel ALL=(ALL) NOPASSWD: ALL`

To access the account type,
`su NAME`
Any changes to a user and their groups is done by 
`usermod`
In case of mistake, you may want to delete a user
`userdel -r NAME` 

### Internet
For now, you have to use wifi-menu (which you hopefully installed during installation of Arch Linux). 

### Updating Arch
Very important to update the system 
`pacman -Syu`
And when community arch package manager is installend
`yay -Syu`

### Drivers
Necessary graphic is usually:  
`sudo pacman -S xorg`  
That should be all that is needed, but may depend on the graphic card in question. Consult the Arch wiki if things does not work. 

### i3
Next is i3 itself and related packages  
`sudo pacman -S i3-gaps, i3blocks, i3lock, i3status`  
To actually use i3, we first have to adjust some settings. Open the following file:  
`nano /etc/X11/xinit/xinitrc`  
Delete everything after `twm` and replace it with `exec i3`  
You are now able to enter i3. To enter, type:  
`startx`   
See Configurations on how to configure i3  
Before doing so, for good measure, reboot the computer, and login directly through the  user account.  

Congratulations! You know have a working desktop!  

## Essential programs
Here is listed a description of essential programs, to get everything up and running.

### Git
Many packages need git to be installed 
`sudo pacman -S git`

### AUR
To easily access the community application through AUR, an AUR packager needs to be installed. We use yay. It needs to be downloaded directly through source. 
First enter the download directory. Then type
`git clone https://aur.archlinux.org/yay.git cd yay makepkg -si `
You can now use `sudo yay -S PACKAGENAME` to install AUR packages 

### Browser
`sudo pacman -S firefox`

### IDE and Standard text editor
`sudo pacman -S code`

### Cloud service
Essential to adjust and see this file
`yay -S dropbox`

### Terminal emulator
`sudo pacman -S kitty`
In i3 config: 
`terminal-emulator kitty`
Then restart i3 

### Shell (zsh)
The shell of use is zsh. Here is how to install it. The config file is as always found in myconfig folder. To install, just follow the guide, [here](https://github.com/robbyrussell/oh-my-zsh)


### In terminal editor
Vim is used. gvim is installed, as it has the more sensible initial configuration
`sudo pacman -S gvim`

### Sound
To get sound,
`sudo pacman -S alsa-utils`
and, afterwards:
`sudo pacman -S pulseaudio-also`
Then, afterward, enter user interface of alsa
`alsamixer`
Unmute every instance and turn everything up to 100. 
Sound should thereafter work on any device. 

### File manager
Ranger
`sudo pacman -S ranger`

### Network
It is annoying to always manually connect to the internet. Network manager can help in this regard. Here will be explained to install network manager, and how to easily manage your networks. 
First install network manager,
`sudo pacman -S networkmanager`
`sudo pacman -S nm-connection-editor`
`sudo pacman -S network-manager-applet`
The connection editor allows for a gui, and the applet yields a system tray icon, that is clickable. To start networkmanager at startup, write
`systemctl enable NetworkManager.service`

Congratulations! You know have a system with the essentials installed. You can now relax a bit, and be productive, and add the rest at another time. You might want to skip directly to configuration, if the non-essential programs is not needed at this time 

## Non-essential programs
A list of non-essential programs. 

### Office lignende produkter
Libre-office

### Music
`yay -S spotify`

### Chat
Discord app is the main chat device
`yay -S discord`

### Steam
Steam is used for games and chat 

### Image viewer
Image previewer in ranger will be the main way to browse image. Feh will be used as dedicated image viewer. It will also be used to setup a wallpaper. To install, 
`sudo pacman -S feh` 

### Movie viewer

### PDF viewer
Zathura will be the main PDF viewer. It is a light weight VIM based PDF-reader. 
Okular is a heavy weight pdf viewer, and is used when needing to read and write comments in a pdf file. 

### Task managers

### System monitors

### Font viewers

### Hardware sensor monitoring

### Clipboard manager
We use greenclip with rofi. Use $mod+c to access clipboard menu. 
Before this, make sure greenclip is installed and configured:
~~~~
yay -S rofi-greenclip
systemctl --user enable greenclip.service
~~~~

### File searcher
The file search is done through ROFI with an application called dmenu-extended. 
[Documentation](https://github.com/MarkHedleyJones/dmenu-extended)
Overall, you find applications, files and folders and launch them. 
Text files a launched via VIM. 
Folder a launched by opening a terminal with ranger. 
As advice, you can start a code session in a folder by:
`code:: -> enter -> find folder`

### Email manager
See MUTT

### Screenshot takers
Flameshot. Use yay to download. [github](https://github.com/lupoDharkael/flameshot)

### <a id=ssh></a> SSH
For some applications to work, and to gain remote access to some sites, you need an SSH application and to generate a key. After this, the public key must be associated with the remote source. For this example, git-hub will be used. See [this](https://help.github.com/en/enterprise/2.16/user/articles/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent) and [this](https://help.github.com/en/articles/connecting-to-github-with-ssh) for how to generate an SSH key. Also, remember to install openssh.
`pacman -S openssh`
Also remember to add your username and email to git.config file.
`git config --global user.email "email@example.com"`
`git config --global user.username "username"`

## Configurations
The configuration of the ARCH, i3 and the different applications is explained here. 

### Setting up version control for config files
Gnu stow is used in combination with git. Install gnu stow
`sudo pacman -S stow`
Then create the config folder under $HOME
`mkdir myconfig`
Clone the config repository into that folder
Then simply use stow on each config folder. Symlinks will go to the corrects place in the $HOME folder.
Stow works by creating symlinks from the origin folder to whatever other folder, which without designation is the $HOME folder

### Keyboard
The keyboard should be set to us altgt-intl with caps lock and escape switched.
(fuck, jeg har glemt hvordan man gør det her.)

### Directory setup 
The following directory setup is used on the home computer. On the home computer, the file system is explained under structer.md. Moreover, the structure resides under myfolder. 
- images
- movies
- music
- documents
- games
- archive
- lists
- projects
    - roleplaying
    - boardgames
    - videogames
    - studies
    - misc
- dropbox 
    - shared
    - personnel 
Uploading specific folder or files to the internet is done through git or dropbox selective sync. 

### i3 config
After you have setup version control for the configuration files, it is time to configure i3 correctly. 

#### Fonts
Most fonts can be installed through the AUR. 
Some font suggestions: 
- [Font icons](https://old.reddit.com/r/i3wm/comments/c3dux4/how_to_get_nerd_fonts_icons_with_my_i3bar/)
- [Font suggestions](https://old.reddit.com/r/i3wm/comments/c3z4i7/font_suggestions/)
To apply a font, change the font line to
`font pango: <name of font familit>`
Example
`font pango: source code pro`
Consider using nerd fonts for symbols

#### Compton 
Compton allows for smooth scrolling, window transparency, and many other graphical features. 

#### Wallpaper
For the wallpaper to display in the background, you need the path to the wallpaper image and [Feh][#Image viewer]. In i3 config type, 
`exec_always --no-startup-id feh --bg-scale <path-to-wallpaper.jpg>`

#### Gaps 
Shown in the config. 

#### Polybar

#### Workspaces
Workspaces are setup to be consistent, but have additional . In this section, the different workspaces are detailed. The shortcuts for them can be seen in the i3 config file. 
- Welcome: The welcome screen. It includes the TO-DO list through VS-code, a welcoming terminal and Neofetch. No moving og windows should be done to and from this workspace. 
- Browser: A Firefox browser is made here 
0 

#### Startup
Startup exectution is done through for every file in the ~/scripts/startup folder. The most important part i the execution and moving of application to workspaces. An important thing to note, is the fact that renaming of the workspaces has to be done both in the startup folder and in the i3 config. 

### Kitty config
As in i3, we should change the fonts first and foremost. Open the kitty config file. Add the three following lines: 
~~~~
font_family         source code pro
bold_font           source code pro bold
italic_font         source code pro italic
bold_italic_font    source code pro bold italic
~~~~
You can replace source code pro with any font you like, as long as it is installed. 

When it comes to theming the terminal, follow [this guide](https://github.com/dexpota/kitty-themes). Be sure to have a working public SSH key. 

#### fzy
fzy allows for quickly finding files and folders in real-time. It is an improvement over fzf. 

#### Autojump
Autojump allows for jumping between visited directories using the command j. An extension is also provided for ranger. Install autojump:
`sudo pacman -S autojump`
Then source the following files:
`source ~/.bashrc`
`source /etc/profile.d/autojump.bash`

### Ranger
The configuration file for can be found at
`~/.config/ranger`
To make things easier going forward, write,
`pacman -Qi ranger`
This will download all optional dependencies for QI ranger.
There after, we need to be sure ranger understands the config file. This might not be necessary, but just in case:
`ranger --copy-config=scope`

#### Syntax highlighting
To have syntax highlighting in preview install highlight,
`sudo pacman -S highlight`

#### Image preview
Should be enabled when download the optional dependencies, and using the git-config, where `set prevuew_images true` is set. If it does not work, try installing w3m with the image drawing feature and restart. (See)[https://github.com/ranger/ranger/wiki/Image-Previews] for more details

#### PDF preview

#### Enabling autojump
[Follow](https://github.com/fdw/ranger-autojump)
Now you can use j, to automatically jump to a folder (doesn't work very well).

#### Icons
Make sure that a [NERDfont](https://github.com/ryanoasis/nerd-fonts) is the default font in the terminal. Then install 
`git clone https://github.com/alexanderjeurissen/ranger_devicons ~/.config/ranger/plugins/ranger_devicons`

#### Marks 

### Vim config
To make vim use the global clipboard, write in the vimrc  
`set clipboard=unnamedplus`

#### plugins
Vim which key:
- https://github.com/liuchengxu/vim-which-key

### Rofi and dmenu-extended 
Rofi is a pop-menu that can be used for varies activities. We replace Rofi with dmenu as it is easier to configure and looks nicer. In our case we will set it up with dmenu-extended to accomplish the following goals:
- Application launcher (like dmenu)
- File finder and launcher (with file settings)
- Folder finder and opener (to ranger)
- Script finder and launcher
- Easy calculator 
- Quick google search
- Easy finding of emoticons and various symbols 
- Timer
First, to install Rofi 
`sudo pacman -S rofi`
We also need a few packages, to have it work properly
~~~~
yay -S rofi-dmenu
yay -S dmenu-extended-git
yay -S rofi-calc
~~~~
Relevant links:
- https://github.com/MarkHedleyJones/dmenu-extended

### Default application
Default applications decides what program is used to startup a file of folder. See
- https://wiki.archlinux.org/index.php/Default_applications#perl-file-mimeinfo
- https://wiki.archlinux.org/index.php/Xdg-utils#xdg-open
- https://bbs.archlinux.org/viewtopic.php?id=222344
So, you want to install some standard applications: 
`sudo pacman -S xdg-utils`
`sudo pacman -S perl-file-mimeinfo`
`sudo pacman -S desktop-file-utils`
To actually set a default program for a specific file type, write:
`/usr/bin/vendor_perl/mimeopen -d $file.type`
For having a standard editor, you must set the environment variables:

### VS code config

### Firefox config

### git config

#### Setting up SSH key
To be able to use git properly through clone and such, an SSH key needs to be set up. See [SSH](#ssh). 


## Additional Reading

### Useful links