UPDATE `creature_loot_template` SET `maxcount` = 2, `mincountOrRef` = 2 WHERE `item` = 8153; -- Wildvine

UPDATE `creature_onkill_reputation` SET `RewOnKillRepValue1` =  80 WHERE `creature_id` IN (7153, 7154, 7155);   -- Deadwood Warrior, Gardener, Pathfinder
UPDATE `creature_onkill_reputation` SET `RewOnKillRepValue1` =  80 WHERE `creature_id` IN (7440, 7441);         -- Winterfall Den Watcher, Totemic
UPDATE `creature_onkill_reputation` SET `RewOnKillRepValue1` =  96 WHERE `creature_id` =  7442;                 -- Winterfall Pathfinder
UPDATE `creature_onkill_reputation` SET `RewOnKillRepValue1` = 400 WHERE `creature_id` =  9464 AND `patch` = 0; -- Overlord Ror (Patch <1.9)
UPDATE `creature_onkill_reputation` SET `RewOnKillRepValue1` = 240 WHERE `creature_id` =  9464 AND `patch` = 7; -- Overlord Ror (Patch 1.9+)
UPDATE `creature_onkill_reputation` SET `RewOnKillRepValue1` =  80 WHERE `creature_id` = 14342 AND `patch` = 0; -- Ragepaw (Patch <1.9)
UPDATE `creature_onkill_reputation` SET `RewOnKillRepValue1` = 400 WHERE `creature_id` = 14342 AND `patch` = 7; -- Ragepaw (Patch 1.9+)

UPDATE `quest_template` SET `RewRepValue1` =  100 WHERE `entry` = 6031; -- Runecloth
UPDATE `quest_template` SET `RewRepValue1` = 1600 WHERE `entry` = 6131; -- Timbermaw Ally
UPDATE `quest_template` SET `RewRepValue1` = 1600 WHERE `entry` = 7736; -- Restoring Fiery Flux Supplies via Kingsblood
UPDATE `quest_template` SET `RewRepValue1` = 3200 WHERE `entry` = 7737; -- Gaining Acceptance
UPDATE `quest_template` SET `RewRepValue1` = 2400 WHERE `entry` = 8464; -- Winterfall Activity
