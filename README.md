# Uncle Joey's Base
Uncle Joey's Base provides some essential client-side addons for your BeamMP server, including:
- A message of the day with BBCode support (motd)
- Player restrictions (limiting rewinds, menu options etc.)
- Limiting resets to a certain amount per time
- Day / night time syncing
- Environment (weather) syncing (rain (snow), wind, clouds, fog and gravity)

## Getting started
1. Download the latest release
2. Configure the addon using the `settings/config.lua` file
3. Optionally add or replace images in the `ui/uj_base` folder
4. (Re)zip the mod by selecting all files and right clicking -> Send to -> Compressed (zipped) folder
5. Place the .zip file in your `Resources/Client` folder of your BeamMP server

### Motd BBCodes
You can use BBCodes in your motd, `config.lua` contains a sample.
`[url] [forumurl] [ico] [h1] [h2] [h3] [h4] [h5] [h6] [img] [action] [list] [olist] [strike] [code] [br] [MEDIA=youtube] [size] [color] [hr] [spoiler] [font] [left] [center] [right] [i] [b] [u] [s]`
> Note: external urls are not allowed by BeamNG and will not work, only local links and links to beamng.com are allowed.

Variables:
* `{serverTime}` prints the current server time (as set in the config)


## Questions, Feature requests & Bugs
Please create an issue here on GitHub.

## Some impressions
![](https://i.imgur.com/ZcNJnBb.png)
![](https://i.imgur.com/mK7uD2s.jpg)
![](https://i.imgur.com/dUdR08Z.png)
![](https://i.imgur.com/V4BJWA2.png)
