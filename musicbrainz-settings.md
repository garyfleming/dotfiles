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
$if(%_releasecomment%, \(%_releasecomment%\))
$if($gte(%totaldiscs%,2), \(disc %discnumber%\),)
/%artist% - %title%
```

Note: this currently correctly sets release disambiguation in the file path, but not in the tags.
e.g. " (Remastered)" might appear in the file path, but will still cause weird duplication in iTunes

## Plugins

Install into .config/Musicbrainz/Picard/plugins/:

1. Add Cluster As Release
2. Feat. Artists In Titles
3. Release Type
 