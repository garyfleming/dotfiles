# Set-Up New Mac #

1. Switch on FileVault
2. Rename the macbook (general -> about)
3. Take all System Updates
4. Install HomeBrew. /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
5. Install 1Password and recover vault. (TODO more info on how)
   1. brew install 1password (it's now in brew)
   2. Recover vault
6. SSH keys are managed by 1password.
   1. terminal: mkdir ~/.ssh; touch ~/.ssh/config
   2.  Switch on the ssh agent. Settings -> Developer -> Setup SSH agent. Might need to update sshconfig settings as it has a pointer to SSH agent. Not sure if that's a stable location across installs.
7. Dotfiles setup...
   1. Install github cli: brew install gh
   2. gh auth login    (make sure to pick ssh, do not add an ssh key, and follow the browser based flow.)
   3. Install dotfiles from github (includes brew bundle install of most stuff): gh repo clone garyfleming/dotfiles ~/.dotfiles
   4. Run the installer to connect stuff to the right places: chmod +x ~/.dotfiles/install.sh; cd ~/.dotfiles; 
8.  In Finder, go to Finder -> Preferences -> General, and enable showing Hard Disks and Connected Servers on the desktop.
9.  Finder -> Go -> Connect server... and add NAS volumes: smb://...ip.../volume
10. Musicbrainz Picard settings. Can grab from dotfiles repo: musicbrainz-settings.md
11. Keybase: From terminal: keybase login   Then follow choices.
12. NordVPN login
13. (Defunct?) Currently, the Cable Matters ethernet adapter isn't supported out of the box. Grab the driver from here. Chipset is AX88179: http://www.asix.com.tw/products.php?op=pItemdetail&PItemID=131;71;112
14. Filebot settings. Can grab from dotfiles repo: filebot-settings.md
15. Restore chrome bookmarks from backup (TODO script this)
16. Setup citrix. Don't use the workspace, just go to myworkspace.jpmchase.com in a browser
17. Music library
   1. Navigate to /Applications in finder
   2. Option+click Music to pick a library
   3. Library is current a file called "Music Library.musiclibrary" in /Volumes/media

## Migrate iTunes Library ##

iTunes stores all of its metadata under ~/Music/iTunes. You need to copy that to a flash drive (or similar), then write it to the same place on the target machine. It can get fairly big: 20-40Gb, depending on artwork and iOS app backups.


## TO-DO ##

* Automate grabbing MusicBrainz Picard plugins and putting them in place
* Try to figure out Picard settings so it's not manual.
* Automate connecting to NAS volumes.
* Stream deck settings into version control
