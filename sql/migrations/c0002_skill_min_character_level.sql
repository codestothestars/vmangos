-- Remove minimum character level for skills.
-- For our purposes, this limit on the player is unnecessary.

UPDATE npc_trainer
SET reqlevel = 0
WHERE spell IN (
     1847, -- One-Handed Swords
     2021, -- Journeyman Blacksmith
     3539, -- Expert Blacksmith
     4041, -- Expert Engineer
     9786, -- Artisan Blacksmith
    10663, -- Artisan Leatherworking
    10769, -- Artisan Skinning
    11612, -- Artisan Alchemist
    12657, -- Artisan Engineer
    15984, -- One-Handed Axes
    15985, -- Two-Handed Axes
    15986, -- One-Handed Maces
    15987, -- Two-Handed Maces
    15992, -- Fist Weapons
    15996  -- Guns
);
