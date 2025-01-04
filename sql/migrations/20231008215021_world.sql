DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20231008215021');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20231008215021');
-- Add your query below.

-- Add to max condition parameters.
ALTER TABLE `conditions` ADD `value5` INT NOT NULL DEFAULT '0' COMMENT 'data field five for the condition' AFTER `value4`;

--  240: No player alive within 150 yards.
--  Test whether it works when standing in corners.
INSERT `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `flags`) VALUES ( 240, 56,          0,  150, 0, 0x1);
--  241: Black Dragon Egg within 100 yards.
INSERT `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `flags`) VALUES ( 241, 21,     177807,  100, 0, 0x0);
--  242: No Black Dragon Egg within 100 yards.
--  Test whether it works when standing in corners.
INSERT `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `flags`) VALUES ( 242, 21,     177807,  100, 0, 0x1);
--  540: Has aura Possess.
INSERT `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `flags`) VALUES ( 540,  1,      23014,    0, 0, 0x2);
--  541: Last waypoint equals 0.
INSERT `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `flags`) VALUES ( 541, 32,          0,    0, 0, 0x0);
--  542: Last waypoint equals 1.
INSERT `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `flags`) VALUES ( 542, 32,          1,    0, 0, 0x0);
--  543: Last waypoint equals 2.
INSERT `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `flags`) VALUES ( 543, 32,          2,    0, 0, 0x0);
--  544: Last waypoint equals 3.
INSERT `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `flags`) VALUES ( 544, 32,          3,    0, 0, 0x0);
--  545: Last waypoint equals 4.
INSERT `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `flags`) VALUES ( 545, 32,          4,    0, 0, 0x0);
--  546: Last waypoint equals 5.
INSERT `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `flags`) VALUES ( 546, 32,          5,    0, 0, 0x0);
--  547: Last waypoint equals 6.
INSERT `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `flags`) VALUES ( 547, 32,          6,    0, 0, 0x0);
--  548: (541: Last waypoint equals 0) Or (547: Last waypoint equals 6).
INSERT `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `flags`) VALUES ( 548, -2,        541,  547, 0, 0x0);
--  549: Instance data 0 (Razorgore) equals 0 (not started).
INSERT `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `flags`) VALUES ( 549, 34,          0,    0, 0, 0x0);
--  550: Nearby Razorgore within 90 yards
INSERT `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `flags`) VALUES ( 550, 20,      12435,   90, 0, 0x0);
--  551: No nearby Razorgore within 90 yards
INSERT `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `flags`) VALUES ( 551, 20,      12435,   90, 0, 0x1);
--  552: Nearby Razorgore within 70 yards
INSERT `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `flags`) VALUES ( 552, 20,      12435,   70, 0, 0x0);
--  553: No nearby Razorgore within 70 yards
INSERT `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `flags`) VALUES ( 553, 20,      12435,   70, 0, 0x1);
--  554: Nearby Razorgore within 50 yards
INSERT `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `flags`) VALUES ( 554, 20,      12435,   50, 0, 0x0);
--  555: No nearby Razorgore within 50 yards
INSERT `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `flags`) VALUES ( 555, 20,      12435,   50, 0, 0x1);
--  556: Hostile unit within 10 yards
INSERT `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `flags`) VALUES ( 556, 59,         10,    0, 0, 0x0);
--  557: Instance data 26 equal or higher than 0
INSERT `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `flags`) VALUES ( 557, 34,         26,    0, 1, 0x0);
--  558: Instance data 26 equal or less than 24
INSERT `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `flags`) VALUES ( 558, 34,         26,   24, 2, 0x0);
--  559: Instance data 26 equal or higher than 25
INSERT `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `flags`) VALUES ( 559, 34,         26,   25, 1, 0x0);
--  560: Instance data 27 equal to 1
INSERT `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `flags`) VALUES ( 560, 34,         27,    1, 0, 0x0);
--  561: (557: Instance data 26 equal or higher than 0) And (558: Instance data 26 equal or less than 24)
INSERT `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `flags`) VALUES ( 561, -1,        557,  558, 0, 0x0);
--  562: Does not have unit state CONFUSED | POSSESSED | STUNNED
INSERT `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `flags`) VALUES ( 562, 60, 0x00000248,    0, 0, 0x1);
-- 8302: Map event 8302 (Razorgore) is active
INSERT `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `flags`) VALUES (8302, 36,       8302,    0, 0, 0x0);
-- 8303: (242: No Black Dragon Egg within 100 yards.) And (8302: Map event 8302 (Razorgore) is active)
INSERT `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `flags`) VALUES (8303, -1,        242, 8302, 0, 0x0);
-- 8304: (562: Does not have unit state CONFUSED | POSSESSED | STUNNED) And (8303: (242: No Black Dragon Egg within 100 yards.) And (8302: Map event 8302 (Razorgore) is active))
INSERT `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `flags`) VALUES (8303, -1,        562, 8303, 0, 0x0);
-- 8305: (557: Instance data 26 equal or higher than 0) And (8302: Map event 8302 (Razorgore) is active)
INSERT `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `flags`) VALUES (8305, -1,        557, 8302, 0, 0x0);
-- 8306: (561: (557: Instance data 26 equal or higher than 0) And (558: Instance data 26 equal or less than 24)) And (8302: Map event 8302 (Razorgore) is active)
INSERT `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `flags`) VALUES (8306, -1,        561, 8302, 0, 0x0);

-- Correct Portcullis values.
-- There's also a gameobject_addon for this object with these rotation values negated. Make sure it actually looks right.
UPDATE `gameobject` SET `orientation` = 3.75246, `rotation2` = -0.953716, `rotation3` = 0.300708 WHERE `id` = 176964;
-- Existing vmangos flags are 0x04, meaning cannot interact. Make sure this change doesn't cause incorrect behavior.
UPDATE `gameobject_template` SET `faction` = 114, `flags` = 0x20 WHERE `entry` = 176964;

-- Correct Blackwing Guardsman positions.
UPDATE `creature` SET `position_x` = -7619.66, `position_y` = -1025.14, `position_z` = 413.465, `orientation` = 3.68265  WHERE `guid` = 84390;
UPDATE `creature` SET `position_x` = -7615.01, `position_y` = -1021.55, `position_z` = 413.465, `orientation` = 0.610865 WHERE `guid` = 84391;

-- Add missing Blackwing Orb Trigger spawn.
INSERT INTO `creature`
(`guid`,  `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecsmin`, `spawntimesecsmax`, `wander_distance`, `health_percent`, `mana_percent`) VALUES
(   113, 14449,   469,     -7615.51,     -1025.58,      413.465,       5.23599,             604800,             604800,                 0,              100,            100);

-- Daribon pointed out creature 14459 (Nefarian's Troops) which emotes during the fight.
-- This appears to happen when the last egg is destroyed.
-- Also at this point the adds stop spawning.

-- Note that the player-cast Possess spell 19832 starts event 8302,
-- which presumably should govern the rest of the fight.
-- It also hits two targets - Razorgore and the casting player.

-- Double check this, but in at least one sniff Grethok and his guards aggro at the exact same time.
-- Does this mean they're in a linked group that we need to create?

-- Notice in sniff_36035_bwl_stopped_before_dragons when the group wipes,
-- all creatures appear to leave combat and run back to their spawn locations.
-- Did Razorgore become unattackable?

-- Creature entry 14453 (Orb of Domination) had script_name trigger_orb_of_command. What's this creature's function?
-- On wipe, do the creatures respawn or simply run back?
-- Need to set the encounter status to SPECIAL (4) on event start.
-- What is DATA_EGG used for in the existing razorgore script?

-- Don't forget to check threat stuff from sniffs, for when creatures spawn, Razorgore becomes mind controlled/freed, etc.

-- Random spells seen
--  6660
-- 14443
-- 14515
-- 14897
-- 15580
-- 15663
-- 15754
-- 16806
-- 17290
-- 19632
-- 19872
-- 19873
-- 20037
-- 20038
-- 21389
-- 22271
-- 22272
-- 22273
-- 22313
-- 22425
-- 22458
-- 23014
-- 23023
-- 23024
-- 23967
-- 24375
-- 25139

-- Random creature seen
-- 16604 - Blackwing Spell Marker
-- * Located in the four corners, close to each corner of the daises, the dead center of the room,
--   behind Razorgore, and behind Grethok.
-- * Casts 20038 (Explosion), the spell that kills everyone to wipe.
--   This creature apparently is a valid hit target for 20038, but every cast I've seen misses.
-- * Gets hit at some point by spell 20037 (Explode Orb Effect), cast by Blackwing Orb Trigger.
-- On vmangos has UNIT_FLAG_PVP, but not in sniff, so remove that flag.
-- Gains UNIT_FLAG_IN_COMBAT for about 8 seconds per sniff. What's going on at this time?

-- Creatures stop spawning once the last egg is destroyed.
-- Each location always has the same initial delay from the event start, either 45 or 75 seconds.
-- Notice that in sniff_35000_bwl_full_run the initial times are lower by 6 seconds or so.
-- Every location then repeats spawns, most every 15 seconds,
-- but each fourth, fifth, or sixth (random) will be 30 seconds.
-- Any pair of creatures can spawn. The current script prevents two Deathtalon Dragonspawns,
-- but there's an example of that in sniff_33302_bwl_first_boss_try_wipe.
-- The adjacent location pairs are not tied to each other, contrary to what the current script does,
-- which you can tell comparing the timings between sniff_33302_bwl_first_boss_try_wipe and
-- sniff_33302_bwl_first_second_boss_and_ony. On some 15-second intervals neither location spawns a creature,
-- and the timestamps are not identical between the pairs.
-- Comparing all eight locations' timings reveals that there are no synchronized pairs.
-- They're not always spawned with the same orientation.
-- Different orientations appear to correspond to different initial movement paths.
-- While there are at least 25 creatures alive, each location has a 75% chance to not spawn every 2nd 15-second interval.
-- (test this on the Cataclysm PTR)

-- Remove C++ script from Black Dragon Egg.
UPDATE `gameobject_template` SET `script_name` = '' WHERE `entry` = 177807;

-- Remove C++ script from Orb of Domination.
UPDATE `gameobject_template` SET `script_name` = '' WHERE `entry` = 177808;

-- Event Start Script
DELETE FROM `scripted_event_id` WHERE `id` = 8302;
DELETE FROM `event_scripts` WHERE `id` = 8302;
-- Make sure to test that casting Possess subsequent times doesn't start additional instances of the scripts.
INSERT `event_scripts`
(`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_type`, `target_param1`, `target_param2`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `condition_id`, `comments`) VALUES
-- Removed condition 240.
-- sniff_36035_bwl_stopped_before_dragons makes it look like the event fails (and the gate opens) when Razorgore casts the fireball that triggers the explosion.
(8302,       0,        61,       8302,        1200,           0,           0,             0,               0,               0,            0,         0,     830201,          0,     830202,              0, 'Razorgore Event - Start Map Event'),
(8302,      75,        39,    8302045,           0,           0,           0,             0,               0,               0,            0,       100,          0,          0,          0,           8302, 'Razorgore Event - Start Spawning Adds (North)'),
(8302,      75,        39,    8302057,           0,           0,           0,             0,               0,               0,            0,       100,          0,          0,          0,           8302, 'Razorgore Event - Start Spawning Adds (East)'),
(8302,      45,        39,    8302069,           0,           0,           0,             0,               0,               0,            0,       100,          0,          0,          0,           8302, 'Razorgore Event - Start Spawning Adds (East South)'),
(8302,      45,        39,    8302081,           0,           0,           0,             0,               0,               0,            0,       100,          0,          0,          0,           8302, 'Razorgore Event - Start Spawning Adds (South East)'),
(8302,      75,        39,    8302093,           0,           0,           0,             0,               0,               0,            0,       100,          0,          0,          0,           8302, 'Razorgore Event - Start Spawning Adds (South)'),
(8302,      75,        39,    8302105,           0,           0,           0,             0,               0,               0,            0,       100,          0,          0,          0,           8302, 'Razorgore Event - Start Spawning Adds (West)'),
(8302,      45,        39,    8302117,           0,           0,           0,             0,               0,               0,            0,       100,          0,          0,          0,           8302, 'Razorgore Event - Start Spawning Adds (West North)'),
(8302,      45,        39,    8302129,           0,           0,           0,             0,               0,               0,            0,       100,          0,          0,          0,           8302, 'Razorgore Event - Start Spawning Adds (North West)');

-- Success Script for Scripted Map Event
INSERT `generic_scripts`
(  `id`, `delay`, `command`, `datalong`, `datalong2`, `dataint`, `comments`) VALUES
(830201,       4,        39,     176964,           0,       100, 'Razorgore Event - Open Portcullis (entrance)'),
(830201,       4,        39,     176965,           0,       100, 'Razorgore Event - Open Portcullis (exit)');

-- Fail Script for Scripted Map Event
INSERT `generic_scripts`
(  `id`, `command`, `datalong`, `comments`) VALUES
(830202,        39,     176964, 'Razorgore Event - Open Portcullis');

-- Spawning Adds
INSERT `generic_scripts`
(  `id` , `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_type`, `target_param1`, `target_param2`, `data_flags`, `dataint`, `dataint2`, `dataint3`,    `x`  ,    `y`   ,  `z`   , `o`, `condition_id`, `comments`) VALUES
(8302003,       0,         3,          2,           0,       0x000,         0x0,             8,           12435,             150,         0x00,         0,          0,          0,     5   ,     0    ,   0    ,  0 ,              0, 'Razorgore Event Spawning Adds - Move to Razorgore'),
(8302004,       0,        39,    8302003,           0,           0,           0,             0,               0,               0,         0x00,       100,          0,          0,     0   ,     0    ,   0    ,  0 ,            550, 'Razorgore Event Spawning Adds - Initial Movement (North) - Move to Razorgore'),
(8302004,       0,        60,          3,           1,           0,           0,             0,               0,               0,         0x00,         0,     830204,          0,     0   ,     0    ,   0    ,  0 ,            551, 'Razorgore Event Spawning Adds - Initial Movement (North) - Move to Altar'),
(8302005,       0,        39,    8302003,           0,           0,           0,             0,               0,               0,         0x00,       100,          0,          0,     0   ,     0    ,   0    ,  0 ,            550, 'Razorgore Event Spawning Adds - Initial Movement (East) - Move to Razorgore'),
(8302005,       0,        60,          3,           1,           0,           0,             0,               0,               0,         0x00,         0,     830205,          0,     0   ,     0    ,   0    ,  0 ,            551, 'Razorgore Event Spawning Adds - Initial Movement (East) - Move to Altar'),
(8302006,       0,        39,    8302003,           0,           0,           0,             0,               0,               0,         0x00,       100,          0,          0,     0   ,     0    ,   0    ,  0 ,            552, 'Razorgore Event Spawning Adds - Initial Movement (East South) - Move to Razorgore'),
(8302006,       0,        60,          3,           1,           0,           0,             0,               0,               0,         0x00,         0,     830206,          0,     0   ,     0    ,   0    ,  0 ,            553, 'Razorgore Event Spawning Adds - Initial Movement (East South) - Move to Altar'),
(8302007,       0,        39,    8302003,           0,           0,           0,             0,               0,               0,         0x00,       100,          0,          0,     0   ,     0    ,   0    ,  0 ,            554, 'Razorgore Event Spawning Adds - Initial Movement (South East) - Move to Razorgore'),
(8302007,       0,        60,          3,           1,           0,           0,             0,               0,               0,         0x00,         0,     830207,          0,     0   ,     0    ,   0    ,  0 ,            555, 'Razorgore Event Spawning Adds - Initial Movement (South East) - Move to Altar'),
(8302008,       0,        39,    8302003,           0,           0,           0,             0,               0,               0,         0x00,       100,          0,          0,     0   ,     0    ,   0    ,  0 ,            554, 'Razorgore Event Spawning Adds - Initial Movement (South) - Move to Razorgore'),
(8302008,       0,        60,          3,           1,           0,           0,             0,               0,               0,         0x00,         0,     830208,          0,     0   ,     0    ,   0    ,  0 ,            555, 'Razorgore Event Spawning Adds - Initial Movement (South) - Move to Altar'),
(8302009,       0,        39,    8302003,           0,           0,           0,             0,               0,               0,         0x00,       100,          0,          0,     0   ,     0    ,   0    ,  0 ,            554, 'Razorgore Event Spawning Adds - Initial Movement (West) - Move to Razorgore'),
(8302009,       0,        60,          3,           1,           0,           0,             0,               0,               0,         0x00,         0,     830209,          0,     0   ,     0    ,   0    ,  0 ,            555, 'Razorgore Event Spawning Adds - Initial Movement (West) - Move to Altar'),
(8302010,       0,        39,    8302003,           0,           0,           0,             0,               0,               0,         0x00,       100,          0,          0,     0   ,     0    ,   0    ,  0 ,            554, 'Razorgore Event Spawning Adds - Initial Movement (West North) - Move to Razorgore'),
(8302010,       0,        60,          3,           1,           0,           0,             0,               0,               0,         0x00,         0,     830210,          0,     0   ,     0    ,   0    ,  0 ,            555, 'Razorgore Event Spawning Adds - Initial Movement (West North) - Move to Altar'),
(8302011,       0,        39,    8302003,           0,           0,           0,             0,               0,               0,         0x00,       100,          0,          0,     0   ,     0    ,   0    ,  0 ,            552, 'Razorgore Event Spawning Adds - Initial Movement (North West) - Move to Razorgore'),
(8302011,       0,        60,          3,           1,           0,           0,             0,               0,               0,         0x00,         0,     830211,          0,     0   ,     0    ,   0    ,  0 ,            553, 'Razorgore Event Spawning Adds - Initial Movement (North West) - Move to Altar'),
(8302012,       0,        10,      12416,           0,           0,           0,             0,               0,               0,         0x00,      0x00,    8302004,          0, -7659.81, -1043.81 , 407.366,  0 ,              0, 'Razorgore Event Spawning Adds - Summon Blackwing Legionnaire - North'),
(8302013,       0,        10,      12416,           0,           0,           0,             0,               0,               0,         0x00,      0x00,    8302005,          0, -7607.78, -1116.17 , 407.366,  0 ,              0, 'Razorgore Event Spawning Adds - Summon Blackwing Legionnaire - East'),
(8302014,       0,        10,      12416,           0,           0,           0,             0,               0,               0,         0x00,      0x00,    8302006,          0, -7623.1 , -1094.06 , 407.371,  0 ,              0, 'Razorgore Event Spawning Adds - Summon Blackwing Legionnaire - East South'),
(8302015,       0,        10,      12416,           0,           0,           0,             0,               0,               0,         0x00,      0x00,    8302007,          0, -7643.39, -1064.69 , 407.371,  0 ,              0, 'Razorgore Event Spawning Adds - Summon Blackwing Legionnaire - South East'),
(8302016,       0,        10,      12416,           0,           0,           0,             0,               0,               0,         0x00,      0x00,    8302008,          0, -7532.72, -1063.49 , 407.366,  0 ,              0, 'Razorgore Event Spawning Adds - Summon Blackwing Legionnaire - South'),
(8302017,       0,        10,      12416,           0,           0,           0,             0,               0,               0,         0x00,      0x00,    8302009,          0, -7583.08, - 990.483, 407.366,  0 ,              0, 'Razorgore Event Spawning Adds - Summon Blackwing Legionnaire - West'),
(8302018,       0,        10,      12416,           0,           0,           0,             0,               0,               0,         0x00,      0x00,    8302010,          0, -7568.61, -1012.67 , 407.371,  0 ,              0, 'Razorgore Event Spawning Adds - Summon Blackwing Legionnaire - West North'),
(8302019,       0,        10,      12416,           0,           0,           0,             0,               0,               0,         0x00,      0x00,    8302011,          0, -7548.46, -1041.98 , 407.371,  0 ,              0, 'Razorgore Event Spawning Adds - Summon Blackwing Legionnaire - North West'),
(8302020,       0,        10,      12420,           0,           0,           0,             0,               0,               0,         0x00,      0x00,    8302004,          0, -7659.81, -1043.81 , 407.366,  0 ,              0, 'Razorgore Event Spawning Adds - Summon Blackwing Mage - North'),
(8302021,       0,        10,      12420,           0,           0,           0,             0,               0,               0,         0x00,      0x00,    8302005,          0, -7607.78, -1116.17 , 407.366,  0 ,              0, 'Razorgore Event Spawning Adds - Summon Blackwing Mage - East'),
(8302022,       0,        10,      12420,           0,           0,           0,             0,               0,               0,         0x00,      0x00,    8302006,          0, -7623.1 , -1094.06 , 407.371,  0 ,              0, 'Razorgore Event Spawning Adds - Summon Blackwing Mage - East South'),
(8302023,       0,        10,      12420,           0,           0,           0,             0,               0,               0,         0x00,      0x00,    8302007,          0, -7643.39, -1064.69 , 407.371,  0 ,              0, 'Razorgore Event Spawning Adds - Summon Blackwing Mage - South East'),
(8302024,       0,        10,      12420,           0,           0,           0,             0,               0,               0,         0x00,      0x00,    8302008,          0, -7532.72, -1063.49 , 407.366,  0 ,              0, 'Razorgore Event Spawning Adds - Summon Blackwing Mage - South'),
(8302025,       0,        10,      12420,           0,           0,           0,             0,               0,               0,         0x00,      0x00,    8302009,          0, -7583.08, - 990.483, 407.366,  0 ,              0, 'Razorgore Event Spawning Adds - Summon Blackwing Mage - West'),
(8302026,       0,        10,      12420,           0,           0,           0,             0,               0,               0,         0x00,      0x00,    8302010,          0, -7568.61, -1012.67 , 407.371,  0 ,              0, 'Razorgore Event Spawning Adds - Summon Blackwing Mage - West North'),
(8302027,       0,        10,      12420,           0,           0,           0,             0,               0,               0,         0x00,      0x00,    8302011,          0, -7548.46, -1041.98 , 407.371,  0 ,              0, 'Razorgore Event Spawning Adds - Summon Blackwing Mage - North West'),
(8302028,       0,        10,      12422,           0,           0,           0,             0,               0,               0,         0x00,      0x00,    8302004,          0, -7659.81, -1043.81 , 407.366,  0 ,              0, 'Razorgore Event Spawning Adds - Summon Death Talon Dragonspawn - North'),
(8302029,       0,        10,      12422,           0,           0,           0,             0,               0,               0,         0x00,      0x00,    8302005,          0, -7607.78, -1116.17 , 407.366,  0 ,              0, 'Razorgore Event Spawning Adds - Summon Death Talon Dragonspawn - East'),
(8302030,       0,        10,      12422,           0,           0,           0,             0,               0,               0,         0x00,      0x00,    8302006,          0, -7623.1 , -1094.06 , 407.371,  0 ,              0, 'Razorgore Event Spawning Adds - Summon Death Talon Dragonspawn - East South'),
(8302031,       0,        10,      12422,           0,           0,           0,             0,               0,               0,         0x00,      0x00,    8302007,          0, -7643.39, -1064.69 , 407.371,  0 ,              0, 'Razorgore Event Spawning Adds - Summon Death Talon Dragonspawn - South East'),
(8302032,       0,        10,      12422,           0,           0,           0,             0,               0,               0,         0x00,      0x00,    8302008,          0, -7532.72, -1063.49 , 407.366,  0 ,              0, 'Razorgore Event Spawning Adds - Summon Death Talon Dragonspawn - South'),
(8302033,       0,        10,      12422,           0,           0,           0,             0,               0,               0,         0x00,      0x00,    8302009,          0, -7583.08, - 990.483, 407.366,  0 ,              0, 'Razorgore Event Spawning Adds - Summon Death Talon Dragonspawn - West'),
(8302034,       0,        10,      12422,           0,           0,           0,             0,               0,               0,         0x00,      0x00,    8302010,          0, -7568.61, -1012.67 , 407.371,  0 ,              0, 'Razorgore Event Spawning Adds - Summon Death Talon Dragonspawn - West North'),
(8302035,       0,        10,      12422,           0,           0,           0,             0,               0,               0,         0x00,      0x00,    8302011,          0, -7548.46, -1041.98 , 407.371,  0 ,              0, 'Razorgore Event Spawning Adds - Summon Death Talon Dragonspawn - North West'),
(8302036,       0,        37,         26,           1,           1,           0,             0,               0,               0,         0x00,         0,          0,          0,     0   ,     0    ,   0    ,  0 ,              0, 'Razorgore Event Spawning Adds - Increment Creature Count'),
(8302037,       0,        39,    8302012,     8302020,     8302028,           0,             0,               0,               0,         0x00,        39,         39,         22,     0   ,     0    ,   0    ,  0 ,              0, 'Razorgore Event Spawning Adds - Summon Creature - North'),
(8302037,       0,        39,    8302036,           0,           0,           0,             0,               0,               0,         0x00,       100,          0,          0,     0   ,     0    ,   0    ,  0 ,              0, 'Razorgore Event Spawning Adds - Increment Creature Count - North'),
(8302038,       0,        39,    8302013,     8302021,     8302029,           0,             0,               0,               0,         0x00,        39,         39,         22,     0   ,     0    ,   0    ,  0 ,              0, 'Razorgore Event Spawning Adds - Summon Creature - East'),
(8302038,       0,        39,    8302036,           0,           0,           0,             0,               0,               0,         0x00,       100,          0,          0,     0   ,     0    ,   0    ,  0 ,              0, 'Razorgore Event Spawning Adds - Increment Creature Count - East'),
(8302039,       0,        39,    8302014,     8302022,     8302030,           0,             0,               0,               0,         0x00,        39,         39,         22,     0   ,     0    ,   0    ,  0 ,              0, 'Razorgore Event Spawning Adds - Summon Creature - East South'),
(8302039,       0,        39,    8302036,           0,           0,           0,             0,               0,               0,         0x00,       100,          0,          0,     0   ,     0    ,   0    ,  0 ,              0, 'Razorgore Event Spawning Adds - Increment Creature Count - East South'),
(8302040,       0,        39,    8302015,     8302023,     8302031,           0,             0,               0,               0,         0x00,        39,         39,         22,     0   ,     0    ,   0    ,  0 ,              0, 'Razorgore Event Spawning Adds - Summon Creature - South East'),
(8302040,       0,        39,    8302036,           0,           0,           0,             0,               0,               0,         0x00,       100,          0,          0,     0   ,     0    ,   0    ,  0 ,              0, 'Razorgore Event Spawning Adds - Increment Creature Count - South East'),
(8302041,       0,        39,    8302016,     8302024,     8302032,           0,             0,               0,               0,         0x00,        39,         39,         22,     0   ,     0    ,   0    ,  0 ,              0, 'Razorgore Event Spawning Adds - Summon Creature - South'),
(8302041,       0,        39,    8302036,           0,           0,           0,             0,               0,               0,         0x00,       100,          0,          0,     0   ,     0    ,   0    ,  0 ,              0, 'Razorgore Event Spawning Adds - Increment Creature Count - South'),
(8302042,       0,        39,    8302017,     8302025,     8302033,           0,             0,               0,               0,         0x00,        39,         39,         22,     0   ,     0    ,   0    ,  0 ,              0, 'Razorgore Event Spawning Adds - Summon Creature - West'),
(8302042,       0,        39,    8302036,           0,           0,           0,             0,               0,               0,         0x00,       100,          0,          0,     0   ,     0    ,   0    ,  0 ,              0, 'Razorgore Event Spawning Adds - Increment Creature Count - West'),
(8302043,       0,        39,    8302018,     8302026,     8302034,           0,             0,               0,               0,         0x00,        39,         39,         22,     0   ,     0    ,   0    ,  0 ,              0, 'Razorgore Event Spawning Adds - Summon Creature - West North'),
(8302043,       0,        39,    8302036,           0,           0,           0,             0,               0,               0,         0x00,       100,          0,          0,     0   ,     0    ,   0    ,  0 ,              0, 'Razorgore Event Spawning Adds - Increment Creature Count - West North'),
(8302044,       0,        39,    8302019,     8302027,     8302035,           0,             0,               0,               0,         0x00,        39,         39,         22,     0   ,     0    ,   0    ,  0 ,              0, 'Razorgore Event Spawning Adds - Summon Creature - North West'),
(8302044,       0,        39,    8302036,           0,           0,           0,             0,               0,               0,         0x00,       100,          0,          0,     0   ,     0    ,   0    ,  0 ,              0, 'Razorgore Event Spawning Adds - Increment Creature Count - North West'),
(8302045,       0,        39,    8302037,           0,           0,           0,             0,               0,               0,         0x00,       100,          0,          0,     0   ,     0    ,   0    ,  0 ,              0, 'Razorgore Event Spawning Adds - Summon Creature - North 1 - Summon'),
(8302045,      15,        39,    8302046,           0,           0,           0,             0,               0,               0,         0x00,       100,          0,          0,     0   ,     0    ,   0    ,  0 ,           8305, 'Razorgore Event Spawning Adds - Summon Creature - North 1 - Summon Next'),
(8302046,       0,        39,    8302037,           0,           0,           0,             0,               0,               0,         0x00,       100,          0,          0,     0   ,     0    ,   0    ,  0 ,            561, 'Razorgore Event Spawning Adds - Summon Creature - North 2 (fewer than 25 alive) - Summon'),
(8302046,      15,        39,    8302049,           0,           0,           0,             0,               0,               0,         0x00,       100,          0,          0,     0   ,     0    ,   0    ,  0 ,           8306, 'Razorgore Event Spawning Adds - Summon Creature - North 2 (fewer than 25 alive) - Summon Next'),
(8302046,       0,        39,    8302047,     8302048,           0,           0,             0,               0,               0,         0x00,        75,         25,          0,     0   ,     0    ,   0    ,  0 ,            559, 'Razorgore Event Spawning Adds - Summon Creature - North 2 (25 or more alive) - Summon Delayed or Immediately'),
(8302047,      15,        39,    8302037,           0,           0,           0,             0,               0,               0,         0x00,       100,          0,          0,     0   ,     0    ,   0    ,  0 ,           8305, 'Razorgore Event Spawning Adds - Summon Creature - North 2 (25 or more alive) - Summon Delayed'),
(8302047,      30,        39,    8302045,           0,           0,           0,             0,               0,               0,         0x00,       100,          0,          0,     0   ,     0    ,   0    ,  0 ,           8305, 'Razorgore Event Spawning Adds - Summon Creature - North 2 (25 or more alive) - Summon First'),
(8302048,       0,        39,    8302037,           0,           0,           0,             0,               0,               0,         0x00,       100,          0,          0,     0   ,     0    ,   0    ,  0 ,              0, 'Razorgore Event Spawning Adds - Summon Creature - North 2 (25 or more alive) - Summon Immediately'),
(8302048,      15,        39,    8302049,           0,           0,           0,             0,               0,               0,         0x00,       100,          0,          0,     0   ,     0    ,   0    ,  0 ,           8305, 'Razorgore Event Spawning Adds - Summon Creature - North 2 (25 or more alive) - Summon Next'),
(8302049,       0,        39,    8302037,           0,           0,           0,             0,               0,               0,         0x00,       100,          0,          0,     0   ,     0    ,   0    ,  0 ,              0, 'Razorgore Event Spawning Adds - Summon Creature - North 3 - Summon'),
(8302049,      15,        39,    8302050,           0,           0,           0,             0,               0,               0,         0x00,       100,          0,          0,     0   ,     0    ,   0    ,  0 ,           8305, 'Razorgore Event Spawning Adds - Summon Creature - North 3 - Summon Next'),
(8302050,       0,        39,    8302051,     8302052,           0,           0,             0,               0,               0,         0x00,        44,         56,          0,     0   ,     0    ,   0    ,  0 ,              0, 'Razorgore Event Spawning Adds - Summon Creature - North 4 - Summon Delayed or Immediately'),
(8302051,      15,        39,    8302037,           0,           0,           0,             0,               0,               0,         0x00,       100,          0,          0,     0   ,     0    ,   0    ,  0 ,           8305, 'Razorgore Event Spawning Adds - Summon Creature - North 4 - Summon Delayed'),
(8302051,      30,        39,    8302045,           0,           0,           0,             0,               0,               0,         0x00,       100,          0,          0,     0   ,     0    ,   0    ,  0 ,           8305, 'Razorgore Event Spawning Adds - Summon Creature - North 4 - Summon First'),
(8302052,       0,        39,    8302037,           0,           0,           0,             0,               0,               0,         0x00,       100,          0,          0,     0   ,     0    ,   0    ,  0 ,              0, 'Razorgore Event Spawning Adds - Summon Creature - North 4 - Summon Immediately'),
(8302052,      15,        39,    8302053,           0,           0,           0,             0,               0,               0,         0x00,       100,          0,          0,     0   ,     0    ,   0    ,  0 ,           8305, 'Razorgore Event Spawning Adds - Summon Creature - North 4 - Summon Next'),
(8302053,       0,        39,    8302054,     8302055,           0,           0,             0,               0,               0,         0x00,        79,         21,          0,     0   ,     0    ,   0    ,  0 ,              0, 'Razorgore Event Spawning Adds - Summon Creature - North 5 - Summon Delayed or Immediately'),
(8302054,      15,        39,    8302037,           0,           0,           0,             0,               0,               0,         0x00,       100,          0,          0,     0   ,     0    ,   0    ,  0 ,           8305, 'Razorgore Event Spawning Adds - Summon Creature - North 5 - Summon Delayed'),
(8302054,      30,        39,    8302045,           0,           0,           0,             0,               0,               0,         0x00,       100,          0,          0,     0   ,     0    ,   0    ,  0 ,           8305, 'Razorgore Event Spawning Adds - Summon Creature - North 5 - Summon First'),
(8302055,       0,        39,    8302037,           0,           0,           0,             0,               0,               0,         0x00,       100,          0,          0,     0   ,     0    ,   0    ,  0 ,              0, 'Razorgore Event Spawning Adds - Summon Creature - North 5 - Summon Immediately'),
(8302055,      15,        39,    8302056,           0,           0,           0,             0,               0,               0,         0x00,       100,          0,          0,     0   ,     0    ,   0    ,  0 ,           8305, 'Razorgore Event Spawning Adds - Summon Creature - North 5 - Summon Next'),
(8302056,      15,        39,    8302037,           0,           0,           0,             0,               0,               0,         0x00,       100,          0,          0,     0   ,     0    ,   0    ,  0 ,           8305, 'Razorgore Event Spawning Adds - Summon Creature - North 6 - Summon Delayed'),
(8302056,      30,        39,    8302045,           0,           0,           0,             0,               0,               0,         0x00,       100,          0,          0,     0   ,     0    ,   0    ,  0 ,           8305, 'Razorgore Event Spawning Adds - Summon Creature - North 6 - Summon First'),
(8302057,       0,        39,    8302038,           0,           0,           0,             0,               0,               0,         0x00,       100,          0,          0,     0   ,     0    ,   0    ,  0 ,              0, 'Razorgore Event Spawning Adds - Summon Creature - East 1 - Summon'),
(8302057,      15,        39,    8302058,           0,           0,           0,             0,               0,               0,         0x00,       100,          0,          0,     0   ,     0    ,   0    ,  0 ,           8305, 'Razorgore Event Spawning Adds - Summon Creature - East 1 - Summon Next'),
(8302058,       0,        39,    8302038,           0,           0,           0,             0,               0,               0,         0x00,       100,          0,          0,     0   ,     0    ,   0    ,  0 ,            561, 'Razorgore Event Spawning Adds - Summon Creature - East 2 (fewer than 25 alive) - Summon'),
(8302058,      15,        39,    8302061,           0,           0,           0,             0,               0,               0,         0x00,       100,          0,          0,     0   ,     0    ,   0    ,  0 ,           8306, 'Razorgore Event Spawning Adds - Summon Creature - East 2 (fewer than 25 alive) - Summon Next'),
(8302058,       0,        39,    8302059,     8302060,           0,           0,             0,               0,               0,         0x00,        75,         25,          0,     0   ,     0    ,   0    ,  0 ,            559, 'Razorgore Event Spawning Adds - Summon Creature - East 2 (25 or more alive) - Summon Delayed or Immediately'),
(8302059,      15,        39,    8302038,           0,           0,           0,             0,               0,               0,         0x00,       100,          0,          0,     0   ,     0    ,   0    ,  0 ,           8305, 'Razorgore Event Spawning Adds - Summon Creature - East 2 (25 or more alive) - Summon Delayed'),
(8302059,      30,        39,    8302057,           0,           0,           0,             0,               0,               0,         0x00,       100,          0,          0,     0   ,     0    ,   0    ,  0 ,           8305, 'Razorgore Event Spawning Adds - Summon Creature - East 2 (25 or more alive) - Summon First'),
(8302060,       0,        39,    8302038,           0,           0,           0,             0,               0,               0,         0x00,       100,          0,          0,     0   ,     0    ,   0    ,  0 ,              0, 'Razorgore Event Spawning Adds - Summon Creature - East 2 (25 or more alive) - Summon Immediately'),
(8302060,      15,        39,    8302061,           0,           0,           0,             0,               0,               0,         0x00,       100,          0,          0,     0   ,     0    ,   0    ,  0 ,           8305, 'Razorgore Event Spawning Adds - Summon Creature - East 2 (25 or more alive) - Summon Next'),
(8302061,       0,        39,    8302038,           0,           0,           0,             0,               0,               0,         0x00,       100,          0,          0,     0   ,     0    ,   0    ,  0 ,              0, 'Razorgore Event Spawning Adds - Summon Creature - East 3 - Summon'),
(8302061,      15,        39,    8302062,           0,           0,           0,             0,               0,               0,         0x00,       100,          0,          0,     0   ,     0    ,   0    ,  0 ,           8305, 'Razorgore Event Spawning Adds - Summon Creature - East 3 - Summon Next'),
(8302062,       0,        39,    8302063,     8302064,           0,           0,             0,               0,               0,         0x00,        44,         56,          0,     0   ,     0    ,   0    ,  0 ,              0, 'Razorgore Event Spawning Adds - Summon Creature - East 4 - Summon Delayed or Immediately'),
(8302063,      15,        39,    8302038,           0,           0,           0,             0,               0,               0,         0x00,       100,          0,          0,     0   ,     0    ,   0    ,  0 ,           8305, 'Razorgore Event Spawning Adds - Summon Creature - East 4 - Summon Delayed'),
(8302063,      30,        39,    8302057,           0,           0,           0,             0,               0,               0,         0x00,       100,          0,          0,     0   ,     0    ,   0    ,  0 ,           8305, 'Razorgore Event Spawning Adds - Summon Creature - East 4 - Summon First'),
(8302064,       0,        39,    8302038,           0,           0,           0,             0,               0,               0,         0x00,       100,          0,          0,     0   ,     0    ,   0    ,  0 ,              0, 'Razorgore Event Spawning Adds - Summon Creature - East 4 - Summon Immediately'),
(8302064,      15,        39,    8302065,           0,           0,           0,             0,               0,               0,         0x00,       100,          0,          0,     0   ,     0    ,   0    ,  0 ,           8305, 'Razorgore Event Spawning Adds - Summon Creature - East 4 - Summon Next'),
(8302065,       0,        39,    8302066,     8302067,           0,           0,             0,               0,               0,         0x00,        79,         21,          0,     0   ,     0    ,   0    ,  0 ,              0, 'Razorgore Event Spawning Adds - Summon Creature - East 5 - Summon Delayed or Immediately'),
(8302066,      15,        39,    8302038,           0,           0,           0,             0,               0,               0,         0x00,       100,          0,          0,     0   ,     0    ,   0    ,  0 ,           8305, 'Razorgore Event Spawning Adds - Summon Creature - East 5 - Summon Delayed'),
(8302066,      30,        39,    8302057,           0,           0,           0,             0,               0,               0,         0x00,       100,          0,          0,     0   ,     0    ,   0    ,  0 ,           8305, 'Razorgore Event Spawning Adds - Summon Creature - East 5 - Summon First'),
(8302067,       0,        39,    8302038,           0,           0,           0,             0,               0,               0,         0x00,       100,          0,          0,     0   ,     0    ,   0    ,  0 ,              0, 'Razorgore Event Spawning Adds - Summon Creature - East 5 - Summon Immediately'),
(8302067,      15,        39,    8302068,           0,           0,           0,             0,               0,               0,         0x00,       100,          0,          0,     0   ,     0    ,   0    ,  0 ,           8305, 'Razorgore Event Spawning Adds - Summon Creature - East 5 - Summon Next'),
(8302068,      15,        39,    8302038,           0,           0,           0,             0,               0,               0,         0x00,       100,          0,          0,     0   ,     0    ,   0    ,  0 ,           8305, 'Razorgore Event Spawning Adds - Summon Creature - East 6 - Summon Delayed'),
(8302068,      30,        39,    8302057,           0,           0,           0,             0,               0,               0,         0x00,       100,          0,          0,     0   ,     0    ,   0    ,  0 ,           8305, 'Razorgore Event Spawning Adds - Summon Creature - East 6 - Summon First'),
(8302069,       0,        39,    8302039,           0,           0,           0,             0,               0,               0,         0x00,       100,          0,          0,     0   ,     0    ,   0    ,  0 ,              0, 'Razorgore Event Spawning Adds - Summon Creature - East South 1 - Summon'),
(8302069,      15,        39,    8302070,           0,           0,           0,             0,               0,               0,         0x00,       100,          0,          0,     0   ,     0    ,   0    ,  0 ,           8305, 'Razorgore Event Spawning Adds - Summon Creature - East South 1 - Summon Next'),
(8302070,       0,        39,    8302039,           0,           0,           0,             0,               0,               0,         0x00,       100,          0,          0,     0   ,     0    ,   0    ,  0 ,            561, 'Razorgore Event Spawning Adds - Summon Creature - East South 2 (fewer than 25 alive) - Summon'),
(8302070,      15,        39,    8302073,           0,           0,           0,             0,               0,               0,         0x00,       100,          0,          0,     0   ,     0    ,   0    ,  0 ,           8306, 'Razorgore Event Spawning Adds - Summon Creature - East South 2 (fewer than 25 alive) - Summon Next'),
(8302070,       0,        39,    8302071,     8302072,           0,           0,             0,               0,               0,         0x00,        75,         25,          0,     0   ,     0    ,   0    ,  0 ,            559, 'Razorgore Event Spawning Adds - Summon Creature - East South 2 (25 or more alive) - Summon Delayed or Immediately'),
(8302071,      15,        39,    8302039,           0,           0,           0,             0,               0,               0,         0x00,       100,          0,          0,     0   ,     0    ,   0    ,  0 ,           8305, 'Razorgore Event Spawning Adds - Summon Creature - East South 2 (25 or more alive) - Summon Delayed'),
(8302071,      30,        39,    8302069,           0,           0,           0,             0,               0,               0,         0x00,       100,          0,          0,     0   ,     0    ,   0    ,  0 ,           8305, 'Razorgore Event Spawning Adds - Summon Creature - East South 2 (25 or more alive) - Summon First'),
(8302072,       0,        39,    8302039,           0,           0,           0,             0,               0,               0,         0x00,       100,          0,          0,     0   ,     0    ,   0    ,  0 ,              0, 'Razorgore Event Spawning Adds - Summon Creature - East South 2 (25 or more alive) - Summon Immediately'),
(8302072,      15,        39,    8302073,           0,           0,           0,             0,               0,               0,         0x00,       100,          0,          0,     0   ,     0    ,   0    ,  0 ,           8305, 'Razorgore Event Spawning Adds - Summon Creature - East South 2 (25 or more alive) - Summon Next'),
(8302073,       0,        39,    8302039,           0,           0,           0,             0,               0,               0,         0x00,       100,          0,          0,     0   ,     0    ,   0    ,  0 ,              0, 'Razorgore Event Spawning Adds - Summon Creature - East South 3 - Summon'),
(8302073,      15,        39,    8302074,           0,           0,           0,             0,               0,               0,         0x00,       100,          0,          0,     0   ,     0    ,   0    ,  0 ,           8305, 'Razorgore Event Spawning Adds - Summon Creature - East South 3 - Summon Next'),
(8302074,       0,        39,    8302075,     8302076,           0,           0,             0,               0,               0,         0x00,        44,         56,          0,     0   ,     0    ,   0    ,  0 ,              0, 'Razorgore Event Spawning Adds - Summon Creature - East South 4 - Summon Delayed or Immediately'),
(8302075,      15,        39,    8302039,           0,           0,           0,             0,               0,               0,         0x00,       100,          0,          0,     0   ,     0    ,   0    ,  0 ,           8305, 'Razorgore Event Spawning Adds - Summon Creature - East South 4 - Summon Delayed'),
(8302075,      30,        39,    8302069,           0,           0,           0,             0,               0,               0,         0x00,       100,          0,          0,     0   ,     0    ,   0    ,  0 ,           8305, 'Razorgore Event Spawning Adds - Summon Creature - East South 4 - Summon First'),
(8302076,       0,        39,    8302039,           0,           0,           0,             0,               0,               0,         0x00,       100,          0,          0,     0   ,     0    ,   0    ,  0 ,              0, 'Razorgore Event Spawning Adds - Summon Creature - East South 4 - Summon Immediately'),
(8302076,      15,        39,    8302077,           0,           0,           0,             0,               0,               0,         0x00,       100,          0,          0,     0   ,     0    ,   0    ,  0 ,           8305, 'Razorgore Event Spawning Adds - Summon Creature - East South 4 - Summon Next'),
(8302077,       0,        39,    8302078,     8302079,           0,           0,             0,               0,               0,         0x00,        79,         21,          0,     0   ,     0    ,   0    ,  0 ,              0, 'Razorgore Event Spawning Adds - Summon Creature - East South 5 - Summon Delayed or Immediately'),
(8302078,      15,        39,    8302039,           0,           0,           0,             0,               0,               0,         0x00,       100,          0,          0,     0   ,     0    ,   0    ,  0 ,           8305, 'Razorgore Event Spawning Adds - Summon Creature - East South 5 - Summon Delayed'),
(8302078,      30,        39,    8302069,           0,           0,           0,             0,               0,               0,         0x00,       100,          0,          0,     0   ,     0    ,   0    ,  0 ,           8305, 'Razorgore Event Spawning Adds - Summon Creature - East South 5 - Summon First'),
(8302079,       0,        39,    8302039,           0,           0,           0,             0,               0,               0,         0x00,       100,          0,          0,     0   ,     0    ,   0    ,  0 ,              0, 'Razorgore Event Spawning Adds - Summon Creature - East South 5 - Summon Immediately'),
(8302079,      15,        39,    8302080,           0,           0,           0,             0,               0,               0,         0x00,       100,          0,          0,     0   ,     0    ,   0    ,  0 ,           8305, 'Razorgore Event Spawning Adds - Summon Creature - East South 5 - Summon Next'),
(8302080,      15,        39,    8302039,           0,           0,           0,             0,               0,               0,         0x00,       100,          0,          0,     0   ,     0    ,   0    ,  0 ,           8305, 'Razorgore Event Spawning Adds - Summon Creature - East South 6 - Summon Delayed'),
(8302080,      30,        39,    8302069,           0,           0,           0,             0,               0,               0,         0x00,       100,          0,          0,     0   ,     0    ,   0    ,  0 ,           8305, 'Razorgore Event Spawning Adds - Summon Creature - East South 6 - Summon First'),
(8302081,       0,        39,    8302040,           0,           0,           0,             0,               0,               0,         0x00,       100,          0,          0,     0   ,     0    ,   0    ,  0 ,              0, 'Razorgore Event Spawning Adds - Summon Creature - South East 1 - Summon'),
(8302081,      15,        39,    8302082,           0,           0,           0,             0,               0,               0,         0x00,       100,          0,          0,     0   ,     0    ,   0    ,  0 ,           8305, 'Razorgore Event Spawning Adds - Summon Creature - South East 1 - Summon Next'),
(8302082,       0,        39,    8302040,           0,           0,           0,             0,               0,               0,         0x00,       100,          0,          0,     0   ,     0    ,   0    ,  0 ,            561, 'Razorgore Event Spawning Adds - Summon Creature - South East 2 (fewer than 25 alive) - Summon'),
(8302082,      15,        39,    8302085,           0,           0,           0,             0,               0,               0,         0x00,       100,          0,          0,     0   ,     0    ,   0    ,  0 ,           8306, 'Razorgore Event Spawning Adds - Summon Creature - South East 2 (fewer than 25 alive) - Summon Next'),
(8302082,       0,        39,    8302083,     8302084,           0,           0,             0,               0,               0,         0x00,        75,         25,          0,     0   ,     0    ,   0    ,  0 ,            559, 'Razorgore Event Spawning Adds - Summon Creature - South East 2 (25 or more alive) - Summon Delayed or Immediately'),
(8302083,      15,        39,    8302040,           0,           0,           0,             0,               0,               0,         0x00,       100,          0,          0,     0   ,     0    ,   0    ,  0 ,           8305, 'Razorgore Event Spawning Adds - Summon Creature - South East 2 (25 or more alive) - Summon Delayed'),
(8302083,      30,        39,    8302081,           0,           0,           0,             0,               0,               0,         0x00,       100,          0,          0,     0   ,     0    ,   0    ,  0 ,           8305, 'Razorgore Event Spawning Adds - Summon Creature - South East 2 (25 or more alive) - Summon First'),
(8302084,       0,        39,    8302040,           0,           0,           0,             0,               0,               0,         0x00,       100,          0,          0,     0   ,     0    ,   0    ,  0 ,              0, 'Razorgore Event Spawning Adds - Summon Creature - South East 2 (25 or more alive) - Summon Immediately'),
(8302084,      15,        39,    8302085,           0,           0,           0,             0,               0,               0,         0x00,       100,          0,          0,     0   ,     0    ,   0    ,  0 ,           8305, 'Razorgore Event Spawning Adds - Summon Creature - South East 2 (25 or more alive) - Summon Next'),
(8302085,       0,        39,    8302040,           0,           0,           0,             0,               0,               0,         0x00,       100,          0,          0,     0   ,     0    ,   0    ,  0 ,              0, 'Razorgore Event Spawning Adds - Summon Creature - South East 3 - Summon'),
(8302085,      15,        39,    8302086,           0,           0,           0,             0,               0,               0,         0x00,       100,          0,          0,     0   ,     0    ,   0    ,  0 ,           8305, 'Razorgore Event Spawning Adds - Summon Creature - South East 3 - Summon Next'),
(8302086,       0,        39,    8302087,     8302088,           0,           0,             0,               0,               0,         0x00,        44,         56,          0,     0   ,     0    ,   0    ,  0 ,              0, 'Razorgore Event Spawning Adds - Summon Creature - South East 4 - Summon Delayed or Immediately'),
(8302087,      15,        39,    8302040,           0,           0,           0,             0,               0,               0,         0x00,       100,          0,          0,     0   ,     0    ,   0    ,  0 ,           8305, 'Razorgore Event Spawning Adds - Summon Creature - South East 4 - Summon Delayed'),
(8302087,      30,        39,    8302081,           0,           0,           0,             0,               0,               0,         0x00,       100,          0,          0,     0   ,     0    ,   0    ,  0 ,           8305, 'Razorgore Event Spawning Adds - Summon Creature - South East 4 - Summon First'),
(8302088,       0,        39,    8302040,           0,           0,           0,             0,               0,               0,         0x00,       100,          0,          0,     0   ,     0    ,   0    ,  0 ,              0, 'Razorgore Event Spawning Adds - Summon Creature - South East 4 - Summon Immediately'),
(8302088,      15,        39,    8302089,           0,           0,           0,             0,               0,               0,         0x00,       100,          0,          0,     0   ,     0    ,   0    ,  0 ,           8305, 'Razorgore Event Spawning Adds - Summon Creature - South East 4 - Summon Next'),
(8302089,       0,        39,    8302090,     8302091,           0,           0,             0,               0,               0,         0x00,        79,         21,          0,     0   ,     0    ,   0    ,  0 ,              0, 'Razorgore Event Spawning Adds - Summon Creature - South East 5 - Summon Delayed or Immediately'),
(8302090,      15,        39,    8302040,           0,           0,           0,             0,               0,               0,         0x00,       100,          0,          0,     0   ,     0    ,   0    ,  0 ,           8305, 'Razorgore Event Spawning Adds - Summon Creature - South East 5 - Summon Delayed'),
(8302090,      30,        39,    8302081,           0,           0,           0,             0,               0,               0,         0x00,       100,          0,          0,     0   ,     0    ,   0    ,  0 ,           8305, 'Razorgore Event Spawning Adds - Summon Creature - South East 5 - Summon First'),
(8302091,       0,        39,    8302040,           0,           0,           0,             0,               0,               0,         0x00,       100,          0,          0,     0   ,     0    ,   0    ,  0 ,              0, 'Razorgore Event Spawning Adds - Summon Creature - South East 5 - Summon Immediately'),
(8302091,      15,        39,    8302092,           0,           0,           0,             0,               0,               0,         0x00,       100,          0,          0,     0   ,     0    ,   0    ,  0 ,           8305, 'Razorgore Event Spawning Adds - Summon Creature - South East 5 - Summon Next'),
(8302092,      15,        39,    8302040,           0,           0,           0,             0,               0,               0,         0x00,       100,          0,          0,     0   ,     0    ,   0    ,  0 ,           8305, 'Razorgore Event Spawning Adds - Summon Creature - South East 6 - Summon Delayed'),
(8302092,      30,        39,    8302081,           0,           0,           0,             0,               0,               0,         0x00,       100,          0,          0,     0   ,     0    ,   0    ,  0 ,           8305, 'Razorgore Event Spawning Adds - Summon Creature - South East 6 - Summon First'),
(8302093,       0,        39,    8302041,           0,           0,           0,             0,               0,               0,         0x00,       100,          0,          0,     0   ,     0    ,   0    ,  0 ,              0, 'Razorgore Event Spawning Adds - Summon Creature - South 1 - Summon'),
(8302093,      15,        39,    8302094,           0,           0,           0,             0,               0,               0,         0x00,       100,          0,          0,     0   ,     0    ,   0    ,  0 ,           8305, 'Razorgore Event Spawning Adds - Summon Creature - South 1 - Summon Next'),
(8302094,       0,        39,    8302041,           0,           0,           0,             0,               0,               0,         0x00,       100,          0,          0,     0   ,     0    ,   0    ,  0 ,            561, 'Razorgore Event Spawning Adds - Summon Creature - South 2 (fewer than 25 alive) - Summon'),
(8302094,      15,        39,    8302097,           0,           0,           0,             0,               0,               0,         0x00,       100,          0,          0,     0   ,     0    ,   0    ,  0 ,           8306, 'Razorgore Event Spawning Adds - Summon Creature - South 2 (fewer than 25 alive) - Summon Next'),
(8302094,       0,        39,    8302095,     8302096,           0,           0,             0,               0,               0,         0x00,        75,         25,          0,     0   ,     0    ,   0    ,  0 ,            559, 'Razorgore Event Spawning Adds - Summon Creature - South 2 (25 or more alive) - Summon Delayed or Immediately'),
(8302095,      15,        39,    8302041,           0,           0,           0,             0,               0,               0,         0x00,       100,          0,          0,     0   ,     0    ,   0    ,  0 ,           8305, 'Razorgore Event Spawning Adds - Summon Creature - South 2 (25 or more alive) - Summon Delayed'),
(8302095,      30,        39,    8302093,           0,           0,           0,             0,               0,               0,         0x00,       100,          0,          0,     0   ,     0    ,   0    ,  0 ,           8305, 'Razorgore Event Spawning Adds - Summon Creature - South 2 (25 or more alive) - Summon First'),
(8302096,       0,        39,    8302041,           0,           0,           0,             0,               0,               0,         0x00,       100,          0,          0,     0   ,     0    ,   0    ,  0 ,              0, 'Razorgore Event Spawning Adds - Summon Creature - South 2 (25 or more alive) - Summon Immediately'),
(8302096,      15,        39,    8302097,           0,           0,           0,             0,               0,               0,         0x00,       100,          0,          0,     0   ,     0    ,   0    ,  0 ,           8305, 'Razorgore Event Spawning Adds - Summon Creature - South 2 (25 or more alive) - Summon Next'),
(8302097,       0,        39,    8302041,           0,           0,           0,             0,               0,               0,         0x00,       100,          0,          0,     0   ,     0    ,   0    ,  0 ,              0, 'Razorgore Event Spawning Adds - Summon Creature - South 3 - Summon'),
(8302097,      15,        39,    8302098,           0,           0,           0,             0,               0,               0,         0x00,       100,          0,          0,     0   ,     0    ,   0    ,  0 ,           8305, 'Razorgore Event Spawning Adds - Summon Creature - South 3 - Summon Next'),
(8302098,       0,        39,    8302099,     8302100,           0,           0,             0,               0,               0,         0x00,        44,         56,          0,     0   ,     0    ,   0    ,  0 ,              0, 'Razorgore Event Spawning Adds - Summon Creature - South 4 - Summon Delayed or Immediately'),
(8302099,      15,        39,    8302041,           0,           0,           0,             0,               0,               0,         0x00,       100,          0,          0,     0   ,     0    ,   0    ,  0 ,           8305, 'Razorgore Event Spawning Adds - Summon Creature - South 4 - Summon Delayed'),
(8302099,      30,        39,    8302093,           0,           0,           0,             0,               0,               0,         0x00,       100,          0,          0,     0   ,     0    ,   0    ,  0 ,           8305, 'Razorgore Event Spawning Adds - Summon Creature - South 4 - Summon First'),
(8302100,       0,        39,    8302041,           0,           0,           0,             0,               0,               0,         0x00,       100,          0,          0,     0   ,     0    ,   0    ,  0 ,              0, 'Razorgore Event Spawning Adds - Summon Creature - South 4 - Summon Immediately'),
(8302100,      15,        39,    8302101,           0,           0,           0,             0,               0,               0,         0x00,       100,          0,          0,     0   ,     0    ,   0    ,  0 ,           8305, 'Razorgore Event Spawning Adds - Summon Creature - South 4 - Summon Next'),
(8302101,       0,        39,    8302102,     8302103,           0,           0,             0,               0,               0,         0x00,        79,         21,          0,     0   ,     0    ,   0    ,  0 ,              0, 'Razorgore Event Spawning Adds - Summon Creature - South 5 - Summon Delayed or Immediately'),
(8302102,      15,        39,    8302041,           0,           0,           0,             0,               0,               0,         0x00,       100,          0,          0,     0   ,     0    ,   0    ,  0 ,           8305, 'Razorgore Event Spawning Adds - Summon Creature - South 5 - Summon Delayed'),
(8302102,      30,        39,    8302093,           0,           0,           0,             0,               0,               0,         0x00,       100,          0,          0,     0   ,     0    ,   0    ,  0 ,           8305, 'Razorgore Event Spawning Adds - Summon Creature - South 5 - Summon First'),
(8302103,       0,        39,    8302041,           0,           0,           0,             0,               0,               0,         0x00,       100,          0,          0,     0   ,     0    ,   0    ,  0 ,              0, 'Razorgore Event Spawning Adds - Summon Creature - South 5 - Summon Immediately'),
(8302103,      15,        39,    8302104,           0,           0,           0,             0,               0,               0,         0x00,       100,          0,          0,     0   ,     0    ,   0    ,  0 ,           8305, 'Razorgore Event Spawning Adds - Summon Creature - South 5 - Summon Next'),
(8302104,      15,        39,    8302041,           0,           0,           0,             0,               0,               0,         0x00,       100,          0,          0,     0   ,     0    ,   0    ,  0 ,           8305, 'Razorgore Event Spawning Adds - Summon Creature - South 6 - Summon Delayed'),
(8302104,      30,        39,    8302093,           0,           0,           0,             0,               0,               0,         0x00,       100,          0,          0,     0   ,     0    ,   0    ,  0 ,           8305, 'Razorgore Event Spawning Adds - Summon Creature - South 6 - Summon First'),
(8302105,       0,        39,    8302042,           0,           0,           0,             0,               0,               0,         0x00,       100,          0,          0,     0   ,     0    ,   0    ,  0 ,              0, 'Razorgore Event Spawning Adds - Summon Creature - West 1 - Summon'),
(8302105,      15,        39,    8302106,           0,           0,           0,             0,               0,               0,         0x00,       100,          0,          0,     0   ,     0    ,   0    ,  0 ,           8305, 'Razorgore Event Spawning Adds - Summon Creature - West 1 - Summon Next'),
(8302106,       0,        39,    8302042,           0,           0,           0,             0,               0,               0,         0x00,       100,          0,          0,     0   ,     0    ,   0    ,  0 ,            561, 'Razorgore Event Spawning Adds - Summon Creature - West 2 (fewer than 25 alive) - Summon'),
(8302106,      15,        39,    8302109,           0,           0,           0,             0,               0,               0,         0x00,       100,          0,          0,     0   ,     0    ,   0    ,  0 ,           8306, 'Razorgore Event Spawning Adds - Summon Creature - West 2 (fewer than 25 alive) - Summon Next'),
(8302106,       0,        39,    8302107,     8302108,           0,           0,             0,               0,               0,         0x00,        75,         25,          0,     0   ,     0    ,   0    ,  0 ,            559, 'Razorgore Event Spawning Adds - Summon Creature - West 2 (25 or more alive) - Summon Delayed or Immediately'),
(8302107,      15,        39,    8302042,           0,           0,           0,             0,               0,               0,         0x00,       100,          0,          0,     0   ,     0    ,   0    ,  0 ,           8305, 'Razorgore Event Spawning Adds - Summon Creature - West 2 (25 or more alive) - Summon Delayed'),
(8302107,      30,        39,    8302105,           0,           0,           0,             0,               0,               0,         0x00,       100,          0,          0,     0   ,     0    ,   0    ,  0 ,           8305, 'Razorgore Event Spawning Adds - Summon Creature - West 2 (25 or more alive) - Summon First'),
(8302108,       0,        39,    8302042,           0,           0,           0,             0,               0,               0,         0x00,       100,          0,          0,     0   ,     0    ,   0    ,  0 ,              0, 'Razorgore Event Spawning Adds - Summon Creature - West 2 (25 or more alive) - Summon Immediately'),
(8302108,      15,        39,    8302109,           0,           0,           0,             0,               0,               0,         0x00,       100,          0,          0,     0   ,     0    ,   0    ,  0 ,           8305, 'Razorgore Event Spawning Adds - Summon Creature - West 2 (25 or more alive) - Summon Next'),
(8302109,       0,        39,    8302042,           0,           0,           0,             0,               0,               0,         0x00,       100,          0,          0,     0   ,     0    ,   0    ,  0 ,              0, 'Razorgore Event Spawning Adds - Summon Creature - West 3 - Summon'),
(8302109,      15,        39,    8302110,           0,           0,           0,             0,               0,               0,         0x00,       100,          0,          0,     0   ,     0    ,   0    ,  0 ,           8305, 'Razorgore Event Spawning Adds - Summon Creature - West 3 - Summon Next'),
(8302110,       0,        39,    8302111,     8302112,           0,           0,             0,               0,               0,         0x00,        44,         56,          0,     0   ,     0    ,   0    ,  0 ,              0, 'Razorgore Event Spawning Adds - Summon Creature - West 4 - Summon Delayed or Immediately'),
(8302111,      15,        39,    8302042,           0,           0,           0,             0,               0,               0,         0x00,       100,          0,          0,     0   ,     0    ,   0    ,  0 ,           8305, 'Razorgore Event Spawning Adds - Summon Creature - West 4 - Summon Delayed'),
(8302111,      30,        39,    8302105,           0,           0,           0,             0,               0,               0,         0x00,       100,          0,          0,     0   ,     0    ,   0    ,  0 ,           8305, 'Razorgore Event Spawning Adds - Summon Creature - West 4 - Summon First'),
(8302112,       0,        39,    8302042,           0,           0,           0,             0,               0,               0,         0x00,       100,          0,          0,     0   ,     0    ,   0    ,  0 ,              0, 'Razorgore Event Spawning Adds - Summon Creature - West 4 - Summon Immediately'),
(8302112,      15,        39,    8302113,           0,           0,           0,             0,               0,               0,         0x00,       100,          0,          0,     0   ,     0    ,   0    ,  0 ,           8305, 'Razorgore Event Spawning Adds - Summon Creature - West 4 - Summon Next'),
(8302113,       0,        39,    8302114,     8302115,           0,           0,             0,               0,               0,         0x00,        79,         21,          0,     0   ,     0    ,   0    ,  0 ,              0, 'Razorgore Event Spawning Adds - Summon Creature - West 5 - Summon Delayed or Immediately'),
(8302114,      15,        39,    8302042,           0,           0,           0,             0,               0,               0,         0x00,       100,          0,          0,     0   ,     0    ,   0    ,  0 ,           8305, 'Razorgore Event Spawning Adds - Summon Creature - West 5 - Summon Delayed'),
(8302114,      30,        39,    8302105,           0,           0,           0,             0,               0,               0,         0x00,       100,          0,          0,     0   ,     0    ,   0    ,  0 ,           8305, 'Razorgore Event Spawning Adds - Summon Creature - West 5 - Summon First'),
(8302115,       0,        39,    8302042,           0,           0,           0,             0,               0,               0,         0x00,       100,          0,          0,     0   ,     0    ,   0    ,  0 ,              0, 'Razorgore Event Spawning Adds - Summon Creature - West 5 - Summon Immediately'),
(8302115,      15,        39,    8302116,           0,           0,           0,             0,               0,               0,         0x00,       100,          0,          0,     0   ,     0    ,   0    ,  0 ,           8305, 'Razorgore Event Spawning Adds - Summon Creature - West 5 - Summon Next'),
(8302116,      15,        39,    8302042,           0,           0,           0,             0,               0,               0,         0x00,       100,          0,          0,     0   ,     0    ,   0    ,  0 ,           8305, 'Razorgore Event Spawning Adds - Summon Creature - West 6 - Summon Delayed'),
(8302116,      30,        39,    8302105,           0,           0,           0,             0,               0,               0,         0x00,       100,          0,          0,     0   ,     0    ,   0    ,  0 ,           8305, 'Razorgore Event Spawning Adds - Summon Creature - West 6 - Summon First'),
(8302117,       0,        39,    8302043,           0,           0,           0,             0,               0,               0,         0x00,       100,          0,          0,     0   ,     0    ,   0    ,  0 ,              0, 'Razorgore Event Spawning Adds - Summon Creature - West North 1 - Summon'),
(8302117,      15,        39,    8302118,           0,           0,           0,             0,               0,               0,         0x00,       100,          0,          0,     0   ,     0    ,   0    ,  0 ,           8305, 'Razorgore Event Spawning Adds - Summon Creature - West North 1 - Summon Next'),
(8302118,       0,        39,    8302043,           0,           0,           0,             0,               0,               0,         0x00,       100,          0,          0,     0   ,     0    ,   0    ,  0 ,            561, 'Razorgore Event Spawning Adds - Summon Creature - West North 2 (fewer than 25 alive) - Summon'),
(8302118,      15,        39,    8302121,           0,           0,           0,             0,               0,               0,         0x00,       100,          0,          0,     0   ,     0    ,   0    ,  0 ,           8306, 'Razorgore Event Spawning Adds - Summon Creature - West North 2 (fewer than 25 alive) - Summon Next'),
(8302118,       0,        39,    8302119,     8302120,           0,           0,             0,               0,               0,         0x00,        75,         25,          0,     0   ,     0    ,   0    ,  0 ,            559, 'Razorgore Event Spawning Adds - Summon Creature - West North 2 (25 or more alive) - Summon Delayed or Immediately'),
(8302119,      15,        39,    8302043,           0,           0,           0,             0,               0,               0,         0x00,       100,          0,          0,     0   ,     0    ,   0    ,  0 ,           8305, 'Razorgore Event Spawning Adds - Summon Creature - West North 2 (25 or more alive) - Summon Delayed'),
(8302119,      30,        39,    8302117,           0,           0,           0,             0,               0,               0,         0x00,       100,          0,          0,     0   ,     0    ,   0    ,  0 ,           8305, 'Razorgore Event Spawning Adds - Summon Creature - West North 2 (25 or more alive) - Summon First'),
(8302120,       0,        39,    8302043,           0,           0,           0,             0,               0,               0,         0x00,       100,          0,          0,     0   ,     0    ,   0    ,  0 ,              0, 'Razorgore Event Spawning Adds - Summon Creature - West North 2 (25 or more alive) - Summon Immediately'),
(8302120,      15,        39,    8302121,           0,           0,           0,             0,               0,               0,         0x00,       100,          0,          0,     0   ,     0    ,   0    ,  0 ,           8305, 'Razorgore Event Spawning Adds - Summon Creature - West North 2 (25 or more alive) - Summon Next'),
(8302121,       0,        39,    8302043,           0,           0,           0,             0,               0,               0,         0x00,       100,          0,          0,     0   ,     0    ,   0    ,  0 ,              0, 'Razorgore Event Spawning Adds - Summon Creature - West North 3 - Summon'),
(8302121,      15,        39,    8302122,           0,           0,           0,             0,               0,               0,         0x00,       100,          0,          0,     0   ,     0    ,   0    ,  0 ,           8305, 'Razorgore Event Spawning Adds - Summon Creature - West North 3 - Summon Next'),
(8302122,       0,        39,    8302123,     8302124,           0,           0,             0,               0,               0,         0x00,        44,         56,          0,     0   ,     0    ,   0    ,  0 ,              0, 'Razorgore Event Spawning Adds - Summon Creature - West North 4 - Summon Delayed or Immediately'),
(8302123,      15,        39,    8302043,           0,           0,           0,             0,               0,               0,         0x00,       100,          0,          0,     0   ,     0    ,   0    ,  0 ,           8305, 'Razorgore Event Spawning Adds - Summon Creature - West North 4 - Summon Delayed'),
(8302123,      30,        39,    8302117,           0,           0,           0,             0,               0,               0,         0x00,       100,          0,          0,     0   ,     0    ,   0    ,  0 ,           8305, 'Razorgore Event Spawning Adds - Summon Creature - West North 4 - Summon First'),
(8302124,       0,        39,    8302043,           0,           0,           0,             0,               0,               0,         0x00,       100,          0,          0,     0   ,     0    ,   0    ,  0 ,              0, 'Razorgore Event Spawning Adds - Summon Creature - West North 4 - Summon Immediately'),
(8302124,      15,        39,    8302125,           0,           0,           0,             0,               0,               0,         0x00,       100,          0,          0,     0   ,     0    ,   0    ,  0 ,           8305, 'Razorgore Event Spawning Adds - Summon Creature - West North 4 - Summon Next'),
(8302125,       0,        39,    8302126,     8302127,           0,           0,             0,               0,               0,         0x00,        79,         21,          0,     0   ,     0    ,   0    ,  0 ,              0, 'Razorgore Event Spawning Adds - Summon Creature - West North 5 - Summon Delayed or Immediately'),
(8302126,      15,        39,    8302043,           0,           0,           0,             0,               0,               0,         0x00,       100,          0,          0,     0   ,     0    ,   0    ,  0 ,           8305, 'Razorgore Event Spawning Adds - Summon Creature - West North 5 - Summon Delayed'),
(8302126,      30,        39,    8302117,           0,           0,           0,             0,               0,               0,         0x00,       100,          0,          0,     0   ,     0    ,   0    ,  0 ,           8305, 'Razorgore Event Spawning Adds - Summon Creature - West North 5 - Summon First'),
(8302127,       0,        39,    8302043,           0,           0,           0,             0,               0,               0,         0x00,       100,          0,          0,     0   ,     0    ,   0    ,  0 ,              0, 'Razorgore Event Spawning Adds - Summon Creature - West North 5 - Summon Immediately'),
(8302127,      15,        39,    8302128,           0,           0,           0,             0,               0,               0,         0x00,       100,          0,          0,     0   ,     0    ,   0    ,  0 ,           8305, 'Razorgore Event Spawning Adds - Summon Creature - West North 5 - Summon Next'),
(8302128,      15,        39,    8302043,           0,           0,           0,             0,               0,               0,         0x00,       100,          0,          0,     0   ,     0    ,   0    ,  0 ,           8305, 'Razorgore Event Spawning Adds - Summon Creature - West North 6 - Summon Delayed'),
(8302128,      30,        39,    8302117,           0,           0,           0,             0,               0,               0,         0x00,       100,          0,          0,     0   ,     0    ,   0    ,  0 ,           8305, 'Razorgore Event Spawning Adds - Summon Creature - West North 6 - Summon First'),
(8302129,       0,        39,    8302044,           0,           0,           0,             0,               0,               0,         0x00,       100,          0,          0,     0   ,     0    ,   0    ,  0 ,              0, 'Razorgore Event Spawning Adds - Summon Creature - North West 1 - Summon'),
(8302129,      15,        39,    8302130,           0,           0,           0,             0,               0,               0,         0x00,       100,          0,          0,     0   ,     0    ,   0    ,  0 ,           8305, 'Razorgore Event Spawning Adds - Summon Creature - North West 1 - Summon Next'),
(8302130,       0,        39,    8302044,           0,           0,           0,             0,               0,               0,         0x00,       100,          0,          0,     0   ,     0    ,   0    ,  0 ,            561, 'Razorgore Event Spawning Adds - Summon Creature - North West 2 (fewer than 25 alive) - Summon'),
(8302130,      15,        39,    8302133,           0,           0,           0,             0,               0,               0,         0x00,       100,          0,          0,     0   ,     0    ,   0    ,  0 ,           8306, 'Razorgore Event Spawning Adds - Summon Creature - North West 2 (fewer than 25 alive) - Summon Next'),
(8302130,       0,        39,    8302131,     8302132,           0,           0,             0,               0,               0,         0x00,        75,         25,          0,     0   ,     0    ,   0    ,  0 ,            559, 'Razorgore Event Spawning Adds - Summon Creature - North West 2 (25 or more alive) - Summon Delayed or Immediately'),
(8302131,      15,        39,    8302044,           0,           0,           0,             0,               0,               0,         0x00,       100,          0,          0,     0   ,     0    ,   0    ,  0 ,           8305, 'Razorgore Event Spawning Adds - Summon Creature - North West 2 (25 or more alive) - Summon Delayed'),
(8302131,      30,        39,    8302129,           0,           0,           0,             0,               0,               0,         0x00,       100,          0,          0,     0   ,     0    ,   0    ,  0 ,           8305, 'Razorgore Event Spawning Adds - Summon Creature - North West 2 (25 or more alive) - Summon First'),
(8302132,       0,        39,    8302044,           0,           0,           0,             0,               0,               0,         0x00,       100,          0,          0,     0   ,     0    ,   0    ,  0 ,              0, 'Razorgore Event Spawning Adds - Summon Creature - North West 2 (25 or more alive) - Summon Immediately'),
(8302132,      15,        39,    8302133,           0,           0,           0,             0,               0,               0,         0x00,       100,          0,          0,     0   ,     0    ,   0    ,  0 ,           8305, 'Razorgore Event Spawning Adds - Summon Creature - North West 2 (25 or more alive) - Summon Next'),
(8302133,       0,        39,    8302044,           0,           0,           0,             0,               0,               0,         0x00,       100,          0,          0,     0   ,     0    ,   0    ,  0 ,              0, 'Razorgore Event Spawning Adds - Summon Creature - North West 3 - Summon'),
(8302133,      15,        39,    8302134,           0,           0,           0,             0,               0,               0,         0x00,       100,          0,          0,     0   ,     0    ,   0    ,  0 ,           8305, 'Razorgore Event Spawning Adds - Summon Creature - North West 3 - Summon Next'),
(8302134,       0,        39,    8302135,     8302136,           0,           0,             0,               0,               0,         0x00,        44,         56,          0,     0   ,     0    ,   0    ,  0 ,              0, 'Razorgore Event Spawning Adds - Summon Creature - North West 4 - Summon Delayed or Immediately'),
(8302135,      15,        39,    8302044,           0,           0,           0,             0,               0,               0,         0x00,       100,          0,          0,     0   ,     0    ,   0    ,  0 ,           8305, 'Razorgore Event Spawning Adds - Summon Creature - North West 4 - Summon Delayed'),
(8302135,      30,        39,    8302129,           0,           0,           0,             0,               0,               0,         0x00,       100,          0,          0,     0   ,     0    ,   0    ,  0 ,           8305, 'Razorgore Event Spawning Adds - Summon Creature - North West 4 - Summon First'),
(8302136,       0,        39,    8302044,           0,           0,           0,             0,               0,               0,         0x00,       100,          0,          0,     0   ,     0    ,   0    ,  0 ,              0, 'Razorgore Event Spawning Adds - Summon Creature - North West 4 - Summon Immediately'),
(8302136,      15,        39,    8302137,           0,           0,           0,             0,               0,               0,         0x00,       100,          0,          0,     0   ,     0    ,   0    ,  0 ,           8305, 'Razorgore Event Spawning Adds - Summon Creature - North West 4 - Summon Next'),
(8302137,       0,        39,    8302138,     8302139,           0,           0,             0,               0,               0,         0x00,        79,         21,          0,     0   ,     0    ,   0    ,  0 ,              0, 'Razorgore Event Spawning Adds - Summon Creature - North West 5 - Summon Delayed or Immediately'),
(8302138,      15,        39,    8302044,           0,           0,           0,             0,               0,               0,         0x00,       100,          0,          0,     0   ,     0    ,   0    ,  0 ,           8305, 'Razorgore Event Spawning Adds - Summon Creature - North West 5 - Summon Delayed'),
(8302138,      30,        39,    8302129,           0,           0,           0,             0,               0,               0,         0x00,       100,          0,          0,     0   ,     0    ,   0    ,  0 ,           8305, 'Razorgore Event Spawning Adds - Summon Creature - North West 5 - Summon First'),
(8302139,       0,        39,    8302044,           0,           0,           0,             0,               0,               0,         0x00,       100,          0,          0,     0   ,     0    ,   0    ,  0 ,              0, 'Razorgore Event Spawning Adds - Summon Creature - North West 5 - Summon Immediately'),
(8302139,      15,        39,    8302140,           0,           0,           0,             0,               0,               0,         0x00,       100,          0,          0,     0   ,     0    ,   0    ,  0 ,           8305, 'Razorgore Event Spawning Adds - Summon Creature - North West 5 - Summon Next'),
(8302140,      15,        39,    8302044,           0,           0,           0,             0,               0,               0,         0x00,       100,          0,          0,     0   ,     0    ,   0    ,  0 ,           8305, 'Razorgore Event Spawning Adds - Summon Creature - North West 6 - Summon Delayed'),
(8302140,      30,        39,    8302129,           0,           0,           0,             0,               0,               0,         0x00,       100,          0,          0,     0   ,     0    ,   0    ,  0 ,           8305, 'Razorgore Event Spawning Adds - Summon Creature - North West 6 - Summon First'),
(8302141,       0,        34,          0,           0,           0,           0,             0,               0,               0,         0x00,         0,          0,          0, -7556.65, -1025.56 , 408.56 ,  0 ,              0, 'Razorgore Event - Nefarian''s Troops - Set Home Position'),
(8302141,       0,        59,          0,           0,           0,           0,             0,               0,               0,         0x00,         0,          0,          0,     0   ,     0    ,   0    ,  0 ,              0, 'Razorgore Event - Nefarian''s Troops - Set React State'),
(8302141,       0,        67,          7,           0,           0,           0,             0,               0,               0,         0x00,         0,          0,          0,     0   ,     0    ,   0    ,  0 ,              0, 'Razorgore Event - Nefarian''s Troops - Set Default Movement');

-- Waypoints for Blackwing Legionnaire, Blackwing Mage, Deathtalon Dragonspawn (North)
INSERT INTO `creature_movement_special`
(  `id`, `point`, `position_x`, `position_y`, `position_z`) VALUES
(830204,       1,     -7529.6 ,     -1064.9 ,      407.344),
(830204,       2,     -7532.72,     -1063.49,      407.344),
(830204,       3,     -7535.84,     -1062.08,      407.344),
(830204,       4,     -7535.88,     -1058.81,      408.544),
(830204,       5,     -7537.27,     -1057.84,      408.544),
(830204,       6,     -7537.77,     -1057.49,      408.89 ),
(830204,       7,     -7538.47,     -1057.0 ,      408.944),
(830204,       8,     -7538.71,     -1056.76,      408.928),
(830204,       9,     -7538.93,     -1056.53,      408.594),
(830204,      10,     -7539.1 ,     -1056.36,      408.827),
(830204,      11,     -7539.5 ,     -1055.96,      408.878),
(830204,      12,     -7540.25,     -1055.21,      408.544),
(830204,      13,     -7542.52,     -1052.92,      408.544),
(830204,      14,     -7543.63,     -1051.81,      408.737),
(830204,      15,     -7545.17,     -1050.26,      408.463),
(830204,      16,     -7547.29,     -1048.12,      408.544),
(830204,      17,     -7549.06,     -1045.76,      407.363),
(830204,      18,     -7549.5 ,     -1045.63,      407.344),
(830204,      19,     -7552.87,     -1041.4 ,      407.55 ),
(830204,      20,     -7553.88,     -1038.97,      408.544),
(830204,      21,     -7555.07,     -1038.37,      408.544),
(830204,      22,     -7556.37,     -1038.11,      408.544),
(830204,      23,     -7558.44,     -1037.69,      408.544),
(830204,      24,     -7567.79,     -1020.52,      408.544),
(830204,      25,     -7566.17,     -1020.1 ,      408.632),
(830204,      26,     -7568.07,     -1019.6 ,      408.544),
(830204,      27,     -7569.46,     -1016.56,      407.366),
(830204,      28,     -7570.25,     -1016.72,      407.355),
(830204,      29,     -7570.69,     -1016.38,      407.326),
(830204,      30,     -7573.85,     -1017.09,      408.417),
(830204,      31,     -7574.8 ,     -1017.3 ,      408.544),
(830204,      32,     -7604.73,     -1021.47,      408.544),
(830204,      33,     -7603.67,     -1019.7 ,      408.544),
(830204,      34,     -7603.27,     -1019.54,      408.602),
(830204,      35,     -7603.47,     -1019.0 ,      409.544),
(830204,      36,     -7602.97,     -1017.2 ,      410.153),
(830204,      37,     -7602.79,     -1016.4 ,      408.544),
(830204,      38,     -7601.23,     -1013.94,      408.544),
(830204,      39,     -7601.13,     -1013.13,      409.809),
(830204,      40,     -7602.47,     -1013.8 ,      410.354),
(830204,      41,     -7603.47,     -1013.8 ,      410.742),
(830204,      42,     -7603.87,     -1014.0 ,      410.805),
(830204,      43,     -7604.3 ,     -1014.37,      410.928),
(830204,      44,     -7604.87,     -1014.8 ,      411.354),
(830204,      45,     -7605.47,     -1015.2 ,      411.586),
(830204,      46,     -7605.87,     -1015.4 ,      411.67 ),
(830204,      47,     -7606.33,     -1015.74,      411.914),
(830204,      48,     -7606.87,     -1016.2 ,      412.17 ),
(830204,      49,     -7607.47,     -1016.6 ,      412.555),
(830204,      50,     -7607.87,     -1016.8 ,      412.743),
(830204,      51,     -7608.33,     -1017.14,      412.876),
(830204,      52,     -7608.45,     -1017.3 ,      413.038),
(830204,      53,     -7608.87,     -1018.2 ,      413.339),
(830204,      54,     -7608.87,     -1018.74,      413.744),
(830204,      55,     -7608.87,     -1019.27,      413.544),
(830204,      56,     -7609.47,     -1020.0 ,      414.145),
(830204,      57,     -7609.87,     -1020.2 ,      413.544),
(830204,      58,     -7610.74,     -1021.22,      413.544),
(830204,      59,     -7611.79,     -1022.45,      413.597),
(830204,      60,     -7611.79,     -1022.45,      413.597);

-- Waypoints for Blackwing Legionnaire, Blackwing Mage, Deathtalon Dragonspawn (East)
INSERT INTO `creature_movement_special`
(  `id`, `point`, `position_x`, `position_y`, `position_z`) VALUES
(830205,       1,     -7609.09,     -1120.46,      407.366),
(830205,       2,     -7607.78,     -1116.17,      407.366),
(830205,       3,     -7606.47,     -1111.87,      407.366),
(830205,       4,     -7603.08,     -1110.11,      408.558),
(830205,       5,     -7603.62,     -1106.28,      408.566),
(830205,       6,     -7603.75,     -1105.43,      408.632),
(830205,       7,     -7605.52,     -1092.97,      408.566),
(830205,       8,     -7605.6 ,     -1092.45,      408.898),
(830205,       9,     -7605.63,     -1092.19,      408.875),
(830205,      10,     -7605.73,     -1091.56,      408.599),
(830205,      11,     -7605.83,     -1090.81,      408.902),
(830205,      12,     -7605.89,     -1090.4 ,      408.566),
(830205,      13,     -7607.59,     -1078.51,      408.566),
(830205,      14,     -7611.84,     -1066.67,      408.566),
(830205,      15,     -7613.62,     -1044.22,      408.358),
(830205,      16,     -7623.45,     -1036.61,      408.519),
(830205,      17,     -7622.62,     -1034.71,      408.645),
(830205,      18,     -7623.77,     -1035.4 ,      408.744),
(830205,      19,     -7624.27,     -1035.6 ,      408.944),
(830205,      20,     -7625.17,     -1036.5 ,      408.944),
(830205,      21,     -7626.26,     -1037.29,      408.744),
(830205,      22,     -7631.69,     -1040.7 ,      408.666),
(830205,      23,     -7632.47,     -1040.4 ,      409.144),
(830205,      24,     -7633.07,     -1039.9 ,      409.144),
(830205,      25,     -7633.67,     -1035.6 ,      408.518),
(830205,      26,     -7633.47,     -1035.2 ,      409.345),
(830205,      27,     -7632.87,     -1034.4 ,      409.794),
(830205,      28,     -7632.27,     -1034.0 ,      409.933),
(830205,      29,     -7631.87,     -1033.6 ,      410.144),
(830205,      30,     -7631.47,     -1033.4 ,      410.315),
(830205,      31,     -7630.87,     -1033.0 ,      410.534),
(830205,      32,     -7630.26,     -1032.6 ,      410.884),
(830205,      33,     -7629.87,     -1032.2 ,      411.144),
(830205,      34,     -7629.47,     -1032.0 ,      411.174),
(830205,      35,     -7628.87,     -1031.6 ,      411.483),
(830205,      36,     -7628.27,     -1031.2 ,      411.816),
(830205,      37,     -7627.87,     -1030.8 ,      411.944),
(830205,      38,     -7627.47,     -1030.61,      412.142),
(830205,      39,     -7626.87,     -1030.2 ,      412.329),
(830205,      40,     -7626.37,     -1029.7 ,      412.605),
(830205,      41,     -7626.08,     -1029.09,      412.62 ),
(830205,      42,     -7625.84,     -1029.03,      412.84 ),
(830205,      43,     -7625.6 ,     -1028.63,      412.806),
(830205,      44,     -7625.24,     -1028.55,      413.119),
(830205,      45,     -7624.88,     -1028.83,      413.329),
(830205,      46,     -7624.39,     -1028.7 ,      413.513),
(830205,      47,     -7623.36,     -1028.43,      413.659),
(830205,      48,     -7623.14,     -1028.37,      413.83 ),
(830205,      49,     -7622.43,     -1028.19,      413.544),
(830205,      50,     -7619.88,     -1027.51,      413.628),
(830205,      51,     -7619.88,     -1027.51,      413.628);

-- Waypoints for Blackwing Legionnaire, Blackwing Mage, Deathtalon Dragonspawn (East South)
INSERT INTO `creature_movement_special`
(  `id`, `point`, `position_x`, `position_y`, `position_z`) VALUES
(830206,       1,     -7622.58,     -1096.7 ,      407.366),
(830206,       2,     -7623.1 ,     -1094.06,      407.366),
(830206,       3,     -7623.61,     -1091.42,      407.366),
(830206,       4,     -7623.77,     -1090.6 ,      407.629),
(830206,       5,     -7624.29,     -1087.88,      408.578),
(830206,       6,     -7624.22,     -1086.91,      408.566),
(830206,       7,     -7630.34,     -1066.67,      408.566),
(830206,       8,     -7631.52,     -1062.77,      408.522),
(830206,       9,     -7635.23,     -1050.53,      408.578),
(830206,      10,     -7635.3 ,     -1050.3 ,      408.638),
(830206,      11,     -7635.37,     -1050.06,      408.545),
(830206,      12,     -7635.76,     -1048.79,      408.544),
(830206,      13,     -7637.27,     -1043.8 ,      408.544),
(830206,      14,     -7634.85,     -1040.78,      408.544),
(830206,      15,     -7633.87,     -1040.06,      409.222),
(830206,      16,     -7633.65,     -1039.91,      408.998),
(830206,      17,     -7633.4 ,     -1039.72,      408.978),
(830206,      18,     -7633.13,     -1039.52,      409.09 ),
(830206,      19,     -7633.67,     -1035.6 ,      408.518),
(830206,      20,     -7633.47,     -1035.2 ,      409.345),
(830206,      21,     -7632.87,     -1034.4 ,      409.794),
(830206,      22,     -7632.27,     -1034.0 ,      409.933),
(830206,      23,     -7631.87,     -1033.6 ,      410.144),
(830206,      24,     -7631.47,     -1033.4 ,      410.315),
(830206,      25,     -7630.87,     -1033.0 ,      410.534),
(830206,      26,     -7630.26,     -1032.6 ,      410.884),
(830206,      27,     -7629.87,     -1032.2 ,      411.144),
(830206,      28,     -7629.47,     -1032.0 ,      411.174),
(830206,      29,     -7628.87,     -1031.6 ,      411.483),
(830206,      30,     -7628.27,     -1031.2 ,      411.816),
(830206,      31,     -7627.87,     -1030.8 ,      411.944),
(830206,      32,     -7627.47,     -1030.61,      412.142),
(830206,      33,     -7626.87,     -1030.2 ,      412.329),
(830206,      34,     -7626.37,     -1029.7 ,      412.605),
(830206,      35,     -7626.08,     -1029.09,      412.62 ),
(830206,      36,     -7625.84,     -1029.03,      412.84 ),
(830206,      37,     -7625.6 ,     -1028.63,      412.806),
(830206,      38,     -7625.24,     -1028.55,      413.119),
(830206,      39,     -7624.88,     -1028.83,      413.329),
(830206,      40,     -7624.39,     -1028.7 ,      413.513),
(830206,      41,     -7623.36,     -1028.43,      413.659),
(830206,      42,     -7623.14,     -1028.37,      413.83 ),
(830206,      43,     -7622.43,     -1028.19,      413.544),
(830206,      44,     -7619.88,     -1027.51,      413.628),
(830206,      45,     -7619.88,     -1027.51,      413.628);

-- Waypoints for Blackwing Legionnaire, Blackwing Mage, Deathtalon Dragonspawn (South East)
INSERT INTO `creature_movement_special`
(  `id`, `point`, `position_x`, `position_y`, `position_z`) VALUES
(830207,       1,     -7643.12,     -1067.25,      407.344),
(830207,       2,     -7643.39,     -1064.69,      407.344),
(830207,       3,     -7643.67,     -1062.13,      407.344),
(830207,       4,     -7643.71,     -1061.71,      407.454),
(830207,       5,     -7643.78,     -1061.06,      407.723),
(830207,       6,     -7644.07,     -1058.4 ,      408.544),
(830207,       7,     -7644.41,     -1057.54,      408.544),
(830207,       8,     -7637.27,     -1043.8 ,      408.544),
(830207,       9,     -7632.77,     -1040.25,      409.223),
(830207,      10,     -7633.07,     -1039.9 ,      409.144),
(830207,      11,     -7633.67,     -1035.6 ,      408.518),
(830207,      12,     -7633.47,     -1035.2 ,      409.345),
(830207,      13,     -7632.87,     -1034.4 ,      409.794),
(830207,      14,     -7632.27,     -1034.0 ,      409.933),
(830207,      15,     -7631.87,     -1033.6 ,      410.144),
(830207,      16,     -7631.47,     -1033.4 ,      410.315),
(830207,      17,     -7630.87,     -1033.0 ,      410.534),
(830207,      18,     -7630.26,     -1032.6 ,      410.884),
(830207,      19,     -7629.87,     -1032.2 ,      411.144),
(830207,      20,     -7629.47,     -1032.0 ,      411.174),
(830207,      21,     -7628.87,     -1031.6 ,      411.483),
(830207,      22,     -7628.27,     -1031.2 ,      411.816),
(830207,      23,     -7627.87,     -1030.8 ,      411.944),
(830207,      24,     -7627.47,     -1030.61,      412.142),
(830207,      25,     -7626.87,     -1030.2 ,      412.329),
(830207,      26,     -7626.37,     -1029.7 ,      412.605),
(830207,      27,     -7626.08,     -1029.09,      412.62 ),
(830207,      28,     -7625.84,     -1029.03,      412.84 ),
(830207,      29,     -7625.6 ,     -1028.63,      412.806),
(830207,      30,     -7625.24,     -1028.55,      413.119),
(830207,      31,     -7624.88,     -1028.83,      413.329),
(830207,      32,     -7624.39,     -1028.7 ,      413.513),
(830207,      33,     -7623.36,     -1028.43,      413.659),
(830207,      34,     -7623.14,     -1028.37,      413.83 ),
(830207,      35,     -7622.43,     -1028.19,      413.544),
(830207,      36,     -7619.88,     -1027.51,      413.628),
(830207,      37,     -7619.88,     -1027.51,      413.628);

-- Waypoints for Blackwing Legionnaire, Blackwing Mage, Deathtalon Dragonspawn (South)
INSERT INTO `creature_movement_special`
(  `id`, `point`, `position_x`, `position_y`, `position_z`) VALUES
(830208,       1,     -7664.3 ,     -1045.57,      407.357),
(830208,       2,     -7659.81,     -1043.81,      407.377),
(830208,       3,     -7655.33,     -1042.05,      407.396),
(830208,       4,     -7651.78,     -1040.65,      408.544),
(830208,       5,     -7651.02,     -1040.36,      408.544),
(830208,       6,     -7634.79,     -1033.98,      408.544),
(830208,       7,     -7634.35,     -1033.81,      409.144),
(830208,       8,     -7633.27,     -1034.0 ,      409.365),
(830208,       9,     -7632.87,     -1034.4 ,      409.714),
(830208,      10,     -7632.27,     -1034.0 ,      409.933),
(830208,      11,     -7631.87,     -1033.6 ,      410.144),
(830208,      12,     -7631.8 ,     -1032.97,      409.978),
(830208,      13,     -7631.27,     -1032.6 ,      410.162),
(830208,      14,     -7626.27,     -1029.0 ,      412.335),
(830208,      15,     -7625.67,     -1028.6 ,      412.782),
(830208,      16,     -7625.21,     -1028.5 ,      413.094),
(830208,      17,     -7624.87,     -1028.8 ,      413.345),
(830208,      18,     -7624.37,     -1028.67,      413.522),
(830208,      19,     -7623.38,     -1028.42,      413.662),
(830208,      20,     -7623.15,     -1028.35,      413.841),
(830208,      21,     -7622.44,     -1028.17,      413.544),
(830208,      22,     -7619.88,     -1027.5 ,      413.627),
(830208,      23,     -7619.88,     -1027.5 ,      413.627);

-- Waypoints for Blackwing Legionnaire, Blackwing Mage, Deathtalon Dragonspawn (West)
INSERT INTO `creature_movement_special`
(  `id`, `point`, `position_x`, `position_y`, `position_z`) VALUES
(830209,       1,     -7579.84,     -986.863,      407.344),
(830209,       2,     -7583.08,     -990.483,      407.344),
(830209,       3,     -7586.32,     -994.103,      407.344),
(830209,       4,     -7588.66,     -995.783,      408.545),
(830209,       5,     -7590.11,     -997.456,      408.544),
(830209,       6,     -7600.2 ,     -1009.1 ,      408.715),
(830209,       7,     -7601.3 ,     -1010.37,      408.633),
(830209,       8,     -7601.42,     -1010.51,      408.923),
(830209,       9,     -7601.62,     -1010.74,      408.949),
(830209,      10,     -7601.77,     -1010.92,      409.144),
(830209,      11,     -7603.68,     -1011.42,      409.544),
(830209,      12,     -7605.77,     -1009.11,      409.855),
(830209,      13,     -7606.1 ,     -1009.71,      410.233),
(830209,      14,     -7606.35,     -1010.18,      410.198),
(830209,      15,     -7606.75,     -1010.91,      410.632),
(830209,      16,     -7606.69,     -1014.4 ,      411.145),
(830209,      17,     -7607.87,     -1016.2 ,      412.149),
(830209,      18,     -7607.27,     -1015.8 ,      411.876),
(830209,      19,     -7607.69,     -1016.38,      412.323),
(830209,      20,     -7607.92,     -1016.69,      412.633),
(830209,      21,     -7608.42,     -1017.04,      412.785),
(830209,      22,     -7608.67,     -1017.4 ,      413.144),
(830209,      23,     -7608.87,     -1018.2 ,      413.339),
(830209,      24,     -7608.87,     -1018.74,      413.744),
(830209,      25,     -7608.87,     -1019.27,      413.544),
(830209,      26,     -7609.47,     -1020.0 ,      414.145),
(830209,      27,     -7609.87,     -1020.2 ,      413.544),
(830209,      28,     -7610.74,     -1021.22,      413.544),
(830209,      29,     -7611.79,     -1022.45,      413.597),
(830209,      30,     -7611.79,     -1022.45,      413.597);

-- Waypoints for Blackwing Legionnaire, Blackwing Mage, Deathtalon Dragonspawn (West North)
INSERT INTO `creature_movement_special`
(  `id`, `point`, `position_x`, `position_y`, `position_z`) VALUES
(830210,       1,     -7568.35,     -1012.8 ,      407.344),
(830210,       2,     -7568.61,     -1012.67,      407.344),
(830210,       3,     -7568.87,     -1012.54,      407.344),
(830210,       4,     -7571.81,     -1011.05,      407.485),
(830210,       5,     -7573.62,     -1010.14,      408.326),
(830210,       6,     -7574.46,     -1009.71,      408.544),
(830210,       7,     -7575.27,     -1009.8 ,      408.544),
(830210,       8,     -7577.94,     -1010.62,      408.544),
(830210,       9,     -7579.18,     -1011.14,      408.544),
(830210,      10,     -7599.67,     -1012.4 ,      408.544),
(830210,      11,     -7600.65,     -1011.19,      408.71 ),
(830210,      12,     -7600.87,     -1011.4 ,      409.143),
(830210,      13,     -7601.27,     -1011.6 ,      409.144),
(830210,      14,     -7601.87,     -1012.0 ,      409.377),
(830210,      15,     -7603.83,     -1013.44,      410.38 ),
(830210,      16,     -7604.02,     -1013.68,      410.574),
(830210,      17,     -7604.56,     -1014.11,      410.797),
(830210,      18,     -7605.06,     -1014.61,      411.155),
(830210,      19,     -7605.53,     -1015.14,      411.515),
(830210,      20,     -7606.87,     -1016.2 ,      412.17 ),
(830210,      21,     -7607.47,     -1016.6 ,      412.555),
(830210,      22,     -7607.87,     -1016.8 ,      412.743),
(830210,      23,     -7608.33,     -1017.14,      412.876),
(830210,      24,     -7608.45,     -1017.3 ,      413.038),
(830210,      25,     -7608.87,     -1018.2 ,      413.339),
(830210,      26,     -7608.87,     -1018.74,      413.744),
(830210,      27,     -7608.87,     -1019.27,      413.544),
(830210,      28,     -7609.47,     -1020.0 ,      414.145),
(830210,      29,     -7609.87,     -1020.2 ,      413.544),
(830210,      30,     -7610.74,     -1021.22,      413.544),
(830210,      31,     -7611.79,     -1022.45,      413.597),
(830210,      32,     -7611.79,     -1022.45,      413.597);

-- Waypoints for Blackwing Legionnaire, Blackwing Mage, Deathtalon Dragonspawn (North West)
INSERT INTO `creature_movement_special`
(  `id`, `point`, `position_x`, `position_y`, `position_z`) VALUES
(830211,       1,     -7546.27,     -1044.42,      407.207),
(830211,       2,     -7548.46,     -1041.98,      407.343),
(830211,       3,     -7550.66,     -1039.54,      407.479),
(830211,       4,     -7551.26,     -1038.87,      407.832),
(830211,       5,     -7552.23,     -1037.79,      408.544),
(830211,       6,     -7555.21,     -1034.49,      408.544),
(830211,       7,     -7556.04,     -1033.56,      408.544),
(830211,       8,     -7556.73,     -1032.8 ,      408.544),
(830211,       9,     -7559.61,     -1029.59,      408.621),
(830211,      10,     -7560.11,     -1029.04,      408.545),
(830211,      11,     -7562.08,     -1026.86,      408.544),
(830211,      12,     -7567.79,     -1020.52,      408.544),
(830211,      13,     -7566.17,     -1020.1 ,      408.632),
(830211,      14,     -7568.07,     -1019.6 ,      408.544),
(830211,      15,     -7569.46,     -1016.56,      407.366),
(830211,      16,     -7569.98,     -1016.66,      407.344),
(830211,      17,     -7573.47,     -1012.0 ,      407.544),
(830211,      18,     -7574.46,     -1009.71,      408.544),
(830211,      19,     -7575.27,     -1009.8 ,      408.544),
(830211,      20,     -7577.94,     -1010.62,      408.544),
(830211,      21,     -7579.18,     -1011.14,      408.544),
(830211,      22,     -7599.67,     -1012.4 ,      408.544),
(830211,      23,     -7600.65,     -1011.19,      408.71 ),
(830211,      24,     -7600.87,     -1011.4 ,      409.143),
(830211,      25,     -7601.27,     -1011.6 ,      409.144),
(830211,      26,     -7601.87,     -1012.0 ,      409.377),
(830211,      27,     -7603.83,     -1013.44,      410.38 ),
(830211,      28,     -7604.02,     -1013.68,      410.574),
(830211,      29,     -7604.56,     -1014.11,      410.797),
(830211,      30,     -7605.06,     -1014.61,      411.155),
(830211,      31,     -7605.53,     -1015.14,      411.515),
(830211,      32,     -7606.87,     -1016.2 ,      412.17 ),
(830211,      33,     -7607.47,     -1016.6 ,      412.555),
(830211,      34,     -7607.87,     -1016.8 ,      412.743),
(830211,      35,     -7608.33,     -1017.14,      412.876),
(830211,      36,     -7608.45,     -1017.3 ,      413.038),
(830211,      37,     -7608.87,     -1018.2 ,      413.339),
(830211,      38,     -7608.87,     -1018.74,      413.744),
(830211,      39,     -7608.87,     -1019.27,      413.544),
(830211,      40,     -7609.47,     -1020.0 ,      414.145),
(830211,      41,     -7609.87,     -1020.2 ,      413.544),
(830211,      42,     -7610.74,     -1021.22,      413.544),
(830211,      43,     -7611.79,     -1022.45,      413.597),
(830211,      44,     -7611.79,     -1022.45,      413.597);

-- On wipe on Cata PTR, Razorgore yells "I'm free!" etc. and then kills Grethok etc. with a fireball/explosion.
-- Actually, sniff_36035 apparently has this.

-- Events list for Blackwing Legionnaire
REPLACE `creature_spells`
(`entry`, `name`,                  `spellId_1`, `probability_1`, `castTarget_1`, `delayInitialMin_1`, `delayInitialMax_1`, `delayRepeatMin_1`, `delayRepeatMax_1`, `spellId_2`, `probability_2`, `castTarget_2`, `delayInitialMin_2`, `delayInitialMax_2`, `delayRepeatMin_2`, `delayRepeatMax_2`, `spellId_3`, `probability_3`, `castTarget_3`, `targetParam1_3`, `targetParam2_3`, `delayInitialMin_3`, `delayInitialMax_3`, `delayRepeatMin_3`, `delayRepeatMax_3`) VALUES
( 124160, 'Blackwing Legionnaire',       15580,             100,              1,                   3,                  16,                  5,                 16,       15754,             100,              1,                   0,                  15,                  6,                 13,       23967,             100,              8,            12435,                5,                   1,                  24,                  6,                 27);
REPLACE `creature_ai_events`
(   `id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `comment`) VALUES
(1241601,         12416,              0,            6,                        0x0,            100,          0x00,              0,              0,              0,              0,          1241601, 'Blackwing Legionnaire - Death'),
-- Lower this ID at the end as needed.
(1241604,         12416,              0,           21,                        0x0,            100,          0x00,              0,              0,              0,              0,          1241604, 'Blackwing Legionnaire - Reached Home');
REPLACE `creature_ai_scripts`
(   `id`, `command`, `datalong`, `datalong2`, `datalong3`, `dataint`, `comments`) VALUES
(1241601,        37,         26,           1,           2,         0, 'Blackwing Legionnaire - Decrement Creature Count'),
(1241604,        18,          0,           0,           0,         0, 'Blackwing Legionnaire - Despawn');

