-- Enables more spells to be cast while seated
-- for role-playing and fun.

UPDATE `spell_template` SET `attributes` = `attributes` | 0x08000000 WHERE `entry` IN (
     883, -- Call Pet
    3450, -- Elixir of Fortitude
    3451, -- Mighty Troll's Blood Potion
    4942, -- Lesser Stoneshield Potion
    6459, -- Ornate Spyglass
   10685, -- Summon Ancona
   10714, -- Summon Black Kingsnake
   11465, -- Elixir of Fortitude
   11467, -- Elixir of Greater Agility
   11472, -- Elixir of Giants
   15999, -- Summon Worg Pup
   17554, -- Elixir of Superior Defense
   17573, -- Greater Arcane Elixir
   21343, -- Snowball
   23135  -- Heavy Leather Ball
);
