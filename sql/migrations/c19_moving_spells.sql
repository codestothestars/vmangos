-- Enables more spells to be cast while moving
-- for role-playing, fun, and some better multiboxing support.

UPDATE `spell_template` SET `interruptFlags` = `interruptFlags` & ~0x01 WHERE `entry` IN (
  10917 -- Flash Heal (Rank 7)
);
