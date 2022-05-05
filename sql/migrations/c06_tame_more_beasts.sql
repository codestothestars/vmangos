-- Make additional beasts tameable

UPDATE `creature_template` SET             `type_flags` = `type_flags` | 0x00000001, `pet_family` =  5 WHERE `entry` =  3237; -- Wooly Kodo
UPDATE `creature_template` SET             `type_flags` = `type_flags` | 0x00000001, `pet_family` = 24 WHERE `entry` =  3817; -- Shadowhorn Stag
UPDATE `creature_template` SET `type` = 1, `type_flags` = `type_flags` | 0x00000001, `pet_family` =  1 WHERE `entry` = 10356; -- Bayne
