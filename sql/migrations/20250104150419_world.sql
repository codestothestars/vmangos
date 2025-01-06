DROP PROCEDURE IF EXISTS add_migration;
DELIMITER ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20250104150419');
IF v = 0 THEN
INSERT INTO `migrations` VALUES ('20250104150419');
-- Add your query below.

--  240: No player alive within 150 yards.
--  Test whether it works when standing in corners.
INSERT `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `flags`) VALUES ( 240, 56,          0,  150, 0, 0x1);
--  241: Black Dragon Egg within 100 yards.
INSERT `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `flags`) VALUES ( 241, 21,     177807,  100, 0, 0x0);
--  242: No Black Dragon Egg within 100 yards.
--  Test whether it works when standing in corners.
INSERT `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `flags`) VALUES ( 242, 21,     177807,  100, 0, 0x1);
--  572: Has aura Possess.
INSERT `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `flags`) VALUES ( 572,  1,      23014,    0, 0, 0x2);
--  573: Last waypoint equals 0.
INSERT `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `flags`) VALUES ( 573, 32,          0,    0, 0, 0x0);
--  574: Last waypoint equals 1.
INSERT `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `flags`) VALUES ( 574, 32,          1,    0, 0, 0x0);
--  575: Last waypoint equals 2.
INSERT `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `flags`) VALUES ( 575, 32,          2,    0, 0, 0x0);
--  576: Last waypoint equals 3.
INSERT `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `flags`) VALUES ( 576, 32,          3,    0, 0, 0x0);
--  577: Last waypoint equals 4.
INSERT `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `flags`) VALUES ( 577, 32,          4,    0, 0, 0x0);
--  578: Last waypoint equals 5.
INSERT `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `flags`) VALUES ( 578, 32,          5,    0, 0, 0x0);
--  579: Last waypoint equals 6.
INSERT `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `flags`) VALUES ( 579, 32,          6,    0, 0, 0x0);
--  580: (573: Last waypoint equals 0) Or (579: Last waypoint equals 6).
INSERT `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `flags`) VALUES ( 580, -2,        573,  579, 0, 0x0);
--  581: Instance data 0 (Razorgore) equals 0 (not started).
INSERT `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `flags`) VALUES ( 581, 34,          0,    0, 0, 0x0);
--  582: Nearby Razorgore within 90 yards
INSERT `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `flags`) VALUES ( 582, 20,      12435,   90, 0, 0x0);
--  583: No nearby Razorgore within 90 yards
INSERT `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `flags`) VALUES ( 583, 20,      12435,   90, 0, 0x1);
--  584: Nearby Razorgore within 70 yards
INSERT `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `flags`) VALUES ( 584, 20,      12435,   70, 0, 0x0);
--  585: No nearby Razorgore within 70 yards
INSERT `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `flags`) VALUES ( 585, 20,      12435,   70, 0, 0x1);
--  586: Nearby Razorgore within 50 yards
INSERT `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `flags`) VALUES ( 586, 20,      12435,   50, 0, 0x0);
--  587: No nearby Razorgore within 50 yards
INSERT `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `flags`) VALUES ( 587, 20,      12435,   50, 0, 0x1);
--  588: Hostile unit within 10 yards
INSERT `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `flags`) VALUES ( 588, 59,         10,    0, 0, 0x0);
--  589: Instance data 26 equal or less than 24
INSERT `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `flags`) VALUES ( 589, 34,         26,   24, 2, 0x0);
--  590: Instance data 26 equal or higher than 25
INSERT `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `flags`) VALUES ( 590, 34,         26,   25, 1, 0x0);
--  591: Instance data 27 equal to 1
INSERT `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `flags`) VALUES ( 591, 34,         27,    1, 0, 0x0);
--  592: Does not have unit state CONFUSED | POSSESSED | STUNNED
INSERT `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `flags`) VALUES ( 592, 60, 0x00000248,    0, 0, 0x1);
-- 8302: Map event 8302 (Razorgore) is active
INSERT `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `flags`) VALUES (8302, 36,       8302,    0, 0, 0x0);
-- 8303: (241: Black Dragon Egg within 100 yards) And (8302: Map event 8302 (Razorgore) is active)
INSERT `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `flags`) VALUES (8303, -1,        241, 8302, 0, 0x0);
-- 8304: (242: No Black Dragon Egg within 100 yards) And (8302: Map event 8302 (Razorgore) is active)
INSERT `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `flags`) VALUES (8304, -1,        242, 8302, 0, 0x0);
-- 8305: (589: Instance data 26 equal or less than 24) And (8303: (241: Black Dragon Egg within 100 yards) And (8302: Map event 8302 (Razorgore) is active))
INSERT `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `flags`) VALUES (8305, -1,        589, 8303, 0, 0x0);

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
(  1881, 14449,   469,     -7615.51,     -1025.58,      413.465,       5.23599,             604800,             604800,                 0,              100,            100);

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
(8302004,       0,        39,    8302003,           0,           0,           0,             0,               0,               0,         0x00,       100,          0,          0,     0   ,     0    ,   0    ,  0 ,            582, 'Razorgore Event Spawning Adds - Initial Movement (North) - Move to Razorgore'),
(8302004,       0,        60,          3,           1,           0,           0,             0,               0,               0,         0x00,         0,     830204,          0,     0   ,     0    ,   0    ,  0 ,            583, 'Razorgore Event Spawning Adds - Initial Movement (North) - Move to Altar'),
(8302005,       0,        39,    8302003,           0,           0,           0,             0,               0,               0,         0x00,       100,          0,          0,     0   ,     0    ,   0    ,  0 ,            582, 'Razorgore Event Spawning Adds - Initial Movement (East) - Move to Razorgore'),
(8302005,       0,        60,          3,           1,           0,           0,             0,               0,               0,         0x00,         0,     830205,          0,     0   ,     0    ,   0    ,  0 ,            583, 'Razorgore Event Spawning Adds - Initial Movement (East) - Move to Altar'),
(8302006,       0,        39,    8302003,           0,           0,           0,             0,               0,               0,         0x00,       100,          0,          0,     0   ,     0    ,   0    ,  0 ,            584, 'Razorgore Event Spawning Adds - Initial Movement (East South) - Move to Razorgore'),
(8302006,       0,        60,          3,           1,           0,           0,             0,               0,               0,         0x00,         0,     830206,          0,     0   ,     0    ,   0    ,  0 ,            585, 'Razorgore Event Spawning Adds - Initial Movement (East South) - Move to Altar'),
(8302007,       0,        39,    8302003,           0,           0,           0,             0,               0,               0,         0x00,       100,          0,          0,     0   ,     0    ,   0    ,  0 ,            586, 'Razorgore Event Spawning Adds - Initial Movement (South East) - Move to Razorgore'),
(8302007,       0,        60,          3,           1,           0,           0,             0,               0,               0,         0x00,         0,     830207,          0,     0   ,     0    ,   0    ,  0 ,            587, 'Razorgore Event Spawning Adds - Initial Movement (South East) - Move to Altar'),
(8302008,       0,        39,    8302003,           0,           0,           0,             0,               0,               0,         0x00,       100,          0,          0,     0   ,     0    ,   0    ,  0 ,            586, 'Razorgore Event Spawning Adds - Initial Movement (South) - Move to Razorgore'),
(8302008,       0,        60,          3,           1,           0,           0,             0,               0,               0,         0x00,         0,     830208,          0,     0   ,     0    ,   0    ,  0 ,            587, 'Razorgore Event Spawning Adds - Initial Movement (South) - Move to Altar'),
(8302009,       0,        39,    8302003,           0,           0,           0,             0,               0,               0,         0x00,       100,          0,          0,     0   ,     0    ,   0    ,  0 ,            586, 'Razorgore Event Spawning Adds - Initial Movement (West) - Move to Razorgore'),
(8302009,       0,        60,          3,           1,           0,           0,             0,               0,               0,         0x00,         0,     830209,          0,     0   ,     0    ,   0    ,  0 ,            587, 'Razorgore Event Spawning Adds - Initial Movement (West) - Move to Altar'),
(8302010,       0,        39,    8302003,           0,           0,           0,             0,               0,               0,         0x00,       100,          0,          0,     0   ,     0    ,   0    ,  0 ,            586, 'Razorgore Event Spawning Adds - Initial Movement (West North) - Move to Razorgore'),
(8302010,       0,        60,          3,           1,           0,           0,             0,               0,               0,         0x00,         0,     830210,          0,     0   ,     0    ,   0    ,  0 ,            587, 'Razorgore Event Spawning Adds - Initial Movement (West North) - Move to Altar'),
(8302011,       0,        39,    8302003,           0,           0,           0,             0,               0,               0,         0x00,       100,          0,          0,     0   ,     0    ,   0    ,  0 ,            584, 'Razorgore Event Spawning Adds - Initial Movement (North West) - Move to Razorgore'),
(8302011,       0,        60,          3,           1,           0,           0,             0,               0,               0,         0x00,         0,     830211,          0,     0   ,     0    ,   0    ,  0 ,            585, 'Razorgore Event Spawning Adds - Initial Movement (North West) - Move to Altar'),
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
(8302045,      15,        39,    8302046,           0,           0,           0,             0,               0,               0,         0x00,       100,          0,          0,     0   ,     0    ,   0    ,  0 ,           8303, 'Razorgore Event Spawning Adds - Summon Creature - North 1 - Summon Next'),
(8302046,       0,        39,    8302037,           0,           0,           0,             0,               0,               0,         0x00,       100,          0,          0,     0   ,     0    ,   0    ,  0 ,            589, 'Razorgore Event Spawning Adds - Summon Creature - North 2 (fewer than 25 alive) - Summon'),
(8302046,      15,        39,    8302049,           0,           0,           0,             0,               0,               0,         0x00,       100,          0,          0,     0   ,     0    ,   0    ,  0 ,           8305, 'Razorgore Event Spawning Adds - Summon Creature - North 2 (fewer than 25 alive) - Summon Next'),
(8302044,       0,        39,    8302036,           0,           0,           0,             0,               0,               0,         0x00,       100,          0,          0,     0   ,     0    ,   0    ,  0 ,              0, 'Razorgore Event Spawning Adds - Increment Creature Count - North West'),
(8302045,       0,        39,    8302037,           0,           0,           0,             0,               0,               0,         0x00,       100,          0,          0,     0   ,     0    ,   0    ,  0 ,              0, 'Razorgore Event Spawning Adds - Summon Creature - North 1 - Summon'),
(8302046,       0,        39,    8302047,     8302048,           0,           0,             0,               0,               0,         0x00,        75,         25,          0,     0   ,     0    ,   0    ,  0 ,            590, 'Razorgore Event Spawning Adds - Summon Creature - North 2 (25 or more alive) - Summon Delayed or Immediately'),
(8302047,      15,        39,    8302037,           0,           0,           0,             0,               0,               0,         0x00,       100,          0,          0,     0   ,     0    ,   0    ,  0 ,           8303, 'Razorgore Event Spawning Adds - Summon Creature - North 2 (25 or more alive) - Summon Delayed'),
(8302047,      30,        39,    8302045,           0,           0,           0,             0,               0,               0,         0x00,       100,          0,          0,     0   ,     0    ,   0    ,  0 ,           8303, 'Razorgore Event Spawning Adds - Summon Creature - North 2 (25 or more alive) - Summon First'),
(8302048,       0,        39,    8302037,           0,           0,           0,             0,               0,               0,         0x00,       100,          0,          0,     0   ,     0    ,   0    ,  0 ,              0, 'Razorgore Event Spawning Adds - Summon Creature - North 2 (25 or more alive) - Summon Immediately'),
(8302048,      15,        39,    8302049,           0,           0,           0,             0,               0,               0,         0x00,       100,          0,          0,     0   ,     0    ,   0    ,  0 ,           8303, 'Razorgore Event Spawning Adds - Summon Creature - North 2 (25 or more alive) - Summon Next'),
(8302049,       0,        39,    8302037,           0,           0,           0,             0,               0,               0,         0x00,       100,          0,          0,     0   ,     0    ,   0    ,  0 ,              0, 'Razorgore Event Spawning Adds - Summon Creature - North 3 - Summon'),
(8302049,      15,        39,    8302050,           0,           0,           0,             0,               0,               0,         0x00,       100,          0,          0,     0   ,     0    ,   0    ,  0 ,           8303, 'Razorgore Event Spawning Adds - Summon Creature - North 3 - Summon Next'),
(8302050,       0,        39,    8302051,     8302052,           0,           0,             0,               0,               0,         0x00,        44,         56,          0,     0   ,     0    ,   0    ,  0 ,              0, 'Razorgore Event Spawning Adds - Summon Creature - North 4 - Summon Delayed or Immediately'),
(8302051,      15,        39,    8302037,           0,           0,           0,             0,               0,               0,         0x00,       100,          0,          0,     0   ,     0    ,   0    ,  0 ,           8303, 'Razorgore Event Spawning Adds - Summon Creature - North 4 - Summon Delayed'),
(8302051,      30,        39,    8302045,           0,           0,           0,             0,               0,               0,         0x00,       100,          0,          0,     0   ,     0    ,   0    ,  0 ,           8303, 'Razorgore Event Spawning Adds - Summon Creature - North 4 - Summon First'),
(8302052,       0,        39,    8302037,           0,           0,           0,             0,               0,               0,         0x00,       100,          0,          0,     0   ,     0    ,   0    ,  0 ,              0, 'Razorgore Event Spawning Adds - Summon Creature - North 4 - Summon Immediately'),
(8302052,      15,        39,    8302053,           0,           0,           0,             0,               0,               0,         0x00,       100,          0,          0,     0   ,     0    ,   0    ,  0 ,           8303, 'Razorgore Event Spawning Adds - Summon Creature - North 4 - Summon Next'),
(8302053,       0,        39,    8302054,     8302055,           0,           0,             0,               0,               0,         0x00,        79,         21,          0,     0   ,     0    ,   0    ,  0 ,              0, 'Razorgore Event Spawning Adds - Summon Creature - North 5 - Summon Delayed or Immediately'),
(8302054,      15,        39,    8302037,           0,           0,           0,             0,               0,               0,         0x00,       100,          0,          0,     0   ,     0    ,   0    ,  0 ,           8303, 'Razorgore Event Spawning Adds - Summon Creature - North 5 - Summon Delayed'),
(8302054,      30,        39,    8302045,           0,           0,           0,             0,               0,               0,         0x00,       100,          0,          0,     0   ,     0    ,   0    ,  0 ,           8303, 'Razorgore Event Spawning Adds - Summon Creature - North 5 - Summon First'),
(8302055,       0,        39,    8302037,           0,           0,           0,             0,               0,               0,         0x00,       100,          0,          0,     0   ,     0    ,   0    ,  0 ,              0, 'Razorgore Event Spawning Adds - Summon Creature - North 5 - Summon Immediately'),
(8302055,      15,        39,    8302056,           0,           0,           0,             0,               0,               0,         0x00,       100,          0,          0,     0   ,     0    ,   0    ,  0 ,           8303, 'Razorgore Event Spawning Adds - Summon Creature - North 5 - Summon Next'),
(8302056,      15,        39,    8302037,           0,           0,           0,             0,               0,               0,         0x00,       100,          0,          0,     0   ,     0    ,   0    ,  0 ,           8303, 'Razorgore Event Spawning Adds - Summon Creature - North 6 - Summon Delayed'),
(8302057,      15,        39,    8302058,           0,           0,           0,             0,               0,               0,         0x00,       100,          0,          0,     0   ,     0    ,   0    ,  0 ,           8303, 'Razorgore Event Spawning Adds - Summon Creature - East 1 - Summon Next'),
(8302058,       0,        39,    8302038,           0,           0,           0,             0,               0,               0,         0x00,       100,          0,          0,     0   ,     0    ,   0    ,  0 ,            589, 'Razorgore Event Spawning Adds - Summon Creature - East 2 (fewer than 25 alive) - Summon'),
(8302058,      15,        39,    8302061,           0,           0,           0,             0,               0,               0,         0x00,       100,          0,          0,     0   ,     0    ,   0    ,  0 ,           8305, 'Razorgore Event Spawning Adds - Summon Creature - East 2 (fewer than 25 alive) - Summon Next'),
(8302056,      30,        39,    8302045,           0,           0,           0,             0,               0,               0,         0x00,       100,          0,          0,     0   ,     0    ,   0    ,  0 ,           8303, 'Razorgore Event Spawning Adds - Summon Creature - North 6 - Summon First'),
(8302057,       0,        39,    8302038,           0,           0,           0,             0,               0,               0,         0x00,       100,          0,          0,     0   ,     0    ,   0    ,  0 ,              0, 'Razorgore Event Spawning Adds - Summon Creature - East 1 - Summon'),
(8302058,       0,        39,    8302059,     8302060,           0,           0,             0,               0,               0,         0x00,        75,         25,          0,     0   ,     0    ,   0    ,  0 ,            590, 'Razorgore Event Spawning Adds - Summon Creature - East 2 (25 or more alive) - Summon Delayed or Immediately'),
(8302059,      15,        39,    8302038,           0,           0,           0,             0,               0,               0,         0x00,       100,          0,          0,     0   ,     0    ,   0    ,  0 ,           8303, 'Razorgore Event Spawning Adds - Summon Creature - East 2 (25 or more alive) - Summon Delayed'),
(8302059,      30,        39,    8302057,           0,           0,           0,             0,               0,               0,         0x00,       100,          0,          0,     0   ,     0    ,   0    ,  0 ,           8303, 'Razorgore Event Spawning Adds - Summon Creature - East 2 (25 or more alive) - Summon First'),
(8302060,       0,        39,    8302038,           0,           0,           0,             0,               0,               0,         0x00,       100,          0,          0,     0   ,     0    ,   0    ,  0 ,              0, 'Razorgore Event Spawning Adds - Summon Creature - East 2 (25 or more alive) - Summon Immediately'),
(8302060,      15,        39,    8302061,           0,           0,           0,             0,               0,               0,         0x00,       100,          0,          0,     0   ,     0    ,   0    ,  0 ,           8303, 'Razorgore Event Spawning Adds - Summon Creature - East 2 (25 or more alive) - Summon Next'),
(8302061,       0,        39,    8302038,           0,           0,           0,             0,               0,               0,         0x00,       100,          0,          0,     0   ,     0    ,   0    ,  0 ,              0, 'Razorgore Event Spawning Adds - Summon Creature - East 3 - Summon'),
(8302061,      15,        39,    8302062,           0,           0,           0,             0,               0,               0,         0x00,       100,          0,          0,     0   ,     0    ,   0    ,  0 ,           8303, 'Razorgore Event Spawning Adds - Summon Creature - East 3 - Summon Next'),
(8302062,       0,        39,    8302063,     8302064,           0,           0,             0,               0,               0,         0x00,        44,         56,          0,     0   ,     0    ,   0    ,  0 ,              0, 'Razorgore Event Spawning Adds - Summon Creature - East 4 - Summon Delayed or Immediately'),
(8302063,      15,        39,    8302038,           0,           0,           0,             0,               0,               0,         0x00,       100,          0,          0,     0   ,     0    ,   0    ,  0 ,           8303, 'Razorgore Event Spawning Adds - Summon Creature - East 4 - Summon Delayed'),
(8302063,      30,        39,    8302057,           0,           0,           0,             0,               0,               0,         0x00,       100,          0,          0,     0   ,     0    ,   0    ,  0 ,           8303, 'Razorgore Event Spawning Adds - Summon Creature - East 4 - Summon First'),
(8302064,       0,        39,    8302038,           0,           0,           0,             0,               0,               0,         0x00,       100,          0,          0,     0   ,     0    ,   0    ,  0 ,              0, 'Razorgore Event Spawning Adds - Summon Creature - East 4 - Summon Immediately'),
(8302064,      15,        39,    8302065,           0,           0,           0,             0,               0,               0,         0x00,       100,          0,          0,     0   ,     0    ,   0    ,  0 ,           8303, 'Razorgore Event Spawning Adds - Summon Creature - East 4 - Summon Next'),
(8302065,       0,        39,    8302066,     8302067,           0,           0,             0,               0,               0,         0x00,        79,         21,          0,     0   ,     0    ,   0    ,  0 ,              0, 'Razorgore Event Spawning Adds - Summon Creature - East 5 - Summon Delayed or Immediately'),
(8302066,      15,        39,    8302038,           0,           0,           0,             0,               0,               0,         0x00,       100,          0,          0,     0   ,     0    ,   0    ,  0 ,           8303, 'Razorgore Event Spawning Adds - Summon Creature - East 5 - Summon Delayed'),
(8302066,      30,        39,    8302057,           0,           0,           0,             0,               0,               0,         0x00,       100,          0,          0,     0   ,     0    ,   0    ,  0 ,           8303, 'Razorgore Event Spawning Adds - Summon Creature - East 5 - Summon First'),
(8302067,       0,        39,    8302038,           0,           0,           0,             0,               0,               0,         0x00,       100,          0,          0,     0   ,     0    ,   0    ,  0 ,              0, 'Razorgore Event Spawning Adds - Summon Creature - East 5 - Summon Immediately'),
(8302067,      15,        39,    8302068,           0,           0,           0,             0,               0,               0,         0x00,       100,          0,          0,     0   ,     0    ,   0    ,  0 ,           8303, 'Razorgore Event Spawning Adds - Summon Creature - East 5 - Summon Next'),
(8302068,      15,        39,    8302038,           0,           0,           0,             0,               0,               0,         0x00,       100,          0,          0,     0   ,     0    ,   0    ,  0 ,           8303, 'Razorgore Event Spawning Adds - Summon Creature - East 6 - Summon Delayed'),
(8302069,      15,        39,    8302070,           0,           0,           0,             0,               0,               0,         0x00,       100,          0,          0,     0   ,     0    ,   0    ,  0 ,           8303, 'Razorgore Event Spawning Adds - Summon Creature - East South 1 - Summon Next'),
(8302070,       0,        39,    8302039,           0,           0,           0,             0,               0,               0,         0x00,       100,          0,          0,     0   ,     0    ,   0    ,  0 ,            589, 'Razorgore Event Spawning Adds - Summon Creature - East South 2 (fewer than 25 alive) - Summon'),
(8302070,      15,        39,    8302073,           0,           0,           0,             0,               0,               0,         0x00,       100,          0,          0,     0   ,     0    ,   0    ,  0 ,           8305, 'Razorgore Event Spawning Adds - Summon Creature - East South 2 (fewer than 25 alive) - Summon Next'),
(8302068,      30,        39,    8302057,           0,           0,           0,             0,               0,               0,         0x00,       100,          0,          0,     0   ,     0    ,   0    ,  0 ,           8303, 'Razorgore Event Spawning Adds - Summon Creature - East 6 - Summon First'),
(8302069,       0,        39,    8302039,           0,           0,           0,             0,               0,               0,         0x00,       100,          0,          0,     0   ,     0    ,   0    ,  0 ,              0, 'Razorgore Event Spawning Adds - Summon Creature - East South 1 - Summon'),
(8302070,       0,        39,    8302071,     8302072,           0,           0,             0,               0,               0,         0x00,        75,         25,          0,     0   ,     0    ,   0    ,  0 ,            590, 'Razorgore Event Spawning Adds - Summon Creature - East South 2 (25 or more alive) - Summon Delayed or Immediately'),
(8302071,      15,        39,    8302039,           0,           0,           0,             0,               0,               0,         0x00,       100,          0,          0,     0   ,     0    ,   0    ,  0 ,           8303, 'Razorgore Event Spawning Adds - Summon Creature - East South 2 (25 or more alive) - Summon Delayed'),
(8302071,      30,        39,    8302069,           0,           0,           0,             0,               0,               0,         0x00,       100,          0,          0,     0   ,     0    ,   0    ,  0 ,           8303, 'Razorgore Event Spawning Adds - Summon Creature - East South 2 (25 or more alive) - Summon First'),
(8302072,       0,        39,    8302039,           0,           0,           0,             0,               0,               0,         0x00,       100,          0,          0,     0   ,     0    ,   0    ,  0 ,              0, 'Razorgore Event Spawning Adds - Summon Creature - East South 2 (25 or more alive) - Summon Immediately'),
(8302072,      15,        39,    8302073,           0,           0,           0,             0,               0,               0,         0x00,       100,          0,          0,     0   ,     0    ,   0    ,  0 ,           8303, 'Razorgore Event Spawning Adds - Summon Creature - East South 2 (25 or more alive) - Summon Next'),
(8302073,       0,        39,    8302039,           0,           0,           0,             0,               0,               0,         0x00,       100,          0,          0,     0   ,     0    ,   0    ,  0 ,              0, 'Razorgore Event Spawning Adds - Summon Creature - East South 3 - Summon'),
(8302073,      15,        39,    8302074,           0,           0,           0,             0,               0,               0,         0x00,       100,          0,          0,     0   ,     0    ,   0    ,  0 ,           8303, 'Razorgore Event Spawning Adds - Summon Creature - East South 3 - Summon Next'),
(8302074,       0,        39,    8302075,     8302076,           0,           0,             0,               0,               0,         0x00,        44,         56,          0,     0   ,     0    ,   0    ,  0 ,              0, 'Razorgore Event Spawning Adds - Summon Creature - East South 4 - Summon Delayed or Immediately'),
(8302075,      15,        39,    8302039,           0,           0,           0,             0,               0,               0,         0x00,       100,          0,          0,     0   ,     0    ,   0    ,  0 ,           8303, 'Razorgore Event Spawning Adds - Summon Creature - East South 4 - Summon Delayed'),
(8302075,      30,        39,    8302069,           0,           0,           0,             0,               0,               0,         0x00,       100,          0,          0,     0   ,     0    ,   0    ,  0 ,           8303, 'Razorgore Event Spawning Adds - Summon Creature - East South 4 - Summon First'),
(8302076,       0,        39,    8302039,           0,           0,           0,             0,               0,               0,         0x00,       100,          0,          0,     0   ,     0    ,   0    ,  0 ,              0, 'Razorgore Event Spawning Adds - Summon Creature - East South 4 - Summon Immediately'),
(8302076,      15,        39,    8302077,           0,           0,           0,             0,               0,               0,         0x00,       100,          0,          0,     0   ,     0    ,   0    ,  0 ,           8303, 'Razorgore Event Spawning Adds - Summon Creature - East South 4 - Summon Next'),
(8302077,       0,        39,    8302078,     8302079,           0,           0,             0,               0,               0,         0x00,        79,         21,          0,     0   ,     0    ,   0    ,  0 ,              0, 'Razorgore Event Spawning Adds - Summon Creature - East South 5 - Summon Delayed or Immediately'),
(8302078,      15,        39,    8302039,           0,           0,           0,             0,               0,               0,         0x00,       100,          0,          0,     0   ,     0    ,   0    ,  0 ,           8303, 'Razorgore Event Spawning Adds - Summon Creature - East South 5 - Summon Delayed'),
(8302078,      30,        39,    8302069,           0,           0,           0,             0,               0,               0,         0x00,       100,          0,          0,     0   ,     0    ,   0    ,  0 ,           8303, 'Razorgore Event Spawning Adds - Summon Creature - East South 5 - Summon First'),
(8302079,       0,        39,    8302039,           0,           0,           0,             0,               0,               0,         0x00,       100,          0,          0,     0   ,     0    ,   0    ,  0 ,              0, 'Razorgore Event Spawning Adds - Summon Creature - East South 5 - Summon Immediately'),
(8302079,      15,        39,    8302080,           0,           0,           0,             0,               0,               0,         0x00,       100,          0,          0,     0   ,     0    ,   0    ,  0 ,           8303, 'Razorgore Event Spawning Adds - Summon Creature - East South 5 - Summon Next'),
(8302080,      15,        39,    8302039,           0,           0,           0,             0,               0,               0,         0x00,       100,          0,          0,     0   ,     0    ,   0    ,  0 ,           8303, 'Razorgore Event Spawning Adds - Summon Creature - East South 6 - Summon Delayed'),
(8302081,      15,        39,    8302082,           0,           0,           0,             0,               0,               0,         0x00,       100,          0,          0,     0   ,     0    ,   0    ,  0 ,           8303, 'Razorgore Event Spawning Adds - Summon Creature - South East 1 - Summon Next'),
(8302082,       0,        39,    8302040,           0,           0,           0,             0,               0,               0,         0x00,       100,          0,          0,     0   ,     0    ,   0    ,  0 ,            589, 'Razorgore Event Spawning Adds - Summon Creature - South East 2 (fewer than 25 alive) - Summon'),
(8302082,      15,        39,    8302085,           0,           0,           0,             0,               0,               0,         0x00,       100,          0,          0,     0   ,     0    ,   0    ,  0 ,           8305, 'Razorgore Event Spawning Adds - Summon Creature - South East 2 (fewer than 25 alive) - Summon Next'),
(8302080,      30,        39,    8302069,           0,           0,           0,             0,               0,               0,         0x00,       100,          0,          0,     0   ,     0    ,   0    ,  0 ,           8303, 'Razorgore Event Spawning Adds - Summon Creature - East South 6 - Summon First'),
(8302081,       0,        39,    8302040,           0,           0,           0,             0,               0,               0,         0x00,       100,          0,          0,     0   ,     0    ,   0    ,  0 ,              0, 'Razorgore Event Spawning Adds - Summon Creature - South East 1 - Summon'),
(8302082,       0,        39,    8302083,     8302084,           0,           0,             0,               0,               0,         0x00,        75,         25,          0,     0   ,     0    ,   0    ,  0 ,            590, 'Razorgore Event Spawning Adds - Summon Creature - South East 2 (25 or more alive) - Summon Delayed or Immediately'),
(8302083,      15,        39,    8302040,           0,           0,           0,             0,               0,               0,         0x00,       100,          0,          0,     0   ,     0    ,   0    ,  0 ,           8303, 'Razorgore Event Spawning Adds - Summon Creature - South East 2 (25 or more alive) - Summon Delayed'),
(8302083,      30,        39,    8302081,           0,           0,           0,             0,               0,               0,         0x00,       100,          0,          0,     0   ,     0    ,   0    ,  0 ,           8303, 'Razorgore Event Spawning Adds - Summon Creature - South East 2 (25 or more alive) - Summon First'),
(8302084,       0,        39,    8302040,           0,           0,           0,             0,               0,               0,         0x00,       100,          0,          0,     0   ,     0    ,   0    ,  0 ,              0, 'Razorgore Event Spawning Adds - Summon Creature - South East 2 (25 or more alive) - Summon Immediately'),
(8302084,      15,        39,    8302085,           0,           0,           0,             0,               0,               0,         0x00,       100,          0,          0,     0   ,     0    ,   0    ,  0 ,           8303, 'Razorgore Event Spawning Adds - Summon Creature - South East 2 (25 or more alive) - Summon Next'),
(8302085,       0,        39,    8302040,           0,           0,           0,             0,               0,               0,         0x00,       100,          0,          0,     0   ,     0    ,   0    ,  0 ,              0, 'Razorgore Event Spawning Adds - Summon Creature - South East 3 - Summon'),
(8302085,      15,        39,    8302086,           0,           0,           0,             0,               0,               0,         0x00,       100,          0,          0,     0   ,     0    ,   0    ,  0 ,           8303, 'Razorgore Event Spawning Adds - Summon Creature - South East 3 - Summon Next'),
(8302086,       0,        39,    8302087,     8302088,           0,           0,             0,               0,               0,         0x00,        44,         56,          0,     0   ,     0    ,   0    ,  0 ,              0, 'Razorgore Event Spawning Adds - Summon Creature - South East 4 - Summon Delayed or Immediately'),
(8302087,      15,        39,    8302040,           0,           0,           0,             0,               0,               0,         0x00,       100,          0,          0,     0   ,     0    ,   0    ,  0 ,           8303, 'Razorgore Event Spawning Adds - Summon Creature - South East 4 - Summon Delayed'),
(8302087,      30,        39,    8302081,           0,           0,           0,             0,               0,               0,         0x00,       100,          0,          0,     0   ,     0    ,   0    ,  0 ,           8303, 'Razorgore Event Spawning Adds - Summon Creature - South East 4 - Summon First'),
(8302088,       0,        39,    8302040,           0,           0,           0,             0,               0,               0,         0x00,       100,          0,          0,     0   ,     0    ,   0    ,  0 ,              0, 'Razorgore Event Spawning Adds - Summon Creature - South East 4 - Summon Immediately'),
(8302088,      15,        39,    8302089,           0,           0,           0,             0,               0,               0,         0x00,       100,          0,          0,     0   ,     0    ,   0    ,  0 ,           8303, 'Razorgore Event Spawning Adds - Summon Creature - South East 4 - Summon Next'),
(8302089,       0,        39,    8302090,     8302091,           0,           0,             0,               0,               0,         0x00,        79,         21,          0,     0   ,     0    ,   0    ,  0 ,              0, 'Razorgore Event Spawning Adds - Summon Creature - South East 5 - Summon Delayed or Immediately'),
(8302090,      15,        39,    8302040,           0,           0,           0,             0,               0,               0,         0x00,       100,          0,          0,     0   ,     0    ,   0    ,  0 ,           8303, 'Razorgore Event Spawning Adds - Summon Creature - South East 5 - Summon Delayed'),
(8302090,      30,        39,    8302081,           0,           0,           0,             0,               0,               0,         0x00,       100,          0,          0,     0   ,     0    ,   0    ,  0 ,           8303, 'Razorgore Event Spawning Adds - Summon Creature - South East 5 - Summon First'),
(8302091,       0,        39,    8302040,           0,           0,           0,             0,               0,               0,         0x00,       100,          0,          0,     0   ,     0    ,   0    ,  0 ,              0, 'Razorgore Event Spawning Adds - Summon Creature - South East 5 - Summon Immediately'),
(8302091,      15,        39,    8302092,           0,           0,           0,             0,               0,               0,         0x00,       100,          0,          0,     0   ,     0    ,   0    ,  0 ,           8303, 'Razorgore Event Spawning Adds - Summon Creature - South East 5 - Summon Next'),
(8302092,      15,        39,    8302040,           0,           0,           0,             0,               0,               0,         0x00,       100,          0,          0,     0   ,     0    ,   0    ,  0 ,           8303, 'Razorgore Event Spawning Adds - Summon Creature - South East 6 - Summon Delayed'),
(8302093,      15,        39,    8302094,           0,           0,           0,             0,               0,               0,         0x00,       100,          0,          0,     0   ,     0    ,   0    ,  0 ,           8303, 'Razorgore Event Spawning Adds - Summon Creature - South 1 - Summon Next'),
(8302094,       0,        39,    8302041,           0,           0,           0,             0,               0,               0,         0x00,       100,          0,          0,     0   ,     0    ,   0    ,  0 ,            589, 'Razorgore Event Spawning Adds - Summon Creature - South 2 (fewer than 25 alive) - Summon'),
(8302094,      15,        39,    8302097,           0,           0,           0,             0,               0,               0,         0x00,       100,          0,          0,     0   ,     0    ,   0    ,  0 ,           8305, 'Razorgore Event Spawning Adds - Summon Creature - South 2 (fewer than 25 alive) - Summon Next'),
(8302092,      30,        39,    8302081,           0,           0,           0,             0,               0,               0,         0x00,       100,          0,          0,     0   ,     0    ,   0    ,  0 ,           8303, 'Razorgore Event Spawning Adds - Summon Creature - South East 6 - Summon First'),
(8302093,       0,        39,    8302041,           0,           0,           0,             0,               0,               0,         0x00,       100,          0,          0,     0   ,     0    ,   0    ,  0 ,              0, 'Razorgore Event Spawning Adds - Summon Creature - South 1 - Summon'),
(8302094,       0,        39,    8302095,     8302096,           0,           0,             0,               0,               0,         0x00,        75,         25,          0,     0   ,     0    ,   0    ,  0 ,            590, 'Razorgore Event Spawning Adds - Summon Creature - South 2 (25 or more alive) - Summon Delayed or Immediately'),
(8302095,      15,        39,    8302041,           0,           0,           0,             0,               0,               0,         0x00,       100,          0,          0,     0   ,     0    ,   0    ,  0 ,           8303, 'Razorgore Event Spawning Adds - Summon Creature - South 2 (25 or more alive) - Summon Delayed'),
(8302095,      30,        39,    8302093,           0,           0,           0,             0,               0,               0,         0x00,       100,          0,          0,     0   ,     0    ,   0    ,  0 ,           8303, 'Razorgore Event Spawning Adds - Summon Creature - South 2 (25 or more alive) - Summon First'),
(8302096,       0,        39,    8302041,           0,           0,           0,             0,               0,               0,         0x00,       100,          0,          0,     0   ,     0    ,   0    ,  0 ,              0, 'Razorgore Event Spawning Adds - Summon Creature - South 2 (25 or more alive) - Summon Immediately'),
(8302096,      15,        39,    8302097,           0,           0,           0,             0,               0,               0,         0x00,       100,          0,          0,     0   ,     0    ,   0    ,  0 ,           8303, 'Razorgore Event Spawning Adds - Summon Creature - South 2 (25 or more alive) - Summon Next'),
(8302097,       0,        39,    8302041,           0,           0,           0,             0,               0,               0,         0x00,       100,          0,          0,     0   ,     0    ,   0    ,  0 ,              0, 'Razorgore Event Spawning Adds - Summon Creature - South 3 - Summon'),
(8302097,      15,        39,    8302098,           0,           0,           0,             0,               0,               0,         0x00,       100,          0,          0,     0   ,     0    ,   0    ,  0 ,           8303, 'Razorgore Event Spawning Adds - Summon Creature - South 3 - Summon Next'),
(8302098,       0,        39,    8302099,     8302100,           0,           0,             0,               0,               0,         0x00,        44,         56,          0,     0   ,     0    ,   0    ,  0 ,              0, 'Razorgore Event Spawning Adds - Summon Creature - South 4 - Summon Delayed or Immediately'),
(8302099,      15,        39,    8302041,           0,           0,           0,             0,               0,               0,         0x00,       100,          0,          0,     0   ,     0    ,   0    ,  0 ,           8303, 'Razorgore Event Spawning Adds - Summon Creature - South 4 - Summon Delayed'),
(8302099,      30,        39,    8302093,           0,           0,           0,             0,               0,               0,         0x00,       100,          0,          0,     0   ,     0    ,   0    ,  0 ,           8303, 'Razorgore Event Spawning Adds - Summon Creature - South 4 - Summon First'),
(8302100,       0,        39,    8302041,           0,           0,           0,             0,               0,               0,         0x00,       100,          0,          0,     0   ,     0    ,   0    ,  0 ,              0, 'Razorgore Event Spawning Adds - Summon Creature - South 4 - Summon Immediately'),
(8302100,      15,        39,    8302101,           0,           0,           0,             0,               0,               0,         0x00,       100,          0,          0,     0   ,     0    ,   0    ,  0 ,           8303, 'Razorgore Event Spawning Adds - Summon Creature - South 4 - Summon Next'),
(8302101,       0,        39,    8302102,     8302103,           0,           0,             0,               0,               0,         0x00,        79,         21,          0,     0   ,     0    ,   0    ,  0 ,              0, 'Razorgore Event Spawning Adds - Summon Creature - South 5 - Summon Delayed or Immediately'),
(8302102,      15,        39,    8302041,           0,           0,           0,             0,               0,               0,         0x00,       100,          0,          0,     0   ,     0    ,   0    ,  0 ,           8303, 'Razorgore Event Spawning Adds - Summon Creature - South 5 - Summon Delayed'),
(8302102,      30,        39,    8302093,           0,           0,           0,             0,               0,               0,         0x00,       100,          0,          0,     0   ,     0    ,   0    ,  0 ,           8303, 'Razorgore Event Spawning Adds - Summon Creature - South 5 - Summon First'),
(8302103,       0,        39,    8302041,           0,           0,           0,             0,               0,               0,         0x00,       100,          0,          0,     0   ,     0    ,   0    ,  0 ,              0, 'Razorgore Event Spawning Adds - Summon Creature - South 5 - Summon Immediately'),
(8302103,      15,        39,    8302104,           0,           0,           0,             0,               0,               0,         0x00,       100,          0,          0,     0   ,     0    ,   0    ,  0 ,           8303, 'Razorgore Event Spawning Adds - Summon Creature - South 5 - Summon Next'),
(8302104,      15,        39,    8302041,           0,           0,           0,             0,               0,               0,         0x00,       100,          0,          0,     0   ,     0    ,   0    ,  0 ,           8303, 'Razorgore Event Spawning Adds - Summon Creature - South 6 - Summon Delayed'),
(8302105,      15,        39,    8302106,           0,           0,           0,             0,               0,               0,         0x00,       100,          0,          0,     0   ,     0    ,   0    ,  0 ,           8303, 'Razorgore Event Spawning Adds - Summon Creature - West 1 - Summon Next'),
(8302106,       0,        39,    8302042,           0,           0,           0,             0,               0,               0,         0x00,       100,          0,          0,     0   ,     0    ,   0    ,  0 ,            589, 'Razorgore Event Spawning Adds - Summon Creature - West 2 (fewer than 25 alive) - Summon'),
(8302106,      15,        39,    8302109,           0,           0,           0,             0,               0,               0,         0x00,       100,          0,          0,     0   ,     0    ,   0    ,  0 ,           8305, 'Razorgore Event Spawning Adds - Summon Creature - West 2 (fewer than 25 alive) - Summon Next'),
(8302104,      30,        39,    8302093,           0,           0,           0,             0,               0,               0,         0x00,       100,          0,          0,     0   ,     0    ,   0    ,  0 ,           8303, 'Razorgore Event Spawning Adds - Summon Creature - South 6 - Summon First'),
(8302105,       0,        39,    8302042,           0,           0,           0,             0,               0,               0,         0x00,       100,          0,          0,     0   ,     0    ,   0    ,  0 ,              0, 'Razorgore Event Spawning Adds - Summon Creature - West 1 - Summon'),
(8302106,       0,        39,    8302107,     8302108,           0,           0,             0,               0,               0,         0x00,        75,         25,          0,     0   ,     0    ,   0    ,  0 ,            590, 'Razorgore Event Spawning Adds - Summon Creature - West 2 (25 or more alive) - Summon Delayed or Immediately'),
(8302107,      15,        39,    8302042,           0,           0,           0,             0,               0,               0,         0x00,       100,          0,          0,     0   ,     0    ,   0    ,  0 ,           8303, 'Razorgore Event Spawning Adds - Summon Creature - West 2 (25 or more alive) - Summon Delayed'),
(8302107,      30,        39,    8302105,           0,           0,           0,             0,               0,               0,         0x00,       100,          0,          0,     0   ,     0    ,   0    ,  0 ,           8303, 'Razorgore Event Spawning Adds - Summon Creature - West 2 (25 or more alive) - Summon First'),
(8302108,       0,        39,    8302042,           0,           0,           0,             0,               0,               0,         0x00,       100,          0,          0,     0   ,     0    ,   0    ,  0 ,              0, 'Razorgore Event Spawning Adds - Summon Creature - West 2 (25 or more alive) - Summon Immediately'),
(8302108,      15,        39,    8302109,           0,           0,           0,             0,               0,               0,         0x00,       100,          0,          0,     0   ,     0    ,   0    ,  0 ,           8303, 'Razorgore Event Spawning Adds - Summon Creature - West 2 (25 or more alive) - Summon Next'),
(8302109,       0,        39,    8302042,           0,           0,           0,             0,               0,               0,         0x00,       100,          0,          0,     0   ,     0    ,   0    ,  0 ,              0, 'Razorgore Event Spawning Adds - Summon Creature - West 3 - Summon'),
(8302109,      15,        39,    8302110,           0,           0,           0,             0,               0,               0,         0x00,       100,          0,          0,     0   ,     0    ,   0    ,  0 ,           8303, 'Razorgore Event Spawning Adds - Summon Creature - West 3 - Summon Next'),
(8302110,       0,        39,    8302111,     8302112,           0,           0,             0,               0,               0,         0x00,        44,         56,          0,     0   ,     0    ,   0    ,  0 ,              0, 'Razorgore Event Spawning Adds - Summon Creature - West 4 - Summon Delayed or Immediately'),
(8302111,      15,        39,    8302042,           0,           0,           0,             0,               0,               0,         0x00,       100,          0,          0,     0   ,     0    ,   0    ,  0 ,           8303, 'Razorgore Event Spawning Adds - Summon Creature - West 4 - Summon Delayed'),
(8302111,      30,        39,    8302105,           0,           0,           0,             0,               0,               0,         0x00,       100,          0,          0,     0   ,     0    ,   0    ,  0 ,           8303, 'Razorgore Event Spawning Adds - Summon Creature - West 4 - Summon First'),
(8302112,       0,        39,    8302042,           0,           0,           0,             0,               0,               0,         0x00,       100,          0,          0,     0   ,     0    ,   0    ,  0 ,              0, 'Razorgore Event Spawning Adds - Summon Creature - West 4 - Summon Immediately'),
(8302112,      15,        39,    8302113,           0,           0,           0,             0,               0,               0,         0x00,       100,          0,          0,     0   ,     0    ,   0    ,  0 ,           8303, 'Razorgore Event Spawning Adds - Summon Creature - West 4 - Summon Next'),
(8302113,       0,        39,    8302114,     8302115,           0,           0,             0,               0,               0,         0x00,        79,         21,          0,     0   ,     0    ,   0    ,  0 ,              0, 'Razorgore Event Spawning Adds - Summon Creature - West 5 - Summon Delayed or Immediately'),
(8302114,      15,        39,    8302042,           0,           0,           0,             0,               0,               0,         0x00,       100,          0,          0,     0   ,     0    ,   0    ,  0 ,           8303, 'Razorgore Event Spawning Adds - Summon Creature - West 5 - Summon Delayed'),
(8302114,      30,        39,    8302105,           0,           0,           0,             0,               0,               0,         0x00,       100,          0,          0,     0   ,     0    ,   0    ,  0 ,           8303, 'Razorgore Event Spawning Adds - Summon Creature - West 5 - Summon First'),
(8302115,       0,        39,    8302042,           0,           0,           0,             0,               0,               0,         0x00,       100,          0,          0,     0   ,     0    ,   0    ,  0 ,              0, 'Razorgore Event Spawning Adds - Summon Creature - West 5 - Summon Immediately'),
(8302115,      15,        39,    8302116,           0,           0,           0,             0,               0,               0,         0x00,       100,          0,          0,     0   ,     0    ,   0    ,  0 ,           8303, 'Razorgore Event Spawning Adds - Summon Creature - West 5 - Summon Next'),
(8302116,      15,        39,    8302042,           0,           0,           0,             0,               0,               0,         0x00,       100,          0,          0,     0   ,     0    ,   0    ,  0 ,           8303, 'Razorgore Event Spawning Adds - Summon Creature - West 6 - Summon Delayed'),
(8302117,      15,        39,    8302118,           0,           0,           0,             0,               0,               0,         0x00,       100,          0,          0,     0   ,     0    ,   0    ,  0 ,           8303, 'Razorgore Event Spawning Adds - Summon Creature - West North 1 - Summon Next'),
(8302118,       0,        39,    8302043,           0,           0,           0,             0,               0,               0,         0x00,       100,          0,          0,     0   ,     0    ,   0    ,  0 ,            589, 'Razorgore Event Spawning Adds - Summon Creature - West North 2 (fewer than 25 alive) - Summon'),
(8302118,      15,        39,    8302121,           0,           0,           0,             0,               0,               0,         0x00,       100,          0,          0,     0   ,     0    ,   0    ,  0 ,           8305, 'Razorgore Event Spawning Adds - Summon Creature - West North 2 (fewer than 25 alive) - Summon Next'),
(8302116,      30,        39,    8302105,           0,           0,           0,             0,               0,               0,         0x00,       100,          0,          0,     0   ,     0    ,   0    ,  0 ,           8303, 'Razorgore Event Spawning Adds - Summon Creature - West 6 - Summon First'),
(8302117,       0,        39,    8302043,           0,           0,           0,             0,               0,               0,         0x00,       100,          0,          0,     0   ,     0    ,   0    ,  0 ,              0, 'Razorgore Event Spawning Adds - Summon Creature - West North 1 - Summon'),
(8302118,       0,        39,    8302119,     8302120,           0,           0,             0,               0,               0,         0x00,        75,         25,          0,     0   ,     0    ,   0    ,  0 ,            590, 'Razorgore Event Spawning Adds - Summon Creature - West North 2 (25 or more alive) - Summon Delayed or Immediately'),
(8302119,      15,        39,    8302043,           0,           0,           0,             0,               0,               0,         0x00,       100,          0,          0,     0   ,     0    ,   0    ,  0 ,           8303, 'Razorgore Event Spawning Adds - Summon Creature - West North 2 (25 or more alive) - Summon Delayed'),
(8302119,      30,        39,    8302117,           0,           0,           0,             0,               0,               0,         0x00,       100,          0,          0,     0   ,     0    ,   0    ,  0 ,           8303, 'Razorgore Event Spawning Adds - Summon Creature - West North 2 (25 or more alive) - Summon First'),
(8302120,       0,        39,    8302043,           0,           0,           0,             0,               0,               0,         0x00,       100,          0,          0,     0   ,     0    ,   0    ,  0 ,              0, 'Razorgore Event Spawning Adds - Summon Creature - West North 2 (25 or more alive) - Summon Immediately'),
(8302120,      15,        39,    8302121,           0,           0,           0,             0,               0,               0,         0x00,       100,          0,          0,     0   ,     0    ,   0    ,  0 ,           8303, 'Razorgore Event Spawning Adds - Summon Creature - West North 2 (25 or more alive) - Summon Next'),
(8302121,       0,        39,    8302043,           0,           0,           0,             0,               0,               0,         0x00,       100,          0,          0,     0   ,     0    ,   0    ,  0 ,              0, 'Razorgore Event Spawning Adds - Summon Creature - West North 3 - Summon'),
(8302121,      15,        39,    8302122,           0,           0,           0,             0,               0,               0,         0x00,       100,          0,          0,     0   ,     0    ,   0    ,  0 ,           8303, 'Razorgore Event Spawning Adds - Summon Creature - West North 3 - Summon Next'),
(8302122,       0,        39,    8302123,     8302124,           0,           0,             0,               0,               0,         0x00,        44,         56,          0,     0   ,     0    ,   0    ,  0 ,              0, 'Razorgore Event Spawning Adds - Summon Creature - West North 4 - Summon Delayed or Immediately'),
(8302123,      15,        39,    8302043,           0,           0,           0,             0,               0,               0,         0x00,       100,          0,          0,     0   ,     0    ,   0    ,  0 ,           8303, 'Razorgore Event Spawning Adds - Summon Creature - West North 4 - Summon Delayed'),
(8302123,      30,        39,    8302117,           0,           0,           0,             0,               0,               0,         0x00,       100,          0,          0,     0   ,     0    ,   0    ,  0 ,           8303, 'Razorgore Event Spawning Adds - Summon Creature - West North 4 - Summon First'),
(8302124,       0,        39,    8302043,           0,           0,           0,             0,               0,               0,         0x00,       100,          0,          0,     0   ,     0    ,   0    ,  0 ,              0, 'Razorgore Event Spawning Adds - Summon Creature - West North 4 - Summon Immediately'),
(8302124,      15,        39,    8302125,           0,           0,           0,             0,               0,               0,         0x00,       100,          0,          0,     0   ,     0    ,   0    ,  0 ,           8303, 'Razorgore Event Spawning Adds - Summon Creature - West North 4 - Summon Next'),
(8302125,       0,        39,    8302126,     8302127,           0,           0,             0,               0,               0,         0x00,        79,         21,          0,     0   ,     0    ,   0    ,  0 ,              0, 'Razorgore Event Spawning Adds - Summon Creature - West North 5 - Summon Delayed or Immediately'),
(8302126,      15,        39,    8302043,           0,           0,           0,             0,               0,               0,         0x00,       100,          0,          0,     0   ,     0    ,   0    ,  0 ,           8303, 'Razorgore Event Spawning Adds - Summon Creature - West North 5 - Summon Delayed'),
(8302126,      30,        39,    8302117,           0,           0,           0,             0,               0,               0,         0x00,       100,          0,          0,     0   ,     0    ,   0    ,  0 ,           8303, 'Razorgore Event Spawning Adds - Summon Creature - West North 5 - Summon First'),
(8302127,       0,        39,    8302043,           0,           0,           0,             0,               0,               0,         0x00,       100,          0,          0,     0   ,     0    ,   0    ,  0 ,              0, 'Razorgore Event Spawning Adds - Summon Creature - West North 5 - Summon Immediately'),
(8302127,      15,        39,    8302128,           0,           0,           0,             0,               0,               0,         0x00,       100,          0,          0,     0   ,     0    ,   0    ,  0 ,           8303, 'Razorgore Event Spawning Adds - Summon Creature - West North 5 - Summon Next'),
(8302128,      15,        39,    8302043,           0,           0,           0,             0,               0,               0,         0x00,       100,          0,          0,     0   ,     0    ,   0    ,  0 ,           8303, 'Razorgore Event Spawning Adds - Summon Creature - West North 6 - Summon Delayed'),
(8302129,      15,        39,    8302130,           0,           0,           0,             0,               0,               0,         0x00,       100,          0,          0,     0   ,     0    ,   0    ,  0 ,           8303, 'Razorgore Event Spawning Adds - Summon Creature - North West 1 - Summon Next'),
(8302130,       0,        39,    8302044,           0,           0,           0,             0,               0,               0,         0x00,       100,          0,          0,     0   ,     0    ,   0    ,  0 ,            589, 'Razorgore Event Spawning Adds - Summon Creature - North West 2 (fewer than 25 alive) - Summon'),
(8302130,      15,        39,    8302133,           0,           0,           0,             0,               0,               0,         0x00,       100,          0,          0,     0   ,     0    ,   0    ,  0 ,           8305, 'Razorgore Event Spawning Adds - Summon Creature - North West 2 (fewer than 25 alive) - Summon Next'),
(8302128,      30,        39,    8302117,           0,           0,           0,             0,               0,               0,         0x00,       100,          0,          0,     0   ,     0    ,   0    ,  0 ,           8303, 'Razorgore Event Spawning Adds - Summon Creature - West North 6 - Summon First'),
(8302129,       0,        39,    8302044,           0,           0,           0,             0,               0,               0,         0x00,       100,          0,          0,     0   ,     0    ,   0    ,  0 ,              0, 'Razorgore Event Spawning Adds - Summon Creature - North West 1 - Summon'),
(8302130,       0,        39,    8302131,     8302132,           0,           0,             0,               0,               0,         0x00,        75,         25,          0,     0   ,     0    ,   0    ,  0 ,            590, 'Razorgore Event Spawning Adds - Summon Creature - North West 2 (25 or more alive) - Summon Delayed or Immediately'),
(8302131,      15,        39,    8302044,           0,           0,           0,             0,               0,               0,         0x00,       100,          0,          0,     0   ,     0    ,   0    ,  0 ,           8303, 'Razorgore Event Spawning Adds - Summon Creature - North West 2 (25 or more alive) - Summon Delayed'),
(8302131,      30,        39,    8302129,           0,           0,           0,             0,               0,               0,         0x00,       100,          0,          0,     0   ,     0    ,   0    ,  0 ,           8303, 'Razorgore Event Spawning Adds - Summon Creature - North West 2 (25 or more alive) - Summon First'),
(8302132,       0,        39,    8302044,           0,           0,           0,             0,               0,               0,         0x00,       100,          0,          0,     0   ,     0    ,   0    ,  0 ,              0, 'Razorgore Event Spawning Adds - Summon Creature - North West 2 (25 or more alive) - Summon Immediately'),
(8302132,      15,        39,    8302133,           0,           0,           0,             0,               0,               0,         0x00,       100,          0,          0,     0   ,     0    ,   0    ,  0 ,           8303, 'Razorgore Event Spawning Adds - Summon Creature - North West 2 (25 or more alive) - Summon Next'),
(8302133,       0,        39,    8302044,           0,           0,           0,             0,               0,               0,         0x00,       100,          0,          0,     0   ,     0    ,   0    ,  0 ,              0, 'Razorgore Event Spawning Adds - Summon Creature - North West 3 - Summon'),
(8302133,      15,        39,    8302134,           0,           0,           0,             0,               0,               0,         0x00,       100,          0,          0,     0   ,     0    ,   0    ,  0 ,           8303, 'Razorgore Event Spawning Adds - Summon Creature - North West 3 - Summon Next'),
(8302134,       0,        39,    8302135,     8302136,           0,           0,             0,               0,               0,         0x00,        44,         56,          0,     0   ,     0    ,   0    ,  0 ,              0, 'Razorgore Event Spawning Adds - Summon Creature - North West 4 - Summon Delayed or Immediately'),
(8302135,      15,        39,    8302044,           0,           0,           0,             0,               0,               0,         0x00,       100,          0,          0,     0   ,     0    ,   0    ,  0 ,           8303, 'Razorgore Event Spawning Adds - Summon Creature - North West 4 - Summon Delayed'),
(8302135,      30,        39,    8302129,           0,           0,           0,             0,               0,               0,         0x00,       100,          0,          0,     0   ,     0    ,   0    ,  0 ,           8303, 'Razorgore Event Spawning Adds - Summon Creature - North West 4 - Summon First'),
(8302136,       0,        39,    8302044,           0,           0,           0,             0,               0,               0,         0x00,       100,          0,          0,     0   ,     0    ,   0    ,  0 ,              0, 'Razorgore Event Spawning Adds - Summon Creature - North West 4 - Summon Immediately'),
(8302136,      15,        39,    8302137,           0,           0,           0,             0,               0,               0,         0x00,       100,          0,          0,     0   ,     0    ,   0    ,  0 ,           8303, 'Razorgore Event Spawning Adds - Summon Creature - North West 4 - Summon Next'),
(8302137,       0,        39,    8302138,     8302139,           0,           0,             0,               0,               0,         0x00,        79,         21,          0,     0   ,     0    ,   0    ,  0 ,              0, 'Razorgore Event Spawning Adds - Summon Creature - North West 5 - Summon Delayed or Immediately'),
(8302138,      15,        39,    8302044,           0,           0,           0,             0,               0,               0,         0x00,       100,          0,          0,     0   ,     0    ,   0    ,  0 ,           8303, 'Razorgore Event Spawning Adds - Summon Creature - North West 5 - Summon Delayed'),
(8302138,      30,        39,    8302129,           0,           0,           0,             0,               0,               0,         0x00,       100,          0,          0,     0   ,     0    ,   0    ,  0 ,           8303, 'Razorgore Event Spawning Adds - Summon Creature - North West 5 - Summon First'),
(8302139,       0,        39,    8302044,           0,           0,           0,             0,               0,               0,         0x00,       100,          0,          0,     0   ,     0    ,   0    ,  0 ,              0, 'Razorgore Event Spawning Adds - Summon Creature - North West 5 - Summon Immediately'),
(8302139,      15,        39,    8302140,           0,           0,           0,             0,               0,               0,         0x00,       100,          0,          0,     0   ,     0    ,   0    ,  0 ,           8303, 'Razorgore Event Spawning Adds - Summon Creature - North West 5 - Summon Next'),
(8302140,      15,        39,    8302044,           0,           0,           0,             0,               0,               0,         0x00,       100,          0,          0,     0   ,     0    ,   0    ,  0 ,           8303, 'Razorgore Event Spawning Adds - Summon Creature - North West 6 - Summon Delayed'),
(8302140,      30,        39,    8302129,           0,           0,           0,             0,               0,               0,         0x00,       100,          0,          0,     0   ,     0    ,   0    ,  0 ,           8303, 'Razorgore Event Spawning Adds - Summon Creature - North West 6 - Summon First'),
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

