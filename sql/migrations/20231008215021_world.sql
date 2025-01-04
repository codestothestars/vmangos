DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20231008215021');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20231008215021');
-- Add your query below.

-- 540: Has aura Possess.
INSERT `conditions` (`condition_entry`, `type`, `value1`, `value2`, `flags`) VALUES (540,  1, 23014,   0, 0x2);
-- 541: Last waypoint equals 0.
INSERT `conditions` (`condition_entry`, `type`, `value1`, `value2`, `flags`) VALUES (541, 32,     0,   0, 0x0);
-- 542: Last waypoint equals 1.
INSERT `conditions` (`condition_entry`, `type`, `value1`, `value2`, `flags`) VALUES (542, 32,     1,   0, 0x0);
-- 543: Last waypoint equals 2.
INSERT `conditions` (`condition_entry`, `type`, `value1`, `value2`, `flags`) VALUES (543, 32,     2,   0, 0x0);
-- 544: Last waypoint equals 3.
INSERT `conditions` (`condition_entry`, `type`, `value1`, `value2`, `flags`) VALUES (544, 32,     3,   0, 0x0);
-- 545: Last waypoint equals 4.
INSERT `conditions` (`condition_entry`, `type`, `value1`, `value2`, `flags`) VALUES (545, 32,     4,   0, 0x0);
-- 546: Last waypoint equals 5.
INSERT `conditions` (`condition_entry`, `type`, `value1`, `value2`, `flags`) VALUES (546, 32,     5,   0, 0x0);
-- 547: Last waypoint equals 6.
INSERT `conditions` (`condition_entry`, `type`, `value1`, `value2`, `flags`) VALUES (547, 32,     6,   0, 0x0);
-- 548: (541: Last waypoint equals 0) Or (547: Last waypoint equals 6).
INSERT `conditions` (`condition_entry`, `type`, `value1`, `value2`, `flags`) VALUES (548, -2,   541, 547, 0x0);
-- 549: Instance data 0 (Razorgore) equals 0 (not started).
INSERT `conditions` (`condition_entry`, `type`, `value1`, `value2`, `flags`) VALUES (549, 34,     0,   0, 0x0);

-- Correct Blackwing Guardsman positions.
UPDATE `creature` SET `position_x` = -7619.66, `position_y` = -1025.14, `position_z` = 413.465, `orientation` = 3.68265  WHERE `guid` = 84390;
UPDATE `creature` SET `position_x` = -7615.01, `position_y` = -1021.55, `position_z` = 413.465, `orientation` = 0.610865 WHERE `guid` = 84391;

-- Add missing Blackwing Orb Trigger spawn.
INSERT INTO `creature`
(`guid`,  `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecsmin`, `spawntimesecsmax`, `wander_distance`, `health_percent`, `mana_percent`) VALUES
(   113, 14449,   469,     -7615.51,     -1025.58,      413.465,       5.23599,             604800,             604800,                 0,              100,            100);

-- Creature entry 14453 (Orb of Domination) had script_name trigger_orb_of_command. What's this creature's function?
-- On wipe, do the creatures respawn or simply run back?
-- Need to set the encounter status to SPECIAL (4) on event start.
-- What is DATA_EGG used for in the existing razorgore script?

-- Remove C++ script from Black Dragon Egg.
UPDATE `gameobject_template` SET `script_name` = '' WHERE `entry` = 177807;

-- Remove C++ script from Orb of Domination.
UPDATE `gameobject_template` SET `script_name` = '' WHERE `entry` = 177808;

-- Events list for Razorgore the Untamed
INSERT `creature_ai_events`
(  `id`,  `creature_id`, `condition_id`, `event_type`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `comment`) VALUES
(1243501,         12435,             540,           1,          0x01,           6000,          16000,           6000,          16000,          1243501, 'Razorgore the Untamed - Out of Combat (periodic)');
INSERT `creature_ai_scripts`
(   `id`, `command`, `datalong`, `datalong2`, `target_type`, `condition_id`, `comments`) VALUES
(1243501,        15,      21389,       0x002,             6,            548, 'Razorgore the Untamed - Cast Fire Channeling'),
(1243501,        60,          0,           1,             0,            548, 'Razorgore the Untamed - Start Waypoint 1'),
(1243501,        60,          0,           2,             0,            542, 'Razorgore the Untamed - Start Waypoint 2'),
(1243501,        60,          0,           3,             0,            543, 'Razorgore the Untamed - Start Waypoint 3'),
(1243501,        60,          0,           4,             0,            544, 'Razorgore the Untamed - Start Waypoint 4'),
(1243501,        60,          0,           5,             0,            545, 'Razorgore the Untamed - Start Waypoint 5'),
(1243501,        60,          0,           6,             0,            546, 'Razorgore the Untamed - Start Waypoint 6');
UPDATE `creature_template` SET `ai_name` = 'EventAI', `auras` = '18943', `script_name` = '' WHERE `entry` = 12435;