-- Events list for Blackwing Mage
REPLACE `creature_spells`
(`entry`, `name`,           `spellId_1`, `probability_1`, `castTarget_1`, `delayInitialMin_1`, `delayInitialMax_1`, `delayRepeatMin_1`, `delayRepeatMax_1`) VALUES
( 124200, 'Blackwing Mage',       17290,             100,              1,                   0,                   0,                  3,                 12);
DELETE FROM `creature_ai_events` WHERE `id` = 1242002;
REPLACE `creature_ai_events`
(  `id`,  `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `comment`) VALUES
(1242001,         12420,            556,            0,                        0x1,          0x01,              0,          22000,           3000,          22000,          1242001, 'Blackwing Mage - In Combat (periodic)'),
-- Lower this ID at the end as needed.
(1242003,         12420,              0,           21,                        0x0,          0x00,              0,              0,              0,              0,          1242003, 'Blackwing Mage - Reached Home');
DELETE FROM `creature_ai_scripts` WHERE `id` = 1242002;
REPLACE `creature_ai_scripts`
(   `id`, `command`, `datalong`, `datalong2`, `target_type`, `dataint`, `comments`) VALUES
(1242001,        15,      22271,       0x000,             6,         0, 'Blackwing Mage - Cast Arcane Explosion'),
(1242003,        18,          0,       0x000,             0,         0, 'Blackwing Mage - Despawn');

-- Events list for Death Talon Dragonspawn
REPLACE `creature_spells`
(`entry`, `name`,                    `spellId_1`, `probability_1`, `castTarget_1`, `delayInitialMin_1`, `delayInitialMax_1`, `delayRepeatMin_1`, `delayRepeatMax_1`, `spellId_2`, `probability_2`, `castTarget_2`, `delayInitialMin_2`, `delayInitialMax_2`, `delayRepeatMin_2`, `delayRepeatMax_2`, `spellId_3`, `probability_3`, `castTarget_3`, `targetParam1_3`, `targetParam2_3`, `delayInitialMin_3`, `delayInitialMax_3`, `delayRepeatMin_3`, `delayRepeatMax_3`) VALUES
( 124220, 'Death Talon Dragonspawn',       15580,             100,              1,                   0,                  32,                  4,                  27,       15663,             100,              1,                  0,                  32,                 13,                 36,       23967,             100,              8,            12435,                5,                   0,                  34,                  6,                 36);
REPLACE `creature_ai_events`
(   `id`,  `creature_id`, `event_type`, `action1_script`, `comment`) VALUES
(1242201,          12422,            7,          1242201, 'Death Talon Dragonspawn - Evade'),
-- Lower this ID at the end as needed.
(1242204,          12422,           21,          1242204, 'Death Talon Dragonspawn - Reached Home');
REPLACE `creature_ai_scripts`
(   `id`, `command`, `datalong`, `comments`) VALUES
(1242201,        34,          1, 'Death Talon Dragonspawn - Set Home Position'),
(1242204,        18,          0, 'Death Talon Dragonspawn - Despawn');
-- REPLACE `generic_scripts`
-- (   `id`, `command`, `comments`) VALUES;

-- Events list for Razorgore the Untamed
-- Note that effect 1 of spell 19873 has a misc value of Disturb (activate gameobject trap). In the sniff does the object do something to the caster?
-- Note that effect 2 of spell 19873 has an implicit target of TARGET_LOCATION_SCRIPT_NEAR_CASTER with a radius of 100 yards. What might it be doing?
INSERT `creature_ai_events`
(  `id`,  `creature_id`, `condition_id`, `event_type`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `comment`) VALUES
(1243501,         12435,             540,           1,          0x01,           6000,          16000,           6000,          16000,          1243501, 'Razorgore the Untamed - Out of Combat (periodic)'),
(1243502,         12435,             241,           6,          0x00,              0,              0,              0,              0,          1243502, 'Razorgore the Untamed - Death (Eggs remain)'),
(1243503,         12435,             242,           6,          0x00,              0,              0,              0,              0,          1243503, 'Razorgore the Untamed - Death (Eggs destroyed)');
INSERT `creature_ai_scripts`
(   `id`, `command`, `datalong`, `datalong2`, `target_param1`, `target_param2`, `target_type`, `dataint`, `condition_id`, `comments`) VALUES
(1243501,        15,      21389,       0x002,               0,               0,             6,         0,            548, 'Razorgore the Untamed - Cast Fire Channeling'),
(1243501,        60,          0,           1,               0,               0,             0,         0,            548, 'Razorgore the Untamed - Start Waypoint 1'),
(1243501,        60,          0,           2,               0,               0,             0,         0,            542, 'Razorgore the Untamed - Start Waypoint 2'),
(1243501,        60,          0,           3,               0,               0,             0,         0,            543, 'Razorgore the Untamed - Start Waypoint 3'),
(1243501,        60,          0,           4,               0,               0,             0,         0,            544, 'Razorgore the Untamed - Start Waypoint 4'),
(1243501,        60,          0,           5,               0,               0,             0,         0,            545, 'Razorgore the Untamed - Start Waypoint 5'),
(1243501,        60,          0,           6,               0,               0,             0,         0,            546, 'Razorgore the Untamed - Start Waypoint 6'),
(1243502,         0,          1,           0,               0,               0,             0,      9591,              0, 'Razorgore the Untamed - Yell (Death)'),
-- might need a spell_script_target of Blackwing Orb Trigger for this.
(1243502,        15,      23024,           0,               0,               0,             0,         0,              0, 'Razorgore the Untamed - Cast Fireball'),
(1243502,        62,       8302,           0,               0,               0,             0,         0,              0, 'Razorgore the Untamed - End Map Event (Failure)'),
-- Need to do other stuff like raise gates. Also yell?
(1243503,        62,       8302,           1,               0,               0,             0,         0,              0, 'Razorgore the Untamed - End Map Event (Success)');
UPDATE `creature_template` SET `ai_name` = 'EventAI', `auras` = '18943', `script_name` = '' WHERE `entry` = 12435;

-- Events list for Grethok the Controller
INSERT `creature_ai_events`
(  `id`,  `creature_id`, `condition_id`, `event_type`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `comment`) VALUES
(1255701,         12557,            549,            1,          0x00,              0,              0,              0,              0,          1255701, 'Grethok the Controller - Out of Combat'),
(1255702,         12557,              0,            0,          0x01,           6000,           6000,          14000,          14000,          1255702, 'Grethlok the Controller - Cast Dominate Mind'),
(1255703,         12557,              0,            4,          0x00,              0,              0,              0,              0,          1255703, 'Grethok the Controller - Aggro'),
(1255704,         12557,              0,            0,          0x00,            800,            800,              0,              0,          1255704, 'Grethok the Controller - In Combat (Close Portcullis)'),
(1255705,         12557,              0,            0,          0x00,           1000,           5000,              0,              0,          1255705, 'Grethok the Controller - In Combat (Summon Monster Generators)'),
-- existing. Verified visually on Cata Classic, though a sniff would be good.
(1255706,         12557,              0,           21,          0x00,              0,              0,              0,              0,          1255706, 'Grethlok the Controller - On ReachHome Sound');
INSERT `creature_ai_scripts`
(   `id`, `command`, `datalong`, `datalong2`, `target_type`, `dataint`, `dataint4`,      `x`,      `y`,     `z`,     `o`, `comments`) VALUES
(1255701,        15,      23018,           0,             6,         0,          0,        0,        0,       0,       0, 'Grethok the Controller - Cast Use Dragon Orb'),
-- double check target for Dominate Mind
(1255702,        15,      14515,           0,             4,         0,          0,        0,        0,       0,       0, 'Grethok the Controller - Cast Spell Dominate Mind'),
(1255702,         0,          1,           0,             0,      9960,          0,        0,        0,       0,       0, 'Grethok the Controller - Say Text'),
(1255703,        49,          1,           0,             0,         0,          0,        0,        0,       0,       0, 'Grethok the Controller - Combat Pulse'),
(1255703,         0,          1,           0,             0,      9958,          0,        0,        0,       0,       0, 'Grethok the Controller - Yell'),
(1255703,        37,          0,           4,             0,         0,          0,        0,        0,       0,       0, 'Grethok the Controller - Set Instance Data (Encounter Special)'),
(1255704,        12,     232301,           0,             0,         0,          0,        0,        0,       0,       0, 'Grethok the Controller - Close Portcullis'),
(1255705,        10,      12434,         400,             0,         0,          3, -7643.39, -1064.69, 407.288, 1.71042, 'Grethok the Controller - Summon Monster Generator (Blackwing)'),
(1255705,        10,      12434,         400,             0,         0,          3, -7623.1,  -1094.06, 407.288, 1.44862, 'Grethok the Controller - Summon Monster Generator (Blackwing)'),
(1255705,        10,      12434,         400,             0,         0,          3, -7568.61, -1012.67, 407.288, 1.51844, 'Grethok the Controller - Summon Monster Generator (Blackwing)'),
(1255705,        10,      12434,         400,             0,         0,          3, -7548.46, -1041.98, 407.288, 2.02458, 'Grethok the Controller - Summon Monster Generator (Blackwing)'),
-- existing. Verified visually on Cata Classic, though a sniff would be good.
(1255706,        16,       8274,           0,             0,         0,          0,        0,        0,       0,       0, 'Grethok the Controller - Play Sound 8274');
REPLACE `creature_spells`
(`entry`, `name`,                   `spellId_1`, `probability_1`, `castTarget_1`, `delayInitialMin_1`, `delayInitialMax_1`, `delayRepeatMin_1`, `delayRepeatMax_1`, `spellId_2`, `probability_2`, `castTarget_2`, `delayInitialMin_2`, `delayInitialMax_2`, `delayRepeatMin_2`, `delayRepeatMax_2`, `spellId_3`, `probability_3`, `castTarget_3`, `delayInitialMin_3`, `delayInitialMax_3`, `delayRepeatMin_3`, `delayRepeatMax_3`) VALUES
( 125570, 'Grethok the Controller',       13747,             100,              6,                  12,                  22,                 12,                 22,       22272,             100,              4,                   0,                  16,                 10,                 18,       22274,             100,              4,                   2,                  18,                  7,                 11);
UPDATE `creature_template` SET `auras` = '18950' WHERE `entry` = 12557;
-- spells
-- Need to check spell targets against what's in the current list.
-- Current list has 22273 (Arcane Missiles), but that is just a component of 22272.
-- No data for repeating delays on spells 13747 and 14515. Only one data point for 22274.
-- 13747
-- Implicit target A - TARGET_LOCATION_CASTER_SRC
-- Implicit target B - TARGET_ENUM_UNITS_ENEMY_AOE_AT_SRC_LOC
-- Test and make sure it affects all players in a radius.

-- Events list for Blackwing Orb Trigger
-- INSERT `creature_ai_events`
-- (   `id`,  `creature_id`, `condition_id`, `event_type`, `event_param1`, `event_param2`, `action1_script`, `comment`) VALUES;
INSERT `creature_ai_scripts`
(   `id`, `command`, `datalong`, `comments`) VALUES
(1444901,        15,      20037, 'Blackwing Orb Trigger - Cast Explode Orb Effect'); -- Need to code the script effects.
UPDATE `creature_template` SET `ai_name` = 'EventAI' WHERE `entry` = 14449;

-- Player's Possess on Razorgore needs to reset DATA_RAZORGORE_EGG_YELLED to 0
-- so that he always yells on the first Destroy Egg.

-- Events list for Orb of Domination
UPDATE `creature_template` SET `script_name` = '' WHERE `entry` = 14453;

-- Waypoints for Razorgore the Untamed
INSERT INTO `creature_movement_template`
(`entry`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `waittime`) VALUES
(  12435,       1,     -7571.69,     -1088.25,      413.465,      4.64258 ,          0),
(  12435,       2,     -7571.69,     -1088.25,      413.465,      2.44346 ,      20000),
(  12435,       3,     -7571.69,     -1088.25,      413.465,      3.33358 ,      20000),
(  12435,       4,     -7571.69,     -1088.25,      413.465,      0.139626,      20000),
(  12435,       5,     -7571.69,     -1088.25,      413.465,      1.309   ,      20000),
(  12435,       6,     -7571.69,     -1088.25,      413.465,      4.64258 ,      20000);

-- Events list for Blackwing Guardsman
REPLACE `creature_spells`
(`entry`, `name`,                                 `spellId_1`, `probability_1`, `castTarget_1`, `delayInitialMin_1`, `delayInitialMax_1`, `delayRepeatMin_1`, `delayRepeatMax_1`, `spellId_2`, `probability_2`, `castTarget_2`, `delayInitialMin_2`, `delayInitialMax_2`, `delayRepeatMin_2`, `delayRepeatMax_2`) VALUES
( 144560, 'Blackwing Lair - Blackwing Guardsman',       15580,             100,              1,                   5,                  23,                  1,                 16,       15754,             100,              1,                   3,                  24,                  8,                 11);

-- Events list for Blackwing Spell Marker
REPLACE `generic_scripts`
(   `id`, `command`, `datalong`, `comments`) VALUES
(1660401,        15,      23032, 'Blackwing Spell Marker - Cast Nefarian''s Troops Flee');

-- Portcullis (Entry: 176964 Guid: 232301) Open Script
INSERT `generic_scripts`
(  `id`, `command`, `datalong`, `comments`) VALUES
(176964,        11,     232301, 'Portcullis - Open');

-- Portcullis (Entry: 176965 Guid: 232302) Open Script
INSERT `generic_scripts`
(  `id`, `command`, `datalong`, `comments`) VALUES
(176965,        11,     232302, 'Portcullis - Open');

-- Correct target for spell Use Dragon Orb.
UPDATE `spell_script_target` SET `targetEntry` = 14449, `type` = 1 WHERE `entry` = 23018;

-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;

DELETE FROM conditions WHERE condition_entry BETWEEN 540 AND 549;
DELETE FROM creature WHERE id IN (14449);
DELETE FROM creature_ai_events WHERE id LIKE '12435%' OR id LIKE '12557%' OR id LIKE '14449%';
DELETE FROM creature_ai_scripts WHERE id LIKE '12435%' OR id LIKE '12557%' OR id LIKE '14449%';
DELETE FROM creature_movement_template WHERE `entry` = 12435;

-- Creature spawn delays from Possess and previous spawn.
WITH
creature_create_time AS (
  SELECT unixtimems, guid, position_x, position_y FROM creature_create1_time
  UNION ALL
  SELECT unixtimems, guid, position_x, position_y FROM creature_create2_time
),
first_possess AS (
  SELECT spell_cast_go_target.target_guid, MIN(unixtimems) unixtimems
  FROM spell_cast_go JOIN spell_cast_go_target ON spell_cast_go.hit_targets_list_id = spell_cast_go_target.list_id
  WHERE spell_cast_go.spell_id = 19832 AND spell_cast_go_target.target_id = 12435
  GROUP BY spell_cast_go_target.target_guid
),
mage_spawn AS (
  SELECT creature_create_time.*
  FROM creature_create_time JOIN creature ON creature_create_time.guid = creature.guid
  WHERE creature.id IN (12416, 12420, 12422)
)
SELECT
  most_recent_possess.target_guid razorgore_guid,
  spawn_position.position_x,
  spawn_position.position_y,
  mage_spawn.unixtimems,
  ROUND((mage_spawn.unixtimems - COALESCE(last_spawn.unixtimems, most_recent_possess_time.possess_unixtimems)) / 1000) delay
FROM mage_spawn
JOIN (
  SELECT mage_spawn.unixtimems spawn_unixtimems, MAX(first_possess.unixtimems) possess_unixtimems
  FROM first_possess
  JOIN mage_spawn
  WHERE first_possess.unixtimems < mage_spawn.unixtimems
  GROUP BY mage_spawn.unixtimems
) most_recent_possess_time ON mage_spawn.unixtimems = most_recent_possess_time.spawn_unixtimems
JOIN first_possess most_recent_possess ON most_recent_possess_time.possess_unixtimems = most_recent_possess.unixtimems
JOIN (
  SELECT -7659.81 position_x, -1043.81 position_y
  UNION
  SELECT -7643.39, -1064.69
  UNION
  SELECT -7623.1, -1094.06
  UNION
  SELECT -7607.78, -1116.17
  UNION
  SELECT -7583.08, -990.483
  UNION
  SELECT -7568.61, -1012.67
  UNION
  SELECT -7548.46, -1041.98
  UNION
  SELECT -7532.72, -1063.49
) spawn_position ON ABS(mage_spawn.position_x - spawn_position.position_x) < 13
LEFT JOIN mage_spawn last_spawn
  ON ABS(mage_spawn.position_x - last_spawn.position_x) < 13
  AND mage_spawn.unixtimems > last_spawn.unixtimems
  AND most_recent_possess_time.possess_unixtimems < last_spawn.unixtimems
LEFT JOIN mage_spawn intermediate_spawn
  ON ABS(mage_spawn.position_x - intermediate_spawn.position_x) < 13
  AND mage_spawn.unixtimems > intermediate_spawn.unixtimems
  AND last_spawn.unixtimems < intermediate_spawn.unixtimems
WHERE intermediate_spawn.unixtimems IS NULL
ORDER BY razorgore_guid, position_x, unixtimems;

-- Creature spawn orientations and distance from Razorgore
INSERT encounter
SELECT
  1 unit_type,
  creature.guid,
  first_guid_value_update.unixtimems start_unixtimems,
  last_value_update.unixtimems end_unixtimems
FROM creature
  JOIN (SELECT guid, MIN(unixtimems) unixtimems FROM creature_guid_values_update GROUP BY guid) first_guid_value_update
    ON creature.guid = first_guid_value_update.guid
  JOIN (SELECT guid, MAX(unixtimems) unixtimems FROM creature_values_update GROUP BY guid) last_value_update
    ON creature.guid = last_value_update.guid
WHERE creature.id IN (12416, 12420, 12422);
INSERT event
WITH
mage_spawn AS (
  SELECT creature_create2_time.*
  FROM creature_create2_time JOIN creature ON creature_create2_time.guid = creature.guid
  WHERE creature.id IN (12416, 12420, 12422)
)
SELECT DISTINCT unixtimems FROM mage_spawn;

INSERT event_unit_position
WITH
first_possess AS (
  SELECT spell_cast_go_target.target_guid, MIN(unixtimems) unixtimems
  FROM spell_cast_go JOIN spell_cast_go_target ON spell_cast_go.hit_targets_list_id = spell_cast_go_target.list_id
  WHERE spell_cast_go.spell_id = 19832 AND spell_cast_go_target.target_id = 12435
  GROUP BY spell_cast_go_target.target_guid
),
mage_spawn AS (
  SELECT creature_create2_time.*
  FROM creature_create2_time JOIN creature ON creature_create2_time.guid = creature.guid
  WHERE creature.id IN (12416, 12420, 12422)
)
SELECT
  mage_spawn.unixtimems,
  1 unit_type,
  mage_spawn.guid,
  mage_spawn.position_x spawn_x,
  mage_spawn.position_y spawn_y,
  mage_spawn.position_z spawn_z
FROM mage_spawn
JOIN (
  SELECT mage_spawn.unixtimems spawn_unixtimems, MAX(first_possess.unixtimems) possess_unixtimems
  FROM first_possess
  JOIN mage_spawn
  WHERE first_possess.unixtimems < mage_spawn.unixtimems
  GROUP BY mage_spawn.unixtimems
) most_recent_possess_time ON mage_spawn.unixtimems = most_recent_possess_time.spawn_unixtimems
JOIN first_possess most_recent_possess ON most_recent_possess_time.possess_unixtimems = most_recent_possess.unixtimems
JOIN (
  SELECT -7659.81 position_x, -1043.81 position_y
  UNION
  SELECT -7643.39, -1064.69
  UNION
  SELECT -7623.1, -1094.06
  UNION
  SELECT -7607.78, -1116.17
  UNION
  SELECT -7583.08, -990.483
  UNION
  SELECT -7568.61, -1012.67
  UNION
  SELECT -7548.46, -1041.98
  UNION
  SELECT -7532.72, -1063.49
) spawn_position ON ABS(mage_spawn.position_x - spawn_position.position_x) < 13
LEFT JOIN mage_spawn last_spawn
  ON ABS(mage_spawn.position_x - last_spawn.position_x) < 13
  AND mage_spawn.unixtimems > last_spawn.unixtimems
  AND most_recent_possess_time.possess_unixtimems < last_spawn.unixtimems
LEFT JOIN mage_spawn intermediate_spawn
  ON ABS(mage_spawn.position_x - intermediate_spawn.position_x) < 13
  AND mage_spawn.unixtimems > intermediate_spawn.unixtimems
  AND last_spawn.unixtimems < intermediate_spawn.unixtimems
WHERE intermediate_spawn.unixtimems IS NULL;

INSERT unit_health_update
WITH unit_health_update AS (
  -- Starting health
  SELECT
    1 unit_type,
    creature.guid,
    creature_create1_time.unixtimems,
    creature.current_health,
    1 source
  FROM creature JOIN creature_create1_time ON creature.guid = creature_create1_time.guid
  UNION ALL
  SELECT
    1 unit_type,
    guid,
    unixtimems,
    AVG(current_health) current_health, -- AVG in case of ambiguous simultaneous updates
    2 source
  FROM creature_values_update
  GROUP BY unit_type, guid, unixtimems, source
  UNION ALL
  SELECT
    2 unit_type,
    guid,
    unixtimems,
    AVG(current_health) current_health,
    2 source
  FROM player_values_update
  GROUP BY unit_type, guid, unixtimems, source
)
SELECT
  unit_health_update.unit_type,
  unit_health_update.guid,
  unit_health_update.unixtimems,
  unit_health_update.current_health
FROM unit_health_update
JOIN (
  SELECT unit_type, guid, unixtimems, MAX(source) source
  FROM unit_health_update
  GROUP BY unit_type, guid, unixtimems
) unit_health_update_best_source
  ON unit_health_update.unit_type = unit_health_update_best_source.unit_type
  AND unit_health_update.guid = unit_health_update_best_source.guid
  AND unit_health_update.unixtimems = unit_health_update_best_source.unixtimems
  AND unit_health_update.source = unit_health_update_best_source.source
WHERE unit_health_update.current_health IS NOT NULL
  AND unit_health_update.unit_type = 1
  AND unit_health_update.guid IN (SELECT guid FROM creature WHERE id = 12435);

INSERT unit_movement
WITH unit_movement AS (
  -- Charmed creature
  SELECT
    1 unit_type,
    guid,
    unixtimems,
    0 move_time,
    1 movement_type,
    0 `point`,
    0 spline_count,
    AVG(position_x) position_x,
    AVG(position_y) position_y,
    AVG(position_z) position_z
  FROM creature_movement_client
  GROUP BY guid, unixtimems
  UNION ALL
  SELECT
    1 unit_type,
    guid,
    unixtimems,
    move_time,
    2 movement_type,
    `point`,
    spline_count,
    start_position_x,
    start_position_y,
    start_position_z
  FROM creature_movement_server
  UNION ALL
  -- Creature in combat
  SELECT
    1 unit_type,
    guid,
    unixtimems,
    move_time,
    3 movement_type,
    `point`,
    spline_count,
    start_position_x,
    start_position_y,
    start_position_z
  FROM creature_movement_server_combat
  UNION ALL
  -- Player client
  SELECT
    2 unit_type,
    guid,
    unixtimems,
    0 move_time,
    1 movement_type,
    0 `point`,
    0 spline_count,
    AVG(position_x) position_x,
    AVG(position_y) position_y,
    AVG(position_z) position_z
  FROM player_movement_client
  GROUP BY guid, unixtimems
  UNION ALL
  -- Player server
  SELECT
    2 unit_type,
    guid,
    unixtimems,
    move_time,
    2 movement_type,
    `point`,
    spline_count,
    start_position_x position_x,
    start_position_y position_y,
    start_position_z position_z
  FROM player_movement_server
)
SELECT
  unit_movement.unit_type,
  unit_movement.guid,
  unit_movement.unixtimems,
  unit_movement.move_time,
  unit_movement.movement_type,
  unit_movement.spline_count,
  unit_movement.position_x,
  unit_movement.position_y,
  unit_movement.position_z
FROM unit_movement
JOIN (
  SELECT unit_type, guid, unixtimems, MAX(movement_type) movement_type
  FROM unit_movement
  GROUP BY unit_type, guid, unixtimems
) unit_movement_type
  ON unit_movement.unit_type = unit_movement_type.unit_type
  AND unit_movement.guid = unit_movement_type.guid
  AND unit_movement.unixtimems = unit_movement_type.unixtimems
  AND unit_movement.movement_type = unit_movement_type.movement_type
JOIN (
  SELECT unit_type, guid, unixtimems, movement_type, MAX(`point`) `point`
  FROM unit_movement
  GROUP BY unit_type, guid, unixtimems, movement_type
) unit_movement_point
  ON unit_movement.unit_type = unit_movement_point.unit_type
  AND unit_movement.guid = unit_movement_point.guid
  AND unit_movement.unixtimems = unit_movement_point.unixtimems
  AND unit_movement.movement_type = unit_movement_point.movement_type
  AND unit_movement.`point` = unit_movement_point.`point`
-- store only the movements within an encounter and the latest one within 90 seconds before an encounter
WHERE
  (unit_movement.unixtimems IN (
    SELECT unixtimems
    FROM unit_movement JOIN encounter
    WHERE unixtimems BETWEEN encounter.start_unixtimems AND encounter.end_unixtimems
  )
  OR unit_movement.unixtimems IN (
    SELECT MAX(movement.unixtimems)
    FROM unit_movement movement JOIN encounter
    WHERE movement.unixtimems > (encounter.start_unixtimems - 90000)
      AND movement.unixtimems < encounter.start_unixtimems
    GROUP BY movement.unit_type, movement.guid, encounter.start_unixtimems
  ))
  AND unit_movement.unit_type = 1
  AND unit_movement.guid IN (SELECT guid FROM creature WHERE id = 12435);

INSERT unit_point
WITH unit_point AS (
  -- Creature start point out of combat
  SELECT
    1 unit_type,
    guid,
    unixtimems parent_unixtimems,
    0 spline_point,
    2 movement_type,
    `point`,
    start_position_x position_x,
    start_position_y position_y,
    start_position_z position_z
  FROM creature_movement_server
  UNION ALL
  -- Creature start point in combat
  SELECT
    1 unit_type,
    guid,
    unixtimems parent_unixtimems,
    0 spline_point,
    3 movement_type,
    `point`,
    start_position_x position_x,
    start_position_y position_y,
    start_position_z position_z
  FROM creature_movement_server_combat
  UNION ALL
  -- Creature single-point spline end point out of combat
  SELECT
    1 unit_type,
    guid,
    unixtimems parent_unixtimems,
    1 spline_point,
    2 movement_type,
    `point`,
    end_position_x position_x,
    end_position_y position_y,
    end_position_z position_z
  FROM creature_movement_server
  WHERE spline_count = 1
  UNION ALL
  -- Creature single-point spline end point in combat
  SELECT
    1 unit_type,
    guid,
    unixtimems parent_unixtimems,
    1 spline_point,
    3 movement_type,
    `point`,
    end_position_x position_x,
    end_position_y position_y,
    end_position_z position_z
  FROM creature_movement_server_combat
  WHERE spline_count = 1
  UNION ALL
  -- Creature multi-point spline point out of combat
  SELECT
    1 unit_type,
    creature_movement_server.guid,
    creature_movement_server.unixtimems parent_unixtimems,
    spline_point,
    2 movement_type,
    `point`,
    position_x,
    position_y,
    position_z
  FROM creature_movement_server_spline
  JOIN creature_movement_server
    ON creature_movement_server_spline.guid = creature_movement_server.guid
    AND creature_movement_server_spline.parent_point = creature_movement_server.`point`
  UNION ALL
  -- Creature multi-point spline point in combat
  SELECT
    1 unit_type,
    creature_movement_server_combat.guid,
    creature_movement_server_combat.unixtimems parent_unixtimems,
    spline_point,
    3 movement_type,
    `point`,
    position_x,
    position_y,
    position_z
  FROM creature_movement_server_combat_spline
  JOIN creature_movement_server_combat
    ON creature_movement_server_combat_spline.guid = creature_movement_server_combat.guid
    AND creature_movement_server_combat_spline.parent_point = creature_movement_server_combat.`point`
  UNION ALL
  -- Charmed creature
  SELECT
    1 unit_type,
    guid,
    unixtimems parent_unixtimems,
    0 spline_point,
    1 movement_type,
    0 `point`,
    position_x,
    position_y,
    position_z
  FROM creature_movement_client
  UNION ALL
  -- Player client
  SELECT
    2 unit_type,
    guid,
    unixtimems parent_unixtimems,
    0 spline_point,
    1 movement_type,
    0 `point`,
    position_x,
    position_y,
    position_z
  FROM player_movement_client
  UNION ALL
  -- Player start point (only point for non-spline)
  SELECT
    2 unit_type,
    guid,
    unixtimems parent_unixtimems,
    0 spline_point,
    2 movement_type,
    `point`,
    start_position_x position_x,
    start_position_y position_y,
    start_position_z position_z
  FROM player_movement_server
  UNION ALL
  -- Player end point of single-point spline
  SELECT
    2 unit_type,
    guid,
    unixtimems parent_unixtimems,
    1 spline_point,
    2 movement_type,
    `point`,
    end_position_x position_x,
    end_position_y position_y,
    end_position_z position_z
  FROM player_movement_server
  WHERE spline_count = 1
  UNION ALL
  -- Player multi-point spline point
  SELECT
    2 unit_type,
    player_movement_server.guid,
    player_movement_server.unixtimems parent_unixtimems,
    spline_point,
    2 movement_type,
    `point`,
    position_x,
    position_y,
    position_z
  FROM player_movement_server_spline
  JOIN player_movement_server
    ON player_movement_server_spline.guid = player_movement_server.guid
    AND player_movement_server_spline.parent_point = player_movement_server.`point`
),
unit_point_distance_from_previous AS (
  SELECT
    unit_point.unit_type,
    unit_point.guid,
    unit_point.parent_unixtimems,
    unit_point.spline_point,
    unit_point.movement_type,
    CASE WHEN previous_point.unit_type IS NULL THEN 0 ELSE SQRT(
      POW(unit_point.position_x - previous_point.position_x, 2)
      + POW(unit_point.position_y - previous_point.position_y, 2)
      + POW(unit_point.position_z - previous_point.position_z, 2)
    ) END distance
  FROM unit_point
  LEFT JOIN unit_point previous_point
    ON unit_point.unit_type = previous_point.unit_type
    AND unit_point.guid = previous_point.guid
    AND unit_point.parent_unixtimems = previous_point.parent_unixtimems
    AND (unit_point.spline_point - 1) = previous_point.spline_point
    AND unit_point.movement_type = previous_point.movement_type
),
unit_movement_speed AS (
  SELECT
    unit_movement.unit_type,
    unit_movement.guid,
    unit_movement.unixtimems,
    unit_movement.movement_type,
    SUM(unit_point_distance_from_previous.distance) / unit_movement.move_time speed
  FROM unit_movement
  JOIN unit_point_distance_from_previous
    ON unit_movement.unit_type = unit_point_distance_from_previous.unit_type
    AND unit_movement.guid = unit_point_distance_from_previous.guid
    AND unit_movement.unixtimems = unit_point_distance_from_previous.parent_unixtimems
    AND unit_movement.movement_type = unit_point_distance_from_previous.movement_type
  WHERE unit_movement.move_time > 0 
  GROUP BY
    unit_movement.unit_type,
    unit_movement.guid,
    unit_movement.unixtimems,
    unit_movement.movement_type,
    unit_movement.move_time
),
unit_point_distance_from_movement AS (
  SELECT
    unit_point.unit_type,
    unit_point.guid,
    unit_point.parent_unixtimems,
    unit_point.spline_point,
    unit_point.movement_type,
    SUM(unit_point_distance_from_previous.distance) distance
  FROM unit_point
  JOIN unit_point_distance_from_previous
    ON unit_point.unit_type = unit_point_distance_from_previous.unit_type
    AND unit_point.guid = unit_point_distance_from_previous.guid
    AND unit_point.parent_unixtimems = unit_point_distance_from_previous.parent_unixtimems
    AND unit_point.movement_type = unit_point_distance_from_previous.movement_type
  WHERE unit_point.spline_point >= unit_point_distance_from_previous.spline_point
  GROUP BY
    unit_point.unit_type,
    unit_point.guid,
    unit_point.parent_unixtimems,
    unit_point.spline_point,
    unit_point.movement_type
)
SELECT
  unit_movement.unit_type,
  unit_movement.guid,
  unit_movement.unixtimems parent_unixtimems,
  unit_movement.unixtimems
    + CASE WHEN unit_movement_speed.unit_type IS NULL THEN 0 ELSE
      ROUND(unit_point_distance_from_movement.distance / unit_movement_speed.speed)
    END
    + ROW_NUMBER() OVER( -- offset consecutive points rounding to same time
      PARTITION BY
        unit_movement.unit_type,
        unit_movement.guid,
        unit_movement.unixtimems,
        CASE WHEN unit_movement_speed.unit_type IS NULL THEN 0 ELSE
          ROUND(unit_point_distance_from_movement.distance / unit_movement_speed.speed)
        END
      ORDER BY unit_point.spline_point
    ) - 1 point_unixtimems,
  unit_point.spline_point,
  unit_point.position_x,
  unit_point.position_y,
  unit_point.position_z
FROM unit_movement
JOIN unit_point
  ON unit_movement.unit_type = unit_point.unit_type
  AND unit_movement.guid = unit_point.guid
  AND unit_movement.movement_type = unit_point.movement_type
  AND unit_movement.unixtimems = unit_point.parent_unixtimems
JOIN (
  SELECT unit_type, guid, parent_unixtimems, movement_type, MAX(`point`) `point`
  FROM unit_point
  GROUP BY unit_type, guid, parent_unixtimems, movement_type
) unit_point_max_point
  ON unit_movement.unit_type = unit_point_max_point.unit_type
  AND unit_movement.guid = unit_point_max_point.guid
  AND unit_movement.unixtimems = unit_point_max_point.parent_unixtimems
  AND unit_movement.movement_type = unit_point_max_point.movement_type
  AND unit_point.`point` = unit_point_max_point.`point`
LEFT JOIN unit_movement_speed
  ON unit_movement.unit_type = unit_movement_speed.unit_type
  AND unit_movement.guid = unit_movement_speed.guid
  AND unit_movement.unixtimems = unit_movement_speed.unixtimems
  AND unit_movement.movement_type = unit_movement_speed.movement_type
LEFT JOIN unit_point_distance_from_movement
  ON unit_movement.unit_type = unit_point_distance_from_movement.unit_type
  AND unit_movement.guid = unit_point_distance_from_movement.guid
  AND unit_movement.unixtimems = unit_point_distance_from_movement.parent_unixtimems
  AND unit_point.spline_point = unit_point_distance_from_movement.spline_point
  AND unit_movement.movement_type = unit_point_distance_from_movement.movement_type;

INSERT event_unit_health_time
SELECT
  event.unixtimems event_unixtimems,
  unit_health_update.unit_type,
  unit_health_update.guid,
  MAX(unit_health_update.unixtimems) update_unixtimems
FROM event
JOIN unit_health_update
WHERE unit_health_update.unixtimems < event.unixtimems
GROUP BY
  event.unixtimems,
  unit_health_update.unit_type,
  unit_health_update.guid;

INSERT event_unit_last_point
SELECT
  event.unixtimems event_unixtimems,
  event_unit_last_movement.unit_type,
  event_unit_last_movement.guid,
  event_unit_last_movement.movement_unixtimems,
  MAX(unit_point.unixtimems) point_unixtimems
FROM event
JOIN (
  SELECT
    event.unixtimems event_unixtimems,
    unit_movement.unit_type,
    unit_movement.guid,
    MAX(unit_movement.unixtimems) movement_unixtimems
  FROM event JOIN unit_movement
  WHERE event.unixtimems >= unit_movement.unixtimems
  GROUP BY event.unixtimems, unit_movement.unit_type, unit_movement.guid
) event_unit_last_movement ON event.unixtimems = event_unit_last_movement.event_unixtimems
JOIN unit_point
  ON event_unit_last_movement.unit_type = unit_point.unit_type
  AND event_unit_last_movement.guid = unit_point.guid
  AND event_unit_last_movement.movement_unixtimems = unit_point.parent_unixtimems
WHERE unit_point.unixtimems <= event.unixtimems
GROUP BY
  event.unixtimems,
  event_unit_last_movement.unit_type,
  event_unit_last_movement.guid,
  event_unit_last_movement.movement_unixtimems;

WITH
first_possess AS (
  SELECT spell_cast_go_target.target_guid, MIN(unixtimems) unixtimems
  FROM spell_cast_go JOIN spell_cast_go_target ON spell_cast_go.hit_targets_list_id = spell_cast_go_target.list_id
  WHERE spell_cast_go.spell_id = 19832 AND spell_cast_go_target.target_id = 12435
  GROUP BY spell_cast_go_target.target_guid
),
mage_spawn AS (
  SELECT creature_create2_time.*
  FROM creature_create2_time JOIN creature ON creature_create2_time.guid = creature.guid
  WHERE creature.id IN (12416, 12420, 12422)
)
SELECT
  most_recent_possess.target_guid razorgore_guid,
  mage_spawn.position_x,
  mage_spawn.position_y,
  mage_spawn.unixtimems,
  mage_spawn.orientation,
  spawn_distance.distance,
  creature.guid,
  creature.id
FROM mage_spawn
JOIN creature ON mage_spawn.guid = creature.guid
JOIN (
  SELECT mage_spawn.unixtimems spawn_unixtimems, MAX(first_possess.unixtimems) possess_unixtimems
  FROM first_possess
  JOIN mage_spawn
  WHERE first_possess.unixtimems < mage_spawn.unixtimems
  GROUP BY mage_spawn.unixtimems
) most_recent_possess_time ON mage_spawn.unixtimems = most_recent_possess_time.spawn_unixtimems
JOIN first_possess most_recent_possess ON most_recent_possess_time.possess_unixtimems = most_recent_possess.unixtimems
JOIN (
  SELECT
    event_unit_position.event_unixtimems,
    event_unit_position.guid,
    target_last_point_time.guid target_guid,
    SQRT(
      POW(event_unit_position.position_x - (
        target_last_point.position_x + CASE WHEN target_next_point.unixtimems IS NULL THEN 0 ELSE
          (target_next_point.position_x - target_last_point.position_x) * (
            (event_unit_position.event_unixtimems - target_last_point.unixtimems)
            / (target_next_point.unixtimems - target_last_point.unixtimems)
          )
        END
      ), 2)
      + POW(event_unit_position.position_y - (
        target_last_point.position_y + CASE WHEN target_next_point.unixtimems IS NULL THEN 0 ELSE
          (target_next_point.position_y - target_last_point.position_y) * (
            (event_unit_position.event_unixtimems - target_last_point.unixtimems)
            / (target_next_point.unixtimems - target_last_point.unixtimems)
          )
        END
      ), 2)
    ) distance
  FROM event_unit_position
  JOIN event_unit_last_point target_last_point_time
    ON event_unit_position.event_unixtimems = target_last_point_time.event_unixtimems
  JOIN unit_point target_last_point
    ON target_last_point_time.unit_type = target_last_point.unit_type
    AND target_last_point_time.guid = target_last_point.guid
    AND target_last_point_time.movement_unixtimems = target_last_point.parent_unixtimems
    AND target_last_point_time.point_unixtimems = target_last_point.unixtimems
  JOIN event_unit_health_time target_health_time
    ON event_unit_position.event_unixtimems = target_health_time.event_unixtimems
    AND target_last_point_time.unit_type = target_health_time.unit_type
    AND target_last_point_time.guid = target_health_time.guid
  JOIN unit_health_update target_health
    ON target_last_point_time.unit_type = target_health.unit_type
    AND target_last_point_time.guid = target_health.guid
    AND target_health_time.update_unixtimems = target_health.unixtimems
  LEFT JOIN unit_point target_next_point
    ON target_last_point_time.unit_type = target_next_point.unit_type
    AND target_last_point_time.guid = target_next_point.guid
    AND target_last_point.parent_unixtimems = target_next_point.parent_unixtimems
    AND (target_last_point.spline_point + 1) = target_next_point.spline_point
  WHERE target_health.current_health > 1
) spawn_distance ON mage_spawn.guid = spawn_distance.guid AND most_recent_possess.target_guid = spawn_distance.target_guid
LEFT JOIN mage_spawn last_spawn
  ON ABS(mage_spawn.position_x - last_spawn.position_x) < 13
  AND mage_spawn.unixtimems > last_spawn.unixtimems
  AND most_recent_possess_time.possess_unixtimems < last_spawn.unixtimems
LEFT JOIN mage_spawn intermediate_spawn
  ON ABS(mage_spawn.position_x - intermediate_spawn.position_x) < 13
  AND mage_spawn.unixtimems > intermediate_spawn.unixtimems
  AND last_spawn.unixtimems < intermediate_spawn.unixtimems
WHERE intermediate_spawn.unixtimems IS NULL
ORDER BY razorgore_guid, position_x, distance DESC;

-- Creature count of longer-delayed (30-second) spawns from previous longer-delayed spawn.
INSERT higher_delay
WITH
creature_create_time AS (
  SELECT unixtimems, guid, position_x, position_y FROM creature_create1_time
  UNION ALL
  SELECT unixtimems, guid, position_x, position_y FROM creature_create2_time
),
first_possess AS (
  SELECT spell_cast_go_target.target_guid, MIN(unixtimems) unixtimems
  FROM spell_cast_go JOIN spell_cast_go_target ON spell_cast_go.hit_targets_list_id = spell_cast_go_target.list_id
  WHERE spell_cast_go.spell_id = 19832 AND spell_cast_go_target.target_id = 12435
  GROUP BY spell_cast_go_target.target_guid
),
mage_spawn AS (
  SELECT creature_create_time.*
  FROM creature_create_time JOIN creature ON creature_create_time.guid = creature.guid
  WHERE creature.id IN (12416, 12420, 12422)
)
SELECT DISTINCT
  most_recent_possess.target_guid razorgore_guid,
  spawn_position.position_x,
  spawn_position.position_y,
  mage_spawn.unixtimems,
  ROUND((mage_spawn.unixtimems - COALESCE(last_spawn.unixtimems, most_recent_possess_time.possess_unixtimems)) / 1000) delay
FROM mage_spawn
JOIN (
  SELECT mage_spawn.unixtimems spawn_unixtimems, MAX(first_possess.unixtimems) possess_unixtimems
  FROM first_possess
  JOIN mage_spawn
  WHERE first_possess.unixtimems < mage_spawn.unixtimems
  GROUP BY mage_spawn.unixtimems
) most_recent_possess_time ON mage_spawn.unixtimems = most_recent_possess_time.spawn_unixtimems
JOIN first_possess most_recent_possess ON most_recent_possess_time.possess_unixtimems = most_recent_possess.unixtimems
JOIN (
  SELECT -7659.81 position_x, -1043.81 position_y
  UNION
  SELECT -7643.39, -1064.69
  UNION
  SELECT -7623.1, -1094.06
  UNION
  SELECT -7607.78, -1116.17
  UNION
  SELECT -7583.08, -990.483
  UNION
  SELECT -7568.61, -1012.67
  UNION
  SELECT -7548.46, -1041.98
  UNION
  SELECT -7532.72, -1063.49
) spawn_position ON ABS(mage_spawn.position_x - spawn_position.position_x) < 13
LEFT JOIN mage_spawn last_spawn
  ON ABS(mage_spawn.position_x - last_spawn.position_x) < 13
  AND mage_spawn.unixtimems > last_spawn.unixtimems
  AND most_recent_possess_time.possess_unixtimems < last_spawn.unixtimems
LEFT JOIN mage_spawn intermediate_spawn
  ON ABS(mage_spawn.position_x - intermediate_spawn.position_x) < 13
  AND mage_spawn.unixtimems > intermediate_spawn.unixtimems
  AND last_spawn.unixtimems < intermediate_spawn.unixtimems
WHERE intermediate_spawn.unixtimems IS NULL;

INSERT higher_delay_count
SELECT
  higher_delay.razorgore_guid,
  higher_delay.position_x,
  higher_delay.position_y,
  higher_delay.unixtimems,
  previous_higher_delay.unixtimems previous_unixtimems,
  ROUND((higher_delay.unixtimems - previous_higher_delay.unixtimems) / 15000)
    - CASE WHEN previous_higher_delay.delay > 36 THEN 0 ELSE 1 END delay_count
FROM higher_delay
JOIN higher_delay previous_higher_delay
  ON higher_delay.razorgore_guid = previous_higher_delay.razorgore_guid
  AND higher_delay.position_x = previous_higher_delay.position_x
  AND higher_delay.position_y = previous_higher_delay.position_y
LEFT JOIN higher_delay intermediate_higher_delay
  ON higher_delay.razorgore_guid = intermediate_higher_delay.razorgore_guid
  AND higher_delay.position_x = intermediate_higher_delay.position_x
  AND higher_delay.position_y = intermediate_higher_delay.position_y
  AND higher_delay.unixtimems > intermediate_higher_delay.unixtimems
  AND previous_higher_delay.unixtimems < intermediate_higher_delay.unixtimems
  AND intermediate_higher_delay.delay > 21
WHERE higher_delay.delay > 21
  AND higher_delay.unixtimems > previous_higher_delay.unixtimems
  AND intermediate_higher_delay.razorgore_guid IS NULL
  AND previous_higher_delay.delay > 21;

WITH
creature_create_time AS (
  SELECT unixtimems, guid, position_x, position_y FROM creature_create1_time
  UNION ALL
  SELECT unixtimems, guid, position_x, position_y FROM creature_create2_time
),
first_possess AS (
  SELECT spell_cast_go_target.target_guid, MIN(unixtimems) unixtimems
  FROM spell_cast_go JOIN spell_cast_go_target ON spell_cast_go.hit_targets_list_id = spell_cast_go_target.list_id
  WHERE spell_cast_go.spell_id = 19832 AND spell_cast_go_target.target_id = 12435
  GROUP BY spell_cast_go_target.target_guid
)
SELECT
  higher_delay_count.razorgore_guid,
  higher_delay_count.position_x,
  higher_delay_count.position_y,
  higher_delay_count.unixtimems,
  higher_delay_count.delay_count,
  COUNT(DISTINCT creature_create_time.guid) - COUNT(DISTINCT COALESCE(creature_death.guid)) creatures_alive
FROM higher_delay_count
JOIN (
  SELECT higher_delay_count.unixtimems spawn_unixtimems, MAX(first_possess.unixtimems) possess_unixtimems
  FROM first_possess
  JOIN higher_delay_count
  WHERE first_possess.unixtimems < higher_delay_count.unixtimems
  GROUP BY higher_delay_count.unixtimems
) most_recent_possess_time ON higher_delay_count.unixtimems = most_recent_possess_time.spawn_unixtimems
JOIN creature_create_time
JOIN creature ON creature_create_time.guid = creature.guid
LEFT JOIN creature_values_update creature_death
  ON higher_delay_count.unixtimems > creature_death.unixtimems
  AND creature_create_time.guid = creature_death.guid
  AND creature_death.current_health = 0
WHERE creature.id IN (12416, 12420, 12422)
  AND higher_delay_count.unixtimems > creature_create_time.unixtimems
  AND most_recent_possess_time.possess_unixtimems < creature_create_time.unixtimems
GROUP BY 
  higher_delay_count.razorgore_guid,
  higher_delay_count.position_x,
  higher_delay_count.position_y,
  higher_delay_count.unixtimems
ORDER BY unixtimems, position_x;

DROP TABLE IF EXISTS higher_delay_count;
DROP TABLE IF EXISTS higher_delay;
CREATE TABLE higher_delay(
  razorgore_guid INT(10) UNSIGNED NOT NULL,
  position_x FLOAT NOT NULL,
  position_y FLOAT NOT NULL,
  unixtimems BIGINT(20) NOT NULL,
  delay SMALLINT UNSIGNED NOT NULL,
  PRIMARY KEY(razorgore_guid, position_x, position_y, unixtimems)
);
CREATE TABLE higher_delay_count(
  razorgore_guid INT(10) UNSIGNED NOT NULL,
  position_x FLOAT NOT NULL,
  position_y FLOAT NOT NULL,
  unixtimems BIGINT(20) NOT NULL,
  previous_unixtimems BIGINT(20) NOT NULL,
  delay_count TINYINT UNSIGNED NOT NULL,
  PRIMARY KEY(razorgore_guid, position_x, position_y, unixtimems),
  FOREIGN KEY(razorgore_guid, position_x, position_y, unixtimems) REFERENCES higher_delay(razorgore_guid, position_x, position_y, unixtimems)
);

-- Final movement of adds. Doesn't include Dragonspawn because they despawn immediately.
SELECT creature_movement_server_combat.*
FROM creature_movement_server_combat
JOIN (SELECT guid, MAX(unixtimems) unixtimems FROM creature_movement_server_combat GROUP BY guid) creature_last_movement_time
  ON creature_movement_server_combat.guid = creature_last_movement_time.guid
  AND creature_movement_server_combat.unixtimems = creature_last_movement_time.unixtimems
JOIN creature ON creature_movement_server_combat.guid = creature.guid
JOIN creature_text
WHERE creature.id IN (12416, 12420)
  AND creature_movement_server_combat.unixtimems > creature_text.unixtimems - 2000
  AND creature_text.entry = 14459
ORDER BY unixtimems, guid, point;

-- Creature time spent fleeing before despawn.
SELECT creature_movement_server_combat.*, creature_destroy_time.unixtimems - creature_movement_server_combat.unixtimems time_fleeing
FROM creature_movement_server_combat
JOIN (SELECT guid, MAX(unixtimems) unixtimems FROM creature_movement_server_combat GROUP BY guid) creature_last_movement_time
  ON creature_movement_server_combat.guid = creature_last_movement_time.guid
  AND creature_movement_server_combat.unixtimems = creature_last_movement_time.unixtimems
JOIN creature ON creature_movement_server_combat.guid = creature.guid
JOIN creature_destroy_time ON creature_movement_server_combat.guid = creature_destroy_time.guid
JOIN creature_text
WHERE creature.id IN (12416, 12420)
  AND creature_movement_server_combat.end_position_x <> 0
  AND creature_movement_server_combat.unixtimems > creature_text.unixtimems - 2000
  AND creature_text.entry = 14459
ORDER BY unixtimems, guid, point;

-- Creature time to despawn after fleeing.
SELECT
  creature.guid,
  creature_destroy_time.unixtimems,
  CAST(creature_destroy_time.unixtimems AS SIGNED INT)
    - (CAST(last_movement_time.unixtimems AS SIGNED INT) + CAST(creature_movement_server_combat.move_time AS SIGNED INT))
    delay
FROM creature
JOIN (SELECT guid, MAX(unixtimems) unixtimems FROM creature_movement_server_combat GROUP BY guid) last_movement_time
  ON creature.guid = last_movement_time.guid
JOIN creature_movement_server_combat
  ON creature.guid = creature_movement_server_combat.guid
  AND last_movement_time.unixtimems = creature_movement_server_combat.unixtimems
JOIN creature_destroy_time
  ON creature.guid = creature_destroy_time.guid
LEFT JOIN creature_values_update creature_death
  ON creature.guid = creature_death.guid AND creature_death.current_health < 2
WHERE creature.id IN (12416, 12420)
  AND creature_death.unixtimems IS NULL
  AND last_movement_time.unixtimems > ((SELECT unixtimems FROM creature_text WHERE entry = 14459) - 2000)
ORDER BY unixtimems;