-- Events list for Blackwing Legionnaire
REPLACE `creature_spells`
(`entry`, `name`,                  `spellId_1`, `probability_1`, `castTarget_1`, `delayInitialMin_1`, `delayInitialMax_1`, `delayRepeatMin_1`, `delayRepeatMax_1`, `spellId_2`, `probability_2`, `castTarget_2`, `delayInitialMin_2`, `delayInitialMax_2`, `delayRepeatMin_2`, `delayRepeatMax_2`, `spellId_3`, `probability_3`, `castTarget_3`, `targetParam1_3`, `targetParam2_3`, `delayInitialMin_3`, `delayInitialMax_3`, `delayRepeatMin_3`, `delayRepeatMax_3`) VALUES
( 124160, 'Blackwing Legionnaire',       15580,             100,              1,                   3,                  16,                  5,                 16,       15754,             100,              1,                   0,                  15,                  6,                 13,       23967,             100,              8,            12435,                5,                   1,                  24,                  6,                 27);
DELETE FROM `creature_ai_events` WHERE `creature_id` = 12416;
INSERT `creature_ai_events`
(   `id`, `creature_id`, `condition_id`, `event_type`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `comment`) VALUES
(1241601,         12416,              0,            6,            100,          0x00,              0,              0,              0,              0,          1241601, 'Blackwing Legionnaire - Death'),
-- Lower this ID at the end as needed.
(1241604,         12416,              0,           21,            100,          0x00,              0,              0,              0,              0,          1241604, 'Blackwing Legionnaire - Reached Home');
REPLACE `creature_ai_scripts`
(   `id`, `command`, `datalong`, `datalong2`, `datalong3`, `dataint`, `comments`) VALUES
(1241601,        37,         26,           1,           2,         0, 'Blackwing Legionnaire - Decrement Creature Count'),
(1241604,        18,          0,           0,           0,         0, 'Blackwing Legionnaire - Despawn');

