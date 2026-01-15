-- Enables more races to complete restricted quests
-- for role-playing and fun.

UPDATE `quest_template` SET `RequiredRaces` = `RequiredRaces` | 0x40 WHERE `entry` = 6285; -- Return to Lewis (Gnome)
