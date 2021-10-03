-- Removes the requirement of Engineering membership cards to learn teleport spells
-- because it doesn't make sense.

UPDATE `conditions`
SET
    `value1` = 1366, -- Engineering 260
    `value2` = 1367, -- Goblin Engineer
    `value3` = 1369  -- Does not know Dimensional Ripper - Everlook
WHERE `condition_entry` = 1377; -- Allowed to learn Dimensional Ripper - Everlook

UPDATE `conditions`
SET
    `value1` = 1366, -- Engineering 260
    `value2` = 1368, -- Gnomish Engineer
    `value3` = 1370  -- Does not know Ultrasafe Transporter - Gadgetzan
WHERE `condition_entry` = 1380; -- Allowed to learn Ultrasafe Transporter - Gadgetzan
