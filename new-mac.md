# Set-Up New Mac #

1. Switch on FileVault
1. Take all System Updates
1. Install 1Password and recover vault. (TODO more info on how)
1. Create a new SSH private key
1. Sign into github and give it the private key (remove old keys, if necessary).
1. Install HomeBrew
1. Install dotfiles from github (includes brew bundle install of most stuff)
1. In Finder, go to Finder -> Preferences -> General, and enable showing Hard Disks and Connected Servers on the desktop.
1. Finder -> Go -> Connect server... and add NAS volumes: smb://...ip.../volume
1. Musicbrainz Picard settings. Can grab from dotfiles repo: musicbrainz-settings.md
1. Keybase: From terminal: keybase login   Then follow choices.
1. NordVPN login
1. (Defunct?) Currently, the Cable Matters ethernet adapter isn't supported out of the box.
Grab the driver from here. Chipset is AX88179: http://www.asix.com.tw/products.php?op=pItemdetail&PItemID=131;71;112
1. Filebot settings. Can grab from dotfiles repo: filebot-settings.md
1. Restore chrome bookmarks from backup (TODO script this)

## Migrate iTunes Library ##

iTunes stores all of its metadata under ~/Music/iTunes. You need to copy that to a flash drive (or similar), then write it to the same place on the target machine. It can get fairly big: 20-40Gb, depending on artwork and iOS app backups.


## TO-DO ##

* Automate grabbing MusicBrainz Picard plugins and putting them in place
* Try to figure out Picard settings so it's not manual.
* Automate connecting to NAS volumes.
