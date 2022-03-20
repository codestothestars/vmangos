-- Restricts patch-dependent items to the patch in which they were introduced.

UPDATE `item_template` SET `patch` = 7 WHERE `entry` = 21177; -- Symbol of Kings
