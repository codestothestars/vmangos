DROP PROCEDURE IF EXISTS add_migration;
DELIMITER ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20260529030008');
IF v = 0 THEN
INSERT INTO `migrations` VALUES ('20260529030008');
-- Add your query below.

-- Proof: https://youtu.be/xkbKOzwAihw?si=X1fm0HFzTD9nT-Qs&t=226
-- (codestothestars - also archived locally)
DELETE FROM `creature_groups` WHERE `leader_guid` = 56800

-- End of migration.
END IF;
END??
DELIMITER ;
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
