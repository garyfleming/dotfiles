# MusicBrainz Settings #

MusicBrainz Picard doesn't appear to have a versionable settings file so do this manually:

## General ##

Username: VKPS
Password: .......

## Metadata ##

Tick: Translate artistnames to this Locale...
Tick Use standardized artist names
Tick: Use Release Relationships
Tick: Use folksonomy tags as genre


## Tags ##

Tick: write tags to files
Tag version: 2.4, encoding UTF-8
Tick: Also include ID3v1 tags in the files

## Cover Art ##

Tick: Embed cover images into tags
Tick: Only embed a front image

## File Naming ##

Tick: rename files when saving
Tick: Windows compatibility
Tick: Moves files to this directory when saving
   and set to "/Volumes/media/Music"

Name Files like this: 
```
$if2(%albumartist%,%artist%)
/%album%
$if($gte(%totaldiscs%,2), \(disc %discnumber%\),)
/%artist% - %title%
```

Note: Disambiguation is added by scripting. Adding it here as well doubles it up!

## Plugins

These should all be available in the Plugins preferences pane, but if not install into .config/Musicbrainz/Picard/plugins/:

1. Add Cluster As Release
2. Feat. Artists In Titles
3. Release Type

## Scripting 

Tick: Enable Tagger Scripts

Add a new tagger script, name it "Album", and set the contents to:

`$set(album,%album%$if(%_releasecomment%, \(%_releasecomment%\)))`

This adds album disambiguation (e.g. "Remastered") to the album tag.
 