-- Events list for Blackwing Mage
REPLACE `creature_spells`
(`entry`, `name`,           `spellId_1`, `probability_1`, `castTarget_1`, `delayInitialMin_1`, `delayInitialMax_1`, `delayRepeatMin_1`, `delayRepeatMax_1`) VALUES
( 124200, 'Blackwing Mage',       17290,             100,              1,                   0,                   0,                  3,                 12);
DELETE FROM `creature_ai_events` WHERE `creature_id` = 12420;
INSERT `creature_ai_events`
(  `id`,  `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `comment`) VALUES
(1242001,         12420,            588,            0,                        0x1,          0x01,              0,          22000,           3000,          22000,          1242001, 'Blackwing Mage - In Combat (periodic)'),
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
DELETE FROM `creature_ai_events` WHERE `creature_id` = 12422;
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
-- Note that effect 1 of spell 19873 has a misc value of SPELL_EFFECT_ACTIVATE_OBJECT with implicit target TARGET_GAMEOBJECT_SCRIPT_NEAR_CASTER.
-- Already has a spell_script_target of 177807 (Black Dragon Egg).
-- Video shows that while possessing, an electric beam connects Razorgore to (apparently) the orb. Make sure this is implemented.
DELETE FROM `creature_ai_events` WHERE `creature_id` = 12435;
INSERT `creature_ai_events`
(  `id`,  `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `comment`) VALUES
(1243501,         12435,             572,           1,                          0,          0x01,           6000,          16000,           6000,          16000,          1243501, 'Razorgore the Untamed - Out of Combat (periodic)'),
(1243502,         12435,               0,          23,                          0,          0x01,          19832,              1,              0,              0,          1243502, 'Razorgore the Untamed - Aura'),
-- Not sure if this needs a phase, but it will be obvious if so.
(1243503,         12435,               0,          21,                          0,          0x00,              0,              0,              0,              0,          1243503, 'Razorgore the Untamed - Reached Home'),
(1243504,         12435,             241,           6,                        0b1,          0x00,              0,              0,              0,              0,          1243504, 'Razorgore the Untamed - Death (eggs remain, phase 1)'),
(1243505,         12435,             241,           6,                          0,          0x00,              0,              0,              0,              0,          1243505, 'Razorgore the Untamed - Death (eggs remain, any phase)'),
(1243506,         12435,             242,           6,                          0,          0x00,              0,              0,              0,              0,          1243506, 'Razorgore the Untamed - Death (eggs destroyed)');
INSERT `creature_ai_scripts`
(   `id`, `command`, `datalong`, `datalong2`, `datalong3`, `target_param1`, `target_param2`, `target_type`, `dataint`, `condition_id`, `comments`) VALUES
(1243501,        15,      21389,       0x002,           0,               0,               0,             6,         0,            580, 'Razorgore the Untamed - Cast Fire Channeling'),
(1243501,        60,          0,           1,           0,               0,               0,             0,         0,            580, 'Razorgore the Untamed - Start Waypoint 1'),
(1243501,        60,          0,           2,           0,               0,               0,             0,         0,            574, 'Razorgore the Untamed - Start Waypoint 2'),
(1243501,        60,          0,           3,           0,               0,               0,             0,         0,            575, 'Razorgore the Untamed - Start Waypoint 3'),
(1243501,        60,          0,           4,           0,               0,               0,             0,         0,            576, 'Razorgore the Untamed - Start Waypoint 4'),
(1243501,        60,          0,           5,           0,               0,               0,             0,         0,            577, 'Razorgore the Untamed - Start Waypoint 5'),
(1243501,        60,          0,           6,           0,               0,               0,             0,         0,            578, 'Razorgore the Untamed - Start Waypoint 6'),
(1243502,        37,         27,           0,           0,               0,               0,             0,         0,              0, 'Razorgore the Untamed - Set instance data'),
(1243503,         0,          1,           0,           0,               0,               0,             0,      7980,              0, 'Razorgore the Untamed - Yell (reached home)'),
(1243503,        39,    1243501,           0,           0,               0,               0,             0,       100,              0, 'Razorgore the Untamed - Cast Fireball'),
(1243504,         0,          1,           0,           0,               0,               0,             0,      9591,              0, 'Razorgore the Untamed - Yell (death)'),
-- might need a spell_script_target of Blackwing Orb Trigger for this.
(1243504,        39,    1243501,           0,           0,               0,               0,             0,       100,              0, 'Razorgore the Untamed - Cast Fireball'),
(1243505,        62,       8302,           0,           0,               0,               0,             0,         0,              0, 'Razorgore the Untamed - End Map Event (Failure)'),
(1243506,        62,       8302,           1,           0,               0,               0,             0,         0,              0, 'Razorgore the Untamed - End Map Event (Success)');
REPLACE `creature_spells`
(`entry`, `name`,
                                   `spellId_1`, `castTarget_1`, `targetParam1_1`, `targetParam2_1`, `delayInitialMin_1`, `delayInitialMax_1`, `delayRepeatMin_1`, `delayRepeatMax_1`, 
                                   `spellId_2`, `castTarget_2`, `targetParam1_2`, `targetParam2_2`, `delayInitialMin_2`, `delayInitialMax_2`, `delayRepeatMin_2`, `delayRepeatMax_2`,
                                   `spellId_3`, `castTarget_3`, `targetParam1_3`, `targetParam2_3`, `delayInitialMin_3`, `delayInitialMax_3`, `delayRepeatMin_3`, `delayRepeatMax_3`,
                                   `spellId_4`, `castTarget_4`, `targetParam1_4`, `targetParam2_4`, `delayInitialMin_4`, `delayInitialMax_4`, `delayRepeatMin_4`, `delayRepeatMax_4`,
                                   `spellId_5`, `castTarget_5`, `targetParam1_5`, `targetParam2_5`, `delayInitialMin_5`, `delayInitialMax_5`, `delayRepeatMin_5`, `delayRepeatMax_5`) VALUES
