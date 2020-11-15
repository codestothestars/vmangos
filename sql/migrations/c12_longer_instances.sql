-- Makes instances reset only after a month
-- to support extended sessions.

UPDATE `creature` SET `spawntimesecsmax` = 2678400, `spawntimesecsmin` = 2678400 WHERE `map` IN (
    109, -- Sunken Temple
    209, -- Zul'Farrak
    229, -- Blackrock Spire
    230, -- Blackrock Depths
    349, -- Maraudon
    429  -- Dire Maul
);
