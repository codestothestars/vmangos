-- Remove SPELL_ATTR_HIDDEN_CLIENTSIDE attribute from Furor (spell triggered by Druid talent of the same name).
-- Enables its SPELL_AURA_INTERRUPT_REGEN effect to expire, enabling the player to leave combat and their rage to decay.
UPDATE `spell_template` SET `attributes` = `attributes` & ~0x00000080 WHERE `entry` = 17057;
