-- Lower minimum levels of some quests
-- for more adventurous questing.

UPDATE `quest_template` SET `MinLevel` =  0 WHERE `entry` IN (6031, 6032);                               -- Timbermaw Hold
UPDATE `quest_template` SET `MinLevel` = 40 WHERE `entry` IN (7028, 7029, 7041, 7044, 7046, 7064, 7065); -- Maraudon
