-- Remove minimum character level for professions.
-- For our purposes, this limit on the player is unnecessary.

UPDATE npc_trainer
SET reqlevel = 0
WHERE spell IN (2021, 3539, 4041, 10663, 10769, 11612);
