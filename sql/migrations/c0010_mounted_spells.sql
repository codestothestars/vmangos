-- Enables more spells to be cast while mounted
-- for role-playing and fun.

UPDATE `spell_template` SET `attributes` = `attributes` | 0x01000000 WHERE `entry` IN (
    883 -- Call Pet
);
