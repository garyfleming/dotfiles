# Filebot Settings #

Filebot doesn't appear to have a versionable settings file so do this manually.

1. Go to Edit Presets -> New Preset ...
2. For each preset below, enter the details.


## tv-preset

```
Expression: /Volumes/media/TV/{n.sortName().space('.').replaceAll(/[`´‘’ʻ]/, "'").replaceAll(/[&]/, "and").lowerTrail()}/{episode.special?'Special':'Season'+s.pad(2)}/{n.space('.').replaceAll(/[`´‘’ʻ]/, "'").replaceAll(/[&]/, "and").lowerTrail()}{episode.special ? '.S00E'+special.pad(2):'.'+s00e00}{'.'+fn.matchAll(/repack|proper|extended/).join('.').upper()}{'.'+vf}{'.'+t.space('.').replaceAll(/[`´‘’ʻ]/, "'").replaceAll(/[&]/, "and").lowerTrail()}{'.'+vc}{'.'+source}
Datasource: TheTVDB
Language: English
Rename Action: Rename
Episode Order: Airdate Order
Match Mode: Strict
```

## film-preset

```
Expression: /Volumes/media/Films/{n.space('.')}{'.'+y}{'.'+vf}{'.'+vc}{'.'+ac}{'.pt'+pi}
Datasource: TheMovieDB
Language: English
Rename Action: Rename
Episode Order: Airdate Order
Match Mode: Opportunistic
```
