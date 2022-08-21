-- Replaces portal trainer menus with custom gossip options
-- to learn spells regardless of race.

-- Conditions for not knowing each teleport and portal spell
INSERT INTO `conditions`
(`condition_entry`, `type`, `value1`, `value2`)
VALUES
(              192,     -1,       90,      178), -- Mage AND Level >= 40
(              561,     17,     3561,        1), -- Does not know Teleport: Stormwind
(              562,     17,     3562,        1), -- Does not know Teleport: Ironforge
(              563,     17,     3563,        1), -- Does not know Teleport: Undercity
(              564,     17,     3565,        1), -- Does not know Teleport: Darnassus
(              565,     17,     3566,        1), -- Does not know Teleport: Thunder Bluff
(              566,     17,     3567,        1), -- Does not know Teleport: Orgrimmar
(              567,     17,    10059,        1), -- Does not know Portal: Stormwind
(              568,     17,    11416,        1), -- Does not know Portal: Ironforge
(              569,     17,    11417,        1), -- Does not know Portal: Orgrimmar
(              570,     17,    11418,        1), -- Does not know Portal: Undercity
(              571,     17,    11419,        1), -- Does not know Portal: Darnassus
(              572,     17,    11420,        1), -- Does not know Portal: Thunder Bluff
(             1025,     -1,       90,     1011), -- Mage AND Level >= 20
(             1026,     -1,      192,      567), -- Mage AND Level >= 40 AND Does not know Portal: Stormwind
(             1027,     -1,      192,      568), -- Mage AND Level >= 40 AND Does not know Portal: Ironforge
(             1028,     -1,      192,      569), -- Mage AND Level >= 40 AND Does not know Portal: Orgrimmar
(             1029,     -1,      192,      570), -- Mage AND Level >= 40 AND Does not know Portal: Undercity
(             1030,     -1,      192,      571), -- Mage AND Level >= 40 AND Does not know Portal: Darnassus
(             1031,     -1,      192,      572), -- Mage AND Level >= 40 AND Does not know Portal: Thunder Bluff
(             1032,     -1,      561,     1025), -- Does not know Teleport: Stormwind AND Mage AND Level >= 20
(             1033,     -1,      562,     1025), -- Does not know Teleport: Ironforge AND Mage AND Level >= 20
(             1034,     -1,      563,     1025), -- Does not know Teleport: Undercity AND Mage AND Level >= 20
(             1035,     -1,      564,     1025), -- Does not know Teleport: Darnassus AND Mage AND Level >= 20
(             1036,     -1,      565,     1025), -- Does not know Teleport: Thunder Bluff AND Mage AND Level >= 20
(             1037,     -1,      566,     1025); -- Does not know Teleport: Orgrimmar AND Mage AND Level >= 20

