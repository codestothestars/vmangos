-- Scale mechanics and numbers to make smaller raid groups feasible.

-- Flamewalker Protector will not charm last healer or tank.
UPDATE creature_spells SET castTarget_1 = 30, targetParam2_1 = 0b1100 WHERE entry = 121190;

-- Flamewalker Protector is stunnable
UPDATE creature_template SET mechanic_immune_mask = mechanic_immune_mask & ~0b100000000000 WHERE entry = 12119;

-- Challenging Roar lasts 8 seconds instead of 6, as small groups may rely on it more
UPDATE spell_template SET durationIndex = 31 WHERE entry = 5209;

-- Spells are irresistible when their success is more likely to be critical in small groups
UPDATE spell_template SET attributesEx4 = attributesEx4 | 0x001 WHERE entry IN (
  5209, -- Challenging Roar
  5384  -- Feign Death
);

-- Multi-target spells are more useful for AoE-heavy situations
UPDATE spell_template
SET effectChainTarget1 = 5 -- was 3
WHERE entry IN (
   9908, -- Swipe
  14290  -- Multi-Shot
);

-- Volley is more competitive on AoE damage compared to Blizzard
UPDATE spell_template
SET
  effectBasePoints1 = 118, -- was 59
  manaCost = 1469 -- was 490
WHERE build = 4222 AND entry = 14295;

UPDATE spell_template
SET
  effectBasePoints1 = 158, -- was 79
  manaCost = 1469 -- was 490
WHERE build IN (4449, 5302) AND entry = 14295;
