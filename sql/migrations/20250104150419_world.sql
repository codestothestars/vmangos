DROP PROCEDURE IF EXISTS add_migration;
DELIMITER ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20250104150419');
IF v = 0 THEN
INSERT INTO `migrations` VALUES ('20250104150419');
-- Add your query below.

-- Merge CONDITION_NEARBY_CREATURE boolean params into one flags param
UPDATE `conditions` SET `value3` = `value3` | 0x2, `value4` = 0 WHERE `type` = 20 AND `value4` = 1;

-- Remember to update all condition IDs at the end to use the first gap.
-- Problem - The egg "exists" even after despawning from activation.
-- Need to augment CONDITION_NEARBY_GAMEOBJECT with a condition_id like we did with CONDITION_NEARBY_CREATURE.
--  241: Black Dragon Egg within 100 yards
INSERT `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES ( 241, 21,     177807,  100, 0x0, 122, 0x2);
--  242: No Black Dragon Egg within 100 yards
--  Test whether it works when standing in corners
INSERT `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES ( 242, 21,     177807,  100, 0x0, 122, 0x3);
--  275: No Black Dragon Egg within 100 yards, except self
INSERT `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES ( 275, 21,     177807,  100, 0x1, 122, 0x1);
--  572: Does not have aura Possess
INSERT `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES ( 572,  1,      19832,    0,   0,   0, 0x1);
--  573: Has aura Possess
INSERT `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES ( 573,  1,      23014,    0,   0,   0, 0x2);
--  574: Does not have aura Mind Exhaustion
INSERT `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES ( 574,  1,      23958,    0,   0,   0, 0x1);
--  575: Nearby Razorgore within 100 yards without aura Possess
INSERT `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES ( 575, 20,      12435,  100, 0x0, 572, 0x0);
--  576: (574: Does not have aura Mind Exhaustion) And (575: Nearby Razorgore within 100 yards without aura Possess)
INSERT `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES ( 576, -1,        574,  575,   0,   0, 0x0);
--  577: Source is on phase 0
INSERT `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES ( 577, 62,          0,    0,   0,   0, 0x0);
--  579: Nefarian's Troops is on phase 0
INSERT `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES ( 579, 61,      12796,  577,   0,   0, 0x0);
--  581: Instance data 0 (Razorgore) equals 0 (not started)
INSERT `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES ( 581, 34,          0,    0,   0,   0, 0x0);
--  582: Nearby Razorgore within 90 yards
INSERT `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES ( 582, 20,      12435,   90,   0,   0, 0x2);
--  583: No nearby Razorgore within 90 yards
INSERT `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES ( 583, 20,      12435,   90,   0,   0, 0x3);
--  584: Nearby Razorgore within 70 yards
INSERT `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES ( 584, 20,      12435,   70,   0,   0, 0x2);
--  585: No nearby Razorgore within 70 yards
INSERT `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES ( 585, 20,      12435,   70,   0,   0, 0x3);
--  586: Nearby Razorgore within 50 yards
INSERT `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES ( 586, 20,      12435,   50,   0,   0, 0x2);
--  587: No nearby Razorgore within 50 yards
INSERT `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES ( 587, 20,      12435,   50,   0,   0, 0x3);
--  588: Hostile unit within 10 yards
INSERT `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES ( 588, 59,         10,    0,   0,   0, 0x2);
--  589: Map event data 0 equal or less than 24
INSERT `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES ( 589, 35,       8302,    0,  24,   2, 0x0);
--  590: Map event data 0 equal or higher than 25
INSERT `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES ( 590, 35,       8302,    0,  25,   1, 0x0);
--  591: Map event data 1 equal to 0
INSERT `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES ( 591, 35,       8302,    1,   0,   0, 0x0);
--  592: Map event data 1 equal to 1
INSERT `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES ( 592, 35,       8302,    1,   1,   0, 0x0);
--  593: Map event data 2 equal to 0
INSERT `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES ( 593, 35,       8302,    2,   0,   0, 0x0);
--  594: Map event data 2 equal to 1
INSERT `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES ( 594, 35,       8302,    2,   1,   0, 0x0);
-- 8302: Map event 8302 (Razorgore) is active
INSERT `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (8302, 36,       8302,    0,   0,   0, 0x0);
-- 8303: Map event 8302 (Razorgore) is not active
INSERT `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (8303, 36,       8302,    0,   0,   0, 0x1);
-- 8304: (241: Black Dragon Egg within 100 yards) And (8302: Map event 8302 (Razorgore) is active)
INSERT `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (8304, -1,        241, 8302,   0,   0, 0x0);
-- 8305: (589: Map event data 0 equal or less than 24) And (8304: (241: Black Dragon Egg within 100 yards) And (8302: Map event 8302 (Razorgore) is active))
INSERT `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (8305, -1,        589, 8304,   0,   0, 0x0);

-- Define targets for Explode Orb Effect.
INSERT `spell_script_target`
(`entry`, `type`, `targetEntry`, `inverseEffectMask`) VALUES
(  20037,      0,        177808,                0b01),
(  20037,      1,         14453,                0b10),
(  20037,      1,         16604,                0b10);

-- Define targets for Explosion.
INSERT `spell_script_target`
(`entry`, `type`, `targetEntry`, `inverseEffectMask`) VALUES
(  20038,      0,        177807,                0b01),
(  20038,      1,         12416,                0b10),
(  20038,      1,         12420,                0b10),
(  20038,      1,         12422,                0b10),
(  20038,      1,         12435,                0b10),
(  20038,      1,         12557,                0b10),
(  20038,      1,         14449,                0b10),
(  20038,      1,         14453,                0b10),
(  20038,      1,         14456,                0b10),
(  20038,      1,         16604,                0b10),
(  20038,      3,             0,                0b10);

-- Define targets for Fireball.
INSERT `spell_script_target`
(`entry`, `type`, `targetEntry`) VALUES
(  23024,      1,         14449);

-- Correct Portcullis values.
UPDATE `gameobject` SET `orientation` = 3.75246, `rotation2` = -0.953716, `rotation3` = 0.300708 WHERE `id` = 176964;
UPDATE `gameobject_template` SET `faction` = 114, `flags` = 0x20 WHERE `entry` = 176964;

-- Disable Black Dragon Egg automatic spawn.
UPDATE `gameobject` SET `spawntimesecsmax` = 3600000, `spawntimesecsmin` = 3600000 WHERE `id` = 177807;

-- Correct Orb of Domination respawn time.
UPDATE `gameobject` SET `spawntimesecsmax` = 60, `spawntimesecsmin` = 60 WHERE `id` = 177808;

-- Correct Blackwing Guardsman positions.
UPDATE `creature` SET `position_x` = -7619.66, `position_y` = -1025.14, `position_z` = 413.465, `orientation` = 3.68265  WHERE `guid` = 84390;
UPDATE `creature` SET `position_x` = -7615.01, `position_y` = -1021.55, `position_z` = 413.465, `orientation` = 0.610865 WHERE `guid` = 84391;

-- Add missing Blackwing Orb Trigger spawn.
INSERT INTO `creature`
(`guid`,  `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecsmin`, `spawntimesecsmax`, `wander_distance`) VALUES
( 12784, 14449,   469,     -7615.51,     -1025.58,      413.465,       5.23599,                 60,                 60,                 0);

-- Add missing Blackwing Orb Trigger flags.
UPDATE `creature_template` SET `static_flags1` = `static_flags1` | 0x00000220 WHERE `entry` = 14449;

-- Add missing Orb of Domination spawns.
INSERT INTO `creature`
(`guid`,  `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecsmin`, `spawntimesecsmax`, `wander_distance`, `patch_max`) VALUES
( 12785, 14453,   469,     -7659.47,     -1043.87,      407.282,      1.65806 ,                  0,                  0,                 0,           7),
( 12786, 14453,   469,     -7626.67,     -1009.63,      413.465,      3.19395 ,                  0,                  0,                 0,           7),
( 12787, 14453,   469,     -7619.05,     -1048.82,      408.24 ,      0.680678,                  0,                  0,                 0,           7),
( 12788, 14453,   469,     -7607.38,     -1115.99,      407.282,      4.92183 ,                  0,                  0,                 0,           7),
( 12789, 14453,   469,     -7599.65,     -1077.8 ,      408.24 ,      3.54302 ,                  0,                  0,                 0,           7),
( 12790, 14453,   469,     -7595.42,     -1053.45,      408.24 ,      3.89208 ,                  0,                  0,                 0,           7),
( 12791, 14453,   469,     -7592.7 ,     -1029.95,      408.24 ,      5.32325 ,                  0,                  0,                 0,           7),
( 12792, 14453,   469,     -7583.24,     - 990.03,      407.282,      2.89725 ,                  0,                  0,                 0,           7),
( 12793, 14453,   469,     -7571.81,     -1058.2 ,      408.24 ,      5.74213 ,                  0,                  0,                 0,           7),
( 12794, 14453,   469,     -7566.78,     -1095.09,      413.465,      4.71239 ,                  0,                  0,                 0,           7),
( 12795, 14453,   469,     -7532.15,     -1062.56,      407.282,      4.72984 ,                  0,                  0,                 0,           7);

-- Correct Orb of Domination values.
UPDATE `creature_template` SET `faction` = 35, `display_scale1` = 5, `static_flags1` = `static_flags1` | 0x00000260 WHERE `entry` = 14453;

-- Add missing Nefarian's Troops spawn.
INSERT INTO `creature`
(`guid`,  `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecsmin`, `spawntimesecsmax`, `wander_distance`) VALUES
( 12796, 14459,   469,     -7644.52,     -1081.53,      408.574,        5.2709,                  0,                  0,                 0);

-- Add missing Blackwing Spell Marker spawns
INSERT `creature`
(`guid`,  `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecsmin`, `spawntimesecsmax`, `wander_distance`, `patch_min`) VALUES
( 12797, 16604,   469,     -7659.47,     -1043.87,      407.282,      1.65806 ,                  0,                  0,                 0,           8),
( 12798, 16604,   469,     -7626.67,     -1009.63,      413.465,      3.19395 ,                  0,                  0,                 0,           8),
( 12799, 16604,   469,     -7619.05,     -1048.82,      408.24 ,      0.680678,                  0,                  0,                 0,           8),
( 12800, 16604,   469,     -7607.38,     -1115.99,      407.282,      4.92183 ,                  0,                  0,                 0,           8),
( 12801, 16604,   469,     -7599.65,     -1077.8 ,      408.24 ,      3.54302 ,                  0,                  0,                 0,           8),
( 12802, 16604,   469,     -7595.42,     -1053.45,      408.24 ,      3.89208 ,                  0,                  0,                 0,           8),
( 12803, 16604,   469,     -7592.7 ,     -1029.95,      408.24 ,      5.32325 ,                  0,                  0,                 0,           8),
( 12804, 16604,   469,     -7583.24,     - 990.03,      407.282,      2.89725 ,                  0,                  0,                 0,           8),
( 12805, 16604,   469,     -7571.81,     -1058.2 ,      408.24 ,      5.74213 ,                  0,                  0,                 0,           8),
( 12806, 16604,   469,     -7566.78,     -1095.09,      413.465,      4.71239 ,                  0,                  0,                 0,           8),
( 12807, 16604,   469,     -7532.15,     -1062.56,      407.282,      4.72984 ,                  0,                  0,                 0,           8);

-- Add missing Nefarian's Troops flags.
UPDATE `creature_template` SET `static_flags1` = `static_flags1` | 0x00000260 WHERE `entry` = 14459;

-- Remove C++ script from Black Dragon Egg.
UPDATE `gameobject_template` SET `script_name` = '' WHERE `entry` = 177807;

-- Remove C++ script from Orb of Domination.
-- Well, we actually do want the original script.
-- The client doesn't even get an error message when attempting with Mind Exhaustion.
-- UPDATE `gameobject_template` SET `script_name` = '' WHERE `entry` = 177808;

-- Remove custom size reduction from Possess.
-- Razorgore receives the size reduction from 23021.
DELETE FROM `spell_effect_mod` WHERE `Id` = 19832 AND `EffectIndex` = 1;

-- Replace Possess custom speed boost with disabling speed reduction.
-- Razorgore's speed does not change during Possess.
UPDATE `spell_effect_mod`
SET `Effect` = 0,
  `EffectBasePoints` = -1,
  `EffectApplyAuraName` = -1,
  `Comment` = 'Spell Possess (Razorgore) : disable run speed reduction'
WHERE `Id` = 19832 AND `EffectIndex` = 2; 

