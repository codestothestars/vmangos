DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;

SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20230206014812');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20230206014812');
-- Add your query below.

-- Blackhand Incarcerator in north-east corner wasn't standing on rune.
UPDATE `creature` SET `position_x` = 162.327, `position_y` = -276.759, `position_z` = 91.6961, orientation = 2.32129 WHERE `guid` = 40452;

INSERT `creature_ai_events`
(   `id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES
-- Upon first entering the instance, Emberseer is animated when he should be frozen.
( 981601,          9816,              0,            1,                          0,            100,             0,              0,              0,              0,              0,           981601,                0,                0, 'Pyroguard Emberseer - Encage'),
-- Need to set flags immediately upon reset, instead of waiting a second. Otherwise a feign-deathed hunter could re-aggro.
(1031601,         10316,              0,            1,                          0,            100,             0,           1000,           1000,              0,              0,          1031601,                0,                0, 'Blackhand Incarcerator - Cast Encage Emberseer'),
-- Need to check these timers against more sniffs.
(1031602,         10316,              0,            0,                          0,            100,             1,           6000,          12000,           7000,          18000,          1031602,                0,                0, 'Blackhand Incarcerator - Cast Strike'),
(1031603,         10316,              0,            0,                          0,            100,             1,           6000,          25000,          16000,          30000,          1031603,                0,                0, 'Blackhand Incarcerator - Cast Encage'),
(1031604,         10316,              0,            2,                          0,            100,             0,             15,              0,              0,              0,          1031604,                0,                0, 'Blackhand Incarcerator - Flee');

INSERT `creature_ai_scripts`
(   `id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_type`, `target_param1`, `target_param2`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
( 981601,       0,          0,         4,         46,  0x02000140,           0,           0,             0,               0,               0,            0,         0,          0,          0,          0,   0,   0,   0,   0,              0, 'Pyroguard Emberseer - Set Immune Flags'),
( 981601,       0,          0,        74,      15282,           0,           0,           0,             0,               0,               0,            0,         0,          0,          0,          0,   0,   0,   0,   0,              0, 'Pyroguard Emberseer - Add Encaged Emberseer'),
(1031601,       0,          0,        15,      15281,           0,           0,           0,             8,            9816,              30,            0,         0,          0,          0,          0,   0,   0,   0,   0,              0, 'Blackhand Incarcerator - Cast Encage Emberseer'),
-- Need to set flags immediately upon reset, instead of waiting a second. Otherwise a feign-deathed hunter could re-aggro.
(1031601,       0,          0,         4,         46,  0x00000300,           1,           0,             0,               0,               0,            0,         0,          0,          0,          0,   0,   0,   0,   0,              0, 'Blackhand Incarcerator - Set Immune Flags'),
-- Double-check CF_INTERRUPT_PREVIOUS against other sniffs.
(1031602,       0,          0,        15,      15580,       0x001,           0,           0,             0,               0,               0,            0,         0,          0,          0,          0,   0,   0,   0,   0,              0, 'Blackhand Incarcerator - Cast Strike'),
-- Make sure this can target a totem.
-- Double-check CF_AURA_NOT_PRESENT against other sniffs.
(1031603,       0,          0,        15,      16045,       0x020,           0,           0,             4,               0,               0,            0,         0,          0,          0,          0,   0,   0,   0,   0,              0, 'Blackhand Incarcerator - Cast Encage'),
(1031604,       0,          0,        47,          0,           0,           0,           0,             0,               0,               0,            0,         0,          0,          0,          0,   0,   0,   0,   0,              0, 'Blackhand Incarcerator - Flee');

-- Disable C++ scripts
UPDATE `creature_template` SET `ai_name` = 'EventAI', `script_name` = '' WHERE `entry` IN (
     9816, -- Pyroguard Emberseer
    10316  -- Blackhand Incarcerator
);

UPDATE `creature_template`
SET
    `auras` = '13377', -- Is setting the aura in the template right to do?
    -- `unit_flags` =
    --     -- Is setting initial flags in the template right to do?
    --     -- Need to double check these in the mass parse database.
    --     0x00000040 | -- UNIT_FLAG_UNK_6
    --     0x00000100 | -- UNIT_FLAG_IMMUNE_TO_PLAYER
    --     0x02000000   -- UNIT_FLAG_NOT_SELECTABLE
WHERE `entry` = 9816; -- Pyroguard Emberseer

-- No need to set these flags in the template because we have to set them when the fight resets anyway.
-- UPDATE `creature_template`
-- SET
--     `unit_flags` =
--         0x00000100 | -- UNIT_FLAG_IMMUNE_TO_PLAYER
--         0x00000200   -- UNIT_FLAG_IMMUNE_TO_NPC
-- WHERE `entry` = 10316; -- Blackhand Incarcerator

DELETE FROM `event_scripts` WHERE id = 4884; -- Emberseer Start

INSERT `event_scripts`
(`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_type`, `target_param1`, `target_param2`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(4884,       0,          0,        68,      10316,           2,       10316,          50,             0,               0,               0,            0,         0,          0,          0,          0,   0,   0,   0,   0,              0, 'Emberseer Start - Start Script on Incarcerators'),
(4884,       2,          0,        39,       9816,           0,           0,           0,             8,            9816,              30,         0x02,       100,          0,          0,          0,   0,   0,   0,   0,              0, 'Emberseer Start - Start Script on Pyroguard Emberseer');

INSERT `generic_scripts`
( `id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_type`, `target_param1`, `target_param2`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
-- At this point in the sniff, Emberseer's size jumps a bit initially. Are we missing something?
( 9816,       0,          0,         0,          2,           0,           0,           0,             0,               0,               0,            0,      5565,          0,          0,          0,   0,   0,   0,   0,              0, 'Pyroguard Emberseer - Growth Text 1'),
( 9816,       0,          0,        14,      15282,           0,           0,           0,             0,               0,               0,            0,         0,          0,          0,          0,   0,   0,   0,   0,              0, 'Pyroguard Emberseer - Remove Encaged Emberseer'),
( 9816,       0,          0,        15,      16048,       0x002,           0,           0,             0,               0,               0,            0,         0,          0,          0,          0,   0,   0,   0,   0,              0, 'Pyroguard Emberseer - Cast Emberseer Growing'),
( 9816,       0,          0,        15,      16245,       0x002,           0,           0,             0,               0,               0,            0,         0,          0,          0,          0,   0,   0,   0,   0,              0, 'Pyroguard Emberseer - Cast Freeze Anim'),
( 9816,      20,          0,         0,          2,           0,           0,           0,             0,               0,               0,            0,      5566,          0,          0,          0,   0,   0,   0,   0,              0, 'Pyroguard Emberseer - Growth Text 2'),
-- Double-check this hard 60-second timer against other sniffs.
( 9816,      60,          0,         0,          2,           0,           0,           0,             0,               0,               0,            0,      5567,          0,          0,          0,   0,   0,   0,   0,              0, 'Pyroguard Emberseer - Growth Text 3'),
( 9816,      60,          0,        14,      16245,           0,           0,           0,             0,               0,               0,            0,         0,          0,          0,          0,   0,   0,   0,   0,              0, 'Pyroguard Emberseer - Remove Freeze Anim'),
( 9816,      60,          0,        15,      16047,       0x002,           0,           0,             0,               0,               0,            0,         0,          0,          0,          0,   0,   0,   0,   0,              0, 'Pyroguard Emberseer - Cast Emberseer Full Strength'),
( 9816,      61,          0,         0,          1,           0,           0,           0,             0,               0,               0,            0,      5268,          0,          0,          0,   0,   0,   0,   0,              0, 'Pyroguard Emberseer - Yell'),
-- Need to put Emberseer into combat, and possibly attack someone?
(10316,       0,          0,         4,         46,  0x00000300,           2,           0,             0,               0,               0,            0,         0,          0,          0,          0,   0,   0,   0,   0,              0, 'Blackhand Incarcerator - Remove Immune Flags'),
-- ubrs_ony_attunement_dump_classic_Wow(1.13.2.31882)-6072_1570347344.pkt - targets appeared totally random. Two of three were channelers, one was standing further out but not casting.
(10316,       0,          1,        26,          0,           0,           0,           0,            28,              50,               0,            0,         0,          0,          0,          0,   0,   0,   0,   0,              0, 'Blackhand Incarcerator - Attack Random Player');

DELETE FROM `scripted_event_id` WHERE `id` = 4884; -- event_free_pyroguard_emberseer

-- Reset instances
DELETE FROM character_instance;
DELETE FROM group_instance;
DELETE FROM instance;

-- Set channelers required on Blackrock Altar to 1, for testing. Revert it to 3 when done.
UPDATE gameobject_template SET data0 = 3 WHERE `entry` = 175706;

-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