-- STILL NEED TO GET INITIAL DELAYS FROM CATA PTR IF POSSIBLE. Using the repeat delays for now.
( 124350, 'Razorgore the Untamed',       19632,              1,                0,                0,                   8,                  28,                  8,                 28,
                                         19872,             26,            12422,               60,                   6,                  38,                  6,                 38,
                                         22425,              6,                0,                0,                  18,                  44,                 18,                 44,
                                         23023,              6,                0,                0,                  13,                  42,                 13,                 42,
                                         24375,              6,                0,                0,                  22,                  43,                 22,                 43);
REPLACE `generic_scripts`
(   `id`, `priority`, `command`, `datalong`, `comments`) VALUES
(1243501,          0,        44,          1, 'Razorgore the Untamed - Set Phase 1'),
(1243501,          1,        15,      23024, 'Razorgore the Untamed - Cast Fireball');
UPDATE `creature_template` SET `ai_name` = 'EventAI', `auras` = '18943', `script_name` = '', `spell_list_id` = 124350 WHERE `entry` = 12435;

-- Events list for Grethok the Controller
DELETE FROM `creature_ai_events` WHERE `creature_id` = 12557;
INSERT `creature_ai_events`
(  `id`,  `creature_id`, `condition_id`, `event_type`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `comment`) VALUES
(1255701,         12557,            581,            1,          0x00,              0,              0,              0,              0,          1255701, 'Grethok the Controller - Out of Combat'),
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
-- No data for repeating delays on spells 13747 and 14515. Only one data point for 22274.
-- 13747
-- Implicit target A - TARGET_LOCATION_CASTER_SRC
-- Implicit target B - TARGET_ENUM_UNITS_ENEMY_AOE_AT_SRC_LOC
-- Test and make sure it affects all players in a radius.

