-- Allows casting Entangling Roots indoors
-- for balance in small groups.

UPDATE `spell_template`
SET `attributes` = `attributes` & ~0x00008000
WHERE `entry` IN (
     339, -- Rank 1
    1062, -- Rank 2
    5195, -- Rank 3
    5196, -- Rank 4
    9852, -- Rank 5
    9853  -- Rank 6
);
