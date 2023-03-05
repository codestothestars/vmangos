DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;

SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20230206014812');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20230206014812');
-- Add your query below.

-- To-do
-- Check numbers against more sniffs.
-- Check numbers against mass parse database.

-- No players alive within 100 yards.
INSERT `conditions`
(`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES
(              239,     56,        0,      100,        0,        0,       1);

-- Blackhand Incarcerator in north-east corner wasn't standing on rune.
UPDATE `creature` SET `position_x` = 162.327, `position_y` = -276.759, `position_z` = 91.6961, orientation = 2.32129 WHERE `guid` = 40452;

INSERT `creature_ai_events`
(   `id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES
-- Upon first entering the instance, Emberseer is sometimes animated when he should be frozen.
( 981601,          9816,              0,            1,                          0,            100,             0,              0,              0,              0,              0,           981601,                0,                0, 'Pyroguard Emberseer - Out of Combat'),
-- Check more full sniffs and the mass sniff database for more delay numbers.
( 981602,          9816,              0,            0,                          0,            100,             1,          16000,          16000,          11000,          11000,           981602,                0,                0, 'Pyroguard Emberseer - In Combat (Fire Nova)'),
( 981603,          9816,              0,            0,                          0,            100,             1,          10000,          10000,          10000,          10000,           981603,                0,                0, 'Pyroguard Emberseer - In Combat (Flame Buffet)'),
( 981604,          9816,              0,            6,                          0,            100,             0,              0,              0,              0,              0,           981604,                0,                0, 'Pyroguard Emberseer - Death'),
( 981605,          9816,              0,            1,                        0x2,            100,             0,           2000,           2000,              0,              0,           981605,                0,                0, 'Pyroguard Emberseer - Out of Combat (Phase 2 Growth 1)'),
( 981606,          9816,              0,            1,                        0x2,            100,             0,          32000,          32000,              0,              0,           981606,                0,                0, 'Pyroguard Emberseer - Out of Combat (Phase 2 Growth 2)'),
( 981607,          9816,              0,            1,                        0x2,            100,             0,          62000,          62000,              0,              0,           981607,                0,                0, 'Pyroguard Emberseer - Out of Combat (Phase 2 Growth 3)'),
( 981608,          9816,              0,            1,                        0x6,            100,             0,           1000,           1000,              0,              0,           981608,                0,                0, 'Pyroguard Emberseer - Out of Combat (Phase 3 Yell)'),
( 981609,          9816,              0,            1,                        0x6,            100,             0,           5000,           5000,              0,              0,           981609,                0,                0, 'Pyroguard Emberseer - Out of Combat (Phase 3 Attack Start)'),
(1031602,         10316,              0,            1,                          0,            100,             0,              0,              0,              0,              0,          1031602,                0,                0, 'Blackhand Incarcerator - Out of Combat'),
-- Need to check these timers against more sniffs.
(1031603,         10316,              0,            0,                          0,            100,             1,           6000,          12000,           7000,          18000,          1031603,                0,                0, 'Blackhand Incarcerator - Cast Strike'),
(1031604,         10316,              0,            0,                          0,            100,             1,           6000,          25000,          16000,          30000,          1031604,                0,                0, 'Blackhand Incarcerator - Cast Encage'),
(1031605,         10316,              0,            2,                          0,            100,             0,             15,              0,              0,              0,          1031605,                0,                0, 'Blackhand Incarcerator - 15% Health'),
(1031606,         10316,              0,           11,                          0,            100,             0,              0,              0,              0,              0,          1031606,                0,                0, 'Blackhand Incarcerator - Spawn');

INSERT `creature_ai_scripts`
(   `id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_type`, `target_param1`, `target_param2`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
( 981601,       0,          0,        44,          1,           0,           0,           0,             0,               0,               0,            0,         0,          0,          0,          0,   0,   0,   0,   0,              0, 'Pyroguard Emberseer - Start Phase 1'),
( 981601,       0,          0,         4,         46,  0x02000140,           1,           0,             0,               0,               0,            0,         0,          0,          0,          0,   0,   0,   0,   0,              0, 'Pyroguard Emberseer - Set Immune Flags'),
( 981602,       0,          0,        15,      16079,           0,           0,           0,             0,               0,               0,            0,         0,          0,          0,          0,   0,   0,   0,   0,              0, 'Pyroguard Emberseer - Cast Fire Nova'),
( 981603,       0,          0,        15,      16536,           0,           0,           0,             1,               0,               0,            0,         0,          0,          0,          0,   0,   0,   0,   0,              0, 'Pyroguard Emberseer - Cast Flame Buffet'),
( 981604,       0,          0,        62,       4884,           1,           0,           0,             0,               0,               0,            0,         0,          0,          0,          0,   0,   0,   0,   0,              0, 'Pyroguard Emberseer - End Map Event (Success)'),
( 981605,       0,          0,        39,      98161,           0,           0,           0,             0,               0,               0,            0,       100,          0,          0,          0,   0,   0,   0,   0,              0, 'Pyroguard Emberseer - Growth Start'),
( 981606,       0,          0,         0,          2,           0,           0,           0,             0,               0,               0,            0,      5566,          0,          0,          0,   0,   0,   0,   0,              0, 'Pyroguard Emberseer - Growth Text 2'),
( 981607,       0,          0,         0,          2,           0,           0,           0,             0,               0,               0,            0,      5567,          0,          0,          0,   0,   0,   0,   0,              0, 'Pyroguard Emberseer - Growth Text 3'),
( 981607,       0,          0,        14,      16245,           0,           0,           0,             0,               0,               0,            0,         0,          0,          0,          0,   0,   0,   0,   0,              0, 'Pyroguard Emberseer - Remove Freeze Anim'),
( 981607,       0,          0,        15,      16047,       0x002,           0,           0,             6,               0,               0,            0,         0,          0,          0,          0,   0,   0,   0,   0,              0, 'Pyroguard Emberseer - Cast Emberseer Full Strength'),
( 981607,       0,          0,        39,     175269,           0,           0,           0,             0,               0,               0,            0,       100,          0,          0,          0,   0,   0,   0,   0,              0, 'Pyroguard Emberseer - Activate Runes'),
( 981607,       0,          0,        44,          3,           0,           0,           0,             0,               0,               0,            0,         0,          0,          0,          0,   0,   0,   0,   0,              0, 'Pyroguard Emberseer - Start Phase 3'),
( 981608,       0,          0,         0,          1,           0,           0,           0,             0,               0,               0,            0,      5268,          0,          0,          0,   0,   0,   0,   0,              0, 'Pyroguard Emberseer - Yell'),
( 981609,       0,          0,         4,         46,  0x00000800,           1,           0,             0,               0,               0,            0,         0,          0,          0,          0,   0,   0,   0,   0,              0, 'Pyroguard Emberseer - Set Flags'),
( 981609,       0,          0,         4,         46,  0x02000100,           2,           0,             0,               0,               0,            0,         0,          0,          0,          0,   0,   0,   0,   0,              0, 'Pyroguard Emberseer - Remove Immune Flags'),
( 981609,       0,          0,        22,        754,           2,           0,           0,             0,               0,               0,            0,         0,          0,          0,          0,   0,   0,   0,   0,              0, 'Pyroguard Emberseer - Change Faction'),
( 981609,       0,          1,        49,          1,           0,           0,           0,             0,               0,               0,            0,         0,          0,          0,          0,   0,   0,   0,   0,              0, 'Pyroguard Emberseer - Combat Pulse'),
(1031601,       0,          0,        39,     103161,           0,           0,           0,             0,               0,               0,            0,       100,          0,          0,          0,   0,   0,   0,   0,              0, 'Blackhand Incarcerator - Set Immune Flags'),
(1031602,       0,          0,        39,     103162,           0,           0,           0,             0,               0,               0,            0,       100,          0,          0,          0,   0,   0,   0,   0,              0, 'Blackhand Incarcerator - Cast Encage Emberseer'),
-- Double-check CF_INTERRUPT_PREVIOUS against other sniffs.
(1031603,       0,          0,        15,      15580,       0x001,           0,           0,             0,               0,               0,            0,         0,          0,          0,          0,   0,   0,   0,   0,              0, 'Blackhand Incarcerator - Cast Strike'),
-- Double-check CF_AURA_NOT_PRESENT against other sniffs. Do they ever cast it on a player who's already afflicted?
(1031604,       0,          0,        15,      16045,       0x020,           0,           0,             4,           0x001,               0,            0,         0,          0,          0,          0,   0,   0,   0,   0,              0, 'Blackhand Incarcerator - Cast Encage'),
(1031605,       0,          0,        47,          0,           0,           0,           0,             0,               0,               0,            0,         0,          0,          0,          0,   0,   0,   0,   0,              0, 'Blackhand Incarcerator - Flee'),
(1031606,       0,          0,        39,     103161,           0,           0,           0,             0,               0,               0,            0,       100,          0,          0,          0,   0,   0,   0,   0,              0, 'Blackhand Incarcerator - Set Immune Flags');

-- Disable C++ scripts
UPDATE `creature_template` SET `ai_name` = 'EventAI', `script_name` = '' WHERE `entry` IN (
     9816, -- Pyroguard Emberseer
    10316  -- Blackhand Incarcerator
);

-- Pyroguard Emberseer
UPDATE `creature_template`
SET
    `auras` = '13377 15282'
WHERE `entry` = 9816;

DELETE FROM `event_scripts` WHERE `id` = 4884; -- Emberseer Start

INSERT `event_scripts`
(`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_type`, `target_param1`, `target_param2`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(4884,       0,          0,        61,       4884,        1200,           0,           0,             0,               0,               0,            0,         0,      48841,        239,      48842,   0,   0,   0,   0,              0, 'Emberseer Start - Start Map Event'),
(4884,       0,          0,        80,          1,           0,           0,           0,            12,          260283,               0,            0,         0,          0,          0,          0,   0,   0,   0,   0,              0, 'Emberseer Start - Close Emberseer In'),
(4884,       0,          0,        80,          1,           0,           0,           0,            12,          397205,               0,            0,         0,          0,          0,          0,   0,   0,   0,   0,              0, 'Emberseer Start - Close Doors'),
(4884,       0,          0,        68,     103163,           2,       10316,          50,             0,               0,               0,            0,         0,          0,          0,          0,   0,   0,   0,   0,              0, 'Emberseer Start - Start Script on Incarcerators'),
(4884,       0,          0,        44,          2,           0,           0,           0,             8,            9816,              30,         0x02,       100,          0,          0,          0,   0,   0,   0,   0,              0, 'Emberseer Start - Start Phase 2 on Pyroguard Emberseer');

-- Sniffs reveal an extra DarkIronDwarfRune in the wall, which is also activated during the fight.
INSERT `gameobject`
(`guid`,   `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(397204, 175187,   229,       144.37,     -299.198,      91.4701,             0,           0,           0,           0,           1,                 25,                 25,            100,       1,             0,                0,           0,          10);

-- Missing entry door
INSERT `gameobject`
(`guid`,   `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(397205, 175705,   229,      175.127,     -258.945,      91.5603,             0,           0,           0,           0,           1,                 25,                 25,            100,       0,             0,                0,           0,          10);

-- Templates of most of the DarkIronDwarfRune objects in boss room were incorrect/swapped around. Also tweak positions from sniffs.
UPDATE `gameobject` SET `id` = 175266, `position_x` = 144.375, `position_y` = -240.826, `position_z` = 91.4713 WHERE `guid` = 397215; -- West
UPDATE `gameobject` SET `id` = 175267, `position_x` = 126.354, `position_y` = -240.77 , `position_z` = 91.4701 WHERE `guid` = 397218; -- South-West
UPDATE `gameobject` SET                `position_x` = 162.466, `position_y` = -240.765, `position_z` = 91.4688 WHERE `guid` = 397210; -- North-West
UPDATE `gameobject` SET `id` = 175269, `position_x` = 126.296, `position_y` = -258.732, `position_z` = 91.4701 WHERE `guid` = 397219; -- South
UPDATE `gameobject` SET `id` = 175270, `position_x` = 162.443, `position_y` = -258.904, `position_z` = 91.4701 WHERE `guid` = 397208; -- North
UPDATE `gameobject` SET `id` = 175271, `position_x` = 126.402, `position_y` = -276.79 , `position_z` = 91.4701 WHERE `guid` = 397220; -- South-East
UPDATE `gameobject` SET `id` = 175272, `position_x` = 162.401, `position_y` = -276.824, `position_z` = 91.4701 WHERE `guid` = 397203; -- North-East

INSERT `generic_scripts`
(  `id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_type`, `target_param1`, `target_param2`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
( 48841,       0,          0,        39,     175270,           0,           0,           0,             0,               0,               0,            0,       100,          0,          0,          0,   0,   0,   0,   0,              0, 'Emberseer Event - Ready Runes'),
( 48841,       0,          0,        39,     175705,           0,           0,           0,             0,               0,               0,            0,       100,          0,          0,          0,   0,   0,   0,   0,              0, 'Emberseer Event - Open Doors'),
( 48841,       0,          0,        11,     261637,           0,           0,           0,             0,               0,               0,            0,         0,          0,          0,          0,   0,   0,   0,   0,              0, 'Emberseer Event - Open Emberseer Out'),
( 48842,       0,          0,        39,      98162,           0,           0,           0,             8,            9816,              30,         0x02,       100,          0,          0,          0,   0,   0,   0,   0,              0, 'Emberseer Event - Respawn Pyroguard Emberseer'),
( 48842,       0,          0,        39,     103165,           0,           0,           0,             0,               0,               0,            0,       100,          0,          0,          0,   0,   0,   0,   0,              0, 'Emberseer Event - Respawn Dead Incarcerators'),
( 48842,       0,          0,        39,     175270,           0,           0,           0,             0,               0,               0,            0,       100,          0,          0,          0,   0,   0,   0,   0,              0, 'Emberseer Event - Ready Runes'),
( 48842,       0,          0,        39,     175705,           0,           0,           0,             0,               0,               0,            0,       100,          0,          0,          0,   0,   0,   0,   0,              0, 'Emberseer Event - Open Doors'),
-- At this point in the sniff, Emberseer's size jumps a bit initially. Are we missing something?
( 98161,       0,          0,        14,      15282,           0,           0,           0,             0,               0,               0,            0,         0,          0,          0,          0,   0,   0,   0,   0,              0, 'Pyroguard Emberseer - Remove Encaged Emberseer'),
( 98161,       0,          0,        15,      16048,       0x002,           0,           0,             6,               0,               0,            0,         0,          0,          0,          0,   0,   0,   0,   0,              0, 'Pyroguard Emberseer - Cast Emberseer Growing'),
( 98161,       0,          0,        15,      16245,       0x002,           0,           0,             6,               0,               0,            0,         0,          0,          0,          0,   0,   0,   0,   0,              0, 'Pyroguard Emberseer - Cast Freeze Anim'),
( 98161,       0,          0,         0,          2,           0,           0,           0,             0,               0,               0,            0,      5565,          0,          0,          0,   0,   0,   0,   0,              0, 'Pyroguard Emberseer - Growth Text 1'),
( 98162,       0,          0,        71,          1,           0,           0,           0,             0,               0,               0,            0,         0,          0,          0,          0,   0,   0,   0,   0,              0, 'Pyroguard Emberseer - Respawn'),
(103161,       0,          0,         4,         46,  0x00000300,           1,           0,             0,               0,               0,            0,         0,          0,          0,          0,   0,   0,   0,   0,              0, 'Blackhand Incarcerator - Set Immune Flags'),
(103162,       0,          0,        15,      15281,           0,           0,           0,             8,            9816,              30,            0,         0,          0,          0,          0,   0,   0,   0,   0,              0, 'Blackhand Incarcerator - Cast Encage Emberseer'),
(103163,       0,          0,         4,         46,  0x00000300,           2,           0,             0,               0,               0,            0,         0,          0,          0,          0,   0,   0,   0,   0,              0, 'Blackhand Incarcerator - Remove Immune Flags'),
-- ubrs_ony_attunement_dump_classic_Wow(1.13.2.31882)-6072_1570347344.pkt - targets appeared totally random. Two of three were channelers, one was standing further out but not casting.
(103163,       0,          1,        26,          0,           0,           0,           0,            28,              50,               0,            0,         0,          0,          0,          0,   0,   0,   0,   0,              0, 'Blackhand Incarcerator - Attack Random Player'),
(103164,       0,          0,        39,     103161,           0,           0,           0,             0,               0,               0,            0,       100,          0,          0,          0,   0,   0,   0,   0,              0, 'Blackhand Incarcerator - Set Immune Flags'),
(103164,       0,          0,        71,          0,           0,           0,           0,             0,               0,               0,            0,         0,          0,          0,          0,   0,   0,   0,   0,              0, 'Blackhand Incarcerator - Respawn'),
(103165,       0,          0,        68,     103164,           2,       10316,         100,             0,               0,               0,            0,         0,          0,          0,          0,   0,   0,   0,   0,              0, 'Blackhand Incarcerator - Respawn Dead Incarcerators'),
(175266,       0,          0,        13,          0,           0,           0,           0,             0,               0,               0,            0,         0,          0,          0,          0,   0,   0,   0,   0,              0, 'DarkIronDwarfRune (West) - Activate'),
(175266,       1,          0,         4,          9,  0x00000001,           2,           0,             0,               0,               0,            0,         0,          0,          0,          0,   0,   0,   0,   0,              0, 'DarkIronDwarfRune (West) - Remove In Use Flag'),
(175267,       0,          0,        80,          0,           0,           0,           0,             0,               0,               0,            0,         0,          0,          0,          0,   0,   0,   0,   0,              0, 'DarkIronDwarfRune (Rest) - Set State Active'),
(175268,       0,          0,        80,          1,           0,           0,           0,             0,               0,               0,            0,         0,          0,          0,          0,   0,   0,   0,   0,              0, 'DarkIronDwarfRune - Set State Ready'),
(175269,       0,          0,        39,     175266,           0,           0,           0,            12,          397215,               0,            0,       100,          0,          0,          0,   0,   0,   0,   0,              0, 'Activate DarkIronDwarfRune (West)'),
(175269,       0,          0,        39,     175267,           0,           0,           0,            12,          397218,               0,            0,       100,          0,          0,          0,   0,   0,   0,   0,              0, 'Activate DarkIronDwarfRune (South-West)'),
(175269,       0,          0,        39,     175267,           0,           0,           0,            12,          397210,               0,            0,       100,          0,          0,          0,   0,   0,   0,   0,              0, 'Activate DarkIronDwarfRune (North-West)'),
(175269,       0,          0,        39,     175267,           0,           0,           0,            12,          397219,               0,            0,       100,          0,          0,          0,   0,   0,   0,   0,              0, 'Activate DarkIronDwarfRune (South)'),
(175269,       0,          0,        39,     175267,           0,           0,           0,            12,          397208,               0,            0,       100,          0,          0,          0,   0,   0,   0,   0,              0, 'Activate DarkIronDwarfRune (North)'),
(175269,       0,          0,        39,     175267,           0,           0,           0,            12,          397220,               0,            0,       100,          0,          0,          0,   0,   0,   0,   0,              0, 'Activate DarkIronDwarfRune (South-East)'),
(175269,       0,          0,        39,     175267,           0,           0,           0,            12,          397203,               0,            0,       100,          0,          0,          0,   0,   0,   0,   0,              0, 'Activate DarkIronDwarfRune (North-East)'),
(175269,       0,          0,        39,     175267,           0,           0,           0,            12,          397204,               0,            0,       100,          0,          0,          0,   0,   0,   0,   0,              0, 'Activate DarkIronDwarfRune (Wall)'),
(175270,       0,          0,        87,     175268,           0,           0,           0,            12,          397215,               0,            0,       100,          0,          0,          0,   0,   0,   0,   0,              0, 'Ready DarkIronDwarfRune (West)'),
(175270,       0,          0,        39,     175268,           0,           0,           0,            12,          397218,               0,            0,       100,          0,          0,          0,   0,   0,   0,   0,              0, 'Ready DarkIronDwarfRune (South-West)'),
(175270,       0,          0,        39,     175268,           0,           0,           0,            12,          397210,               0,            0,       100,          0,          0,          0,   0,   0,   0,   0,              0, 'Ready DarkIronDwarfRune (North-West)'),
(175270,       0,          0,        39,     175268,           0,           0,           0,            12,          397219,               0,            0,       100,          0,          0,          0,   0,   0,   0,   0,              0, 'Ready DarkIronDwarfRune (South)'),
(175270,       0,          0,        39,     175268,           0,           0,           0,            12,          397208,               0,            0,       100,          0,          0,          0,   0,   0,   0,   0,              0, 'Ready DarkIronDwarfRune (North)'),
(175270,       0,          0,        39,     175268,           0,           0,           0,            12,          397220,               0,            0,       100,          0,          0,          0,   0,   0,   0,   0,              0, 'Ready DarkIronDwarfRune (South-East)'),
(175270,       0,          0,        39,     175268,           0,           0,           0,            12,          397203,               0,            0,       100,          0,          0,          0,   0,   0,   0,   0,              0, 'Ready DarkIronDwarfRune (North-East)'),
(175270,       0,          0,        39,     175268,           0,           0,           0,            12,          397204,               0,            0,       100,          0,          0,          0,   0,   0,   0,   0,              0, 'Ready DarkIronDwarfRune (Wall)'),
(175705,       0,          0,        80,          0,           0,           0,           0,            12,          260283,               0,            0,         0,          0,          0,          0,   0,   0,   0,   0,              0, 'Emberseer In - Open'),
(175705,       0,          0,        80,          0,           0,           0,           0,            12,          397205,               0,            0,         0,          0,          0,          0,   0,   0,   0,   0,              0, 'Doors - Open');

 -- event_free_pyroguard_emberseer
DELETE FROM `scripted_event_id` WHERE `id` = 4884;

-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;

-- Set channelers required on Blackrock Altar to 1, for testing. Revert it to 3 when done.
UPDATE gameobject_template SET data0 = 1 WHERE `entry` = 175706;

-- Reset instances
DELETE FROM character_instance;
DELETE FROM group_instance;
DELETE FROM instance;

-- RESET ALL
DELETE FROM conditions WHERE condition_entry = 239;
DELETE FROM generic_scripts WHERE id LIKE '4884%' OR id LIKE '9816%' OR id LIKE '10316%' OR id LIKE '1752%' OR id = '175705';
DELETE FROM gameobject WHERE `guid` IN (397204, 397205);
DELETE FROM creature_ai_scripts WHERE id LIKE '9816%' OR id LIKE '10316%';
DELETE FROM creature_ai_events WHERE id LIKE '9816%' OR id LIKE '10316%';