-- Events list for Blackwing Orb Trigger
-- INSERT `creature_ai_events`
-- (   `id`,  `creature_id`, `condition_id`, `event_type`, `event_param1`, `event_param2`, `action1_script`, `comment`) VALUES;
-- INSERT `creature_ai_scripts`
-- (   `id`, `command`, `datalong`, `comments`) VALUES;
UPDATE `creature_template` SET `ai_name` = 'EventAI' WHERE `entry` = 14449;

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

-- Add missing Blackwing Spell Marker spawns
INSERT `creature`
-- make sure they spawn right away instead of after the default of 120 seconds
-- make sure they don't actually wander by wander_distance
(`guid`,  `id`, `map`, `position_x`, `position_y`, `position_z`,  `orientation`, `patch_min`) VALUES
(  4817, 16604,   469,     -7659.47,     -1043.87,      407.282,       1.65806 ,           4),
(  4818, 16604,   469,     -7626.67,     -1009.63,      413.465,       3.19395 ,           4),
(  4819, 16604,   469,     -7619.05,     -1048.82,      408.24 ,       0.680678,           4),
(  4820, 16604,   469,     -7607.38,     -1115.99,      407.282,       4.92183 ,           4),
(  4821, 16604,   469,     -7599.65,     -1077.8 ,      408.24 ,       3.54302 ,           4),
(  4822, 16604,   469,     -7595.42,     -1053.45,      408.24 ,       3.89208 ,           4),
(  4823, 16604,   469,     -7592.7 ,     -1029.95,      408.24 ,       5.32325 ,           4),
(  4824, 16604,   469,     -7583.24,     - 990.03,      407.282,       2.89725 ,           4),
(  4825, 16604,   469,     -7571.81,     -1058.2 ,      408.24 ,       5.74213 ,           4),
(  4826, 16604,   469,     -7566.78,     -1095.09,      413.465,       4.71239 ,           4),
(  4827, 16604,   469,     -7532.15,     -1062.56,      407.282,       4.72984 ,           4);

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
DELIMITER ;
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;

