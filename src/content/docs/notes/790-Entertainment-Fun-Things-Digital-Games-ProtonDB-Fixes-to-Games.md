---
date: 2025-09-15
filetags: ":game:epubnote:"
id: ae9f8a55-bb7e-4844-95c9-09e3d9cb2bb0
title: ProtonDB Fixes to Games
---

Fixes applied to games running on Ubuntu GNU Linux operating system.

## Paradox Games Native

To bypass launcher issues on Native installations, go to the games local
file directory (Game properties \> Install Files \> Browse) using Steam
and find the binary, launch the game from the binary

### EU4

- Use Hide the top bar extension for windowed full screen

## Dead of Alive 6

- Works out of the box with proton experimental

- For story mode, install Proton GE using `asdf` instructions on GE
  GitHub, restart steam, select GE and test story mode works ok

  - During Story Mode cut scenes, may need to press Enter to get
    rendering to work

## XCOM 2

Enable Compatibility: Force the use of a specific Steam Play
compatibility tool: Steam Linux Runtime 1.0 (Scout). The lower version
likely due to changes in Linux and its libraries over time and old
version closer to the game's release. Then launch War of the Chosen.
Alternatively, legacy runtime 1.0 may work as well.

Game startup may take couple minutes until main menu.

### Other fixes

Source: [Linux Client is broken. :: XCOM 2 General
Discussions](https://steamcommunity.com/app/268500/discussions/0/5958906231741663489/)

The issue you are seeing is suspected to be related to the game not
finding the correct libraries due to changes in modern versions of
Linux.

Right click the game in your Steam Library, and select Properties In the
new window that appears, go to Installed Files and click Browse In the
window, enter the 'lib' folder, then the 'x86<sub>64</sub>' folder
Select all files in 'x86<sub>64</sub>', and Cut them using Ctrl+X Now,
go back to the 'lib' folder and Paste the files using Ctrl+V Delete the
remaining 'x86<sub>64</sub>' folder from the 'lib' folder Launch the
game again

## Jagged Alliance 3

Had to apply these fixes

### Initial game launch

<https://www.protondb.com/app/1084160#vf74V81EyK>

Open the game folder (right click on the game, properties -\> installed
files -\> browse) Navigate to Packs/Maps folder. Create some folder,
name it as you like - i.e. bak or temp Find all the files with names
starting with "MainMenu\_" Move all those files to the folder you
created in step 3. Launch the game. Game should launch to the menu but
instead of the background with your mercs, it will be black. Open
Options -\> Video and change Reflections to anything other than Medium
or High. Off, Low and Ultra are ok. Apply the change. Don't try to play
yet. You do not have some necessary files. Close the game. Restore the
"MainMenu\_" files to their previous location. Restart the game. Game
should now go to the main menu, background with mercs should be there.

### Fix full screen alignment

<https://www.protondb.com/app/1084160#SkpINaDy8R>

Windowing:Size

- You might notice that mouse clicks apply slightly below where they are
  supposed to. This is because in full screen the window is slightly
  lower than expected. This can be observed by moving the mouse to the
  top of the screen and looking at the thin black area on the top.
- To fix this, go to settings, set the windowed mode to "Windowed",
  apply and then switch back to "Windowed fullscreen". This will fix the
  clicks.
- Needs to be done after every restart.

## Total Warhammer 3

Game should work native without proton.

With issues with `vkWaitForFences failed: -4` or similar errors related
to Vulkan, try the following troubleshooting options based on [Warhammer
3 crashing, Signal 6/vkwaitforfences
failed](https://www.reddit.com/r/totalwar/comments/1nmlqau/warhammer_3_crashing_signal_6vkwaitforfences/):

- Lower video settings
- Use Windowed mode
- Disable shadows

## Games that should work with no or minor changes

- Cities Skylines
- Crusader Kinds 3 (see Paradox Games native workarounds)
- CyberPunk 2077
- Diablo 4 (IV)
- Homeworld Deserts or Kharak, Remastered Collection
- Injustice 2
- Mechwarrior 5 Mercenaries
- SpellForce Conquest of Eo
- Stellaris
- Total War: Pharaoh, Troy, Three Kingdoms, Warhammer 3
- Uncharted: Legacy of Thieves
- Warhammer 40,000 Dawn of War II Retribution
- Warhammer 40,000 Rogue Trader
- WWE 2K25

### Games to take a while on first run, like due to install, installation scripts, or shader loading

- Battletech
- Marvel's Midnight Suns
- Titanfall 2 - requires log in to EA app during launch
- X COM Chimera Squad

### VS Redist Package Issue and Stopping during initial run

See also fix for [Steam Proton games stuck on "Installing: Microsoft VC
Redist
Package"](https://www.reddit.com/r/SteamPlay/comments/pulnsa/steam_proton_games_stuck_on_installing_microsoft/),
workaround from pewpewpewmoon:

> I get this from time to time. Clear your download cache, give it a
> minute and then try again. It will fix it most of the time
>
> Steam \> Settings \> Downloads \> Clear Download Cache
>
> EDIT: This also happens on windows, it's just an annoying thing that
> has always been a part of steam for some people

Also can check integrity of game's files if there are issues under
Game's Details \> Installed Files

## See Also

- [protondb](https://www.protondb.com/) - crowdsourced Linux and Steam
  Deck game compatibility reports