-- Gossip scripts to cast spell teaching the teleport or portal spell
INSERT INTO `gossip_scripts`
( `id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `comments`)
VALUES
(   22,       0,        15,       3578,           0,           0,            0,         0,          0,          0,          0,   0,   0,   0,   0, 'Teach Teleport: Darnassus'),
(   23,       0,        15,      11422,           0,           0,            0,         0,          0,          0,          0,   0,   0,   0,   0, 'Teach Portal: Darnassus'),
(   24,       0,        15,       3581,           0,           0,            0,         0,          0,          0,          0,   0,   0,   0,   0, 'Teach Teleport: Ironforge'),
(   25,       0,        15,      11421,           0,           0,            0,         0,          0,          0,          0,   0,   0,   0,   0, 'Teach Portal: Ironforge'),
(   26,       0,        15,       3580,           0,           0,            0,         0,          0,          0,          0,   0,   0,   0,   0, 'Teach Teleport: Orgrimmar'),
(   27,       0,        15,      11423,           0,           0,            0,         0,          0,          0,          0,   0,   0,   0,   0, 'Teach Portal: Orgrimmar'),
(   28,       0,        15,        665,           0,           0,            0,         0,          0,          0,          0,   0,   0,   0,   0, 'Teach Teleport: Stormwind'),
(   29,       0,        15,       1851,           0,           0,            0,         0,          0,          0,          0,   0,   0,   0,   0, 'Teach Portal: Stormwind'),
(   30,       0,        15,       3579,           0,           0,            0,         0,          0,          0,          0,   0,   0,   0,   0, 'Teach Teleport: Thunder'),
(   31,       0,        15,      11424,           0,           0,            0,         0,          0,          0,          0,   0,   0,   0,   0, 'Teach Portal: Thunder'),
(   32,       0,        15,       3577,           0,           0,            0,         0,          0,          0,          0,   0,   0,   0,   0, 'Teach Teleport: Undercity'),
(   33,       0,        15,      11425,           0,           0,            0,         0,          0,          0,          0,   0,   0,   0,   0, 'Teach Portal: Undercity');

-- Delete original portal trainer menu options
-- in preparation for replacing them with custom ones.
DELETE FROM `gossip_menu_option` WHERE `menu_id` IN (
    4822, -- Elissa Dumas, Larimaine Purdue
    4823, -- Milstaff Stormeye
    4825, -- Birgitte Cranston
    4826  -- Lexington Mortaim, Thuul
);

-- Reuse existing default "teach me" portal trainer text for first custom option.
UPDATE `broadcast_text`
SET
    `female_text` = 'Please teach me how to teleport to this city.',
    `male_text`   = 'Please teach me how to teleport to this city.'
WHERE `entry` = 8442;

-- Add new custom "teach me portal" text for second custom option.
INSERT INTO `broadcast_text`
(`entry`, `male_text`,                                           `female_text`,                                         `sound_id`, `chat_type`, `language_id`, `emote_id1`, `emote_id2`, `emote_id3`, `emote_delay1`, `emote_delay2`, `emote_delay3`)
VALUES
(      2, 'Please teach me how to create portals to this city.', 'Please teach me how to create portals to this city.',          0,           0,             0,           0,           0,           0,              0,              0,              0);

-- Create new menus for Larimaine Purdue and Lexington Mortaim
-- so each portal trainer can have their own gossip scripts.
INSERT INTO `gossip_menu`
(`entry`, `text_id`, `condition_id`)
VALUES
(      1,      5875,             91),
(      1,      5876,             90),
(      1,      8244,            461),
(      1,      8283,            459),
(      1,      8285,            454),
(      1,      8291,            458),
(      1,      8296,            460),
(      1,      8298,            455),
(      2,      5883,             91),
(      2,      5884,             90),
(      2,      8255,            461),
(      2,      8283,            459),
(      2,      8285,            454),
(      2,      8291,            458),
(      2,      8296,            460),
(      2,      8298,            455);

-- Give Larimaine Purdue and Lexington Mortaim their new menus
UPDATE `creature_template` SET `gossip_menu_id` = 1 WHERE `entry` = 2485; -- Larimaine Purdue
UPDATE `creature_template` SET `gossip_menu_id` = 2 WHERE `entry` = 2492; -- Lexington Mortaim

-- Create new menu options, unique for each trainer, with custom options added.
INSERT INTO `gossip_menu_option`
(`menu_id`, `id`, `option_icon`, `option_text`,                                         `option_broadcast_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `box_broadcast_text`, `condition_id`)
VALUES
(        1,    0,             3, 'Please teach me how to teleport to this city.',                          8442,           1,                    1,               -1,               0,                 28,           0,           0, '',                            0,           1032), -- Larimaine Purdue
(        1,    1,             3, 'Please teach me how to create portals to this city.',                       2,           1,                    1,               -1,               0,                 29,           0,           0, '',                            0,           1026), -- Larimaine Purdue
(        1,    3,             0, 'Here, I''d like to give you this token of my love.',                    11723,           1,                    1,               -1,               0,                410,           0,           0, '',                            0,            462), -- Larimaine Purdue
(        1,    4,             0, 'Here, I''d like to give you this token of my love.',                    11723,           1,                    1,               -1,               0,                411,           0,           0, '',                            0,            461), -- Larimaine Purdue
(        2,    0,             3, 'Please teach me how to teleport to this city.',                          8442,           1,                    1,               -1,               0,                 32,           0,           0, '',                            0,           1034), -- Lexington Mortaim
(        2,    1,             3, 'Please teach me how to create portals to this city.',                       2,           1,                    1,               -1,               0,                 33,           0,           0, '',                            0,           1029), -- Lexington Mortaim
(        2,    3,             0, 'Here, I''d like to give you this token of my love.',                    11723,           1,                    1,               -1,               0,                418,           0,           0, '',                            0,            462), -- Lexington Mortaim
(        2,    4,             0, 'Here, I''d like to give you this token of my love.',                    11723,           1,                    1,               -1,               0,                419,           0,           0, '',                            0,            461), -- Lexington Mortaim
(     4822,    0,             3, 'Please teach me how to teleport to this city.',                          8442,           1,                    1,               -1,               0,                 22,           0,           0, '',                            0,           1035), -- Elissa Dumas
(     4822,    1,             3, 'Please teach me how to create portals to this city.',                       2,           1,                    1,               -1,               0,                 23,           0,           0, '',                            0,           1030), -- Elissa Dumas
(     4822,    3,             0, 'Here, I''d like to give you this token of my love.',                    11723,           1,                    1,               -1,               0,                410,           0,           0, '',                            0,            462), -- Elissa Dumas
(     4822,    4,             0, 'Here, I''d like to give you this token of my love.',                    11723,           1,                    1,               -1,               0,                411,           0,           0, '',                            0,            461), -- Elissa Dumas
(     4823,    0,             3, 'Please teach me how to teleport to this city.',                          8442,           1,                    1,               -1,               0,                 24,           0,           0, '',                            0,           1033), -- Milstaff Stormeye
(     4823,    1,             3, 'Please teach me how to create portals to this city.',                       2,           1,                    1,               -1,               0,                 25,           0,           0, '',                            0,           1027), -- Milstaff Stormeye
(     4823,    2,             0, 'Here, I''d like to give you this token of my love.',                    11723,           1,                    1,               -1,               0,                406,           0,           0, '',                            0,            462), -- Milstaff Stormeye
(     4823,    3,             0, 'Here, I''d like to give you this token of my love.',                    11723,           1,                    1,               -1,               0,                407,           0,           0, '',                            0,            461), -- Milstaff Stormeye
(     4825,    0,             3, 'Please teach me how to teleport to this city.',                          8442,           1,                    1,               -1,               0,                 30,           0,           0, '',                            0,           1036), -- Birgitte Cranston
(     4825,    1,             3, 'Please teach me how to create portals to this city.',                       2,           1,                    1,               -1,               0,                 31,           0,           0, '',                            0,           1031), -- Birgitte Cranston
(     4825,    2,             0, 'Here, I''d like to give you this token of my love.',                    11723,           1,                    1,               -1,               0,                422,           0,           0, '',                            0,            462), -- Birgitte Cranston
(     4825,    3,             0, 'Here, I''d like to give you this token of my love.',                    11723,           1,                    1,               -1,               0,                423,           0,           0, '',                            0,            461), -- Birgitte Cranston
(     4826,    0,             3, 'Please teach me how to teleport to this city.',                          8442,           1,                    1,               -1,               0,                 26,           0,           0, '',                            0,           1037), -- Thuul
(     4826,    1,             3, 'Please teach me how to create portals to this city.',                       2,           1,                    1,               -1,               0,                 27,           0,           0, '',                            0,           1028), -- Thuul
(     4826,    3,             0, 'Here, I''d like to give you this token of my love.',                    11723,           1,                    1,               -1,               0,                418,           0,           0, '',                            0,            462), -- Thuul
(     4826,    4,             0, 'Here, I''d like to give you this token of my love.',                    11723,           1,                    1,               -1,               0,                419,           0,           0, '',                            0,            461); -- Thuul