-- Event Start Script
DELETE FROM `scripted_event_id` WHERE `id` = 8302;
DELETE FROM `event_scripts` WHERE `id` = 8302;
-- Make sure to test that casting Possess subsequent times doesn't start additional instances of the scripts.
INSERT `event_scripts`
(`id`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_type`, `target_param1`, `target_param2`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `condition_id`, `comments`) VALUES
(8302,          0,        39,    8302141,           0,           0,           0,             0,               0,               0,            0,       100,          0,          0,          0,           8303, 'Razorgore Event - Start Spawning Adds (North)'),
(8302,          0,        39,    8302142,           0,           0,           0,             0,               0,               0,            0,       100,          0,          0,          0,           8303, 'Razorgore Event - Start Spawning Adds (East)'),
(8302,          0,        39,    8302143,           0,           0,           0,             0,               0,               0,            0,       100,          0,          0,          0,           8303, 'Razorgore Event - Start Spawning Adds (East South)'),
(8302,          0,        39,    8302144,           0,           0,           0,             0,               0,               0,            0,       100,          0,          0,          0,           8303, 'Razorgore Event - Start Spawning Adds (South East)'),
(8302,          0,        39,    8302145,           0,           0,           0,             0,               0,               0,            0,       100,          0,          0,          0,           8303, 'Razorgore Event - Start Spawning Adds (South)'),
(8302,          0,        39,    8302146,           0,           0,           0,             0,               0,               0,            0,       100,          0,          0,          0,           8303, 'Razorgore Event - Start Spawning Adds (West)'),
(8302,          0,        39,    8302147,           0,           0,           0,             0,               0,               0,            0,       100,          0,          0,          0,           8303, 'Razorgore Event - Start Spawning Adds (West North)'),
(8302,          0,        39,    8302148,           0,           0,           0,             0,               0,               0,            0,       100,          0,          0,          0,           8303, 'Razorgore Event - Start Spawning Adds (North West)'),
(8302,          1,        61,       8302,     9000000,           0,           0,             0,               0,               0,            0,         0,     830201,          0,     830202,              0, 'Razorgore Event - Start Map Event');

-- Success Script for Scripted Map Event
INSERT `generic_scripts`
(  `id`, `delay`, `command`, `datalong`, `dataint`, `comments`) VALUES
(830201,       4,        39,     176964,       100, 'Razorgore Event - Open Portcullis (entrance) (success)'),
(830201,       4,        39,     176965,       100, 'Razorgore Event - Open Portcullis (exit)'),
(830202,       4,        39,     176964,       100, 'Razorgore Event - Open Portcullis (entrance) (failure)');

-- Fail Script for Scripted Map Event
-- INSERT `generic_scripts`
-- (  `id`, `command`, `datalong`, `dataint`, `comments`) VALUES
-- (830202, );

-- Spawning Adds
INSERT `generic_scripts`
(  `id` , `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_type`, `target_param1`, `target_param2`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`,    `x`  ,    `y`   ,  `z`   , `o`, `condition_id`, `comments`) VALUES
(8302003,       0,          0,         3,          2,           0,       0x001,         0x2,             8,           12435,             150,         0x00,         0,          0,          0,          0,     5   ,     0    ,   0    ,  0 ,              0, 'Razorgore Event Spawning Adds - Move to Razorgore'),
(8302004,       0,          0,        39,    8302003,           0,           0,           0,             0,               0,               0,         0x00,       100,          0,          0,          0,     0   ,     0    ,   0    ,  0 ,            582, 'Razorgore Event Spawning Adds - Initial Movement (North) - Move to Razorgore'),
(8302004,       0,          0,        60,          3,           0,           0,           0,             0,               0,               0,         0x00,         0,     830204,          0,          0,     0   ,     0    ,   0    ,  0 ,            583, 'Razorgore Event Spawning Adds - Initial Movement (North) - Move to Altar'),
(8302005,       0,          0,        39,    8302003,           0,           0,           0,             0,               0,               0,         0x00,       100,          0,          0,          0,     0   ,     0    ,   0    ,  0 ,            582, 'Razorgore Event Spawning Adds - Initial Movement (East) - Move to Razorgore'),
(8302005,       0,          0,        60,          3,           0,           0,           0,             0,               0,               0,         0x00,         0,     830206,          0,          0,     0   ,     0    ,   0    ,  0 ,            583, 'Razorgore Event Spawning Adds - Initial Movement (East) - Move to Altar'),
(8302006,       0,          0,        39,    8302003,           0,           0,           0,             0,               0,               0,         0x00,       100,          0,          0,          0,     0   ,     0    ,   0    ,  0 ,            584, 'Razorgore Event Spawning Adds - Initial Movement (East South) - Move to Razorgore'),
(8302006,       0,          0,        60,          3,           0,           0,           0,             0,               0,               0,         0x00,         0,     830208,          0,          0,     0   ,     0    ,   0    ,  0 ,            585, 'Razorgore Event Spawning Adds - Initial Movement (East South) - Move to Altar'),
(8302007,       0,          0,        39,    8302003,           0,           0,           0,             0,               0,               0,         0x00,       100,          0,          0,          0,     0   ,     0    ,   0    ,  0 ,            586, 'Razorgore Event Spawning Adds - Initial Movement (South East) - Move to Razorgore'),
(8302007,       0,          0,        60,          3,           0,           0,           0,             0,               0,               0,         0x00,         0,     830210,          0,          0,     0   ,     0    ,   0    ,  0 ,            587, 'Razorgore Event Spawning Adds - Initial Movement (South East) - Move to Altar'),
(8302008,       0,          0,        39,    8302003,           0,           0,           0,             0,               0,               0,         0x00,       100,          0,          0,          0,     0   ,     0    ,   0    ,  0 ,            586, 'Razorgore Event Spawning Adds - Initial Movement (South) - Move to Razorgore'),
(8302008,       0,          0,        60,          3,           0,           0,           0,             0,               0,               0,         0x00,         0,     830212,          0,          0,     0   ,     0    ,   0    ,  0 ,            587, 'Razorgore Event Spawning Adds - Initial Movement (South) - Move to Altar'),
(8302009,       0,          0,        39,    8302003,           0,           0,           0,             0,               0,               0,         0x00,       100,          0,          0,          0,     0   ,     0    ,   0    ,  0 ,            586, 'Razorgore Event Spawning Adds - Initial Movement (West) - Move to Razorgore'),
(8302009,       0,          0,        60,          3,           0,           0,           0,             0,               0,               0,         0x00,         0,     830214,          0,          0,     0   ,     0    ,   0    ,  0 ,            587, 'Razorgore Event Spawning Adds - Initial Movement (West) - Move to Altar'),
(8302010,       0,          0,        39,    8302003,           0,           0,           0,             0,               0,               0,         0x00,       100,          0,          0,          0,     0   ,     0    ,   0    ,  0 ,            586, 'Razorgore Event Spawning Adds - Initial Movement (West North) - Move to Razorgore'),
(8302010,       0,          0,        60,          3,           0,           0,           0,             0,               0,               0,         0x00,         0,     830216,          0,          0,     0   ,     0    ,   0    ,  0 ,            587, 'Razorgore Event Spawning Adds - Initial Movement (West North) - Move to Altar'),
(8302011,       0,          0,        39,    8302003,           0,           0,           0,             0,               0,               0,         0x00,       100,          0,          0,          0,     0   ,     0    ,   0    ,  0 ,            584, 'Razorgore Event Spawning Adds - Initial Movement (North West) - Move to Razorgore'),
(8302011,       0,          0,        60,          3,           0,           0,           0,             0,               0,               0,         0x00,         0,     830218,          0,          0,     0   ,     0    ,   0    ,  0 ,            585, 'Razorgore Event Spawning Adds - Initial Movement (North West) - Move to Altar'),
(8302012,       0,          0,        10,      12416,      300000,           0,           0,             0,               0,               0,         0x00,      0x01,    8302004,          0,          6, -7532.72, -1063.49 , 407.366,  0 ,              0, 'Razorgore Event Spawning Adds - Summon Blackwing Legionnaire - North'),
(8302013,       0,          0,        10,      12416,      300000,           0,           0,             0,               0,               0,         0x00,      0x01,    8302005,          0,          6, -7607.78, -1116.17 , 407.366,  0 ,              0, 'Razorgore Event Spawning Adds - Summon Blackwing Legionnaire - East'),
(8302014,       0,          0,        10,      12416,      300000,           0,           0,             0,               0,               0,         0x00,      0x01,    8302006,          0,          6, -7623.1 , -1094.06 , 407.371,  0 ,              0, 'Razorgore Event Spawning Adds - Summon Blackwing Legionnaire - East South'),
(8302015,       0,          0,        10,      12416,      300000,           0,           0,             0,               0,               0,         0x00,      0x01,    8302007,          0,          6, -7643.39, -1064.69 , 407.371,  0 ,              0, 'Razorgore Event Spawning Adds - Summon Blackwing Legionnaire - South East'),
(8302016,       0,          0,        10,      12416,      300000,           0,           0,             0,               0,               0,         0x00,      0x01,    8302008,          0,          6, -7659.81, -1043.81 , 407.366,  0 ,              0, 'Razorgore Event Spawning Adds - Summon Blackwing Legionnaire - South'),
(8302017,       0,          0,        10,      12416,      300000,           0,           0,             0,               0,               0,         0x00,      0x01,    8302009,          0,          6, -7583.08, - 990.483, 407.366,  0 ,              0, 'Razorgore Event Spawning Adds - Summon Blackwing Legionnaire - West'),
(8302018,       0,          0,        10,      12416,      300000,           0,           0,             0,               0,               0,         0x00,      0x01,    8302010,          0,          6, -7568.61, -1012.67 , 407.371,  0 ,              0, 'Razorgore Event Spawning Adds - Summon Blackwing Legionnaire - West North'),
(8302019,       0,          0,        10,      12416,      300000,           0,           0,             0,               0,               0,         0x00,      0x01,    8302011,          0,          6, -7548.46, -1041.98 , 407.371,  0 ,              0, 'Razorgore Event Spawning Adds - Summon Blackwing Legionnaire - North West'),
(8302020,       0,          0,        10,      12420,      300000,           0,           0,             0,               0,               0,         0x00,      0x01,    8302004,          0,          6, -7532.72, -1063.49 , 407.366,  0 ,              0, 'Razorgore Event Spawning Adds - Summon Blackwing Mage - North'),
(8302021,       0,          0,        10,      12420,      300000,           0,           0,             0,               0,               0,         0x00,      0x01,    8302005,          0,          6, -7607.78, -1116.17 , 407.366,  0 ,              0, 'Razorgore Event Spawning Adds - Summon Blackwing Mage - East'),
(8302022,       0,          0,        10,      12420,      300000,           0,           0,             0,               0,               0,         0x00,      0x01,    8302006,          0,          6, -7623.1 , -1094.06 , 407.371,  0 ,              0, 'Razorgore Event Spawning Adds - Summon Blackwing Mage - East South'),
(8302023,       0,          0,        10,      12420,      300000,           0,           0,             0,               0,               0,         0x00,      0x01,    8302007,          0,          6, -7643.39, -1064.69 , 407.371,  0 ,              0, 'Razorgore Event Spawning Adds - Summon Blackwing Mage - South East'),
(8302024,       0,          0,        10,      12420,      300000,           0,           0,             0,               0,               0,         0x00,      0x01,    8302008,          0,          6, -7659.81, -1043.81 , 407.366,  0 ,              0, 'Razorgore Event Spawning Adds - Summon Blackwing Mage - South'),
(8302025,       0,          0,        10,      12420,      300000,           0,           0,             0,               0,               0,         0x00,      0x01,    8302009,          0,          6, -7583.08, - 990.483, 407.366,  0 ,              0, 'Razorgore Event Spawning Adds - Summon Blackwing Mage - West'),
(8302026,       0,          0,        10,      12420,      300000,           0,           0,             0,               0,               0,         0x00,      0x01,    8302010,          0,          6, -7568.61, -1012.67 , 407.371,  0 ,              0, 'Razorgore Event Spawning Adds - Summon Blackwing Mage - West North'),
(8302027,       0,          0,        10,      12420,      300000,           0,           0,             0,               0,               0,         0x00,      0x01,    8302011,          0,          6, -7548.46, -1041.98 , 407.371,  0 ,              0, 'Razorgore Event Spawning Adds - Summon Blackwing Mage - North West'),
(8302028,       0,          0,        10,      12422,        5000,           0,           0,             0,               0,               0,         0x00,      0x01,    8302004,          0,          6, -7532.72, -1063.49 , 407.366,  0 ,              0, 'Razorgore Event Spawning Adds - Summon Death Talon Dragonspawn - North'),
(8302029,       0,          0,        10,      12422,        5000,           0,           0,             0,               0,               0,         0x00,      0x01,    8302005,          0,          6, -7607.78, -1116.17 , 407.366,  0 ,              0, 'Razorgore Event Spawning Adds - Summon Death Talon Dragonspawn - East'),
(8302030,       0,          0,        10,      12422,        5000,           0,           0,             0,               0,               0,         0x00,      0x01,    8302006,          0,          6, -7623.1 , -1094.06 , 407.371,  0 ,              0, 'Razorgore Event Spawning Adds - Summon Death Talon Dragonspawn - East South'),
(8302031,       0,          0,        10,      12422,        5000,           0,           0,             0,               0,               0,         0x00,      0x01,    8302007,          0,          6, -7643.39, -1064.69 , 407.371,  0 ,              0, 'Razorgore Event Spawning Adds - Summon Death Talon Dragonspawn - South East'),
(8302032,       0,          0,        10,      12422,        5000,           0,           0,             0,               0,               0,         0x00,      0x01,    8302008,          0,          6, -7659.81, -1043.81 , 407.366,  0 ,              0, 'Razorgore Event Spawning Adds - Summon Death Talon Dragonspawn - South'),
(8302033,       0,          0,        10,      12422,        5000,           0,           0,             0,               0,               0,         0x00,      0x01,    8302009,          0,          6, -7583.08, - 990.483, 407.366,  0 ,              0, 'Razorgore Event Spawning Adds - Summon Death Talon Dragonspawn - West'),
(8302034,       0,          0,        10,      12422,        5000,           0,           0,             0,               0,               0,         0x00,      0x01,    8302010,          0,          6, -7568.61, -1012.67 , 407.371,  0 ,              0, 'Razorgore Event Spawning Adds - Summon Death Talon Dragonspawn - West North'),
(8302035,       0,          0,        10,      12422,        5000,           0,           0,             0,               0,               0,         0x00,      0x01,    8302011,          0,          6, -7548.46, -1041.98 , 407.371,  0 ,              0, 'Razorgore Event Spawning Adds - Summon Death Talon Dragonspawn - North West'),
(8302036,       0,          0,        65,       8302,           0,           1,           1,             0,               0,               0,         0x00,         0,          0,          0,          0,     0   ,     0    ,   0    ,  0 ,              0, 'Razorgore Event Spawning Adds - Increment Creature Count'),
(8302037,       0,          0,        39,    8302012,     8302020,     8302028,           0,             0,               0,               0,         0x00,        39,         39,         22,          0,     0   ,     0    ,   0    ,  0 ,              0, 'Razorgore Event Spawning Adds - Summon Creature - North'),
(8302038,       0,          0,        39,    8302013,     8302021,     8302029,           0,             0,               0,               0,         0x00,        39,         39,         22,          0,     0   ,     0    ,   0    ,  0 ,              0, 'Razorgore Event Spawning Adds - Summon Creature - East'),
(8302039,       0,          0,        39,    8302014,     8302022,     8302030,           0,             0,               0,               0,         0x00,        39,         39,         22,          0,     0   ,     0    ,   0    ,  0 ,              0, 'Razorgore Event Spawning Adds - Summon Creature - East South'),
(8302040,       0,          0,        39,    8302015,     8302023,     8302031,           0,             0,               0,               0,         0x00,        39,         39,         22,          0,     0   ,     0    ,   0    ,  0 ,              0, 'Razorgore Event Spawning Adds - Summon Creature - South East'),
(8302041,       0,          0,        39,    8302016,     8302024,     8302032,           0,             0,               0,               0,         0x00,        39,         39,         22,          0,     0   ,     0    ,   0    ,  0 ,              0, 'Razorgore Event Spawning Adds - Summon Creature - South'),
(8302042,       0,          0,        39,    8302017,     8302025,     8302033,           0,             0,               0,               0,         0x00,        39,         39,         22,          0,     0   ,     0    ,   0    ,  0 ,              0, 'Razorgore Event Spawning Adds - Summon Creature - West'),
(8302043,       0,          0,        39,    8302018,     8302026,     8302034,           0,             0,               0,               0,         0x00,        39,         39,         22,          0,     0   ,     0    ,   0    ,  0 ,              0, 'Razorgore Event Spawning Adds - Summon Creature - West North'),
(8302044,       0,          0,        39,    8302019,     8302027,     8302035,           0,             0,               0,               0,         0x00,        39,         39,         22,          0,     0   ,     0    ,   0    ,  0 ,              0, 'Razorgore Event Spawning Adds - Summon Creature - North West'),
(8302045,       0,          0,        39,    8302037,           0,           0,           0,             0,               0,               0,         0x00,       100,          0,          0,          0,     0   ,     0    ,   0    ,  0 ,              0, 'Razorgore Event Spawning Adds - Summon Creature - North 1 - Summon'),
(8302045,      15,          0,        39,    8302046,           0,           0,           0,             0,               0,               0,         0x00,       100,          0,          0,          0,     0   ,     0    ,   0    ,  0 ,           8304, 'Razorgore Event Spawning Adds - Summon Creature - North 1 - Summon Next'),
(8302046,       0,          0,        39,    8302047,     8302048,           0,           0,             0,               0,               0,         0x00,        75,         25,          0,          0,     0   ,     0    ,   0    ,  0 ,            590, 'Razorgore Event Spawning Adds - Summon Creature - North 2 (25 or more alive) - Summon Delayed or Immediately'),
(8302046,       0,          1,        39,    8302037,           0,           0,           0,             0,               0,               0,         0x08,       100,          0,          0,          0,     0   ,     0    ,   0    ,  0 ,            589, 'Razorgore Event Spawning Adds - Summon Creature - North 2 (fewer than 25 alive) - Summon'),
(8302046,      15,          1,        39,    8302049,           0,           0,           0,             0,               0,               0,         0x00,       100,          0,          0,          0,     0   ,     0    ,   0    ,  0 ,           8305, 'Razorgore Event Spawning Adds - Summon Creature - North 2 (fewer than 25 alive) - Summon Next'),
(8302047,      15,          0,        39,    8302037,           0,           0,           0,             0,               0,               0,         0x00,       100,          0,          0,          0,     0   ,     0    ,   0    ,  0 ,           8304, 'Razorgore Event Spawning Adds - Summon Creature - North 2 (25 or more alive) - Summon Delayed'),
(8302047,      30,          0,        39,    8302045,           0,           0,           0,             0,               0,               0,         0x00,       100,          0,          0,          0,     0   ,     0    ,   0    ,  0 ,           8304, 'Razorgore Event Spawning Adds - Summon Creature - North 2 (25 or more alive) - Summon First'),
(8302048,       0,          0,        39,    8302037,           0,           0,           0,             0,               0,               0,         0x00,       100,          0,          0,          0,     0   ,     0    ,   0    ,  0 ,              0, 'Razorgore Event Spawning Adds - Summon Creature - North 2 (25 or more alive) - Summon Immediately'),
(8302048,      15,          0,        39,    8302049,           0,           0,           0,             0,               0,               0,         0x00,       100,          0,          0,          0,     0   ,     0    ,   0    ,  0 ,           8304, 'Razorgore Event Spawning Adds - Summon Creature - North 2 (25 or more alive) - Summon Next'),
(8302049,       0,          0,        39,    8302037,           0,           0,           0,             0,               0,               0,         0x00,       100,          0,          0,          0,     0   ,     0    ,   0    ,  0 ,              0, 'Razorgore Event Spawning Adds - Summon Creature - North 3 - Summon'),
(8302049,      15,          0,        39,    8302050,           0,           0,           0,             0,               0,               0,         0x00,       100,          0,          0,          0,     0   ,     0    ,   0    ,  0 ,           8304, 'Razorgore Event Spawning Adds - Summon Creature - North 3 - Summon Next'),
(8302050,       0,          0,        39,    8302051,     8302052,           0,           0,             0,               0,               0,         0x00,        44,         56,          0,          0,     0   ,     0    ,   0    ,  0 ,              0, 'Razorgore Event Spawning Adds - Summon Creature - North 4 - Summon Delayed or Immediately'),
(8302051,      15,          0,        39,    8302037,           0,           0,           0,             0,               0,               0,         0x00,       100,          0,          0,          0,     0   ,     0    ,   0    ,  0 ,           8304, 'Razorgore Event Spawning Adds - Summon Creature - North 4 - Summon Delayed'),
(8302051,      30,          0,        39,    8302045,           0,           0,           0,             0,               0,               0,         0x00,       100,          0,          0,          0,     0   ,     0    ,   0    ,  0 ,           8304, 'Razorgore Event Spawning Adds - Summon Creature - North 4 - Summon First'),
(8302052,       0,          0,        39,    8302037,           0,           0,           0,             0,               0,               0,         0x00,       100,          0,          0,          0,     0   ,     0    ,   0    ,  0 ,              0, 'Razorgore Event Spawning Adds - Summon Creature - North 4 - Summon Immediately'),
(8302052,      15,          0,        39,    8302053,           0,           0,           0,             0,               0,               0,         0x00,       100,          0,          0,          0,     0   ,     0    ,   0    ,  0 ,           8304, 'Razorgore Event Spawning Adds - Summon Creature - North 4 - Summon Next'),
(8302053,       0,          0,        39,    8302054,     8302055,           0,           0,             0,               0,               0,         0x00,        79,         21,          0,          0,     0   ,     0    ,   0    ,  0 ,              0, 'Razorgore Event Spawning Adds - Summon Creature - North 5 - Summon Delayed or Immediately'),
(8302054,      15,          0,        39,    8302037,           0,           0,           0,             0,               0,               0,         0x00,       100,          0,          0,          0,     0   ,     0    ,   0    ,  0 ,           8304, 'Razorgore Event Spawning Adds - Summon Creature - North 5 - Summon Delayed'),
(8302054,      30,          0,        39,    8302045,           0,           0,           0,             0,               0,               0,         0x00,       100,          0,          0,          0,     0   ,     0    ,   0    ,  0 ,           8304, 'Razorgore Event Spawning Adds - Summon Creature - North 5 - Summon First'),
(8302055,       0,          0,        39,    8302037,           0,           0,           0,             0,               0,               0,         0x00,       100,          0,          0,          0,     0   ,     0    ,   0    ,  0 ,              0, 'Razorgore Event Spawning Adds - Summon Creature - North 5 - Summon Immediately'),
(8302055,      15,          0,        39,    8302056,           0,           0,           0,             0,               0,               0,         0x00,       100,          0,          0,          0,     0   ,     0    ,   0    ,  0 ,           8304, 'Razorgore Event Spawning Adds - Summon Creature - North 5 - Summon Next'),
(8302056,      15,          0,        39,    8302037,           0,           0,           0,             0,               0,               0,         0x00,       100,          0,          0,          0,     0   ,     0    ,   0    ,  0 ,           8304, 'Razorgore Event Spawning Adds - Summon Creature - North 6 - Summon Delayed'),
(8302056,      30,          0,        39,    8302045,           0,           0,           0,             0,               0,               0,         0x00,       100,          0,          0,          0,     0   ,     0    ,   0    ,  0 ,           8304, 'Razorgore Event Spawning Adds - Summon Creature - North 6 - Summon First'),
(8302057,       0,          0,        39,    8302038,           0,           0,           0,             0,               0,               0,         0x00,       100,          0,          0,          0,     0   ,     0    ,   0    ,  0 ,              0, 'Razorgore Event Spawning Adds - Summon Creature - East 1 - Summon'),
(8302057,      15,          0,        39,    8302058,           0,           0,           0,             0,               0,               0,         0x00,       100,          0,          0,          0,     0   ,     0    ,   0    ,  0 ,           8304, 'Razorgore Event Spawning Adds - Summon Creature - East 1 - Summon Next'),
(8302058,       0,          0,        39,    8302059,     8302060,           0,           0,             0,               0,               0,         0x00,        75,         25,          0,          0,     0   ,     0    ,   0    ,  0 ,            590, 'Razorgore Event Spawning Adds - Summon Creature - East 2 (25 or more alive) - Summon Delayed or Immediately'),
(8302058,       0,          1,        39,    8302038,           0,           0,           0,             0,               0,               0,         0x08,       100,          0,          0,          0,     0   ,     0    ,   0    ,  0 ,            589, 'Razorgore Event Spawning Adds - Summon Creature - East 2 (fewer than 25 alive) - Summon'),
(8302058,      15,          1,        39,    8302061,           0,           0,           0,             0,               0,               0,         0x00,       100,          0,          0,          0,     0   ,     0    ,   0    ,  0 ,           8305, 'Razorgore Event Spawning Adds - Summon Creature - East 2 (fewer than 25 alive) - Summon Next'),
(8302059,      15,          0,        39,    8302038,           0,           0,           0,             0,               0,               0,         0x00,       100,          0,          0,          0,     0   ,     0    ,   0    ,  0 ,           8304, 'Razorgore Event Spawning Adds - Summon Creature - East 2 (25 or more alive) - Summon Delayed'),
(8302059,      30,          0,        39,    8302057,           0,           0,           0,             0,               0,               0,         0x00,       100,          0,          0,          0,     0   ,     0    ,   0    ,  0 ,           8304, 'Razorgore Event Spawning Adds - Summon Creature - East 2 (25 or more alive) - Summon First'),
(8302060,       0,          0,        39,    8302038,           0,           0,           0,             0,               0,               0,         0x00,       100,          0,          0,          0,     0   ,     0    ,   0    ,  0 ,              0, 'Razorgore Event Spawning Adds - Summon Creature - East 2 (25 or more alive) - Summon Immediately'),
(8302060,      15,          0,        39,    8302061,           0,           0,           0,             0,               0,               0,         0x00,       100,          0,          0,          0,     0   ,     0    ,   0    ,  0 ,           8304, 'Razorgore Event Spawning Adds - Summon Creature - East 2 (25 or more alive) - Summon Next'),
(8302061,       0,          0,        39,    8302038,           0,           0,           0,             0,               0,               0,         0x00,       100,          0,          0,          0,     0   ,     0    ,   0    ,  0 ,              0, 'Razorgore Event Spawning Adds - Summon Creature - East 3 - Summon'),
(8302061,      15,          0,        39,    8302062,           0,           0,           0,             0,               0,               0,         0x00,       100,          0,          0,          0,     0   ,     0    ,   0    ,  0 ,           8304, 'Razorgore Event Spawning Adds - Summon Creature - East 3 - Summon Next'),
(8302062,       0,          0,        39,    8302063,     8302064,           0,           0,             0,               0,               0,         0x00,        44,         56,          0,          0,     0   ,     0    ,   0    ,  0 ,              0, 'Razorgore Event Spawning Adds - Summon Creature - East 4 - Summon Delayed or Immediately'),
(8302063,      15,          0,        39,    8302038,           0,           0,           0,             0,               0,               0,         0x00,       100,          0,          0,          0,     0   ,     0    ,   0    ,  0 ,           8304, 'Razorgore Event Spawning Adds - Summon Creature - East 4 - Summon Delayed'),
(8302063,      30,          0,        39,    8302057,           0,           0,           0,             0,               0,               0,         0x00,       100,          0,          0,          0,     0   ,     0    ,   0    ,  0 ,           8304, 'Razorgore Event Spawning Adds - Summon Creature - East 4 - Summon First'),
(8302064,       0,          0,        39,    8302038,           0,           0,           0,             0,               0,               0,         0x00,       100,          0,          0,          0,     0   ,     0    ,   0    ,  0 ,              0, 'Razorgore Event Spawning Adds - Summon Creature - East 4 - Summon Immediately'),
(8302064,      15,          0,        39,    8302065,           0,           0,           0,             0,               0,               0,         0x00,       100,          0,          0,          0,     0   ,     0    ,   0    ,  0 ,           8304, 'Razorgore Event Spawning Adds - Summon Creature - East 4 - Summon Next'),
(8302065,       0,          0,        39,    8302066,     8302067,           0,           0,             0,               0,               0,         0x00,        79,         21,          0,          0,     0   ,     0    ,   0    ,  0 ,              0, 'Razorgore Event Spawning Adds - Summon Creature - East 5 - Summon Delayed or Immediately'),
(8302066,      15,          0,        39,    8302038,           0,           0,           0,             0,               0,               0,         0x00,       100,          0,          0,          0,     0   ,     0    ,   0    ,  0 ,           8304, 'Razorgore Event Spawning Adds - Summon Creature - East 5 - Summon Delayed'),
(8302066,      30,          0,        39,    8302057,           0,           0,           0,             0,               0,               0,         0x00,       100,          0,          0,          0,     0   ,     0    ,   0    ,  0 ,           8304, 'Razorgore Event Spawning Adds - Summon Creature - East 5 - Summon First'),
(8302067,       0,          0,        39,    8302038,           0,           0,           0,             0,               0,               0,         0x00,       100,          0,          0,          0,     0   ,     0    ,   0    ,  0 ,              0, 'Razorgore Event Spawning Adds - Summon Creature - East 5 - Summon Immediately'),
(8302067,      15,          0,        39,    8302068,           0,           0,           0,             0,               0,               0,         0x00,       100,          0,          0,          0,     0   ,     0    ,   0    ,  0 ,           8304, 'Razorgore Event Spawning Adds - Summon Creature - East 5 - Summon Next'),
(8302068,      15,          0,        39,    8302038,           0,           0,           0,             0,               0,               0,         0x00,       100,          0,          0,          0,     0   ,     0    ,   0    ,  0 ,           8304, 'Razorgore Event Spawning Adds - Summon Creature - East 6 - Summon Delayed'),
(8302068,      30,          0,        39,    8302057,           0,           0,           0,             0,               0,               0,         0x00,       100,          0,          0,          0,     0   ,     0    ,   0    ,  0 ,           8304, 'Razorgore Event Spawning Adds - Summon Creature - East 6 - Summon First'),
(8302069,       0,          0,        39,    8302039,           0,           0,           0,             0,               0,               0,         0x00,       100,          0,          0,          0,     0   ,     0    ,   0    ,  0 ,              0, 'Razorgore Event Spawning Adds - Summon Creature - East South 1 - Summon'),
(8302069,      15,          0,        39,    8302070,           0,           0,           0,             0,               0,               0,         0x00,       100,          0,          0,          0,     0   ,     0    ,   0    ,  0 ,           8304, 'Razorgore Event Spawning Adds - Summon Creature - East South 1 - Summon Next'),
(8302070,       0,          0,        39,    8302071,     8302072,           0,           0,             0,               0,               0,         0x00,        75,         25,          0,          0,     0   ,     0    ,   0    ,  0 ,            590, 'Razorgore Event Spawning Adds - Summon Creature - East South 2 (25 or more alive) - Summon Delayed or Immediately'),
(8302070,       0,          1,        39,    8302039,           0,           0,           0,             0,               0,               0,         0x08,       100,          0,          0,          0,     0   ,     0    ,   0    ,  0 ,            589, 'Razorgore Event Spawning Adds - Summon Creature - East South 2 (fewer than 25 alive) - Summon'),
(8302070,      15,          1,        39,    8302073,           0,           0,           0,             0,               0,               0,         0x00,       100,          0,          0,          0,     0   ,     0    ,   0    ,  0 ,           8305, 'Razorgore Event Spawning Adds - Summon Creature - East South 2 (fewer than 25 alive) - Summon Next'),
(8302071,      15,          0,        39,    8302039,           0,           0,           0,             0,               0,               0,         0x00,       100,          0,          0,          0,     0   ,     0    ,   0    ,  0 ,           8304, 'Razorgore Event Spawning Adds - Summon Creature - East South 2 (25 or more alive) - Summon Delayed'),
(8302071,      30,          0,        39,    8302069,           0,           0,           0,             0,               0,               0,         0x00,       100,          0,          0,          0,     0   ,     0    ,   0    ,  0 ,           8304, 'Razorgore Event Spawning Adds - Summon Creature - East South 2 (25 or more alive) - Summon First'),
(8302072,       0,          0,        39,    8302039,           0,           0,           0,             0,               0,               0,         0x00,       100,          0,          0,          0,     0   ,     0    ,   0    ,  0 ,              0, 'Razorgore Event Spawning Adds - Summon Creature - East South 2 (25 or more alive) - Summon Immediately'),
(8302072,      15,          0,        39,    8302073,           0,           0,           0,             0,               0,               0,         0x00,       100,          0,          0,          0,     0   ,     0    ,   0    ,  0 ,           8304, 'Razorgore Event Spawning Adds - Summon Creature - East South 2 (25 or more alive) - Summon Next'),
(8302073,       0,          0,        39,    8302039,           0,           0,           0,             0,               0,               0,         0x00,       100,          0,          0,          0,     0   ,     0    ,   0    ,  0 ,              0, 'Razorgore Event Spawning Adds - Summon Creature - East South 3 - Summon'),
(8302073,      15,          0,        39,    8302074,           0,           0,           0,             0,               0,               0,         0x00,       100,          0,          0,          0,     0   ,     0    ,   0    ,  0 ,           8304, 'Razorgore Event Spawning Adds - Summon Creature - East South 3 - Summon Next'),
(8302074,       0,          0,        39,    8302075,     8302076,           0,           0,             0,               0,               0,         0x00,        44,         56,          0,          0,     0   ,     0    ,   0    ,  0 ,              0, 'Razorgore Event Spawning Adds - Summon Creature - East South 4 - Summon Delayed or Immediately'),
(8302075,      15,          0,        39,    8302039,           0,           0,           0,             0,               0,               0,         0x00,       100,          0,          0,          0,     0   ,     0    ,   0    ,  0 ,           8304, 'Razorgore Event Spawning Adds - Summon Creature - East South 4 - Summon Delayed'),
(8302075,      30,          0,        39,    8302069,           0,           0,           0,             0,               0,               0,         0x00,       100,          0,          0,          0,     0   ,     0    ,   0    ,  0 ,           8304, 'Razorgore Event Spawning Adds - Summon Creature - East South 4 - Summon First'),
(8302076,       0,          0,        39,    8302039,           0,           0,           0,             0,               0,               0,         0x00,       100,          0,          0,          0,     0   ,     0    ,   0    ,  0 ,              0, 'Razorgore Event Spawning Adds - Summon Creature - East South 4 - Summon Immediately'),
(8302076,      15,          0,        39,    8302077,           0,           0,           0,             0,               0,               0,         0x00,       100,          0,          0,          0,     0   ,     0    ,   0    ,  0 ,           8304, 'Razorgore Event Spawning Adds - Summon Creature - East South 4 - Summon Next'),
(8302077,       0,          0,        39,    8302078,     8302079,           0,           0,             0,               0,               0,         0x00,        79,         21,          0,          0,     0   ,     0    ,   0    ,  0 ,              0, 'Razorgore Event Spawning Adds - Summon Creature - East South 5 - Summon Delayed or Immediately'),
(8302078,      15,          0,        39,    8302039,           0,           0,           0,             0,               0,               0,         0x00,       100,          0,          0,          0,     0   ,     0    ,   0    ,  0 ,           8304, 'Razorgore Event Spawning Adds - Summon Creature - East South 5 - Summon Delayed'),
(8302078,      30,          0,        39,    8302069,           0,           0,           0,             0,               0,               0,         0x00,       100,          0,          0,          0,     0   ,     0    ,   0    ,  0 ,           8304, 'Razorgore Event Spawning Adds - Summon Creature - East South 5 - Summon First'),
(8302079,       0,          0,        39,    8302039,           0,           0,           0,             0,               0,               0,         0x00,       100,          0,          0,          0,     0   ,     0    ,   0    ,  0 ,              0, 'Razorgore Event Spawning Adds - Summon Creature - East South 5 - Summon Immediately'),
(8302079,      15,          0,        39,    8302080,           0,           0,           0,             0,               0,               0,         0x00,       100,          0,          0,          0,     0   ,     0    ,   0    ,  0 ,           8304, 'Razorgore Event Spawning Adds - Summon Creature - East South 5 - Summon Next'),
(8302080,      15,          0,        39,    8302039,           0,           0,           0,             0,               0,               0,         0x00,       100,          0,          0,          0,     0   ,     0    ,   0    ,  0 ,           8304, 'Razorgore Event Spawning Adds - Summon Creature - East South 6 - Summon Delayed'),
(8302080,      30,          0,        39,    8302069,           0,           0,           0,             0,               0,               0,         0x00,       100,          0,          0,          0,     0   ,     0    ,   0    ,  0 ,           8304, 'Razorgore Event Spawning Adds - Summon Creature - East South 6 - Summon First'),
(8302081,       0,          0,        39,    8302040,           0,           0,           0,             0,               0,               0,         0x00,       100,          0,          0,          0,     0   ,     0    ,   0    ,  0 ,              0, 'Razorgore Event Spawning Adds - Summon Creature - South East 1 - Summon'),
(8302081,      15,          0,        39,    8302082,           0,           0,           0,             0,               0,               0,         0x00,       100,          0,          0,          0,     0   ,     0    ,   0    ,  0 ,           8304, 'Razorgore Event Spawning Adds - Summon Creature - South East 1 - Summon Next'),
(8302082,       0,          0,        39,    8302083,     8302084,           0,           0,             0,               0,               0,         0x00,        75,         25,          0,          0,     0   ,     0    ,   0    ,  0 ,            590, 'Razorgore Event Spawning Adds - Summon Creature - South East 2 (25 or more alive) - Summon Delayed or Immediately'),
(8302082,       0,          1,        39,    8302040,           0,           0,           0,             0,               0,               0,         0x08,       100,          0,          0,          0,     0   ,     0    ,   0    ,  0 ,            589, 'Razorgore Event Spawning Adds - Summon Creature - South East 2 (fewer than 25 alive) - Summon'),
(8302082,      15,          1,        39,    8302085,           0,           0,           0,             0,               0,               0,         0x00,       100,          0,          0,          0,     0   ,     0    ,   0    ,  0 ,           8305, 'Razorgore Event Spawning Adds - Summon Creature - South East 2 (fewer than 25 alive) - Summon Next'),
(8302083,      15,          0,        39,    8302040,           0,           0,           0,             0,               0,               0,         0x00,       100,          0,          0,          0,     0   ,     0    ,   0    ,  0 ,           8304, 'Razorgore Event Spawning Adds - Summon Creature - South East 2 (25 or more alive) - Summon Delayed'),
(8302083,      30,          0,        39,    8302081,           0,           0,           0,             0,               0,               0,         0x00,       100,          0,          0,          0,     0   ,     0    ,   0    ,  0 ,           8304, 'Razorgore Event Spawning Adds - Summon Creature - South East 2 (25 or more alive) - Summon First'),
(8302084,       0,          0,        39,    8302040,           0,           0,           0,             0,               0,               0,         0x00,       100,          0,          0,          0,     0   ,     0    ,   0    ,  0 ,              0, 'Razorgore Event Spawning Adds - Summon Creature - South East 2 (25 or more alive) - Summon Immediately'),
(8302084,      15,          0,        39,    8302085,           0,           0,           0,             0,               0,               0,         0x00,       100,          0,          0,          0,     0   ,     0    ,   0    ,  0 ,           8304, 'Razorgore Event Spawning Adds - Summon Creature - South East 2 (25 or more alive) - Summon Next'),
(8302085,       0,          0,        39,    8302040,           0,           0,           0,             0,               0,               0,         0x00,       100,          0,          0,          0,     0   ,     0    ,   0    ,  0 ,              0, 'Razorgore Event Spawning Adds - Summon Creature - South East 3 - Summon'),
(8302085,      15,          0,        39,    8302086,           0,           0,           0,             0,               0,               0,         0x00,       100,          0,          0,          0,     0   ,     0    ,   0    ,  0 ,           8304, 'Razorgore Event Spawning Adds - Summon Creature - South East 3 - Summon Next'),
(8302086,       0,          0,        39,    8302087,     8302088,           0,           0,             0,               0,               0,         0x00,        44,         56,          0,          0,     0   ,     0    ,   0    ,  0 ,              0, 'Razorgore Event Spawning Adds - Summon Creature - South East 4 - Summon Delayed or Immediately'),
(8302087,      15,          0,        39,    8302040,           0,           0,           0,             0,               0,               0,         0x00,       100,          0,          0,          0,     0   ,     0    ,   0    ,  0 ,           8304, 'Razorgore Event Spawning Adds - Summon Creature - South East 4 - Summon Delayed'),
(8302087,      30,          0,        39,    8302081,           0,           0,           0,             0,               0,               0,         0x00,       100,          0,          0,          0,     0   ,     0    ,   0    ,  0 ,           8304, 'Razorgore Event Spawning Adds - Summon Creature - South East 4 - Summon First'),
(8302088,       0,          0,        39,    8302040,           0,           0,           0,             0,               0,               0,         0x00,       100,          0,          0,          0,     0   ,     0    ,   0    ,  0 ,              0, 'Razorgore Event Spawning Adds - Summon Creature - South East 4 - Summon Immediately'),
(8302088,      15,          0,        39,    8302089,           0,           0,           0,             0,               0,               0,         0x00,       100,          0,          0,          0,     0   ,     0    ,   0    ,  0 ,           8304, 'Razorgore Event Spawning Adds - Summon Creature - South East 4 - Summon Next'),
(8302089,       0,          0,        39,    8302090,     8302091,           0,           0,             0,               0,               0,         0x00,        79,         21,          0,          0,     0   ,     0    ,   0    ,  0 ,              0, 'Razorgore Event Spawning Adds - Summon Creature - South East 5 - Summon Delayed or Immediately'),
(8302090,      15,          0,        39,    8302040,           0,           0,           0,             0,               0,               0,         0x00,       100,          0,          0,          0,     0   ,     0    ,   0    ,  0 ,           8304, 'Razorgore Event Spawning Adds - Summon Creature - South East 5 - Summon Delayed'),
(8302090,      30,          0,        39,    8302081,           0,           0,           0,             0,               0,               0,         0x00,       100,          0,          0,          0,     0   ,     0    ,   0    ,  0 ,           8304, 'Razorgore Event Spawning Adds - Summon Creature - South East 5 - Summon First'),
(8302091,       0,          0,        39,    8302040,           0,           0,           0,             0,               0,               0,         0x00,       100,          0,          0,          0,     0   ,     0    ,   0    ,  0 ,              0, 'Razorgore Event Spawning Adds - Summon Creature - South East 5 - Summon Immediately'),
(8302091,      15,          0,        39,    8302092,           0,           0,           0,             0,               0,               0,         0x00,       100,          0,          0,          0,     0   ,     0    ,   0    ,  0 ,           8304, 'Razorgore Event Spawning Adds - Summon Creature - South East 5 - Summon Next'),
(8302092,      15,          0,        39,    8302040,           0,           0,           0,             0,               0,               0,         0x00,       100,          0,          0,          0,     0   ,     0    ,   0    ,  0 ,           8304, 'Razorgore Event Spawning Adds - Summon Creature - South East 6 - Summon Delayed'),
(8302092,      30,          0,        39,    8302081,           0,           0,           0,             0,               0,               0,         0x00,       100,          0,          0,          0,     0   ,     0    ,   0    ,  0 ,           8304, 'Razorgore Event Spawning Adds - Summon Creature - South East 6 - Summon First'),
(8302093,       0,          0,        39,    8302041,           0,           0,           0,             0,               0,               0,         0x00,       100,          0,          0,          0,     0   ,     0    ,   0    ,  0 ,              0, 'Razorgore Event Spawning Adds - Summon Creature - South 1 - Summon'),
(8302093,      15,          0,        39,    8302094,           0,           0,           0,             0,               0,               0,         0x00,       100,          0,          0,          0,     0   ,     0    ,   0    ,  0 ,           8304, 'Razorgore Event Spawning Adds - Summon Creature - South 1 - Summon Next'),
(8302094,       0,          0,        39,    8302095,     8302096,           0,           0,             0,               0,               0,         0x00,        75,         25,          0,          0,     0   ,     0    ,   0    ,  0 ,            590, 'Razorgore Event Spawning Adds - Summon Creature - South 2 (25 or more alive) - Summon Delayed or Immediately'),
(8302094,       0,          1,        39,    8302041,           0,           0,           0,             0,               0,               0,         0x08,       100,          0,          0,          0,     0   ,     0    ,   0    ,  0 ,            589, 'Razorgore Event Spawning Adds - Summon Creature - South 2 (fewer than 25 alive) - Summon'),
(8302094,      15,          1,        39,    8302097,           0,           0,           0,             0,               0,               0,         0x00,       100,          0,          0,          0,     0   ,     0    ,   0    ,  0 ,           8305, 'Razorgore Event Spawning Adds - Summon Creature - South 2 (fewer than 25 alive) - Summon Next'),
(8302095,      15,          0,        39,    8302041,           0,           0,           0,             0,               0,               0,         0x00,       100,          0,          0,          0,     0   ,     0    ,   0    ,  0 ,           8304, 'Razorgore Event Spawning Adds - Summon Creature - South 2 (25 or more alive) - Summon Delayed'),
(8302095,      30,          0,        39,    8302093,           0,           0,           0,             0,               0,               0,         0x00,       100,          0,          0,          0,     0   ,     0    ,   0    ,  0 ,           8304, 'Razorgore Event Spawning Adds - Summon Creature - South 2 (25 or more alive) - Summon First'),
(8302096,       0,          0,        39,    8302041,           0,           0,           0,             0,               0,               0,         0x00,       100,          0,          0,          0,     0   ,     0    ,   0    ,  0 ,              0, 'Razorgore Event Spawning Adds - Summon Creature - South 2 (25 or more alive) - Summon Immediately'),
(8302096,      15,          0,        39,    8302097,           0,           0,           0,             0,               0,               0,         0x00,       100,          0,          0,          0,     0   ,     0    ,   0    ,  0 ,           8304, 'Razorgore Event Spawning Adds - Summon Creature - South 2 (25 or more alive) - Summon Next'),
(8302097,       0,          0,        39,    8302041,           0,           0,           0,             0,               0,               0,         0x00,       100,          0,          0,          0,     0   ,     0    ,   0    ,  0 ,              0, 'Razorgore Event Spawning Adds - Summon Creature - South 3 - Summon'),
(8302097,      15,          0,        39,    8302098,           0,           0,           0,             0,               0,               0,         0x00,       100,          0,          0,          0,     0   ,     0    ,   0    ,  0 ,           8304, 'Razorgore Event Spawning Adds - Summon Creature - South 3 - Summon Next'),
(8302098,       0,          0,        39,    8302099,     8302100,           0,           0,             0,               0,               0,         0x00,        44,         56,          0,          0,     0   ,     0    ,   0    ,  0 ,              0, 'Razorgore Event Spawning Adds - Summon Creature - South 4 - Summon Delayed or Immediately'),
(8302099,      15,          0,        39,    8302041,           0,           0,           0,             0,               0,               0,         0x00,       100,          0,          0,          0,     0   ,     0    ,   0    ,  0 ,           8304, 'Razorgore Event Spawning Adds - Summon Creature - South 4 - Summon Delayed'),
(8302099,      30,          0,        39,    8302093,           0,           0,           0,             0,               0,               0,         0x00,       100,          0,          0,          0,     0   ,     0    ,   0    ,  0 ,           8304, 'Razorgore Event Spawning Adds - Summon Creature - South 4 - Summon First'),
(8302100,       0,          0,        39,    8302041,           0,           0,           0,             0,               0,               0,         0x00,       100,          0,          0,          0,     0   ,     0    ,   0    ,  0 ,              0, 'Razorgore Event Spawning Adds - Summon Creature - South 4 - Summon Immediately'),
(8302100,      15,          0,        39,    8302101,           0,           0,           0,             0,               0,               0,         0x00,       100,          0,          0,          0,     0   ,     0    ,   0    ,  0 ,           8304, 'Razorgore Event Spawning Adds - Summon Creature - South 4 - Summon Next'),
(8302101,       0,          0,        39,    8302102,     8302103,           0,           0,             0,               0,               0,         0x00,        79,         21,          0,          0,     0   ,     0    ,   0    ,  0 ,              0, 'Razorgore Event Spawning Adds - Summon Creature - South 5 - Summon Delayed or Immediately'),
(8302102,      15,          0,        39,    8302041,           0,           0,           0,             0,               0,               0,         0x00,       100,          0,          0,          0,     0   ,     0    ,   0    ,  0 ,           8304, 'Razorgore Event Spawning Adds - Summon Creature - South 5 - Summon Delayed'),
(8302102,      30,          0,        39,    8302093,           0,           0,           0,             0,               0,               0,         0x00,       100,          0,          0,          0,     0   ,     0    ,   0    ,  0 ,           8304, 'Razorgore Event Spawning Adds - Summon Creature - South 5 - Summon First'),
(8302103,       0,          0,        39,    8302041,           0,           0,           0,             0,               0,               0,         0x00,       100,          0,          0,          0,     0   ,     0    ,   0    ,  0 ,              0, 'Razorgore Event Spawning Adds - Summon Creature - South 5 - Summon Immediately'),
(8302103,      15,          0,        39,    8302104,           0,           0,           0,             0,               0,               0,         0x00,       100,          0,          0,          0,     0   ,     0    ,   0    ,  0 ,           8304, 'Razorgore Event Spawning Adds - Summon Creature - South 5 - Summon Next'),
(8302104,      15,          0,        39,    8302041,           0,           0,           0,             0,               0,               0,         0x00,       100,          0,          0,          0,     0   ,     0    ,   0    ,  0 ,           8304, 'Razorgore Event Spawning Adds - Summon Creature - South 6 - Summon Delayed'),
(8302104,      30,          0,        39,    8302093,           0,           0,           0,             0,               0,               0,         0x00,       100,          0,          0,          0,     0   ,     0    ,   0    ,  0 ,           8304, 'Razorgore Event Spawning Adds - Summon Creature - South 6 - Summon First'),
(8302105,       0,          0,        39,    8302042,           0,           0,           0,             0,               0,               0,         0x00,       100,          0,          0,          0,     0   ,     0    ,   0    ,  0 ,              0, 'Razorgore Event Spawning Adds - Summon Creature - West 1 - Summon'),
(8302105,      15,          0,        39,    8302106,           0,           0,           0,             0,               0,               0,         0x00,       100,          0,          0,          0,     0   ,     0    ,   0    ,  0 ,           8304, 'Razorgore Event Spawning Adds - Summon Creature - West 1 - Summon Next'),
(8302106,       0,          0,        39,    8302107,     8302108,           0,           0,             0,               0,               0,         0x00,        75,         25,          0,          0,     0   ,     0    ,   0    ,  0 ,            590, 'Razorgore Event Spawning Adds - Summon Creature - West 2 (25 or more alive) - Summon Delayed or Immediately'),
(8302106,       0,          1,        39,    8302042,           0,           0,           0,             0,               0,               0,         0x08,       100,          0,          0,          0,     0   ,     0    ,   0    ,  0 ,            589, 'Razorgore Event Spawning Adds - Summon Creature - West 2 (fewer than 25 alive) - Summon'),
(8302106,      15,          1,        39,    8302109,           0,           0,           0,             0,               0,               0,         0x00,       100,          0,          0,          0,     0   ,     0    ,   0    ,  0 ,           8305, 'Razorgore Event Spawning Adds - Summon Creature - West 2 (fewer than 25 alive) - Summon Next'),
(8302107,      15,          0,        39,    8302042,           0,           0,           0,             0,               0,               0,         0x00,       100,          0,          0,          0,     0   ,     0    ,   0    ,  0 ,           8304, 'Razorgore Event Spawning Adds - Summon Creature - West 2 (25 or more alive) - Summon Delayed'),
(8302107,      30,          0,        39,    8302105,           0,           0,           0,             0,               0,               0,         0x00,       100,          0,          0,          0,     0   ,     0    ,   0    ,  0 ,           8304, 'Razorgore Event Spawning Adds - Summon Creature - West 2 (25 or more alive) - Summon First'),
(8302108,       0,          0,        39,    8302042,           0,           0,           0,             0,               0,               0,         0x00,       100,          0,          0,          0,     0   ,     0    ,   0    ,  0 ,              0, 'Razorgore Event Spawning Adds - Summon Creature - West 2 (25 or more alive) - Summon Immediately'),
(8302108,      15,          0,        39,    8302109,           0,           0,           0,             0,               0,               0,         0x00,       100,          0,          0,          0,     0   ,     0    ,   0    ,  0 ,           8304, 'Razorgore Event Spawning Adds - Summon Creature - West 2 (25 or more alive) - Summon Next'),
(8302109,       0,          0,        39,    8302042,           0,           0,           0,             0,               0,               0,         0x00,       100,          0,          0,          0,     0   ,     0    ,   0    ,  0 ,              0, 'Razorgore Event Spawning Adds - Summon Creature - West 3 - Summon'),
(8302109,      15,          0,        39,    8302110,           0,           0,           0,             0,               0,               0,         0x00,       100,          0,          0,          0,     0   ,     0    ,   0    ,  0 ,           8304, 'Razorgore Event Spawning Adds - Summon Creature - West 3 - Summon Next'),
(8302110,       0,          0,        39,    8302111,     8302112,           0,           0,             0,               0,               0,         0x00,        44,         56,          0,          0,     0   ,     0    ,   0    ,  0 ,              0, 'Razorgore Event Spawning Adds - Summon Creature - West 4 - Summon Delayed or Immediately'),
(8302111,      15,          0,        39,    8302042,           0,           0,           0,             0,               0,               0,         0x00,       100,          0,          0,          0,     0   ,     0    ,   0    ,  0 ,           8304, 'Razorgore Event Spawning Adds - Summon Creature - West 4 - Summon Delayed'),
(8302111,      30,          0,        39,    8302105,           0,           0,           0,             0,               0,               0,         0x00,       100,          0,          0,          0,     0   ,     0    ,   0    ,  0 ,           8304, 'Razorgore Event Spawning Adds - Summon Creature - West 4 - Summon First'),
(8302112,       0,          0,        39,    8302042,           0,           0,           0,             0,               0,               0,         0x00,       100,          0,          0,          0,     0   ,     0    ,   0    ,  0 ,              0, 'Razorgore Event Spawning Adds - Summon Creature - West 4 - Summon Immediately'),
(8302112,      15,          0,        39,    8302113,           0,           0,           0,             0,               0,               0,         0x00,       100,          0,          0,          0,     0   ,     0    ,   0    ,  0 ,           8304, 'Razorgore Event Spawning Adds - Summon Creature - West 4 - Summon Next'),
(8302113,       0,          0,        39,    8302114,     8302115,           0,           0,             0,               0,               0,         0x00,        79,         21,          0,          0,     0   ,     0    ,   0    ,  0 ,              0, 'Razorgore Event Spawning Adds - Summon Creature - West 5 - Summon Delayed or Immediately'),
(8302114,      15,          0,        39,    8302042,           0,           0,           0,             0,               0,               0,         0x00,       100,          0,          0,          0,     0   ,     0    ,   0    ,  0 ,           8304, 'Razorgore Event Spawning Adds - Summon Creature - West 5 - Summon Delayed'),
(8302114,      30,          0,        39,    8302105,           0,           0,           0,             0,               0,               0,         0x00,       100,          0,          0,          0,     0   ,     0    ,   0    ,  0 ,           8304, 'Razorgore Event Spawning Adds - Summon Creature - West 5 - Summon First'),
(8302115,       0,          0,        39,    8302042,           0,           0,           0,             0,               0,               0,         0x00,       100,          0,          0,          0,     0   ,     0    ,   0    ,  0 ,              0, 'Razorgore Event Spawning Adds - Summon Creature - West 5 - Summon Immediately'),
(8302115,      15,          0,        39,    8302116,           0,           0,           0,             0,               0,               0,         0x00,       100,          0,          0,          0,     0   ,     0    ,   0    ,  0 ,           8304, 'Razorgore Event Spawning Adds - Summon Creature - West 5 - Summon Next'),
(8302116,      15,          0,        39,    8302042,           0,           0,           0,             0,               0,               0,         0x00,       100,          0,          0,          0,     0   ,     0    ,   0    ,  0 ,           8304, 'Razorgore Event Spawning Adds - Summon Creature - West 6 - Summon Delayed'),
(8302116,      30,          0,        39,    8302105,           0,           0,           0,             0,               0,               0,         0x00,       100,          0,          0,          0,     0   ,     0    ,   0    ,  0 ,           8304, 'Razorgore Event Spawning Adds - Summon Creature - West 6 - Summon First'),
(8302117,       0,          0,        39,    8302043,           0,           0,           0,             0,               0,               0,         0x00,       100,          0,          0,          0,     0   ,     0    ,   0    ,  0 ,              0, 'Razorgore Event Spawning Adds - Summon Creature - West North 1 - Summon'),
(8302117,      15,          0,        39,    8302118,           0,           0,           0,             0,               0,               0,         0x00,       100,          0,          0,          0,     0   ,     0    ,   0    ,  0 ,           8304, 'Razorgore Event Spawning Adds - Summon Creature - West North 1 - Summon Next'),
(8302118,       0,          0,        39,    8302119,     8302120,           0,           0,             0,               0,               0,         0x00,        75,         25,          0,          0,     0   ,     0    ,   0    ,  0 ,            590, 'Razorgore Event Spawning Adds - Summon Creature - West North 2 (25 or more alive) - Summon Delayed or Immediately'),
(8302118,       0,          1,        39,    8302043,           0,           0,           0,             0,               0,               0,         0x08,       100,          0,          0,          0,     0   ,     0    ,   0    ,  0 ,            589, 'Razorgore Event Spawning Adds - Summon Creature - West North 2 (fewer than 25 alive) - Summon'),
(8302118,      15,          1,        39,    8302121,           0,           0,           0,             0,               0,               0,         0x00,       100,          0,          0,          0,     0   ,     0    ,   0    ,  0 ,           8305, 'Razorgore Event Spawning Adds - Summon Creature - West North 2 (fewer than 25 alive) - Summon Next'),
(8302119,      15,          0,        39,    8302043,           0,           0,           0,             0,               0,               0,         0x00,       100,          0,          0,          0,     0   ,     0    ,   0    ,  0 ,           8304, 'Razorgore Event Spawning Adds - Summon Creature - West North 2 (25 or more alive) - Summon Delayed'),
(8302119,      30,          0,        39,    8302117,           0,           0,           0,             0,               0,               0,         0x00,       100,          0,          0,          0,     0   ,     0    ,   0    ,  0 ,           8304, 'Razorgore Event Spawning Adds - Summon Creature - West North 2 (25 or more alive) - Summon First'),
(8302120,       0,          0,        39,    8302043,           0,           0,           0,             0,               0,               0,         0x00,       100,          0,          0,          0,     0   ,     0    ,   0    ,  0 ,              0, 'Razorgore Event Spawning Adds - Summon Creature - West North 2 (25 or more alive) - Summon Immediately'),
(8302120,      15,          0,        39,    8302121,           0,           0,           0,             0,               0,               0,         0x00,       100,          0,          0,          0,     0   ,     0    ,   0    ,  0 ,           8304, 'Razorgore Event Spawning Adds - Summon Creature - West North 2 (25 or more alive) - Summon Next'),
(8302121,       0,          0,        39,    8302043,           0,           0,           0,             0,               0,               0,         0x00,       100,          0,          0,          0,     0   ,     0    ,   0    ,  0 ,              0, 'Razorgore Event Spawning Adds - Summon Creature - West North 3 - Summon'),
(8302121,      15,          0,        39,    8302122,           0,           0,           0,             0,               0,               0,         0x00,       100,          0,          0,          0,     0   ,     0    ,   0    ,  0 ,           8304, 'Razorgore Event Spawning Adds - Summon Creature - West North 3 - Summon Next'),
(8302122,       0,          0,        39,    8302123,     8302124,           0,           0,             0,               0,               0,         0x00,        44,         56,          0,          0,     0   ,     0    ,   0    ,  0 ,              0, 'Razorgore Event Spawning Adds - Summon Creature - West North 4 - Summon Delayed or Immediately'),
(8302123,      15,          0,        39,    8302043,           0,           0,           0,             0,               0,               0,         0x00,       100,          0,          0,          0,     0   ,     0    ,   0    ,  0 ,           8304, 'Razorgore Event Spawning Adds - Summon Creature - West North 4 - Summon Delayed'),
(8302123,      30,          0,        39,    8302117,           0,           0,           0,             0,               0,               0,         0x00,       100,          0,          0,          0,     0   ,     0    ,   0    ,  0 ,           8304, 'Razorgore Event Spawning Adds - Summon Creature - West North 4 - Summon First'),
(8302124,       0,          0,        39,    8302043,           0,           0,           0,             0,               0,               0,         0x00,       100,          0,          0,          0,     0   ,     0    ,   0    ,  0 ,              0, 'Razorgore Event Spawning Adds - Summon Creature - West North 4 - Summon Immediately'),
(8302124,      15,          0,        39,    8302125,           0,           0,           0,             0,               0,               0,         0x00,       100,          0,          0,          0,     0   ,     0    ,   0    ,  0 ,           8304, 'Razorgore Event Spawning Adds - Summon Creature - West North 4 - Summon Next'),
(8302125,       0,          0,        39,    8302126,     8302127,           0,           0,             0,               0,               0,         0x00,        79,         21,          0,          0,     0   ,     0    ,   0    ,  0 ,              0, 'Razorgore Event Spawning Adds - Summon Creature - West North 5 - Summon Delayed or Immediately'),
(8302126,      15,          0,        39,    8302043,           0,           0,           0,             0,               0,               0,         0x00,       100,          0,          0,          0,     0   ,     0    ,   0    ,  0 ,           8304, 'Razorgore Event Spawning Adds - Summon Creature - West North 5 - Summon Delayed'),
(8302126,      30,          0,        39,    8302117,           0,           0,           0,             0,               0,               0,         0x00,       100,          0,          0,          0,     0   ,     0    ,   0    ,  0 ,           8304, 'Razorgore Event Spawning Adds - Summon Creature - West North 5 - Summon First'),
(8302127,       0,          0,        39,    8302043,           0,           0,           0,             0,               0,               0,         0x00,       100,          0,          0,          0,     0   ,     0    ,   0    ,  0 ,              0, 'Razorgore Event Spawning Adds - Summon Creature - West North 5 - Summon Immediately'),
(8302127,      15,          0,        39,    8302128,           0,           0,           0,             0,               0,               0,         0x00,       100,          0,          0,          0,     0   ,     0    ,   0    ,  0 ,           8304, 'Razorgore Event Spawning Adds - Summon Creature - West North 5 - Summon Next'),
(8302128,      15,          0,        39,    8302043,           0,           0,           0,             0,               0,               0,         0x00,       100,          0,          0,          0,     0   ,     0    ,   0    ,  0 ,           8304, 'Razorgore Event Spawning Adds - Summon Creature - West North 6 - Summon Delayed'),
(8302128,      30,          0,        39,    8302117,           0,           0,           0,             0,               0,               0,         0x00,       100,          0,          0,          0,     0   ,     0    ,   0    ,  0 ,           8304, 'Razorgore Event Spawning Adds - Summon Creature - West North 6 - Summon First'),
(8302129,       0,          0,        39,    8302044,           0,           0,           0,             0,               0,               0,         0x00,       100,          0,          0,          0,     0   ,     0    ,   0    ,  0 ,              0, 'Razorgore Event Spawning Adds - Summon Creature - North West 1 - Summon'),
(8302129,      15,          0,        39,    8302130,           0,           0,           0,             0,               0,               0,         0x00,       100,          0,          0,          0,     0   ,     0    ,   0    ,  0 ,           8304, 'Razorgore Event Spawning Adds - Summon Creature - North West 1 - Summon Next'),
(8302130,       0,          0,        39,    8302131,     8302132,           0,           0,             0,               0,               0,         0x00,        75,         25,          0,          0,     0   ,     0    ,   0    ,  0 ,            590, 'Razorgore Event Spawning Adds - Summon Creature - North West 2 (25 or more alive) - Summon Delayed or Immediately'),
(8302130,       0,          1,        39,    8302044,           0,           0,           0,             0,               0,               0,         0x08,       100,          0,          0,          0,     0   ,     0    ,   0    ,  0 ,            589, 'Razorgore Event Spawning Adds - Summon Creature - North West 2 (fewer than 25 alive) - Summon'),
(8302130,      15,          1,        39,    8302133,           0,           0,           0,             0,               0,               0,         0x00,       100,          0,          0,          0,     0   ,     0    ,   0    ,  0 ,           8305, 'Razorgore Event Spawning Adds - Summon Creature - North West 2 (fewer than 25 alive) - Summon Next'),
(8302131,      15,          0,        39,    8302044,           0,           0,           0,             0,               0,               0,         0x00,       100,          0,          0,          0,     0   ,     0    ,   0    ,  0 ,           8304, 'Razorgore Event Spawning Adds - Summon Creature - North West 2 (25 or more alive) - Summon Delayed'),
(8302131,      30,          0,        39,    8302129,           0,           0,           0,             0,               0,               0,         0x00,       100,          0,          0,          0,     0   ,     0    ,   0    ,  0 ,           8304, 'Razorgore Event Spawning Adds - Summon Creature - North West 2 (25 or more alive) - Summon First'),
(8302132,       0,          0,        39,    8302044,           0,           0,           0,             0,               0,               0,         0x00,       100,          0,          0,          0,     0   ,     0    ,   0    ,  0 ,              0, 'Razorgore Event Spawning Adds - Summon Creature - North West 2 (25 or more alive) - Summon Immediately'),
(8302132,      15,          0,        39,    8302133,           0,           0,           0,             0,               0,               0,         0x00,       100,          0,          0,          0,     0   ,     0    ,   0    ,  0 ,           8304, 'Razorgore Event Spawning Adds - Summon Creature - North West 2 (25 or more alive) - Summon Next'),
(8302133,       0,          0,        39,    8302044,           0,           0,           0,             0,               0,               0,         0x00,       100,          0,          0,          0,     0   ,     0    ,   0    ,  0 ,              0, 'Razorgore Event Spawning Adds - Summon Creature - North West 3 - Summon'),
(8302133,      15,          0,        39,    8302134,           0,           0,           0,             0,               0,               0,         0x00,       100,          0,          0,          0,     0   ,     0    ,   0    ,  0 ,           8304, 'Razorgore Event Spawning Adds - Summon Creature - North West 3 - Summon Next'),
(8302134,       0,          0,        39,    8302135,     8302136,           0,           0,             0,               0,               0,         0x00,        44,         56,          0,          0,     0   ,     0    ,   0    ,  0 ,              0, 'Razorgore Event Spawning Adds - Summon Creature - North West 4 - Summon Delayed or Immediately'),
(8302135,      15,          0,        39,    8302044,           0,           0,           0,             0,               0,               0,         0x00,       100,          0,          0,          0,     0   ,     0    ,   0    ,  0 ,           8304, 'Razorgore Event Spawning Adds - Summon Creature - North West 4 - Summon Delayed'),
(8302135,      30,          0,        39,    8302129,           0,           0,           0,             0,               0,               0,         0x00,       100,          0,          0,          0,     0   ,     0    ,   0    ,  0 ,           8304, 'Razorgore Event Spawning Adds - Summon Creature - North West 4 - Summon First'),
(8302136,       0,          0,        39,    8302044,           0,           0,           0,             0,               0,               0,         0x00,       100,          0,          0,          0,     0   ,     0    ,   0    ,  0 ,              0, 'Razorgore Event Spawning Adds - Summon Creature - North West 4 - Summon Immediately'),
(8302136,      15,          0,        39,    8302137,           0,           0,           0,             0,               0,               0,         0x00,       100,          0,          0,          0,     0   ,     0    ,   0    ,  0 ,           8304, 'Razorgore Event Spawning Adds - Summon Creature - North West 4 - Summon Next'),
(8302137,       0,          0,        39,    8302138,     8302139,           0,           0,             0,               0,               0,         0x00,        79,         21,          0,          0,     0   ,     0    ,   0    ,  0 ,              0, 'Razorgore Event Spawning Adds - Summon Creature - North West 5 - Summon Delayed or Immediately'),
(8302138,      15,          0,        39,    8302044,           0,           0,           0,             0,               0,               0,         0x00,       100,          0,          0,          0,     0   ,     0    ,   0    ,  0 ,           8304, 'Razorgore Event Spawning Adds - Summon Creature - North West 5 - Summon Delayed'),
(8302138,      30,          0,        39,    8302129,           0,           0,           0,             0,               0,               0,         0x00,       100,          0,          0,          0,     0   ,     0    ,   0    ,  0 ,           8304, 'Razorgore Event Spawning Adds - Summon Creature - North West 5 - Summon First'),
(8302139,       0,          0,        39,    8302044,           0,           0,           0,             0,               0,               0,         0x00,       100,          0,          0,          0,     0   ,     0    ,   0    ,  0 ,              0, 'Razorgore Event Spawning Adds - Summon Creature - North West 5 - Summon Immediately'),
(8302139,      15,          0,        39,    8302140,           0,           0,           0,             0,               0,               0,         0x00,       100,          0,          0,          0,     0   ,     0    ,   0    ,  0 ,           8304, 'Razorgore Event Spawning Adds - Summon Creature - North West 5 - Summon Next'),
(8302140,      15,          0,        39,    8302044,           0,           0,           0,             0,               0,               0,         0x00,       100,          0,          0,          0,     0   ,     0    ,   0    ,  0 ,           8304, 'Razorgore Event Spawning Adds - Summon Creature - North West 6 - Summon Delayed'),
(8302140,      30,          0,        39,    8302129,           0,           0,           0,             0,               0,               0,         0x00,       100,          0,          0,          0,     0   ,     0    ,   0    ,  0 ,           8304, 'Razorgore Event Spawning Adds - Summon Creature - North West 6 - Summon First'),
(8302141,      75,          0,        39,    8302045,           0,           0,           0,             0,               0,               0,         0x00,       100,          0,          0,          0,     0   ,     0    ,   0    ,  0 ,           8302, 'Razorgore Event Spawning Adds - Start Spawning Adds (North)'),
(8302142,      75,          0,        39,    8302057,           0,           0,           0,             0,               0,               0,         0x00,       100,          0,          0,          0,     0   ,     0    ,   0    ,  0 ,           8302, 'Razorgore Event Spawning Adds - Start Spawning Adds (East)'),
(8302143,      45,          0,        39,    8302069,           0,           0,           0,             0,               0,               0,         0x00,       100,          0,          0,          0,     0   ,     0    ,   0    ,  0 ,           8302, 'Razorgore Event Spawning Adds - Start Spawning Adds (East South)'),
(8302144,      45,          0,        39,    8302081,           0,           0,           0,             0,               0,               0,         0x00,       100,          0,          0,          0,     0   ,     0    ,   0    ,  0 ,           8302, 'Razorgore Event Spawning Adds - Start Spawning Adds (South East)'),
(8302145,      75,          0,        39,    8302093,           0,           0,           0,             0,               0,               0,         0x00,       100,          0,          0,          0,     0   ,     0    ,   0    ,  0 ,           8302, 'Razorgore Event Spawning Adds - Start Spawning Adds (South)'),
(8302146,      75,          0,        39,    8302105,           0,           0,           0,             0,               0,               0,         0x00,       100,          0,          0,          0,     0   ,     0    ,   0    ,  0 ,           8302, 'Razorgore Event Spawning Adds - Start Spawning Adds (West)'),
(8302147,      45,          0,        39,    8302117,           0,           0,           0,             0,               0,               0,         0x00,       100,          0,          0,          0,     0   ,     0    ,   0    ,  0 ,           8302, 'Razorgore Event Spawning Adds - Start Spawning Adds (West North)'),
(8302148,      45,          0,        39,    8302129,           0,           0,           0,             0,               0,               0,         0x00,       100,          0,          0,          0,     0   ,     0    ,   0    ,  0 ,           8302, 'Razorgore Event Spawning Adds - Start Spawning Adds (North West)');

