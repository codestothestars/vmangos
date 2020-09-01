-- Enables players to have multiple specializations in their profession.

UPDATE `quest_template`
SET `ExclusiveGroup` = 0
WHERE `entry` IN (
    5141, 5143, 5144, 5145, 5146, 5148, -- Leatherworking
    5283, 5284, 5301, 5302              -- Blacksmithing
);