-- Events list for Grethok the Controller
INSERT `creature_ai_events`
(  `id`,  `creature_id`, `condition_id`, `event_type`, `action1_script`, `comment`) VALUES
(1255701,         12557,            549,            1,          1255701, 'Grethok the Controller - Out of Combat'),
(1255702,         12557,              0,            4,          1255702, 'Grethok the Controller - Aggro'); -- should this have condition 549?
INSERT `creature_ai_scripts`
(   `id`, `command`, `datalong`, `target_type`, `dataint`, `comments`) VALUES
(1255701,        15,      23018,             6,         0, 'Grethok the Controller - Cast Use Dragon Orb'),
(1255702,        49,          1,             0,         0, 'Grethok the Controller - Combat Pulse'),
(1255702,         0,          1,             0,      9958, 'Grethok the Controller - Yell');
REPLACE `creature_spells`
(`entry`, `name`,                   `spellId_1`, `probability_1`, `castTarget_1`, `delayInitialMin_1`, `delayInitialMax_1`, `delayRepeatMin_1`, `delayRepeatMax_1`, `spellId_2`, `probability_2`, `castTarget_2`, `delayInitialMin_2`, `delayInitialMax_2`, `delayRepeatMin_2`, `delayRepeatMax_2`, `spellId_3`, `probability_3`, `castTarget_3`, `delayInitialMin_3`, `delayInitialMax_3`, `delayRepeatMin_3`, `delayRepeatMax_3`, `spellId_4`, `probability_4`, `castTarget_4`, `delayInitialMin_4`, `delayInitialMax_4`, `delayRepeatMin_4`, `delayRepeatMax_4`) VALUES
( 125570, 'Grethok the Controller',       13747,             100,              ?,                  12,                  15,                 12,                 15,       14515,             100,              ?,                   6,                  12,                  6,                 12,       22272,             100,              0,                   2,                  16,                 10,                 13,       22274,             100,              0,                   1,                  11,                  7,                  7);
UPDATE `creature_template` SET `auras` = '18950' WHERE `entry` = 12557;
-- spells
-- Need to check spell targets against what's in the current list.
-- Current list has 22273 (Arcane Missiles), but that is just a component of 22272.
-- No data for repeating delays on spells 13747 and 14515. Only one data point for 22274.

-- Events list for Blackwing Orb Trigger
-- INSERT `creature_ai_events`
-- (  `id`,  `creature_id`, `condition_id`, `event_type`, `action1_script`, `comment`) VALUES
-- INSERT `creature_ai_scripts`
-- (   `id`, `command`, `datalong`, `target_type`, `comments`) VALUES
-- UPDATE `creature_template` SET `ai_name` = 'EventAI' WHERE `entry` = 14449;

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

-- Delay of creature's each movement from the previous.
-- SELECT current.unixtimems, current.point, current.orientation, ROUND((current.unixtimems - previous.unixtimems) / 1000) delay
-- FROM creature_movement_server current
--   JOIN creature_movement_server previous ON current.guid = previous.guid AND current.point - 1 = previous.point
--   JOIN creature ON current.guid = creature.guid
-- WHERE creature.id = 12435
-- ORDER BY current.unixtimems, current.point

-- Min and max delay of creature's movement from the previous.
-- SELECT
--   MIN(ROUND((current.unixtimems - previous.unixtimems) / 1000)) min_delay,
--   MAX(ROUND((current.unixtimems - previous.unixtimems) / 1000)) max_delay
-- FROM creature_movement_server current
--   JOIN creature_movement_server previous ON current.guid = previous.guid AND current.point - 1 = previous.point
--   JOIN creature ON current.guid = creature.guid
-- WHERE creature.id = 12435 AND (current.unixtimems - previous.unixtimems) > 3000
-- ORDER BY current.unixtimems, current.point
