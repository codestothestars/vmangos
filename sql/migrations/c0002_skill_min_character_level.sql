-- Remove minimum character level for skills.
-- For our purposes, this limit on the player is unnecessary.

UPDATE npc_trainer
SET reqlevel = 0
WHERE spell IN (
     1847, -- One-Handed Swords
     2021, -- Journeyman Blacksmith
     3539, -- Expert Blacksmith
     4041, -- Expert Engineer
    10663, -- Artisan Leatherworking
    10769, -- Artisan Skinning
    11612  -- Artisan Alchemist
);