-- Movement script for Blackwing Legionnaire, Blackwing Mage, Deathtalon Dragonspawn
INSERT INTO `creature_movement_scripts`
(  `id`, `command`, `datalong`, `comments`) VALUES
(830201,        49,          1, 'Razorgore Event Spawning Adds - Combat Pulse');

-- Waypoints for Blackwing Legionnaire, Blackwing Mage, Deathtalon Dragonspawn (North)
INSERT INTO `creature_movement_special`
(  `id`, `point`, `position_x`, `position_y`, `position_z`, `script_id`, `path_id`) VALUES
(830204,       1,     -7611.79,     -1022.45,      413.597,      830201,    830205),
(830205,       1,     -7529.6 ,     -1064.9 ,      407.344,           0,         0),
(830205,       2,     -7532.72,     -1063.49,      407.344,           0,         0),
(830205,       3,     -7535.84,     -1062.08,      407.344,           0,         0),
(830205,       4,     -7535.88,     -1058.81,      408.544,           0,         0),
(830205,       5,     -7537.27,     -1057.84,      408.544,           0,         0),
(830205,       6,     -7537.77,     -1057.49,      408.89 ,           0,         0),
(830205,       7,     -7538.47,     -1057.0 ,      408.944,           0,         0),
(830205,       8,     -7538.71,     -1056.76,      408.928,           0,         0),
(830205,       9,     -7538.93,     -1056.53,      408.594,           0,         0),
(830205,      10,     -7539.1 ,     -1056.36,      408.827,           0,         0),
(830205,      11,     -7539.5 ,     -1055.96,      408.878,           0,         0),
(830205,      12,     -7540.25,     -1055.21,      408.544,           0,         0),
(830205,      13,     -7542.52,     -1052.92,      408.544,           0,         0),
(830205,      14,     -7543.63,     -1051.81,      408.737,           0,         0),
(830205,      15,     -7545.17,     -1050.26,      408.463,           0,         0),
(830205,      16,     -7547.29,     -1048.12,      408.544,           0,         0),
(830205,      17,     -7549.06,     -1045.76,      407.363,           0,         0),
(830205,      18,     -7549.5 ,     -1045.63,      407.344,           0,         0),
(830205,      19,     -7552.87,     -1041.4 ,      407.55 ,           0,         0),
(830205,      20,     -7553.88,     -1038.97,      408.544,           0,         0),
(830205,      21,     -7555.07,     -1038.37,      408.544,           0,         0),
(830205,      22,     -7556.37,     -1038.11,      408.544,           0,         0),
(830205,      23,     -7558.44,     -1037.69,      408.544,           0,         0),
(830205,      24,     -7567.79,     -1020.52,      408.544,           0,         0),
(830205,      25,     -7566.17,     -1020.1 ,      408.632,           0,         0),
(830205,      26,     -7568.07,     -1019.6 ,      408.544,           0,         0),
(830205,      27,     -7569.46,     -1016.56,      407.366,           0,         0),
(830205,      28,     -7570.25,     -1016.72,      407.355,           0,         0),
(830205,      29,     -7570.69,     -1016.38,      407.326,           0,         0),
(830205,      30,     -7573.85,     -1017.09,      408.417,           0,         0),
(830205,      31,     -7574.8 ,     -1017.3 ,      408.544,           0,         0),
(830205,      32,     -7604.73,     -1021.47,      408.544,           0,         0),
(830205,      33,     -7603.67,     -1019.7 ,      408.544,           0,         0),
(830205,      34,     -7603.27,     -1019.54,      408.602,           0,         0),
(830205,      35,     -7603.47,     -1019.0 ,      409.544,           0,         0),
(830205,      36,     -7602.97,     -1017.2 ,      410.153,           0,         0),
(830205,      37,     -7602.79,     -1016.4 ,      408.544,           0,         0),
(830205,      38,     -7601.23,     -1013.94,      408.544,           0,         0),
(830205,      39,     -7601.13,     -1013.13,      409.809,           0,         0),
(830205,      40,     -7602.47,     -1013.8 ,      410.354,           0,         0),
(830205,      41,     -7603.47,     -1013.8 ,      410.742,           0,         0),
(830205,      42,     -7603.87,     -1014.0 ,      410.805,           0,         0),
(830205,      43,     -7604.3 ,     -1014.37,      410.928,           0,         0),
(830205,      44,     -7604.87,     -1014.8 ,      411.354,           0,         0),
(830205,      45,     -7605.47,     -1015.2 ,      411.586,           0,         0),
(830205,      46,     -7605.87,     -1015.4 ,      411.67 ,           0,         0),
(830205,      47,     -7606.33,     -1015.74,      411.914,           0,         0),
(830205,      48,     -7606.87,     -1016.2 ,      412.17 ,           0,         0),
(830205,      49,     -7607.47,     -1016.6 ,      412.555,           0,         0),
(830205,      50,     -7607.87,     -1016.8 ,      412.743,           0,         0),
(830205,      51,     -7608.33,     -1017.14,      412.876,           0,         0),
(830205,      52,     -7608.45,     -1017.3 ,      413.038,           0,         0),
(830205,      53,     -7608.87,     -1018.2 ,      413.339,           0,         0),
(830205,      54,     -7608.87,     -1018.74,      413.744,           0,         0),
(830205,      55,     -7608.87,     -1019.27,      413.544,           0,         0),
(830205,      56,     -7609.47,     -1020.0 ,      414.145,           0,         0),
(830205,      57,     -7609.87,     -1020.2 ,      413.544,           0,         0),
(830205,      58,     -7610.74,     -1021.22,      413.544,           0,         0),
(830205,      59,     -7611.79,     -1022.45,      413.597,           0,         0);

