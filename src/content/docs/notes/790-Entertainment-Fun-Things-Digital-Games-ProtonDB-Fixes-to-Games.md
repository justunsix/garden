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

- For story mode, install Proton GE using asdf instructions on GE
  GitHub, restart steam, select GE and test story mode works ok

  - During Story Mode cut scenes, may need to press Enter to get
    rendering to work

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

## Games that should work with no or minor changes

- Cities Skylines
- Crusader Kinds 3 (see Paradox Games native workarounds)
- CyberPunk 2077
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
