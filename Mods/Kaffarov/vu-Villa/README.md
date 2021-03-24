Using the terrain from the classic singleplayer mission Villa, this is a Conquest Large map based off the events of the mission. It is a *showcase of how to convert a singleplayer or COOP terrain into multiplayer* taking Janssent's approach - it loads a multiplayer map, and replaces the terrain and other assets. I've also made some objective points and spawn bases, so that this is feasable as a Conquest Large map. This will be done using MapEditor.

To load this, write '*XP3_Desert ConquestLarge0 1*' in your MapList.txt. This map is using Bandar Desert as a foundation. 
**MAKE SURE YOU SET '-highResTerrain' AS A LAUNCH COMMAND FOR YOUR SERVER** (you should do this anyway). Without this, the terrain collision gets trippy.

To convert this to other singleplayer or COOP terrains, some work is needed looking through the EBX dump to replace GUIDs - I've chosen to use InstanceLoadHandlers instead of iterating through all instances and looking for blueprint names to speed up the script, but this does mean that more work is needed to convert this for use with different maps. The comments in the code should be useful in doing this.

All of this have been possible thanks to SassythSasqutch (who made the base mod and make it possible to load the campaign missions themselves), FoolHen (who found how to block properly the terrain),MajorVictory87 (who made possible to get Enlighten in such maps), IllustrisJack (who helped on coding and set different wind speeds), Jannsent and Bree_Arnold (who helped on coding).
