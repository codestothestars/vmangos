DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20221211191716');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20221211191716');
-- Add your query below.

INSERT INTO `allowed_clients` (`major_version`, `minor_version`, `bugfix_version`, `hotfix_version`, `build`, `os`, `platform`, `integrity_hash`) VALUES
(1, 5, 1, '', 4449, 'Win', 'x86', ''),
(1, 5, 1, '', 4449, 'OSX', 'x86', ''),
(1, 5, 1, '', 4449, 'OSX', 'PPC', '');

-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
