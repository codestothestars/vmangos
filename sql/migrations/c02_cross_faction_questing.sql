-- Remove faction condition for creatures that drop items that start quests
UPDATE `creature_loot_template` SET `condition_id` = 0 WHERE `item` IN (
   2874, -- Unsent Letter
  10000  -- Margol's Horn
);

-- Match factions to custom entries made in the client.
UPDATE `faction` SET `base_rep_value2` = 0, `reputation_flags2` = 1 WHERE `id` IN (
   47, -- Ironforge
   54, -- Gnomeregan Exiles
   68, -- Undercity
   69, -- Darnassus
   72, -- Stormwind
   76, -- Orgrimmar
   81, -- Thunder Bluff
  530  -- Darkspear Trolls
);
UPDATE `faction` SET `base_rep_race_mask1` = 255, `reputation_flags1` = 8, `reputation_list_id` = 54 WHERE `id` =  49; -- Night Watch
UPDATE `faction` SET `base_rep_race_mask1` = 255, `reputation_flags1` = 8, `reputation_list_id` = 52 WHERE `id` = 108; -- Theramore
UPDATE `faction` SET `base_rep_race_mask1` = 255, `reputation_flags1` = 8, `reputation_list_id` = 53 WHERE `id` = 189; -- Alliance Generic

UPDATE `game_graveyard_zone` SET `faction` = 0;

-- Remove faction condition for objects that contain items that start quests
UPDATE `gameobject_loot_template` SET `condition_id` = 0 WHERE `entry` = 3214; -- Henrig Lonebrow's Journal

-- Change team-allied object factions to Friendly
UPDATE `gameobject_template` SET `faction` = 35 WHERE `entry` IN (
       256, -- WANTED
       269, -- Guarded Thunder Ale Barrel
       270, -- Unguarded Thunder Ale Barrel
      2059, -- A Dwarven Corpse
      2868, -- Crumpled Map
      2875, -- Battered Dwarven Skeleton
    148498, -- Altar of Suntara
    152095, -- Moonpetal Lily
    175586, -- Jaron's Wagon
    175587, -- Damaged Crate
    175704  -- Singed Letter
);

-- Make quests available to equivalent races on opposite faction.
UPDATE `quest_template` SET `RequiredRaces` =   3 WHERE `RequiredRaces` IN (  1,   2); -- Human, Orc
UPDATE `quest_template` SET `RequiredRaces` =  20 WHERE `RequiredRaces` IN (  4,  16); -- Dwarf, Undead
UPDATE `quest_template` SET `RequiredRaces` =  23 WHERE `RequiredRaces` IN (  5     ); -- Human+Dwarf, Orc+Undead
UPDATE `quest_template` SET `RequiredRaces` =  40 WHERE `RequiredRaces` IN (  8,  32); -- NightElf, Tauren
UPDATE `quest_template` SET `RequiredRaces` = 192 WHERE `RequiredRaces` IN ( 64, 128); -- Gnome, Troll
UPDATE `quest_template` SET `RequiredRaces` = 195 WHERE `RequiredRaces` IN ( 65, 130); -- Human+Gnome, Orc+Troll
UPDATE `quest_template` SET `RequiredRaces` = 212 WHERE `RequiredRaces` IN ( 68, 144); -- Dwarf+Gnome, Undead+Troll
UPDATE `quest_template` SET `RequiredRaces` = 235 WHERE `RequiredRaces` IN (162     ); -- Human+NightElf+Gnome, Orc+Tauren+Troll
UPDATE `quest_template` SET `RequiredRaces` = 255 WHERE `RequiredRaces` IN ( 77, 178); -- All races

-- Guards reciprocate salutes from anyone with reputation Friendly or greater.
UPDATE `creature_ai_events` SET `condition_id` = 4903 WHERE `id` IN ( -- Orgrimmar
   262101, -- Hammerfall Guardian
   329603, -- Orgrimmar Grunt
   595303, -- Razor Hill Grunt
  1430403, -- Kor'kron Elite
  1511513  -- Honored Ancestor
);
UPDATE `creature_ai_events` SET `condition_id` = 5026 WHERE `id` IN ( -- Ironforge
    72701, -- Ironforge Mountaineer
   559503, -- Ironforge Guard
  1299601, -- Mounted Ironforge Mountaineer
  1511313  -- Honored Hero
);
UPDATE `creature_ai_events` SET `condition_id` = 5030 WHERE `id` IN ( -- Undercity
   240501, -- Tarren Mill Deathguard
   798001, -- Deathguard Elite
  1383902  -- Royal Dreadguard (note the condition_id for this was 0, which warrants an issue in VMaNGOS)
);
UPDATE `creature_ai_events` SET `condition_id` = 5033 WHERE `id` IN ( -- Darnassus
   426201  -- Darnassus Sentinel
);
UPDATE `creature_ai_events` SET `condition_id` = 5036 WHERE `id` IN ( -- Stormwind
     6803, -- Stormwind City Guard
    46602, -- General Marcus Jonathan
   142301, -- Stormwind Guard
   175603, -- Stormwind Royal Guard
   197601  -- Stormwind City Patroller
);
UPDATE `creature_ai_events` SET `condition_id` = 5041 WHERE `id` IN ( -- Thunder Bluff
   308401  -- Bluffwatcher
);