-- Waypoints for Blackwing Legionnaire, Blackwing Mage, Deathtalon Dragonspawn (East)
INSERT INTO `creature_movement_special`
(  `id`, `point`, `position_x`, `position_y`, `position_z`, `script_id`, `path_id`) VALUES
(830206,       1,     -7619.88,     -1027.51,      413.628,      830201,    830207),
(830207,       1,     -7609.09,     -1120.46,      407.366,           0,         0),
(830207,       2,     -7607.78,     -1116.17,      407.366,           0,         0),
(830207,       3,     -7606.47,     -1111.87,      407.366,           0,         0),
(830207,       4,     -7603.08,     -1110.11,      408.558,           0,         0),
(830207,       5,     -7603.62,     -1106.28,      408.566,           0,         0),
(830207,       6,     -7603.75,     -1105.43,      408.632,           0,         0),
(830207,       7,     -7605.52,     -1092.97,      408.566,           0,         0),
(830207,       8,     -7605.6 ,     -1092.45,      408.898,           0,         0),
(830207,       9,     -7605.63,     -1092.19,      408.875,           0,         0),
(830207,      10,     -7605.73,     -1091.56,      408.599,           0,         0),
(830207,      11,     -7605.83,     -1090.81,      408.902,           0,         0),
(830207,      12,     -7605.89,     -1090.4 ,      408.566,           0,         0),
(830207,      13,     -7607.59,     -1078.51,      408.566,           0,         0),
(830207,      14,     -7611.84,     -1066.67,      408.566,           0,         0),
(830207,      15,     -7613.62,     -1044.22,      408.358,           0,         0),
(830207,      16,     -7623.45,     -1036.61,      408.519,           0,         0),
(830207,      17,     -7622.62,     -1034.71,      408.645,           0,         0),
(830207,      18,     -7623.77,     -1035.4 ,      408.744,           0,         0),
(830207,      19,     -7624.27,     -1035.6 ,      408.944,           0,         0),
(830207,      20,     -7625.17,     -1036.5 ,      408.944,           0,         0),
(830207,      21,     -7626.26,     -1037.29,      408.744,           0,         0),
(830207,      22,     -7631.69,     -1040.7 ,      408.666,           0,         0),
(830207,      23,     -7632.47,     -1040.4 ,      409.144,           0,         0),
(830207,      24,     -7633.07,     -1039.9 ,      409.144,           0,         0),
(830207,      25,     -7633.67,     -1035.6 ,      408.518,           0,         0),
(830207,      26,     -7633.47,     -1035.2 ,      409.345,           0,         0),
(830207,      27,     -7632.87,     -1034.4 ,      409.794,           0,         0),
(830207,      28,     -7632.27,     -1034.0 ,      409.933,           0,         0),
(830207,      29,     -7631.87,     -1033.6 ,      410.144,           0,         0),
(830207,      30,     -7631.47,     -1033.4 ,      410.315,           0,         0),
(830207,      31,     -7630.87,     -1033.0 ,      410.534,           0,         0),
(830207,      32,     -7630.26,     -1032.6 ,      410.884,           0,         0),
(830207,      33,     -7629.87,     -1032.2 ,      411.144,           0,         0),
(830207,      34,     -7629.47,     -1032.0 ,      411.174,           0,         0),
(830207,      35,     -7628.87,     -1031.6 ,      411.483,           0,         0),
(830207,      36,     -7628.27,     -1031.2 ,      411.816,           0,         0),
(830207,      37,     -7627.87,     -1030.8 ,      411.944,           0,         0),
(830207,      38,     -7627.47,     -1030.61,      412.142,           0,         0),
(830207,      39,     -7626.87,     -1030.2 ,      412.329,           0,         0),
(830207,      40,     -7626.37,     -1029.7 ,      412.605,           0,         0),
(830207,      41,     -7626.08,     -1029.09,      412.62 ,           0,         0),
(830207,      42,     -7625.84,     -1029.03,      412.84 ,           0,         0),
(830207,      43,     -7625.6 ,     -1028.63,      412.806,           0,         0),
(830207,      44,     -7625.24,     -1028.55,      413.119,           0,         0),
(830207,      45,     -7624.88,     -1028.83,      413.329,           0,         0),
(830207,      46,     -7624.39,     -1028.7 ,      413.513,           0,         0),
(830207,      47,     -7623.36,     -1028.43,      413.659,           0,         0),
(830207,      48,     -7623.14,     -1028.37,      413.83 ,           0,         0),
(830207,      49,     -7622.43,     -1028.19,      413.544,           0,         0),
(830207,      50,     -7619.88,     -1027.51,      413.628,           0,         0);

