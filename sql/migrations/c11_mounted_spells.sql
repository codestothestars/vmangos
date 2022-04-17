-- Enables more spells to be cast while mounted
-- for role-playing and fun.

UPDATE `spell_template` SET `attributes` = `attributes` | 0x01000000 WHERE `entry` IN (
     883, -- Call Pet
    9885, -- Mark of the Wild (Rank 7)
    9910  -- Thorns (Rank 6)
);
