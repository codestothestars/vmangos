-- Enables players to have multiple specializations in their profession.

UPDATE `quest_template`
SET `ExclusiveGroup` = 0
WHERE `entry` IN (
    5141, 5143, 5144, 5145, 5146, 5148, -- Leatherworking
    5283, 5284, 5301, 5302              -- Blacksmithing
);

-- Engineering
UPDATE `quest_template` SET `ExclusiveGroup` = 3630 WHERE `entry` IN (3630, 3632, 3634, 3635, 3637);
UPDATE `quest_template` SET `ExclusiveGroup` = 3640 WHERE `entry` IN (3640, 3642);

-- Weaponsmithing
UPDATE `gossip_menu_option` SET `condition_id` = 1360 WHERE `menu_id` =   6090; -- Hammersmith
UPDATE `gossip_menu_option` SET `condition_id` = 1361 WHERE `menu_id` =   6089; -- Axesmith
UPDATE `gossip_menu_option` SET `condition_id` = 1362 WHERE `menu_id` =   6091; -- Swordsmith
UPDATE `gossip_scripts`     SET `condition_id` = 1360 WHERE `id`      = 609001; -- Hammersmith
UPDATE `gossip_scripts`     SET `condition_id` = 1361 WHERE `id`      = 608901; -- Axesmith
UPDATE `gossip_scripts`     SET `condition_id` = 1362 WHERE `id`      = 609101; -- Swordsmith
