-- Makes instances reset only after a month
-- to support extended sessions.

UPDATE `creature` SET `spawntimesecsmax` = 2678400, `spawntimesecsmin` = 2678400 WHERE `map` IN (
);