DELETE FROM conditions WHERE condition_entry BETWEEN 572 AND 592;
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

-- Razorgore encounter starting at end of final Possess
INSERT encounter
SELECT 1 unit_type, creature.guid, last_faction_change.unixtimems, last_value_update.unixtimems
FROM creature
JOIN (
  SELECT guid, MAX(unixtimems) unixtimems FROM creature_values_update WHERE faction IS NOT NULL GROUP BY guid
) last_faction_change ON creature.guid = last_faction_change.guid
JOIN (
  SELECT guid, MAX(unixtimems) unixtimems FROM creature_values_update GROUP BY guid
) last_value_update ON creature.guid = last_value_update.guid
WHERE creature.id = 12435;

-- Razorgore spell delays after final Possess
SET @encounter_creature_id = 12435;
SET @radius = 15;
SET @target_spell_id = 24375;
DROP TABLE IF EXISTS encounter;
DROP TABLE IF EXISTS event_unit_closest_enemy_distance;
DROP TABLE IF EXISTS event_unit_enemy_distance;
DROP TABLE IF EXISTS event_unit_faction_time;
DROP TABLE IF EXISTS event_unit_health_time;
DROP TABLE IF EXISTS event_unit_position;
DROP TABLE IF EXISTS event_unit_last_point;
DROP TABLE IF EXISTS generated_unixtimems;
DROP TABLE IF EXISTS proximity_interval_end_event;
DROP TABLE IF EXISTS proximity_interval_start_event;
DROP TABLE IF EXISTS unit_death;
DROP TABLE IF EXISTS unit_health_update;
DROP TABLE IF EXISTS unit_point;
DROP TABLE IF EXISTS event_unit_faction;
DROP TABLE IF EXISTS unit_movement;
DROP TABLE IF EXISTS event;
CREATE TABLE encounter(
  unit_type TINYINT UNSIGNED NOT NULL,
  guid INT(10) UNSIGNED NOT NULL,
  start_unixtimems BIGINT(20) UNSIGNED NOT NULL,
  end_unixtimems BIGINT(20) UNSIGNED NOT NULL,
  PRIMARY KEY(unit_type, guid),
  FOREIGN KEY(unit_type, guid) REFERENCES unit(unit_type, guid)
);
CREATE TABLE event(
  unixtimems BIGINT(20) UNSIGNED NOT NULL PRIMARY KEY
);
CREATE TABLE event_unit_closest_enemy_distance(
  event_unixtimems BIGINT(20) UNSIGNED NOT NULL REFERENCES event(unixtimems),
  unit_type TINYINT UNSIGNED NOT NULL,
  guid INT(10) UNSIGNED NOT NULL,
  distance FLOAT UNSIGNED NOT NULL,
  PRIMARY KEY(event_unixtimems, unit_type, guid),
  FOREIGN KEY(unit_type, guid) REFERENCES unit(unit_type, guid)
);
CREATE TABLE event_unit_enemy_distance(
  event_unixtimems BIGINT(20) UNSIGNED NOT NULL REFERENCES event(unixtimems),
  unit_type TINYINT UNSIGNED NOT NULL,
  guid INT(10) UNSIGNED NOT NULL,
  enemy_unit_type TINYINT UNSIGNED NOT NULL,
  enemy_guid INT(10) UNSIGNED NOT NULL,
  distance FLOAT UNSIGNED NOT NULL,
  PRIMARY KEY(event_unixtimems, unit_type, guid, enemy_unit_type, enemy_guid),
  FOREIGN KEY(unit_type, guid) REFERENCES unit(unit_type, guid),
  FOREIGN KEY(enemy_unit_type, enemy_guid) REFERENCES unit(unit_type, guid)
);
CREATE TABLE event_unit_faction_time(
  event_unixtimems BIGINT(20) UNSIGNED NOT NULL REFERENCES event(unixtimems),
  unit_type TINYINT UNSIGNED NOT NULL,
  guid INT(10) UNSIGNED NOT NULL,
  update_unixtimems BIGINT(20) UNSIGNED NOT NULL,
  PRIMARY KEY(event_unixtimems, unit_type, guid),
  FOREIGN KEY(unit_type, guid, update_unixtimems) REFERENCES unit_faction_update(unit_type, guid, unixtimems)
);
CREATE TABLE proximity_interval_end_event(
  unit_type TINYINT UNSIGNED NOT NULL,
  guid INT(10) UNSIGNED NOT NULL,
  unixtimems BIGINT(20) UNSIGNED NOT NULL,
  full BIT NOT NULL,
  PRIMARY KEY(unit_type, guid, unixtimems, full),
  FOREIGN KEY(unit_type, guid) REFERENCES unit(unit_type, guid)
);
CREATE TABLE proximity_interval_start_event(
  unit_type TINYINT UNSIGNED NOT NULL,
  guid INT(10) UNSIGNED NOT NULL,
  unixtimems BIGINT(20) UNSIGNED NOT NULL REFERENCES event(unixtimems),
  full BIT NOT NULL,
  PRIMARY KEY(unit_type, guid, unixtimems, full),
  FOREIGN KEY(unit_type, guid) REFERENCES unit(unit_type, guid)
);
CREATE TABLE event_unit_faction(
  event_unixtimems BIGINT(20) UNSIGNED NOT NULL REFERENCES event(unixtimems),
  unit_type TINYINT UNSIGNED NOT NULL,
  guid INT(10) UNSIGNED NOT NULL,
  faction INT(10) UNSIGNED NOT NULL,
  PRIMARY KEY(event_unixtimems, unit_type, guid),
  FOREIGN KEY(unit_type, guid) REFERENCES unit(unit_type, guid)
);
CREATE TABLE event_unit_last_point(
  event_unixtimems BIGINT(20) UNSIGNED NOT NULL REFERENCES event(unixtimems),
  unit_type TINYINT UNSIGNED NOT NULL,
  guid INT(10) UNSIGNED NOT NULL,
  movement_unixtimems BIGINT(20) UNSIGNED NOT NULL,
  point_unixtimems BIGINT(20) UNSIGNED NOT NULL,
  PRIMARY KEY(event_unixtimems, unit_type, guid),
  FOREIGN KEY(unit_type, guid, movement_unixtimems, point_unixtimems)
    REFERENCES unit_point(unit_type, guid, parent_unixtimems, unixtimems)
);
CREATE TABLE event_unit_position(
  event_unixtimems BIGINT(20) UNSIGNED NOT NULL REFERENCES event(unixtimems),
  unit_type TINYINT UNSIGNED NOT NULL,
  guid INT(10) UNSIGNED NOT NULL,
  position_x FLOAT NOT NULL,
  position_y FLOAT NOT NULL,
  position_z FLOAT NOT NULL,
  PRIMARY KEY(event_unixtimems, unit_type, guid),
  FOREIGN KEY(unit_type, guid) REFERENCES unit(unit_type, guid)
);
CREATE TABLE generated_unixtimems(
  unixtimems BIGINT(20) UNSIGNED NOT NULL PRIMARY KEY
);
CREATE TABLE unit_death(
  unit_type TINYINT UNSIGNED NOT NULL,
  guid INT(10) UNSIGNED NOT NULL,
  unixtimems BIGINT(20) UNSIGNED NOT NULL,
  PRIMARY KEY(unit_type, guid, unixtimems),
  FOREIGN KEY(unit_type, guid) REFERENCES unit(unit_type, guid)
);
CREATE TABLE unit_health_update(
  unit_type TINYINT UNSIGNED NOT NULL,
  guid INT(10) UNSIGNED NOT NULL,
  unixtimems BIGINT(20) UNSIGNED NOT NULL,
  current_health INT(10) UNSIGNED NOT NULL,
  PRIMARY KEY (unit_type, guid, unixtimems),
  FOREIGN KEY(unit_type, guid) REFERENCES unit(unit_type, guid),
  INDEX ix_unit_health_update_unixtimems(unixtimems)
);
CREATE TABLE unit_movement(
  unit_type TINYINT UNSIGNED NOT NULL,
  guid INT(10) UNSIGNED NOT NULL,
  unixtimems BIGINT(20) UNSIGNED NOT NULL,
  move_time INT(10) UNSIGNED NOT NULL,
  movement_type TINYINT UNSIGNED NOT NULL,
  spline_count SMALLINT(5) UNSIGNED NOT NULL,
  position_x FLOAT NOT NULL,
  position_y FLOAT NOT NULL,
  position_z FLOAT NOT NULL,
  PRIMARY KEY(unit_type, guid, unixtimems),
  FOREIGN KEY(unit_type, guid) REFERENCES unit(unit_type, guid)
);
CREATE TABLE unit_point(
  unit_type TINYINT UNSIGNED NOT NULL,
  guid INT(10) UNSIGNED NOT NULL,
  parent_unixtimems BIGINT(20) UNSIGNED NOT NULL,
  unixtimems BIGINT(20) UNSIGNED NOT NULL,
  spline_point SMALLINT(5) UNSIGNED NOT NULL,
  position_x FLOAT NOT NULL,
  position_y FLOAT NOT NULL,
  position_z FLOAT NOT NULL,
  PRIMARY KEY(unit_type, guid, parent_unixtimems, unixtimems),
  FOREIGN KEY(unit_type, guid, parent_unixtimems) REFERENCES unit_movement(unit_type, guid, unixtimems)
);
CREATE TABLE event_unit_health_time(
  event_unixtimems BIGINT(20) UNSIGNED NOT NULL REFERENCES event(unixtimems),
  unit_type TINYINT UNSIGNED NOT NULL,
  guid INT(10) UNSIGNED NOT NULL,
  update_unixtimems BIGINT(20) UNSIGNED NOT NULL,
  PRIMARY KEY(event_unixtimems, unit_type, guid),
  FOREIGN KEY(unit_type, guid, update_unixtimems) REFERENCES unit_health_update(unit_type, guid, unixtimems)
);
INSERT unit_death SELECT 1 unit_type, guid, unixtimems FROM creature_values_update WHERE current_health = 0;
INSERT encounter
SELECT 1 unit_type, creature.guid, last_faction_change.unixtimems, unit_death.unixtimems
FROM creature
JOIN (
  SELECT guid, MAX(unixtimems) unixtimems FROM creature_values_update WHERE faction IS NOT NULL GROUP BY guid
) last_faction_change ON creature.guid = last_faction_change.guid
JOIN unit_death ON creature.guid = unit_death.guid
WHERE creature.id = 12435 AND unit_death.unit_type = 1;
SELECT @encounter_intervals := GROUP_CONCAT(
  CONCAT(
    'SELECT seq FROM seq_',
    -- Modulus ensures that overlapping portions of intervals are redundant
    start_unixtimems - start_unixtimems % 250,
    '_to_',
    end_unixtimems - end_unixtimems % 250,
    '_step_250'
  )
  SEPARATOR ' UNION '
) FROM encounter;
CREATE OR REPLACE PROCEDURE p() EXECUTE IMMEDIATE CONCAT('INSERT generated_unixtimems ', @encounter_intervals); CALL p; DROP PROCEDURE p;
INSERT event SELECT * FROM (
  -- Movement time polling
  SELECT unixtimems FROM generated_unixtimems
  UNION
  -- Spell cast
  SELECT spell_cast_go.unixtimems
  FROM spell_cast_go JOIN creature ON spell_cast_go.caster_unit_guid = creature.guid
  WHERE creature.id = @encounter_creature_id AND spell_cast_go.spell_id = @target_spell_id
  UNION
  -- Unit death
  SELECT unit_death.unixtimems
  FROM unit_death JOIN encounter
  WHERE unit_death.unixtimems BETWEEN encounter.start_unixtimems AND encounter.end_unixtimems
  UNION
  -- Unit incapacitate aura remove
  SELECT creature_auras_update.unixtimems
  FROM creature_auras_update JOIN creature ON creature_auras_update.guid = creature.guid
  WHERE creature.id = @encounter_creature_id AND creature_auras_update.spell_id = 0
  UNION
  -- Unit faction change
  SELECT unit_faction_update.unixtimems
  FROM unit_faction_update JOIN encounter
  WHERE unit_faction_update.unixtimems BETWEEN encounter.start_unixtimems AND encounter.end_unixtimems
) event;
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
WHERE unit_health_update.current_health IS NOT NULL;
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
  unit_movement.unixtimems IN (
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
  );
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
INSERT event_unit_faction_time
SELECT
  event.unixtimems event_unixtimems,
  unit_faction_update.unit_type,
  unit_faction_update.guid,
  MAX(unit_faction_update.unixtimems) update_unixtimems