-- Waypoints for Blackwing Legionnaire, Blackwing Mage, Deathtalon Dragonspawn (East South)
INSERT INTO `creature_movement_special`
(  `id`, `point`, `position_x`, `position_y`, `position_z`, `script_id`, `path_id`) VALUES
(830208,       1,     -7619.88,     -1027.51,      413.628,      830201,    830209),
(830209,       1,     -7622.58,     -1096.7 ,      407.366,           0,         0),
(830209,       2,     -7623.1 ,     -1094.06,      407.366,           0,         0),
(830209,       3,     -7623.61,     -1091.42,      407.366,           0,         0),
(830209,       4,     -7623.77,     -1090.6 ,      407.629,           0,         0),
(830209,       5,     -7624.29,     -1087.88,      408.578,           0,         0),
(830209,       6,     -7624.22,     -1086.91,      408.566,           0,         0),
(830209,       7,     -7630.34,     -1066.67,      408.566,           0,         0),
(830209,       8,     -7631.52,     -1062.77,      408.522,           0,         0),
(830209,       9,     -7635.23,     -1050.53,      408.578,           0,         0),
(830209,      10,     -7635.3 ,     -1050.3 ,      408.638,           0,         0),
(830209,      11,     -7635.37,     -1050.06,      408.545,           0,         0),
(830209,      12,     -7635.76,     -1048.79,      408.544,           0,         0),
(830209,      13,     -7637.27,     -1043.8 ,      408.544,           0,         0),
(830209,      14,     -7634.85,     -1040.78,      408.544,           0,         0),
(830209,      15,     -7633.87,     -1040.06,      409.222,           0,         0),
(830209,      16,     -7633.65,     -1039.91,      408.998,           0,         0),
(830209,      17,     -7633.4 ,     -1039.72,      408.978,           0,         0),
(830209,      18,     -7633.13,     -1039.52,      409.09 ,           0,         0),
(830209,      19,     -7633.67,     -1035.6 ,      408.518,           0,         0),
(830209,      20,     -7633.47,     -1035.2 ,      409.345,           0,         0),
(830209,      21,     -7632.87,     -1034.4 ,      409.794,           0,         0),
(830209,      22,     -7632.27,     -1034.0 ,      409.933,           0,         0),
(830209,      23,     -7631.87,     -1033.6 ,      410.144,           0,         0),
(830209,      24,     -7631.47,     -1033.4 ,      410.315,           0,         0),
(830209,      25,     -7630.87,     -1033.0 ,      410.534,           0,         0),
(830209,      26,     -7630.26,     -1032.6 ,      410.884,           0,         0),
(830209,      27,     -7629.87,     -1032.2 ,      411.144,           0,         0),
(830209,      28,     -7629.47,     -1032.0 ,      411.174,           0,         0),
(830209,      29,     -7628.87,     -1031.6 ,      411.483,           0,         0),
(830209,      30,     -7628.27,     -1031.2 ,      411.816,           0,         0),
(830209,      31,     -7627.87,     -1030.8 ,      411.944,           0,         0),
(830209,      32,     -7627.47,     -1030.61,      412.142,           0,         0),
(830209,      33,     -7626.87,     -1030.2 ,      412.329,           0,         0),
(830209,      34,     -7626.37,     -1029.7 ,      412.605,           0,         0),
(830209,      35,     -7626.08,     -1029.09,      412.62 ,           0,         0),
(830209,      36,     -7625.84,     -1029.03,      412.84 ,           0,         0),
(830209,      37,     -7625.6 ,     -1028.63,      412.806,           0,         0),
(830209,      38,     -7625.24,     -1028.55,      413.119,           0,         0),
(830209,      39,     -7624.88,     -1028.83,      413.329,           0,         0),
(830209,      40,     -7624.39,     -1028.7 ,      413.513,           0,         0),
(830209,      41,     -7623.36,     -1028.43,      413.659,           0,         0),
(830209,      42,     -7623.14,     -1028.37,      413.83 ,           0,         0),
(830209,      43,     -7622.43,     -1028.19,      413.544,           0,         0),
(830209,      44,     -7619.88,     -1027.51,      413.628,           0,         0);

