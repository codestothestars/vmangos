DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20240102213945');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20240102213945');
-- Add your query below.

-- Rashona Straglash - A Donation of Mageweave - next quest is A Donation of Runecloth
UPDATE `quest_template` SET `NextQuestId` = 7824 WHERE `entry` = 7831 AND `patch` = 3;

-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
