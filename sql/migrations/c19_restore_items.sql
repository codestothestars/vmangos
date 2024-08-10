-- Make patch-removed items obtainable again
-- for fun.

UPDATE npc_vendor SET slot = slot + 2 WHERE entry = 3362 AND slot >= 4;    -- Ogunaro Wolfrunner
UPDATE npc_vendor SET slot = 4        WHERE entry = 3362 AND item = 12330; -- Horn of the Red Wolf
UPDATE npc_vendor SET slot = 5        WHERE entry = 3362 AND item = 12351; -- Horn of the Arctic Wolf