-- Waypoints for Blackwing Legionnaire, Blackwing Mage, Deathtalon Dragonspawn (South East)
INSERT INTO `creature_movement_special`
(  `id`, `point`, `position_x`, `position_y`, `position_z`, `script_id`, `path_id`) VALUES
(830210,       1,     -7619.88,     -1027.51,      413.628,      830201,    830211),
(830211,       1,     -7643.12,     -1067.25,      407.344,           0,         0),
(830211,       2,     -7643.39,     -1064.69,      407.344,           0,         0),
(830211,       3,     -7643.67,     -1062.13,      407.344,           0,         0),
(830211,       4,     -7643.71,     -1061.71,      407.454,           0,         0),
(830211,       5,     -7643.78,     -1061.06,      407.723,           0,         0),
(830211,       6,     -7644.07,     -1058.4 ,      408.544,           0,         0),
(830211,       7,     -7644.41,     -1057.54,      408.544,           0,         0),
(830211,       8,     -7637.27,     -1043.8 ,      408.544,           0,         0),
(830211,       9,     -7632.77,     -1040.25,      409.223,           0,         0),
(830211,      10,     -7633.07,     -1039.9 ,      409.144,           0,         0),
(830211,      11,     -7633.67,     -1035.6 ,      408.518,           0,         0),
(830211,      12,     -7633.47,     -1035.2 ,      409.345,           0,         0),
(830211,      13,     -7632.87,     -1034.4 ,      409.794,           0,         0),
(830211,      14,     -7632.27,     -1034.0 ,      409.933,           0,         0),
(830211,      15,     -7631.87,     -1033.6 ,      410.144,           0,         0),
(830211,      16,     -7631.47,     -1033.4 ,      410.315,           0,         0),
(830211,      17,     -7630.87,     -1033.0 ,      410.534,           0,         0),
(830211,      18,     -7630.26,     -1032.6 ,      410.884,           0,         0),
(830211,      19,     -7629.87,     -1032.2 ,      411.144,           0,         0),
(830211,      20,     -7629.47,     -1032.0 ,      411.174,           0,         0),
(830211,      21,     -7628.87,     -1031.6 ,      411.483,           0,         0),
(830211,      22,     -7628.27,     -1031.2 ,      411.816,           0,         0),
(830211,      23,     -7627.87,     -1030.8 ,      411.944,           0,         0),
(830211,      24,     -7627.47,     -1030.61,      412.142,           0,         0),
(830211,      25,     -7626.87,     -1030.2 ,      412.329,           0,         0),
(830211,      26,     -7626.37,     -1029.7 ,      412.605,           0,         0),
(830211,      27,     -7626.08,     -1029.09,      412.62 ,           0,         0),
(830211,      28,     -7625.84,     -1029.03,      412.84 ,           0,         0),
(830211,      29,     -7625.6 ,     -1028.63,      412.806,           0,         0),
(830211,      30,     -7625.24,     -1028.55,      413.119,           0,         0),
(830211,      31,     -7624.88,     -1028.83,      413.329,           0,         0),
(830211,      32,     -7624.39,     -1028.7 ,      413.513,           0,         0),
(830211,      33,     -7623.36,     -1028.43,      413.659,           0,         0),
(830211,      34,     -7623.14,     -1028.37,      413.83 ,           0,         0),
(830211,      35,     -7622.43,     -1028.19,      413.544,           0,         0),
(830211,      36,     -7619.88,     -1027.51,      413.628,           0,         0);

-- Waypoints for Blackwing Legionnaire, Blackwing Mage, Deathtalon Dragonspawn (South)
INSERT INTO `creature_movement_special`
(  `id`, `point`, `position_x`, `position_y`, `position_z`, `script_id`, `path_id`) VALUES
(830212,       1,     -7619.88,     -1027.5 ,      413.627,      830201,    830213),
(830213,       1,     -7664.3 ,     -1045.57,      407.357,           0,         0),
(830213,       2,     -7659.81,     -1043.81,      407.377,           0,         0),
(830213,       3,     -7655.33,     -1042.05,      407.396,           0,         0),
(830213,       4,     -7651.78,     -1040.65,      408.544,           0,         0),
(830213,       5,     -7651.02,     -1040.36,      408.544,           0,         0),
(830213,       6,     -7634.79,     -1033.98,      408.544,           0,         0),
(830213,       7,     -7634.35,     -1033.81,      409.144,           0,         0),
(830213,       8,     -7633.27,     -1034.0 ,      409.365,           0,         0),
(830213,       9,     -7632.87,     -1034.4 ,      409.714,           0,         0),
(830213,      10,     -7632.27,     -1034.0 ,      409.933,           0,         0),
(830213,      11,     -7631.87,     -1033.6 ,      410.144,           0,         0),
(830213,      12,     -7631.8 ,     -1032.97,      409.978,           0,         0),
(830213,      13,     -7631.27,     -1032.6 ,      410.162,           0,         0),
(830213,      14,     -7626.27,     -1029.0 ,      412.335,           0,         0),
(830213,      15,     -7625.67,     -1028.6 ,      412.782,           0,         0),
(830213,      16,     -7625.21,     -1028.5 ,      413.094,           0,         0),
(830213,      17,     -7624.87,     -1028.8 ,      413.345,           0,         0),
(830213,      18,     -7624.37,     -1028.67,      413.522,           0,         0),
(830213,      19,     -7623.38,     -1028.42,      413.662,           0,         0),
(830213,      20,     -7623.15,     -1028.35,      413.841,           0,         0),
(830213,      21,     -7622.44,     -1028.17,      413.544,           0,         0),
(830213,      22,     -7619.88,     -1027.5 ,      413.627,           0,         0);

-- Waypoints for Blackwing Legionnaire, Blackwing Mage, Deathtalon Dragonspawn (West)
INSERT INTO `creature_movement_special`
(  `id`, `point`, `position_x`, `position_y`, `position_z`, `script_id`, `path_id`) VALUES
(830214,       1,     -7611.79,     -1022.45,      413.597,      830201,    830215),
(830215,       1,     -7579.84,     -986.863,      407.344,           0,         0),
(830215,       2,     -7583.08,     -990.483,      407.344,           0,         0),
(830215,       3,     -7586.32,     -994.103,      407.344,           0,         0),
(830215,       4,     -7588.66,     -995.783,      408.545,           0,         0),
(830215,       5,     -7590.11,     -997.456,      408.544,           0,         0),
(830215,       6,     -7600.2 ,     -1009.1 ,      408.715,           0,         0),
(830215,       7,     -7601.3 ,     -1010.37,      408.633,           0,         0),
(830215,       8,     -7601.42,     -1010.51,      408.923,           0,         0),
(830215,       9,     -7601.62,     -1010.74,      408.949,           0,         0),
(830215,      10,     -7601.77,     -1010.92,      409.144,           0,         0),
(830215,      11,     -7603.68,     -1011.42,      409.544,           0,         0),
(830215,      12,     -7605.77,     -1009.11,      409.855,           0,         0),
(830215,      13,     -7606.1 ,     -1009.71,      410.233,           0,         0),
(830215,      14,     -7606.35,     -1010.18,      410.198,           0,         0),
(830215,      15,     -7606.75,     -1010.91,      410.632,           0,         0),
(830215,      16,     -7606.69,     -1014.4 ,      411.145,           0,         0),
(830215,      17,     -7607.87,     -1016.2 ,      412.149,           0,         0),
(830215,      18,     -7607.27,     -1015.8 ,      411.876,           0,         0),
(830215,      19,     -7607.69,     -1016.38,      412.323,           0,         0),
(830215,      20,     -7607.92,     -1016.69,      412.633,           0,         0),
(830215,      21,     -7608.42,     -1017.04,      412.785,           0,         0),
(830215,      22,     -7608.67,     -1017.4 ,      413.144,           0,         0),
(830215,      23,     -7608.87,     -1018.2 ,      413.339,           0,         0),
(830215,      24,     -7608.87,     -1018.74,      413.744,           0,         0),
(830215,      25,     -7608.87,     -1019.27,      413.544,           0,         0),
(830215,      26,     -7609.47,     -1020.0 ,      414.145,           0,         0),
(830215,      27,     -7609.87,     -1020.2 ,      413.544,           0,         0),
(830215,      28,     -7610.74,     -1021.22,      413.544,           0,         0),
(830215,      29,     -7611.79,     -1022.45,      413.597,           0,         0);

-- Waypoints for Blackwing Legionnaire, Blackwing Mage, Deathtalon Dragonspawn (West North)
INSERT INTO `creature_movement_special`
(  `id`, `point`, `position_x`, `position_y`, `position_z`, `script_id`, `path_id`) VALUES
(830216,       1,     -7611.79,     -1022.45,      413.597,      830201,    830217),
(830217,       1,     -7568.35,     -1012.8 ,      407.344,           0,         0),
(830217,       2,     -7568.61,     -1012.67,      407.344,           0,         0),
(830217,       3,     -7568.87,     -1012.54,      407.344,           0,         0),
(830217,       4,     -7571.81,     -1011.05,      407.485,           0,         0),
(830217,       5,     -7573.62,     -1010.14,      408.326,           0,         0),
(830217,       6,     -7574.46,     -1009.71,      408.544,           0,         0),
(830217,       7,     -7575.27,     -1009.8 ,      408.544,           0,         0),
(830217,       8,     -7577.94,     -1010.62,      408.544,           0,         0),
(830217,       9,     -7579.18,     -1011.14,      408.544,           0,         0),
(830217,      10,     -7599.67,     -1012.4 ,      408.544,           0,         0),
(830217,      11,     -7600.65,     -1011.19,      408.71 ,           0,         0),
(830217,      12,     -7600.87,     -1011.4 ,      409.143,           0,         0),
(830217,      13,     -7601.27,     -1011.6 ,      409.144,           0,         0),
(830217,      14,     -7601.87,     -1012.0 ,      409.377,           0,         0),
(830217,      15,     -7603.83,     -1013.44,      410.38 ,           0,         0),
(830217,      16,     -7604.02,     -1013.68,      410.574,           0,         0),
(830217,      17,     -7604.56,     -1014.11,      410.797,           0,         0),
(830217,      18,     -7605.06,     -1014.61,      411.155,           0,         0),
(830217,      19,     -7605.53,     -1015.14,      411.515,           0,         0),
(830217,      20,     -7606.87,     -1016.2 ,      412.17 ,           0,         0),
(830217,      21,     -7607.47,     -1016.6 ,      412.555,           0,         0),
(830217,      22,     -7607.87,     -1016.8 ,      412.743,           0,         0),
(830217,      23,     -7608.33,     -1017.14,      412.876,           0,         0),
(830217,      24,     -7608.45,     -1017.3 ,      413.038,           0,         0),
(830217,      25,     -7608.87,     -1018.2 ,      413.339,           0,         0),
(830217,      26,     -7608.87,     -1018.74,      413.744,           0,         0),
(830217,      27,     -7608.87,     -1019.27,      413.544,           0,         0),
(830217,      28,     -7609.47,     -1020.0 ,      414.145,           0,         0),
(830217,      29,     -7609.87,     -1020.2 ,      413.544,           0,         0),
(830217,      30,     -7610.74,     -1021.22,      413.544,           0,         0),
(830217,      31,     -7611.79,     -1022.45,      413.597,           0,         0);

-- Waypoints for Blackwing Legionnaire, Blackwing Mage, Deathtalon Dragonspawn (North West)
INSERT INTO `creature_movement_special`
(  `id`, `point`, `position_x`, `position_y`, `position_z`, `script_id`, `path_id`) VALUES
(830218,       1,     -7611.79,     -1022.45,      413.597,      830201,    830219),
(830219,       1,     -7546.27,     -1044.42,      407.207,           0,         0),
(830219,       2,     -7548.46,     -1041.98,      407.343,           0,         0),
(830219,       3,     -7550.66,     -1039.54,      407.479,           0,         0),
(830219,       4,     -7551.26,     -1038.87,      407.832,           0,         0),
(830219,       5,     -7552.23,     -1037.79,      408.544,           0,         0),
(830219,       6,     -7555.21,     -1034.49,      408.544,           0,         0),
(830219,       7,     -7556.04,     -1033.56,      408.544,           0,         0),
(830219,       8,     -7556.73,     -1032.8 ,      408.544,           0,         0),
(830219,       9,     -7559.61,     -1029.59,      408.621,           0,         0),
(830219,      10,     -7560.11,     -1029.04,      408.545,           0,         0),
(830219,      11,     -7562.08,     -1026.86,      408.544,           0,         0),
(830219,      12,     -7567.79,     -1020.52,      408.544,           0,         0),
(830219,      13,     -7566.17,     -1020.1 ,      408.632,           0,         0),
(830219,      14,     -7568.07,     -1019.6 ,      408.544,           0,         0),
(830219,      15,     -7569.46,     -1016.56,      407.366,           0,         0),
(830219,      16,     -7569.98,     -1016.66,      407.344,           0,         0),
(830219,      17,     -7573.47,     -1012.0 ,      407.544,           0,         0),
(830219,      18,     -7574.46,     -1009.71,      408.544,           0,         0),
(830219,      19,     -7575.27,     -1009.8 ,      408.544,           0,         0),
(830219,      20,     -7577.94,     -1010.62,      408.544,           0,         0),
(830219,      21,     -7579.18,     -1011.14,      408.544,           0,         0),
(830219,      22,     -7599.67,     -1012.4 ,      408.544,           0,         0),
(830219,      23,     -7600.65,     -1011.19,      408.71 ,           0,         0),
(830219,      24,     -7600.87,     -1011.4 ,      409.143,           0,         0),
(830219,      25,     -7601.27,     -1011.6 ,      409.144,           0,         0),
(830219,      26,     -7601.87,     -1012.0 ,      409.377,           0,         0),
(830219,      27,     -7603.83,     -1013.44,      410.38 ,           0,         0),
(830219,      28,     -7604.02,     -1013.68,      410.574,           0,         0),
(830219,      29,     -7604.56,     -1014.11,      410.797,           0,         0),
(830219,      30,     -7605.06,     -1014.61,      411.155,           0,         0),
(830219,      31,     -7605.53,     -1015.14,      411.515,           0,         0),
(830219,      32,     -7606.87,     -1016.2 ,      412.17 ,           0,         0),
(830219,      33,     -7607.47,     -1016.6 ,      412.555,           0,         0),
(830219,      34,     -7607.87,     -1016.8 ,      412.743,           0,         0),
(830219,      35,     -7608.33,     -1017.14,      412.876,           0,         0),
(830219,      36,     -7608.45,     -1017.3 ,      413.038,           0,         0),
(830219,      37,     -7608.87,     -1018.2 ,      413.339,           0,         0),
(830219,      38,     -7608.87,     -1018.74,      413.744,           0,         0),
(830219,      39,     -7608.87,     -1019.27,      413.544,           0,         0),
(830219,      40,     -7609.47,     -1020.0 ,      414.145,           0,         0),
(830219,      41,     -7609.87,     -1020.2 ,      413.544,           0,         0),
(830219,      42,     -7610.74,     -1021.22,      413.544,           0,         0),
(830219,      43,     -7611.79,     -1022.45,      413.597,           0,         0);

-- Events list for Blackwing Legionnaire
REPLACE `creature_spells`
(`entry`, `name`,                  `spellId_1`, `probability_1`, `castTarget_1`, `delayInitialMin_1`, `delayInitialMax_1`, `delayRepeatMin_1`, `delayRepeatMax_1`, `spellId_2`, `probability_2`, `castTarget_2`, `delayInitialMin_2`, `delayInitialMax_2`, `delayRepeatMin_2`, `delayRepeatMax_2`, `spellId_3`, `probability_3`, `castTarget_3`, `targetParam1_3`, `targetParam2_3`, `delayInitialMin_3`, `delayInitialMax_3`, `delayRepeatMin_3`, `delayRepeatMax_3`) VALUES
( 124160, 'Blackwing Legionnaire',       15580,             100,              1,                   3,                  16,                  5,                 16,       15754,             100,              1,                   0,                  15,                  6,                 13,       23967,             100,              8,            12435,                7,                   1,                  24,                  6,                 27);
DELETE FROM `creature_ai_events` WHERE `creature_id` = 12416;
INSERT `creature_ai_events`
(   `id`, `creature_id`, `event_type`, `event_param1`, `action1_script`, `comment`) VALUES
-- Reorder these IDs at the end as needed.
(1241601,         12416,            6,              0,          1241601, 'Blackwing Legionnaire - Death'),
(1241602,         12416,           29,              9,          1241602, 'Blackwing Legionnaire - Movement inform'),
(1241603,         12416,           11,              0,          1241603, 'Blackwing Legionnaire - Spawned'),
(1241604,         12416,           21,              0,          1241604, 'Blackwing Legionnaire - Reached Home');
INSERT INTO `creature_ai_scripts`
(   `id`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `dataint`, `condition_id`, `comments`) VALUES
(1241601,        65,       8302,           0,           1,           2,         0,           8302, 'Blackwing Legionnaire - Decrement Creature Count'),
(1241601,        18,       5000,           0,           0,           0,         0,            579, 'Blackwing Legionnaire - Despawn'),
(1241602,        49,          1,           0,           0,           0,         0,              0, 'Blackwing Legionnaire - Combat Pulse'),
(1241603,        39,    8302036,           0,           0,           0,       100,              0, 'Blackwing Legionnaire - Increment Creature Count'),
(1241604,        18,          0,           0,           0,           0,         0,              0, 'Blackwing Legionnaire - Despawn');

-- Events list for Blackwing Mage
REPLACE `creature_spells`
(`entry`, `name`,           `spellId_1`, `probability_1`, `castTarget_1`, `delayInitialMin_1`, `delayInitialMax_1`, `delayRepeatMin_1`, `delayRepeatMax_1`) VALUES
( 124200, 'Blackwing Mage',       17290,             100,              1,                   0,                   0,                  3,                 12);
DELETE FROM `creature_ai_events` WHERE `creature_id` = 12420;
INSERT `creature_ai_events`
(  `id`,  `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `comment`) VALUES
(1242001,         12420,            588,            0,                        0b0,          0x01,              0,          22000,           3000,          22000,          1242001, 'Blackwing Mage - In Combat (periodic)'),
(1242002,         12420,              0,           29,                        0b0,          0x00,              9,              0,              0,              0,          1242002, 'Blackwing Mage - Movement inform'),
-- Lower this ID at the end as needed.
(1242003,         12420,              0,           21,                        0b0,          0x00,              0,              0,              0,              0,          1242003, 'Blackwing Mage - Reached Home'),
(1242004,         12420,              0,            6,                        0b0,          0x00,              0,              0,              0,              0,          1242004, 'Blackwing Mage - Death'),
(1242005,         12420,              0,           11,                        0b0,          0x00,              0,              0,              0,              0,          1242005, 'Blackwing Mage - Spawned');
DELETE FROM `creature_ai_scripts` WHERE `id` = 1242002;
INSERT INTO `creature_ai_scripts`
(   `id`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_type`, `dataint`, `condition_id`, `comments`) VALUES
(1242001,        15,      22271,           0,           0,           0,             6,         0,              0, 'Blackwing Mage - Cast Arcane Explosion'),
(1242002,        49,          1,           0,           0,           0,             0,         0,              0, 'Blackwing Mage - Combat Pulse'),
(1242003,        18,          0,           0,           0,           0,             0,         0,              0, 'Blackwing Mage - Despawn (reached home)'),
(1242004,        65,       8302,           0,           1,           2,             0,         0,           8302, 'Blackwing Mage - Decrement Creature Count'),
(1242004,        18,       5000,           0,           0,           0,             0,         0,            579, 'Blackwing Mage - Despawn (death)'),
(1242005,        39,    8302036,           0,           0,           0,             0,       100,              0, 'Blackwing Mage - Increment Creature Count');
UPDATE `creature_template` SET `spell_list_id` = 124200 WHERE `entry` = 12420;