FROM event
JOIN unit_faction_update
WHERE unit_faction_update.unixtimems < event.unixtimems
GROUP BY event.unixtimems, unit_faction_update.unit_type, unit_faction_update.guid;
INSERT event_unit_faction
SELECT DISTINCT
  event.unixtimems event_unixtimems,
  unit.unit_type,
  unit.guid,
  COALESCE(unit_faction_update.faction, unit.faction) faction
FROM event
JOIN unit
JOIN unit_activity_time ON unit.unit_type = unit_activity_time.unit_type AND unit.guid = unit_activity_time.guid
LEFT JOIN event_unit_faction_time
  ON event.unixtimems = event_unit_faction_time.event_unixtimems
  AND unit.unit_type = event_unit_faction_time.unit_type
  AND unit.guid = event_unit_faction_time.guid
LEFT JOIN unit_faction_update
  ON unit.unit_type = unit_faction_update.unit_type
  AND unit.guid = unit_faction_update.guid
  AND event_unit_faction_time.update_unixtimems = unit_faction_update.unixtimems
WHERE unit_activity_time.unixtimems BETWEEN (event.unixtimems - 300000) AND event.unixtimems;
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
INSERT event_unit_position
SELECT
  event_unit_last_point.event_unixtimems,
  1 unit_type,
  creature.guid,
  last_point.position_x + CASE WHEN next_point.unixtimems IS NULL THEN 0 ELSE
    (next_point.position_x - last_point.position_x) * (
      (event_unit_last_point.event_unixtimems - last_point.unixtimems)
      / (next_point.unixtimems - last_point.unixtimems)
    )
  END position_x,
  last_point.position_y + CASE WHEN next_point.unixtimems IS NULL THEN 0 ELSE
    (next_point.position_y - last_point.position_y) * (
      (event_unit_last_point.event_unixtimems - last_point.unixtimems)
      / (next_point.unixtimems - last_point.unixtimems)
    )
  END position_y,
  last_point.position_z + CASE WHEN next_point.unixtimems IS NULL THEN 0 ELSE
    (next_point.position_z - last_point.position_z) * (
      (event_unit_last_point.event_unixtimems - last_point.unixtimems)
      / (next_point.unixtimems - last_point.unixtimems)
    )
  END position_z
FROM creature
JOIN event_unit_last_point ON creature.guid = event_unit_last_point.guid
JOIN unit_point last_point
  ON event_unit_last_point.unit_type = last_point.unit_type
  AND event_unit_last_point.guid = last_point.guid
  AND event_unit_last_point.movement_unixtimems = last_point.parent_unixtimems
  AND event_unit_last_point.point_unixtimems = last_point.unixtimems
LEFT JOIN unit_point next_point
  ON event_unit_last_point.unit_type = next_point.unit_type
  AND event_unit_last_point.guid = next_point.guid
  AND last_point.parent_unixtimems = next_point.parent_unixtimems
  AND (last_point.spline_point + 1) = next_point.spline_point
