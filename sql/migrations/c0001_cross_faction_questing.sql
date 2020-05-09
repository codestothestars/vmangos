-- Remove faction condition for creatures that drop items that start quests
UPDATE `creature_loot_template` SET `condition_id` = 0 WHERE `item` IN (
   2874, -- Unsent Letter
  10000  -- Margol's Horn
);

-- Change team-allied NPC factions to city-based versions so players can toggle At War.
UPDATE `creature_template` SET `Faction` =  11 WHERE `Entry` = 7865;        -- Wildhammer Sentry from Alliance Generic to Stormwind
UPDATE `creature_template` SET `Faction` =  11 WHERE `Faction` IN (53, 56); -- Night Watch to Stormwind
UPDATE `creature_template` SET `Faction` =  11 WHERE `Faction` IN (150, 1096);                       -- Theramore (hostile to creatures) to Stormwind
UPDATE `creature_template` SET `Faction` =  12 WHERE `Faction` IN (151, 371, 894, 1075, 1077, 1622); -- Theramore (neutral to creatures) to Stormwind
UPDATE `creature_template` SET `Faction` =  12 WHERE `Entry` =  467;            -- Defias Traitor from Escortee to Stormwind
UPDATE `creature_template` SET `Faction` =  12 WHERE `Entry` = 1156;            -- Vyrin Swiftwind from Alliance Generic to Stormwind
UPDATE `creature_template` SET `Faction` =  23 WHERE `Entry` =  417;            -- Felhunter from PLAYER, Gnome to Gnomeregan Exiles
UPDATE `creature_template` SET `Faction` =  29 WHERE `Entry` IN (10182, 10204); -- Rexxar, Misha from Horde Generic to Orgrimmar
UPDATE `creature_template` SET `Faction` = 104 WHERE `Entry` = 2987;            -- Eyahn Eagletalon from Horde Generic to Thunder Bluff
UPDATE `creature_template` SET `Faction` = 123 WHERE `Faction` = 88;            -- Hillsbrad Militia to Stormwind
UPDATE `creature_template` SET `Faction` = 123 WHERE `Entry` = 14275;           -- Tamra Stormpike to Stormwind
UPDATE `creature_template` SET `Faction` = 250 WHERE `Entry` = 8284;            -- Dorius Stonetender from Escortee (Alliance) to Escortee (Neutral)

-- Remove faction condition for objects that contain items that start quests
UPDATE `gameobject_loot_template` SET `condition_id` = 0 WHERE `entry` = 3214; -- Henrig Lonebrow's Journal

-- Change team-allied object factions to Friendly
UPDATE `gameobject_template` SET `faction` = 35 WHERE `entry` IN (
       269, -- Guarded Thunder Ale Barrel
       270, -- Unguarded Thunder Ale Barrel
      2868, -- Crumpled Map
      2875, -- Battered Dwarven Skeleton
    152095, -- Moonpetal Lily
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