-- Events list for Death Talon Dragonspawn
REPLACE `creature_spells`
(`entry`, `name`,                    `spellId_1`, `probability_1`, `castTarget_1`, `delayInitialMin_1`, `delayInitialMax_1`, `delayRepeatMin_1`, `delayRepeatMax_1`, `spellId_2`, `probability_2`, `castTarget_2`, `delayInitialMin_2`, `delayInitialMax_2`, `delayRepeatMin_2`, `delayRepeatMax_2`, `spellId_3`, `probability_3`, `castTarget_3`, `targetParam1_3`, `targetParam2_3`, `delayInitialMin_3`, `delayInitialMax_3`, `delayRepeatMin_3`, `delayRepeatMax_3`) VALUES
( 124220, 'Death Talon Dragonspawn',       15580,             100,              1,                   0,                  32,                  4,                  27,       15663,             100,              1,                  0,                  32,                 13,                 36,       23967,             100,              8,            12435,                7,                   0,                  34,                  6,                 36);
DELETE FROM `creature_ai_events` WHERE `creature_id` = 12422;
REPLACE `creature_ai_events`
(   `id`, `creature_id`, `condition_id`, `event_type`, `event_param1`, `action1_script`, `comment`) VALUES
(1242201,         12422,              0,            7,              0,          1242201, 'Death Talon Dragonspawn - Evade'),
(1242202,         12422,              0,           29,              9,          1242202, 'Death Talon Dragonspawn - Movement inform'),
(1242203,         12422,           8302,            6,              0,          1242203, 'Death Talon Dragonspawn - Death'),
-- Lower this ID at the end as needed.
(1242204,         12422,              0,           21,              0,          1242204, 'Death Talon Dragonspawn - Reached Home'),
(1242205,         12422,              0,           11,              0,          1242205, 'Death Talon Dragonspawn - Spawned');
INSERT INTO `creature_ai_scripts`
(   `id`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `dataint`, `condition_id`, `comments`) VALUES
(1242201,        34,          1,           0,           0,           0,         0,              0, 'Death Talon Dragonspawn - Set Home Position'),
(1242202,        49,          1,           0,           0,           0,         0,              0, 'Death Talon Dragonspawn - Combat Pulse'),
(1242203,        65,       8302,           0,           1,           2,         0,              0, 'Death Talon Dragonspawn - Decrement Creature Count'),
(1242204,        18,          0,           0,           0,           0,         0,              0, 'Death Talon Dragonspawn - Despawn'),
(1242205,        39,    8302036,           0,           0,           0,       100,              0, 'Death Talon Dragonspawn - Increment Creature Count');
-- REPLACE `generic_scripts`
-- (   `id`, `command`, `comments`) VALUES;

-- Events list for Razorgore the Untamed
DELETE FROM `creature_ai_events` WHERE `creature_id` = 12435;
INSERT `creature_ai_events`
(  `id`,  `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `comment`) VALUES
-- Reorder all these at the end, if necessary.
(1243501,         12435,             573,           1,                   0b011110,          0x01,           6000,          16000,           6000,          16000,          1243501, 'Razorgore the Untamed - Out of Combat (periodic) (phase 0)'),
(1243502,         12435,             573,           1,                   0b011101,          0x01,           6000,          16000,           6000,          16000,          1243502, 'Razorgore the Untamed - Out of Combat (periodic) (phase 1)'),
(1243503,         12435,             573,           1,                   0b011011,          0x01,           6000,          16000,           6000,          16000,          1243503, 'Razorgore the Untamed - Out of Combat (periodic) (phase 2)'),
(1243504,         12435,             573,           1,                   0b010111,          0x01,           6000,          16000,           6000,          16000,          1243504, 'Razorgore the Untamed - Out of Combat (periodic) (phase 3)'),
(1243505,         12435,             573,           1,                   0b001111,          0x01,           6000,          16000,           6000,          16000,          1243505, 'Razorgore the Untamed - Out of Combat (periodic) (phase 4)'),
(1243506,         12435,               0,           4,                   0b100000,          0x00,              0,              0,              0,              0,          1243506, 'Razorgore the Untamed - Aggro'),
(1243511,         12435,               0,          21,                   0b000000,          0x00,              0,              0,              0,              0,          1243511, 'Razorgore the Untamed - Reached Home'),
(1243512,         12435,             241,           6,                   0b100000,          0x00,              0,              0,              0,              0,          1243512, 'Razorgore the Untamed - Death (eggs remain, before phase 5)'),
(1243513,         12435,             241,           6,                   0b000000,          0x00,              0,              0,              0,              0,          1243513, 'Razorgore the Untamed - Death (eggs remain, any phase)'),
(1243514,         12435,             242,           6,                   0b000000,          0x00,              0,              0,              0,              0,          1243514, 'Razorgore the Untamed - Death (eggs destroyed)'),
(1243515,         12435,               0,          11,                   0b000000,          0x00,              0,              0,              0,              0,          1243510, 'Razorgore the Untamed - Spawned'),
(1243516,         12435,               0,          37,                   0b000000,          0x00,          19832,              0,              0,              0,          1243516, 'Razorgore the Untamed - Aura unapply');
INSERT `creature_ai_scripts`
(   `id`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`,      `o`, `condition_id`, `comments`) VALUES
(1243501,          0,        35,          1,           0,           0,           0,               0,               0,             0,         0x00,         0,          0,          0, 4.64258 ,              0, 'Razorgore the Untamed - Turn to point 5'),
(1243501,          1,        15,      21389,       0x003,           0,           0,               0,               0,             6,         0x00,         0,          0,          0, 0       ,              0, 'Razorgore the Untamed - Cast Fire Channeling'),
(1243501,          1,        35,          1,           0,           0,           0,               0,               0,             0,         0x00,         0,          0,          0, 2.44346 ,              0, 'Razorgore the Untamed - Turn to point 1'),
(1243501,          1,        39,    1243502,           0,           0,           0,               0,               0,             0,         0x00,       100,          0,          0, 0       ,              0, 'Razorgore the Untamed - Increment phase (point 1)'),
(1243502,          0,        35,          1,           0,           0,           0,               0,               0,             0,         0x00,         0,          0,          0, 3.33358 ,              0, 'Razorgore the Untamed - Turn to point 2'),
(1243502,          0,        39,    1243502,           0,           0,           0,               0,               0,             0,         0x00,       100,          0,          0, 0       ,              0, 'Razorgore the Untamed - Increment phase (point 2)'),
(1243503,          0,        35,          1,           0,           0,           0,               0,               0,             0,         0x00,         0,          0,          0, 0.139626,              0, 'Razorgore the Untamed - Turn to point 3'),
(1243503,          0,        39,    1243502,           0,           0,           0,               0,               0,             0,         0x00,       100,          0,          0, 0       ,              0, 'Razorgore the Untamed - Increment phase (point 3)'),
(1243504,          0,        35,          1,           0,           0,           0,               0,               0,             0,         0x00,         0,          0,          0, 1.309   ,              0, 'Razorgore the Untamed - Turn to point 4'),
(1243504,          0,        39,    1243502,           0,           0,           0,               0,               0,             0,         0x00,       100,          0,          0, 0       ,              0, 'Razorgore the Untamed - Increment phase (point 4)'),
(1243505,          0,        35,          1,           0,           0,           0,               0,               0,             0,         0x00,         0,          0,          0, 4.64258 ,              0, 'Razorgore the Untamed - Turn to point 5'),
(1243505,          0,        44,          0,           0,           0,           0,               0,               0,             0,         0x00,         0,          0,          0, 0       ,              0, 'Razorgore the Untamed - Set phase 0 (Out of Combat)'),
(1243506,          0,        65,       8302,           1,           0,           0,               0,               0,             0,         0x00,         0,          0,          0, 0       ,           8302, 'Razorgore the Untamed - Set map event data 1 to 0 (Aggro)'),
(1243506,          0,        49,          1,           0,           0,           0,               0,               0,             0,         0x00,         0,          0,          0, 0       ,              0, 'Razorgore the Untamed - Combat Pulse (Aggro)'),
(1243510,          0,        44,          0,           0,           0,           0,               0,               0,             0,         0x00,         0,          0,          0, 0       ,              0, 'Razorgore the Untamed - Set phase 0'),
(1243511,          0,         0,          1,           0,           0,           0,               0,               0,             0,         0x00,      7980,          0,          0, 0       ,              0, 'Razorgore the Untamed - Yell (reached home)'),
(1243511,          0,        18,      20000,           0,           0,           0,               0,               0,             0,         0x00,         0,          0,          0, 0       ,              0, 'Razorgore the Untamed - Despawn (reached home)'),
(1243511,          0,        39,    1243503,           0,           0,           0,               0,               0,             0,         0x00,       100,          0,          0, 0       ,              0, 'Razorgore the Untamed - Cast Fireball (reached home)'),
(1243512,          0,         0,          1,           0,           0,           0,               0,               0,             0,         0x00,      9591,          0,          0, 0       ,              0, 'Razorgore the Untamed - Yell (death)'),
(1243512,          0,        18,       4000,           0,           0,           0,               0,               0,             0,         0x00,         0,          0,          0, 0       ,              0, 'Razorgore the Untamed - Despawn (death)'),
(1243512,          0,        39,    1243503,           0,           0,           0,               0,               0,             0,         0x00,       100,          0,          0, 0       ,              0, 'Razorgore the Untamed - Cast Fireball (death)'),
(1243513,          0,         4,        143,      0x0001,           2,           0,               0,               0,             0,         0x00,         0,          0,          0, 0       ,              0, 'Razorgore the Untamed - Remove Lootable dynamic flag'),
(1243513,          0,        62,       8302,           0,           0,           0,               0,               0,             0,         0x00,         0,          0,          0, 0       ,              0, 'Razorgore the Untamed - End map event (Failure)'),
(1243513,          0,        39,    1243504,           0,           0,           0,               0,               0,             0,         0x00,       100,          0,          0, 0       ,              0, 'Razorgore the Untamed - Respawn encounter'),
(1243514,          0,        62,       8302,           1,           0,           0,               0,               0,             0,         0x00,         0,          0,          0, 0       ,              0, 'Razorgore the Untamed - End map event (Success)'),
(1243516,          0,        65,       8302,           1,           0,           0,               0,               0,             0,         0x00,         0,          0,          0, 0       ,              0, 'Razorgore the Untamed - Set map event data 1 to 0 (Possess removed)'),
(1243516,          0,         5,          0,           0,           0,           0,           12784,               0,             9,         0x02,         0,          0,          0, 0       ,            572, 'Razorgore the Untamed - Interrupt casts on Blackwing Orb Trigger'),
(1243516,          0,        14,      23021,           0,           0,           0,               0,               0,             0,         0x00,         0,          0,          0, 0       ,            572, 'Razorgore the Untamed - Remove aura Dragon Orb');
REPLACE `creature_spells`
(`entry`, `name`,
                                   `spellId_1`, `castTarget_1`, `targetParam1_1`, `targetParam2_1`, `delayInitialMin_1`, `delayInitialMax_1`, `delayRepeatMin_1`, `delayRepeatMax_1`, 
                                   `spellId_2`, `castTarget_2`, `targetParam1_2`, `targetParam2_2`, `delayInitialMin_2`, `delayInitialMax_2`, `delayRepeatMin_2`, `delayRepeatMax_2`,
                                   `spellId_3`, `castTarget_3`, `targetParam1_3`, `targetParam2_3`, `delayInitialMin_3`, `delayInitialMax_3`, `delayRepeatMin_3`, `delayRepeatMax_3`,
                                   `spellId_4`, `castTarget_4`, `targetParam1_4`, `targetParam2_4`, `delayInitialMin_4`, `delayInitialMax_4`, `delayRepeatMin_4`, `delayRepeatMax_4`,
                                   `spellId_5`, `castTarget_5`, `targetParam1_5`, `targetParam2_5`, `delayInitialMin_5`, `delayInitialMax_5`, `delayRepeatMin_5`, `delayRepeatMax_5`) VALUES
( 124350, 'Razorgore the Untamed',       19632,              1,                0,                0,                  14,                  38,                  8,                 28,
                                         19872,             26,            12422,               60,                   6,                  38,                  6,                 38,
                                         22425,              6,                0,                0,                  12,                  41,                 18,                 44,
                                         23023,              6,                0,                0,                  11,                  39,                 13,                 42,
                                         24375,              6,                0,                0,                   8,                  29,                 22,                 43);
