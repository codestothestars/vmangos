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
-- Need to set flags immediately upon reset, instead of waiting a second. Otherwise a feign-deathed hunter could re-aggro.
(1031601,         10316,              0,            1,                          0,            100,             0,           1000,           1000,              0,              0,          1031601,                0,                0, 'Blackhand Incarcerator - Cast Encage Emberseer'),
-- Need to check these timers against more sniffs.
(1031602,         10316,              0,            0,                          0,            100,             1,           6000,          12000,           7000,          18000,          1031602,                0,                0, 'Blackhand Incarcerator - Cast Strike'),
(1031603,         10316,              0,            0,                          0,            100,             1,           6000,          25000,          16000,          30000,          1031603,                0,                0, 'Blackhand Incarcerator - Cast Encage');

INSERT `creature_ai_scripts`
(   `id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_type`, `target_param1`, `target_param2`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(1031601,       0,          0,        15,      15281,           0,           0,           0,             8,            9816,              30,            0,         0,          0,          0,          0,   0,   0,   0,   0,              0, 'Blackhand Incarcerator - Cast Encage Emberseer'),
-- Need to set flags immediately upon reset, instead of waiting a second. Otherwise a feign-deathed hunter could re-aggro.
(1031601,       0,          0,         4,         46,  0x00000300,           1,           0,             0,               0,               0,            0,         0,          0,          0,          0,   0,   0,   0,   0,              0, 'Blackhand Incarcerator - Set Immune Flags'),
-- Double-check CF_INTERRUPT_PREVIOUS against other sniffs.
(1031602,       0,          0,        15,      15580,       0x001,           0,           0,             0,               0,               0,            0,         0,          0,          0,          0,   0,   0,   0,   0,              0, 'Blackhand Incarcerator - Cast Strike'),
-- Make sure this can target a totem.
-- Double-check CF_AURA_NOT_PRESENT against other sniffs.
(1031603,       0,          0,        15,      16045,       0x020,           0,           0,             4,               0,               0,            0,         0,          0,          0,          0,   0,   0,   0,   0,              0, 'Blackhand Incarcerator - Cast Encage');

-- Disable C++ scripts
UPDATE `creature_template` SET `ai_name` = 'EventAI', `script_name` = '' WHERE `entry` IN (
     9816, -- Pyroguard Emberseer
    10316  -- Blackhand Incarcerator
);

UPDATE `creature_template`
SET
    `auras` = '15282 13377', -- Is setting the aura in the template right to do?
    `unit_flags` =
        -- Is setting initial flags in the template right to do?
        -- Need to double check these in the mass parse database.
        0x00000040 | -- UNIT_FLAG_UNK_6
        0x00000100 | -- UNIT_FLAG_IMMUNE_TO_PLAYER
        0x02000000   -- UNIT_FLAG_NOT_SELECTABLE
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
(4884,       1,          0,        68,      10316,           2,       10316,          50,             0,               0,               0,            0,         0,          0,          0,          0,   0,   0,   0,   0,              0, 'Emberseer Start - Start Script on Incarcerators');

INSERT `generic_scripts`
( `id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_type`, `target_param1`, `target_param2`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
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
