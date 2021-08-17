-- Make additional beasts tameable

UPDATE `creature_template` SET `type_flags` = 1, `pet_family` =  5 WHERE `entry` = 3237; -- Wooly Kodo
UPDATE `creature_template` SET `type_flags` = 1, `pet_family` = 24 WHERE `entry` = 3817; -- Shadowhorn Stag