REPLACE `generic_scripts`
(   `id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `target_type`, `data_flags`, `dataint`, `target_param1`, `comments`) VALUES
(1243502,       0,          0,        44,          1,           1,           0,             0,         0x00,         0,               0, 'Razorgore the Untamed - Increment Phase'),
(1243503,       0,          0,        44,          5,           0,           0,             0,         0x00,         0,               0, 'Razorgore the Untamed - Set Phase 5'),
(1243503,       0,          1,        15,      23024,       0x002,           0,             6,         0x00,         0,               0, 'Razorgore the Untamed - Cast Fireball'),
(1243503,       1,          0,        39,     176964,           0,           0,             0,         0x00,       100,               0, 'Razorgore the Untamed - Open Portcullis'),
(1243504,      55,          0,         9,     234786,           0,     3600000,             0,         0x00,         0,               0, 'Razorgore the Untamed - Respawn Black Dragon Egg 1 (spawn)'),
(1243504,      55,          0,         9,     234787,           0,     3600000,             0,         0x00,         0,               0, 'Razorgore the Untamed - Respawn Black Dragon Egg 2 (spawn)'),
(1243504,      55,          0,         9,     234788,           0,     3600000,             0,         0x00,         0,               0, 'Razorgore the Untamed - Respawn Black Dragon Egg 3 (spawn)'),
(1243504,      55,          0,         9,     234789,           0,     3600000,             0,         0x00,         0,               0, 'Razorgore the Untamed - Respawn Black Dragon Egg 4 (spawn)'),
(1243504,      55,          0,         9,     234790,           0,     3600000,             0,         0x00,         0,               0, 'Razorgore the Untamed - Respawn Black Dragon Egg 5 (spawn)'),
(1243504,      55,          0,         9,     234791,           0,     3600000,             0,         0x00,         0,               0, 'Razorgore the Untamed - Respawn Black Dragon Egg 6 (spawn)'),
(1243504,      55,          0,         9,     234792,           0,     3600000,             0,         0x00,         0,               0, 'Razorgore the Untamed - Respawn Black Dragon Egg 7 (spawn)'),
(1243504,      55,          0,         9,     234793,           0,     3600000,             0,         0x00,         0,               0, 'Razorgore the Untamed - Respawn Black Dragon Egg 8 (spawn)'),
(1243504,      55,          0,         9,     234794,           0,     3600000,             0,         0x00,         0,               0, 'Razorgore the Untamed - Respawn Black Dragon Egg 9 (spawn)'),
(1243504,      55,          0,         9,     234795,           0,     3600000,             0,         0x00,         0,               0, 'Razorgore the Untamed - Respawn Black Dragon Egg 10 (spawn)'),
(1243504,      55,          0,         9,     234796,           0,     3600000,             0,         0x00,         0,               0, 'Razorgore the Untamed - Respawn Black Dragon Egg 11 (spawn)'),
(1243504,      55,          0,         9,     234797,           0,     3600000,             0,         0x00,         0,               0, 'Razorgore the Untamed - Respawn Black Dragon Egg 12 (spawn)'),
(1243504,      55,          0,         9,     234798,           0,     3600000,             0,         0x00,         0,               0, 'Razorgore the Untamed - Respawn Black Dragon Egg 13 (spawn)'),
(1243504,      55,          0,         9,     234799,           0,     3600000,             0,         0x00,         0,               0, 'Razorgore the Untamed - Respawn Black Dragon Egg 14 (spawn)'),
(1243504,      55,          0,         9,     234800,           0,     3600000,             0,         0x00,         0,               0, 'Razorgore the Untamed - Respawn Black Dragon Egg 15 (spawn)'),
(1243504,      55,          0,         9,     234801,           0,     3600000,             0,         0x00,         0,               0, 'Razorgore the Untamed - Respawn Black Dragon Egg 16 (spawn)'),
(1243504,      55,          0,         9,     234802,           0,     3600000,             0,         0x00,         0,               0, 'Razorgore the Untamed - Respawn Black Dragon Egg 17 (spawn)'),
(1243504,      55,          0,         9,     234803,           0,     3600000,             0,         0x00,         0,               0, 'Razorgore the Untamed - Respawn Black Dragon Egg 18 (spawn)'),
(1243504,      55,          0,         9,     234804,           0,     3600000,             0,         0x00,         0,               0, 'Razorgore the Untamed - Respawn Black Dragon Egg 19 (spawn)'),
(1243504,      55,          0,         9,     234805,           0,     3600000,             0,         0x00,         0,               0, 'Razorgore the Untamed - Respawn Black Dragon Egg 20 (spawn)'),
(1243504,      55,          0,         9,     234806,           0,     3600000,             0,         0x00,         0,               0, 'Razorgore the Untamed - Respawn Black Dragon Egg 21 (spawn)'),
(1243504,      55,          0,         9,     234807,           0,     3600000,             0,         0x00,         0,               0, 'Razorgore the Untamed - Respawn Black Dragon Egg 22 (spawn)'),
(1243504,      55,          0,         9,     234808,           0,     3600000,             0,         0x00,         0,               0, 'Razorgore the Untamed - Respawn Black Dragon Egg 23 (spawn)'),
(1243504,      55,          0,         9,     234809,           0,     3600000,             0,         0x00,         0,               0, 'Razorgore the Untamed - Respawn Black Dragon Egg 24 (spawn)'),
(1243504,      55,          0,         9,     234810,           0,     3600000,             0,         0x00,         0,               0, 'Razorgore the Untamed - Respawn Black Dragon Egg 25 (spawn)'),
(1243504,      55,          0,         9,     234811,           0,     3600000,             0,         0x00,         0,               0, 'Razorgore the Untamed - Respawn Black Dragon Egg 26 (spawn)'),
(1243504,      55,          0,         9,     234812,           0,     3600000,             0,         0x00,         0,               0, 'Razorgore the Untamed - Respawn Black Dragon Egg 27 (spawn)'),
(1243504,      55,          0,         9,     234813,           0,     3600000,             0,         0x00,         0,               0, 'Razorgore the Untamed - Respawn Black Dragon Egg 28 (spawn)'),
(1243504,      55,          0,         9,     234814,           0,     3600000,             0,         0x00,         0,               0, 'Razorgore the Untamed - Respawn Black Dragon Egg 29 (spawn)'),
(1243504,      55,          0,         9,     234815,           0,     3600000,             0,         0x00,         0,               0, 'Razorgore the Untamed - Respawn Black Dragon Egg 30 (spawn)'),
(1243504,      60,          0,        71,          0,           0,           0,             9,         0x00,         0,           84388, 'Razorgore the Untamed - Respawn Razorgore the Untamed'),
(1243504,      60,          1,        71,          0,           0,           0,             9,         0x02,         0,           84389, 'Razorgore the Untamed - Respawn Grethok the Controller'),
(1243504,      60,          0,        71,        0x2,           0,           0,             9,         0x02,         0,           84390, 'Razorgore the Untamed - Respawn Blackwing Guardsman 1'),
(1243504,      60,          1,        91,      84390,           0,           0,             0,         0x00,         0,               0, 'Razorgore the Untamed - Load Blackwing Guardsman 1 Spawn'),
(1243504,      60,          0,        71,        0x2,           0,           0,             9,         0x02,         0,           84391, 'Razorgore the Untamed - Respawn Blackwing Guardsman 2'),
(1243504,      60,          1,        91,      84391,           0,           0,             0,         0x00,         0,               0, 'Razorgore the Untamed - Load Blackwing Guardsman 2 Spawn');
UPDATE `creature_template` SET `ai_name` = 'EventAI', `auras` = '18943', `script_name` = '', `spell_list_id` = 124350 WHERE `entry` = 12435;

-- Events list for Grethok the Controller
DELETE FROM `creature_ai_events` WHERE `creature_id` = 12557;
INSERT `creature_ai_events`
(  `id`,  `creature_id`, `condition_id`, `event_type`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `comment`) VALUES
(1255701,         12557,            581,            1,          0x00,              0,              0,              0,              0,          1255701, 'Grethok the Controller - Out of Combat'),
(1255702,         12557,              0,            0,          0x01,           6000,           6000,          18000,          29000,          1255702, 'Grethok the Controller - Cast Dominate Mind'),
(1255703,         12557,              0,            4,          0x00,              0,              0,              0,              0,          1255703, 'Grethok the Controller - Aggro'),
(1255704,         12557,              0,            0,          0x00,           1000,           5000,              0,              0,          1255704, 'Grethok the Controller - In Combat (Summon Monster Generators)'),
(1255705,         12557,              0,           21,          0x00,              0,              0,              0,              0,          1255705, 'Grethok the Controller - Reached Home'),
(1255706,         12557,              0,            6,          0x00,              0,              0,              0,              0,          1255706, 'Grethok the Controller - Death');
INSERT `creature_ai_scripts`
(   `id`, `command`, `datalong`, `datalong2`, `target_type`, `dataint`, `dataint4`,      `x`,      `y`,     `z`,     `o`, `comments`) VALUES
(1255701,        15,      23018,           0,             6,         0,          0,        0,        0,       0,       0, 'Grethok the Controller - Cast Use Dragon Orb'),
-- double check target for Dominate Mind
-- currently he sometimes uses it on Razorgore.
(1255702,        15,      14515,           0,             4,         0,          0,        0,        0,       0,       0, 'Grethok the Controller - Cast Spell Dominate Mind'),
(1255702,         0,          1,           0,             0,      9960,          0,        0,        0,       0,       0, 'Grethok the Controller - Say Text'),
(1255703,        39,    1255701,           0,             0,       100,          0,        0,        0,       0,       0, 'Grethok the Controller - Close Portcullis'),
(1255703,        49,          1,           0,             0,         0,          0,        0,        0,       0,       0, 'Grethok the Controller - Combat Pulse'),
(1255703,         0,          1,           0,             0,      9958,          0,        0,        0,       0,       0, 'Grethok the Controller - Yell'),
(1255703,        37,          0,           4,             0,         0,          0,        0,        0,       0,       0, 'Grethok the Controller - Set Instance Data (Encounter Special)'),
(1255704,        10,      12434,         400,             0,         0,          3, -7643.39, -1064.69, 407.288, 1.71042, 'Grethok the Controller - Summon Monster Generator (Blackwing)'),
(1255704,        10,      12434,         400,             0,         0,          3, -7623.1 , -1094.06, 407.288, 1.44862, 'Grethok the Controller - Summon Monster Generator (Blackwing)'),
(1255704,        10,      12434,         400,             0,         0,          3, -7568.61, -1012.67, 407.288, 1.51844, 'Grethok the Controller - Summon Monster Generator (Blackwing)'),
(1255704,        10,      12434,         400,             0,         0,          3, -7548.46, -1041.98, 407.288, 2.02458, 'Grethok the Controller - Summon Monster Generator (Blackwing)'),
(1255705,        16,       8274,           0,             0,         0,          0,        0,        0,       0,       0, 'Grethok the Controller - Play Sound 8274'),
(1255706,        18,       4000,           0,             0,         0,          0,        0,        0,       0,       0, 'Grethok the Controller - Despawn');
REPLACE `creature_spells`
(`entry`, `name`,                   `spellId_1`, `probability_1`, `castTarget_1`, `delayInitialMin_1`, `delayInitialMax_1`, `delayRepeatMin_1`, `delayRepeatMax_1`,
                                    `spellId_2`, `probability_2`, `castTarget_2`, `delayInitialMin_2`, `delayInitialMax_2`, `delayRepeatMin_2`, `delayRepeatMax_2`,
                                    `spellId_3`, `probability_3`, `castTarget_3`, `delayInitialMin_3`, `delayInitialMax_3`, `delayRepeatMin_3`, `delayRepeatMax_3`) VALUES
( 125570, 'Grethok the Controller',       13747,             100,              6,                   8,                  22,                 20,                 37,
                                          22272,             100,              4,                   0,                  16,                 10,                 18,
                                          22274,             100,              4,                   2,                  20,                  3,                 42);
REPLACE `generic_scripts`
(   `id`, `delay`, `command`, `datalong`, `target_param1`, `target_type`, `comments`) VALUES
(1255701,       1,        80,          1,          234783,            12, 'Grethok the Controller - Close Portcullis');
UPDATE `creature_template` SET `auras` = '18950' WHERE `entry` = 12557;
-- spells
-- Need to check spell targets against what's in the current list.
-- No data for repeating delays on spell 14515.
-- 13747
-- Implicit target A - TARGET_LOCATION_CASTER_SRC
-- Implicit target B - TARGET_ENUM_UNITS_ENEMY_AOE_AT_SRC_LOC
-- Test and make sure it affects all players in a radius.

-- Events list for Blackwing Orb Trigger
-- INSERT `creature_ai_events`
-- -- problem: the Trigger isn't in combat and doesn't actually target Razorgore while channeling
-- -- Instead, use Razorgore's AI to cancel the Trigger's channel on Aggro.
-- (   `id`,  `creature_id`, `event_type`, `event_param1`, `event_param2`, `action1_script`, `comment`) VALUES
-- (1444901,          14449,           28,          19832,              1,          1444901, 'Blackwing Orb Trigger - Target missing aura Possess');
-- INSERT `creature_ai_scripts`
-- (   `id`, `command`, `comments`) VALUES
-- (1444901,         5, 'Blackwing Orb Trigger - Interrupt casts');
-- UPDATE `creature_template` SET `ai_name` = 'EventAI' WHERE `entry` = 14449;
-- Note that Blackwing Orb Trigger casts 23031 (Cancel Bob Possession) at some point.

-- Events list for Orb of Domination
UPDATE `creature_template` SET `script_name` = '' WHERE `entry` = 14453;

-- Events list for Blackwing Guardsman
DELETE FROM `creature_ai_events` WHERE `creature_id` = 14456;
DELETE FROM `creature_ai_scripts` WHERE `id` = 1445601;
INSERT `creature_ai_events`
(   `id`, `creature_id`, `event_type`, `action1_script`, `comment`) VALUES
(1445601,        14456,            6,          1445601, 'Blackwing Guardsman - Death'),
(1445602,        14456,            4,          1445602, 'Blackwing Guardsman - Aggro');
INSERT `creature_ai_scripts`
(   `id`, `command`, `datalong`, `comments`) VALUES
(1445601,        18,     300000, 'Blackwing Guardsman - Despawn'),
(1445602,        49,          1, 'Blackwing Guardsman - Combat Pulse');
REPLACE `creature_spells`
(`entry`, `name`,                                 `spellId_1`, `probability_1`, `castTarget_1`, `delayInitialMin_1`, `delayInitialMax_1`, `delayRepeatMin_1`, `delayRepeatMax_1`, `spellId_2`, `probability_2`, `castTarget_2`, `delayInitialMin_2`, `delayInitialMax_2`, `delayRepeatMin_2`, `delayRepeatMax_2`) VALUES
( 144560, 'Blackwing Lair - Blackwing Guardsman',       15580,             100,              1,                   5,                  23,                  1,                 16,       15754,             100,              1,                   3,                  24,                  8,                 11);

-- Events list for Nefarian's Troops
INSERT `creature_ai_events`
(   `id`, `creature_id`, `event_type`, `event_inverse_phase_mask`, `event_param1`, `event_param2`, `action1_script`, `comment`) VALUES
(1445901,         14459,            8,                       0b10,          23032,             -1,          1445901, 'Nefarian''s Troops - Hit by spell');
INSERT `creature_ai_scripts`
(   `id`, `command`) VALUES
(1445901,        44);
UPDATE `creature_template` SET `ai_name` = 'EventAI';

-- Events list for Blackwing Spell Marker
REPLACE `generic_scripts`
(   `id`, `command`, `datalong`, `comments`) VALUES
(1660401,        15,      23032, 'Blackwing Spell Marker - Cast Nefarian''s Troops Flee');

-- Nefarian's Troops Flee hits creature 12434 (Monster Generator (Blackwing))
-- double check that creature's spawn/despawn behavior.

-- Portcullis (Entry: 176964 Guid: 234783) Open Script
INSERT `generic_scripts`
(  `id`, `command`, `datalong`, `target_param1`, `target_type`, `comments`) VALUES
(176964,        80,          0,          234783,            12, 'Portcullis - Open');

-- Portcullis (Entry: 176965 Guid: 234784) Open Script
INSERT `generic_scripts`
(  `id`, `command`, `datalong`, `comments`) VALUES
(176965,        11,     234784, 'Portcullis - Open');

-- Black Dragon Egg
INSERT `gameobject_scripts`
(  `id`, `command`,  `datalong`, `dataint`, `comments`) VALUES
(234786,        39,    17780701,       100, 'Black Dragon Egg 1 - Use'),
(234787,        39,    17780701,       100, 'Black Dragon Egg 2 - Use'),
(234788,        39,    17780701,       100, 'Black Dragon Egg 3 - Use'),
(234789,        39,    17780701,       100, 'Black Dragon Egg 4 - Use'),
(234790,        39,    17780701,       100, 'Black Dragon Egg 5 - Use'),
(234791,        39,    17780701,       100, 'Black Dragon Egg 6 - Use'),
(234792,        39,    17780701,       100, 'Black Dragon Egg 7 - Use'),
(234793,        39,    17780701,       100, 'Black Dragon Egg 8 - Use'),
(234794,        39,    17780701,       100, 'Black Dragon Egg 9 - Use'),
(234795,        39,    17780701,       100, 'Black Dragon Egg 10 - Use'),
(234796,        39,    17780701,       100, 'Black Dragon Egg 11 - Use'),
(234797,        39,    17780701,       100, 'Black Dragon Egg 12 - Use'),
(234798,        39,    17780701,       100, 'Black Dragon Egg 13 - Use'),
(234799,        39,    17780701,       100, 'Black Dragon Egg 14 - Use'),
(234800,        39,    17780701,       100, 'Black Dragon Egg 15 - Use'),
(234801,        39,    17780701,       100, 'Black Dragon Egg 16 - Use'),
(234802,        39,    17780701,       100, 'Black Dragon Egg 17 - Use'),
(234803,        39,    17780701,       100, 'Black Dragon Egg 18 - Use'),
(234804,        39,    17780701,       100, 'Black Dragon Egg 19 - Use'),
(234805,        39,    17780701,       100, 'Black Dragon Egg 20 - Use'),
(234806,        39,    17780701,       100, 'Black Dragon Egg 21 - Use'),
(234807,        39,    17780701,       100, 'Black Dragon Egg 22 - Use'),
(234808,        39,    17780701,       100, 'Black Dragon Egg 23 - Use'),
(234809,        39,    17780701,       100, 'Black Dragon Egg 24 - Use'),
(234810,        39,    17780701,       100, 'Black Dragon Egg 25 - Use'),
(234811,        39,    17780701,       100, 'Black Dragon Egg 26 - Use'),
(234812,        39,    17780701,       100, 'Black Dragon Egg 27 - Use'),
(234813,        39,    17780701,       100, 'Black Dragon Egg 28 - Use'),
(234814,        39,    17780701,       100, 'Black Dragon Egg 29 - Use'),
(234815,        39,    17780701,       100, 'Black Dragon Egg 30 - Use');
INSERT `generic_scripts`
(    `id`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `condition_id`, `comments`) VALUES
(17780701,          0,        68,    1660401,           2,       14453,         100,               0,             0,         0x00,         0,          0,          0,            275, 'Black Dragon Egg - Nefarian''s Troops Flee (Orb of Domination)'),
(17780701,          0,        68,    1660401,           2,       16604,         100,               0,             0,         0x00,         0,          0,          0,            275, 'Black Dragon Egg - Nefarian''s Troops Flee (Blackwing Spell Marker)'),
(17780701,          0,         0,          1,           0,           0,           0,           84388,             9,         0x02,      9961,       9962,       9963,            591, 'Black Dragon Egg - Yell (destroyed egg)'),
(17780701,          0,        65,       8302,           2,           1,           0,               0,             0,         0x00,         0,          0,          0,            591, 'Black Dragon Egg - Set map event data 2 to 1'),
(17780701,          0,        65,       8302,           2,           0,           0,               0,             0,         0x00,         0,          0,          0,            592, 'Black Dragon Egg - Set map event data 2 to 0'),
(17780701,          1,        65,       8302,           1,           1,           0,               0,             0,         0x00,         0,          0,          0,            594, 'Black Dragon Egg - Set map event data 1 to 1'),
(17780701,          1,        65,       8302,           1,           0,           0,               0,             0,         0x00,         0,          0,          0,            593, 'Black Dragon Egg - Set map event data 1 to 0');

-- Correct target for spell Use Dragon Orb.
UPDATE `spell_script_target` SET `targetEntry` = 14449, `type` = 1 WHERE `entry` = 23018;

-- Define targets for Nefarian's Troops Flee.
INSERT `spell_script_target`
(`entry`, `type`, `targetEntry`) VALUES
(  23032,      1,          7386),
(  23032,      1,         10259),
(  23032,      1,         12017),
(  23032,      1,         12416),
(  23032,      1,         12420),
(  23032,      1,         12422),
(  23032,      1,         12434),
(  23032,      1,         12435),
(  23032,      1,         12457),
(  23032,      1,         12458),
(  23032,      1,         12459),
(  23032,      1,         12460),
(  23032,      1,         12461),
(  23032,      1,         12463),
(  23032,      1,         12464),
(  23032,      1,         12465),
(  23032,      1,         12467),
(  23032,      1,         12468),
(  23032,      1,         12999),
(  23032,      1,         13020),
(  23032,      1,         13996),
(  23032,      1,         14020),
(  23032,      1,         14022),
(  23032,      1,         14023),
(  23032,      1,         14024),
(  23032,      1,         14025),
(  23032,      1,         14449),
(  23032,      1,         14459),
(  23032,      1,         16604),
(  23032,      3,             0);

-- TESTING
-- UPDATE creature_template SET display_id1 = 1311 WHERE entry = 12434; -- was 11686
-- UPDATE creature_template SET display_id1 = 1525 WHERE entry = 14449; -- was 11686

-- CODESTOTHESTARS
UPDATE item_template SET name = 'Duchess' WHERE entry = 5665;
UPDATE item_template SET name = 'Puchao' WHERE entry = 8591;
UPDATE item_template SET name = 'Twinkleberry' WHERE entry = 13335;
UPDATE item_template SET name = 'Butterball' WHERE entry = 15290;
UPDATE item_template SET name = 'Craggle' WHERE entry = 18795;
UPDATE `quest_template` SET `RewRepValue1` =  100 WHERE `entry` = 5201; -- Winterfall Intrusion

-- End of migration.
END IF;
END??
DELIMITER ;
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;

DELETE FROM conditions WHERE condition_entry BETWEEN 572 AND 590;
DELETE FROM creature WHERE id IN (14449);
DELETE FROM creature_ai_events WHERE id LIKE '12435%' OR id LIKE '12557%' OR id LIKE '14449%';
DELETE FROM creature_ai_scripts WHERE id LIKE '12435%' OR id LIKE '12557%' OR id LIKE '14449%';
DELETE FROM creature_movement_template WHERE `entry` = 12435;

-- Delay from Grethok aggro to Portcullis close.
SELECT
  grethok_aggro.unixtimems aggro_unixtimems,
  portcullis_close.gameobject_update_unixtimems close_unixtimems,
  portcullis_close.gameobject_update_unixtimems - grethok_aggro.unixtimems delay_ms
FROM (
  SELECT guid, MIN(unixtimems) unixtimems
  FROM creature_guid_values_update
  WHERE creature_guid_values_update.field_name = 'Target'
  GROUP BY guid
) grethok_aggro
JOIN creature grethok ON grethok_aggro.guid = grethok.guid
JOIN (
  SELECT
    creature_guid_values_update.unixtimems creature_update_unixtimems,
    gameobject_values_update.guid object_guid,
    MIN(gameobject_values_update.unixtimems) gameobject_update_unixtimems
  FROM creature_guid_values_update
  JOIN gameobject_values_update
  WHERE creature_guid_values_update.unixtimems < gameobject_values_update.unixtimems
  GROUP BY creature_guid_values_update.unixtimems, gameobject_values_update.guid
) portcullis_close ON grethok_aggro.unixtimems = portcullis_close.creature_update_unixtimems
JOIN gameobject portcullis ON portcullis_close.object_guid = portcullis.guid
WHERE grethok.id = 12557 AND portcullis.id = 176964
ORDER BY aggro_unixtimems;

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

-- Delay from Fireball to Portcullis open
SELECT
  fireball.unixtimems fireball_unixtimems,
  portcullis_open.update_unixtimems open_unixtimems,
  portcullis_open.update_unixtimems - fireball.unixtimems delay_ms
FROM spell_cast_go fireball
JOIN (
  SELECT
    spell_cast_go.unixtimems spell_unixtimems,
    gameobject_values_update.guid object_guid,
    MIN(gameobject_values_update.unixtimems) update_unixtimems
  FROM spell_cast_go
  JOIN gameobject_values_update
  WHERE gameobject_values_update.unixtimems > spell_cast_go.unixtimems
  GROUP BY spell_cast_go.unixtimems, gameobject_values_update.guid
) portcullis_open ON fireball.unixtimems = portcullis_open.spell_unixtimems
JOIN gameobject portcullis ON portcullis_open.object_guid = portcullis.guid
WHERE fireball.spell_id = 23024 AND portcullis.id = 176964
ORDER BY fireball_unixtimems;

-- Respawn delay after boss death
WITH object_create2_time AS (
  SELECT 'creature' object_type, creature_create2_time.* FROM creature_create2_time
  UNION ALL
  SELECT 'gameobject', gameobject_create2_time.* FROM gameobject_create2_time
)
SELECT
  spawn.unixtimems,
  spawn.object_type,
  spawn_object.id,
  spawn_object.guid spawn_guid,
  death_creature.guid death_guid,
  spawn_last_death.death_unixtimems,
  ROUND((spawn.unixtimems - spawn_last_death.death_unixtimems) / 1000) respawn_seconds
FROM object_create2_time spawn
JOIN (
  SELECT
    object_create2_time.object_type create_type,
    object_create2_time.guid create_guid,
    object_create2_time.unixtimems create_unixtimems,
    creature.id death_id,
    MAX(death.unixtimems) death_unixtimems
  FROM object_create2_time JOIN creature_values_update death JOIN creature ON death.guid = creature.guid
  WHERE object_create2_time.unixtimems > death.unixtimems
    AND death.current_health = 0
  GROUP BY
    object_create2_time.object_type,
    object_create2_time.guid,
    object_create2_time.unixtimems,
    creature.id
) spawn_last_death
  ON spawn.object_type = spawn_last_death.create_type
  AND spawn.guid = spawn_last_death.create_guid
  AND spawn.unixtimems = spawn_last_death.create_unixtimems
JOIN (
  SELECT 'creature' object_type, guid, id FROM creature
  UNION ALL
  SELECT 'gameobject', guid, id FROM gameobject
) spawn_object
  ON spawn.object_type = spawn_object.object_type AND spawn.guid = spawn_object.guid
JOIN creature death_creature
  ON spawn_last_death.death_id = death_creature.id
JOIN creature_values_update death
  ON spawn_last_death.death_unixtimems = death.unixtimems AND death_creature.guid = death.guid
WHERE spawn_object.id IN (12435, 12557, 14456, 177808) AND death_creature.id = 12435 AND death.current_health = 0
ORDER BY unixtimems, object_type, id;
