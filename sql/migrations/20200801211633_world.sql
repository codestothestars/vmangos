DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20200801211633');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20200801211633');
-- Add your query below.

-- Remove SPELL_ATTR_HIDDEN_CLIENTSIDE attribute from Furor (spell triggered by Druid talent of the same name).
-- Enables its SPELL_AURA_INTERRUPT_REGEN effect to expire, enabling the player to leave combat and their rage to decay.
UPDATE `spell_template` SET `attributes` = `attributes` & ~0x00000080 WHERE `entry` = 17057;

-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