WHERE creature.id = @encounter_creature_id AND event_unit_last_point.unit_type = 1;
INSERT event_unit_enemy_distance
SELECT
  event_unit_position.event_unixtimems,
  event_unit_position.unit_type,
  event_unit_position.guid,
  enemy_last_point_time.unit_type enemy_unit_type,
  enemy_last_point_time.guid enemy_guid,
  SQRT(
    POW(event_unit_position.position_x - (
      enemy_last_point.position_x + CASE WHEN enemy_next_point.unixtimems IS NULL THEN 0 ELSE
        (enemy_next_point.position_x - enemy_last_point.position_x) * (
          (event_unit_position.event_unixtimems - enemy_last_point.unixtimems)
          / (enemy_next_point.unixtimems - enemy_last_point.unixtimems)
        )
      END
    ), 2)
    + POW(event_unit_position.position_y - (
      enemy_last_point.position_y + CASE WHEN enemy_next_point.unixtimems IS NULL THEN 0 ELSE
        (enemy_next_point.position_y - enemy_last_point.position_y) * (
          (event_unit_position.event_unixtimems - enemy_last_point.unixtimems)
          / (enemy_next_point.unixtimems - enemy_last_point.unixtimems)
        )
      END
    ), 2)
  ) distance
FROM event_unit_position
JOIN event_unit_faction
  ON event_unit_position.unit_type = event_unit_faction.unit_type
  AND event_unit_position.guid = event_unit_faction.guid
  AND event_unit_position.event_unixtimems = event_unit_faction.event_unixtimems
JOIN faction_template unit_faction
  ON event_unit_faction.faction = unit_faction.id
JOIN event_unit_last_point enemy_last_point_time
  ON event_unit_position.event_unixtimems = enemy_last_point_time.event_unixtimems
JOIN unit_point enemy_last_point
  ON enemy_last_point_time.unit_type = enemy_last_point.unit_type
  AND enemy_last_point_time.guid = enemy_last_point.guid
  AND enemy_last_point_time.movement_unixtimems = enemy_last_point.parent_unixtimems
  AND enemy_last_point_time.point_unixtimems = enemy_last_point.unixtimems
JOIN event_unit_faction enemy_faction_update
  ON event_unit_position.event_unixtimems = enemy_faction_update.event_unixtimems
  AND enemy_last_point_time.unit_type = enemy_faction_update.unit_type
  AND enemy_last_point_time.guid = enemy_faction_update.guid
JOIN event_unit_health_time enemy_health_time
  ON event_unit_position.event_unixtimems = enemy_health_time.event_unixtimems
  AND enemy_last_point_time.unit_type = enemy_health_time.unit_type
  AND enemy_last_point_time.guid = enemy_health_time.guid
JOIN unit_health_update enemy_health
  ON enemy_last_point_time.unit_type = enemy_health.unit_type
  AND enemy_last_point_time.guid = enemy_health.guid
  AND enemy_health_time.update_unixtimems = enemy_health.unixtimems
LEFT JOIN unit_point enemy_next_point
  ON enemy_last_point_time.unit_type = enemy_next_point.unit_type
  AND enemy_last_point_time.guid = enemy_next_point.guid
  AND enemy_last_point.parent_unixtimems = enemy_next_point.parent_unixtimems
  AND (enemy_last_point.spline_point + 1) = enemy_next_point.spline_point
JOIN faction_template enemy_faction
  ON enemy_faction_update.faction = enemy_faction.id
WHERE
  unit_faction.hostile_mask & 0x1 -- target unit was hostile to players on event
  AND (
    enemy_faction.faction_id IN (
      unit_faction.enemy_faction1,
      unit_faction.enemy_faction2,
      unit_faction.enemy_faction3,
      unit_faction.enemy_faction4
    )
    OR enemy_faction.our_mask & unit_faction.hostile_mask
  )
  AND enemy_health.current_health > 1;
INSERT event_unit_closest_enemy_distance
SELECT event_unixtimems, unit_type, guid, MIN(distance) closest_unit_distance
FROM event_unit_enemy_distance
GROUP BY event_unixtimems, unit_type, guid
ORDER BY event_unixtimems, unit_type, guid;
INSERT proximity_interval_end_event SELECT * FROM (
  -- Creature casts the spell.
  SELECT 1 unit_type, creature.guid, spell_cast_go.unixtimems, 1 full
  FROM spell_cast_go JOIN creature ON spell_cast_go.caster_unit_guid = creature.guid
  WHERE creature.id = @encounter_creature_id AND spell_cast_go.spell_id = @target_spell_id
  UNION
  -- Creature dies
  SELECT 1 unit_type, unit_death.guid, unit_death.unixtimems, 0 full
  FROM unit_death JOIN creature ON unit_death.guid = creature.guid
  WHERE creature.id = @encounter_creature_id AND unit_death.unit_type = 1
  UNION
  -- Creature incapacitated
  SELECT 1 unit_type, creature_auras_update.guid, creature_auras_update.unixtimems, 0 full
  FROM creature_auras_update
    JOIN incapacitate_spell ON creature_auras_update.spell_id = incapacitate_spell.entry
    JOIN creature ON creature_auras_update.guid = creature.guid
  WHERE creature.id = @encounter_creature_id
  UNION
  -- No enemy in range
  SELECT 1 unit_type, encounter.guid, event.unixtimems, 0 full
  FROM (
    -- Death
    SELECT unixtimems FROM unit_death
    UNION
    -- Faction change
    SELECT unixtimems FROM unit_faction_update
    UNION
    -- Movement time polling
    SELECT unixtimems FROM generated_unixtimems
  ) event
  JOIN encounter ON event.unixtimems BETWEEN encounter.start_unixtimems AND encounter.end_unixtimems
  WHERE NOT EXISTS(
    SELECT 1 FROM event_unit_enemy_distance
    WHERE event.unixtimems = event_unit_enemy_distance.event_unixtimems
      AND encounter.unit_type = event_unit_enemy_distance.unit_type
      AND encounter.guid = event_unit_enemy_distance.guid
      AND event_unit_enemy_distance.distance <= @radius
  )
) proximity_interval_end_event;
INSERT proximity_interval_start_event
SELECT
  proximity_interval_start_event.unit_type,
  proximity_interval_start_event.guid,
  proximity_interval_start_event.unixtimems,
  proximity_interval_start_event.full
FROM (
  -- Creature casts the spell.
  SELECT 1 unit_type, caster_unit_guid guid, unixtimems, 1 full
  FROM spell_cast_go
  WHERE caster_unit_id = @encounter_creature_id AND spell_id = @target_spell_id
  UNION ALL
  -- Enemy in range
  SELECT DISTINCT
    event_unit_enemy_distance.unit_type,
    event_unit_enemy_distance.guid,
    event_unit_enemy_distance.event_unixtimems,
    0 full
  FROM event_unit_enemy_distance
  JOIN (
    -- Faction change
    SELECT unixtimems FROM unit_faction_update
    UNION
    -- Incapacitate aura removed
    SELECT aura_removal.unixtimems
    FROM creature_auras_update aura_removal
    JOIN creature ON aura_removal.guid = creature.guid
    JOIN (
      SELECT
        aura_removal.guid,
        aura_removal.unixtimems removal_unixtimems,
        aura_removal.slot,
        MAX(aura_application.unixtimems) application_unixtimems
      FROM creature_auras_update aura_removal
      JOIN creature_auras_update aura_application
        ON aura_removal.guid = aura_application.guid AND aura_removal.slot = aura_application.slot
      WHERE aura_application.unixtimems < aura_removal.unixtimems
      GROUP BY aura_removal.guid, aura_removal.unixtimems, aura_removal.slot
    ) aura_application_time
      ON aura_removal.guid = aura_application_time.guid
      AND aura_removal.unixtimems = aura_application_time.removal_unixtimems
      AND aura_removal.slot = aura_application_time.slot
    JOIN creature_auras_update aura_application
      ON aura_removal.guid = aura_application.guid
      AND aura_removal.slot = aura_application.slot
      AND aura_application_time.application_unixtimems = aura_application.unixtimems
    JOIN incapacitate_spell ON aura_application.spell_id = incapacitate_spell.entry
    LEFT JOIN (
      SELECT
        aura_removal.guid,
        aura_removal.unixtimems removal_unixtimems,
        aura_removal.slot removal_slot,
        remaining_slot_update.slot remaining_slot,
        MAX(remaining_slot_update.unixtimems) remaining_unixtimems
      FROM creature_auras_update aura_removal
      JOIN creature_auras_update remaining_slot_update
        ON aura_removal.guid = remaining_slot_update.guid AND aura_removal.slot = remaining_slot_update.slot
      WHERE remaining_slot_update.slot <> aura_removal.slot
        AND remaining_slot_update.unixtimems < aura_removal.unixtimems
      GROUP BY aura_removal.guid, aura_removal.unixtimems, aura_removal.slot, remaining_slot_update.slot
    ) remaining_slot_update
      ON aura_removal.guid = remaining_slot_update.guid
      AND aura_removal.unixtimems = remaining_slot_update.removal_unixtimems
      AND aura_removal.slot = remaining_slot_update.removal_slot
    LEFT JOIN creature_auras_update remaining_aura
      ON aura_removal.guid = remaining_aura.guid
      AND remaining_slot_update.remaining_slot = remaining_aura.slot
      AND remaining_slot_update.remaining_unixtimems = remaining_aura.unixtimems
      AND remaining_aura.spell_id <> 0
    LEFT JOIN incapacitate_spell remaining_incapacitate_spell
      ON remaining_aura.spell_id = remaining_incapacitate_spell.entry
    WHERE aura_removal.spell_id = 0
      AND creature.id = @encounter_creature_id
      AND remaining_incapacitate_spell.entry IS NULL
    UNION
    -- Movement time polling
    SELECT unixtimems FROM generated_unixtimems
  ) movement ON event_unit_enemy_distance.event_unixtimems = movement.unixtimems
  WHERE event_unit_enemy_distance.distance <= @radius
) proximity_interval_start_event
WHERE EXISTS(SELECT 1 FROM encounter WHERE proximity_interval_start_event.unixtimems BETWEEN start_unixtimems AND end_unixtimems);
SELECT
  start_event.unit_type,
  start_event.guid,
  start_event.unixtimems start_unixtimems,
  end_event_time.end_unixtimems,
  end_event_time.end_unixtimems - start_event.unixtimems duration,
  start_event.full AND end_event.full full
FROM (
  SELECT unit_type, guid, unixtimems, MAX(CAST(full AS INT)) full
  FROM proximity_interval_start_event
  GROUP BY unit_type, guid, unixtimems
) start_event
JOIN (
  SELECT
    proximity_interval_start_event.unit_type,
    proximity_interval_start_event.guid,
    proximity_interval_start_event.unixtimems start_unixtimems,
    MIN(proximity_interval_end_event.unixtimems) end_unixtimems
  FROM proximity_interval_start_event
  JOIN proximity_interval_end_event
    ON proximity_interval_start_event.unit_type = proximity_interval_end_event.unit_type
    AND proximity_interval_start_event.guid = proximity_interval_end_event.guid
  WHERE proximity_interval_start_event.unixtimems < proximity_interval_end_event.unixtimems
  GROUP BY
    proximity_interval_start_event.unit_type,
    proximity_interval_start_event.guid,
    proximity_interval_start_event.unixtimems
) end_event_time
  ON start_event.unit_type = end_event_time.unit_type
  AND start_event.guid = end_event_time.guid
  AND start_event.unixtimems = end_event_time.start_unixtimems
JOIN proximity_interval_end_event end_event
  ON start_event.unit_type = end_event.unit_type
  AND start_event.guid = end_event.guid
  AND end_event_time.end_unixtimems = end_event.unixtimems
LEFT JOIN (
  SELECT
    proximity_interval_start_event.unit_type,
    proximity_interval_start_event.guid,
    proximity_interval_start_event.unixtimems start_unixtimems,
    MAX(proximity_interval_end_event.unixtimems) end_unixtimems
  FROM proximity_interval_start_event
  JOIN proximity_interval_end_event
    ON proximity_interval_start_event.unit_type = proximity_interval_end_event.unit_type
    AND proximity_interval_start_event.guid = proximity_interval_end_event.guid
  WHERE proximity_interval_end_event.unixtimems <= proximity_interval_start_event.unixtimems
  GROUP BY
    proximity_interval_start_event.unit_type,
    proximity_interval_start_event.guid,
    proximity_interval_start_event.unixtimems
) previous_end_event
  ON start_event.unit_type = previous_end_event.unit_type
  AND start_event.guid = previous_end_event.guid
  AND start_event.unixtimems = previous_end_event.start_unixtimems
LEFT JOIN proximity_interval_start_event previous_start_event
  ON start_event.unit_type = previous_start_event.unit_type
  AND start_event.guid = previous_start_event.guid
  AND start_event.unixtimems > previous_start_event.unixtimems
  AND (previous_end_event.unit_type IS NULL OR previous_start_event.unixtimems >= previous_end_event.end_unixtimems)
WHERE previous_start_event.unit_type IS NULL
ORDER BY duration, start_unixtimems, start_event.guid;
