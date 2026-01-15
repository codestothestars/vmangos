DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20241202212034');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20241202212034');
-- Add your query below.

-- remove 17393 (Shadow Bolt) in favor of CreatureEventAI that chooses between 17393, 17434, and 17435.
REPLACE `creature_spells`
(`entry`, `name`,                         `spellId_1`, `castTarget_1`, `targetParam1_1`, `targetParam2_1`, `castFlags_1`, `delayInitialMin_1`, `delayInitialMax_1`, `delayRepeatMin_1`, `delayRepeatMax_1`, `scriptId_1`,
                                          `spellId_2`, `castTarget_2`, `targetParam1_2`, `targetParam2_2`, `castFlags_2`, `delayInitialMin_2`, `delayInitialMax_2`, `delayRepeatMin_2`, `delayRepeatMax_2`, `scriptId_2`,
                                          `spellId_3`, `castTarget_3`, `targetParam1_3`, `targetParam2_3`, `castFlags_3`, `delayInitialMin_3`, `delayInitialMax_3`, `delayRepeatMin_3`, `delayRepeatMax_3`, `scriptId_3`,
                                          `spellId_4`, `castTarget_4`, `targetParam1_4`, `targetParam2_4`, `castFlags_4`, `delayInitialMin_4`, `delayInitialMax_4`, `delayRepeatMin_4`, `delayRepeatMax_4`, `scriptId_4`) VALUES
( 104400, 'Stratholme - Baron Rivendare',       15708,              1,                0,                0,             0,                  13,                  46,                  9,                 47,            0,
                                                15754,              1,                0,                0,             0,                  10,                  46,                  8,                 47,            0,
                                                17393,              4,                0,                0,             0,                   3,                  19,                  3,                 26,            0,
                                                17473,              0,                0,                0,            32,                   6,                  21,                 16,                 22,        17473);

-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
