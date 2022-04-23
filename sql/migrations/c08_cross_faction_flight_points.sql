-- Adds gossip options to flight masters for cross-faction flight points.

INSERT INTO `broadcast_text`
(`entry`, `male_text`,                                         `female_text`,                                       `sound_id`, `language_id`, `emote_id1`, `emote_id2`, `emote_id3`, `emote_delay1`, `emote_delay2`, `emote_delay3`)
VALUES
(  20,    'Which Alliance location would you like to fly to?', 'Which Alliance location would you like to fly to?',          0,             7,           0,           0,           0,              0,              0,              0),
(  21,    'Which Horde location would you like to fly to?',    'Which Horde location would you like to fly to?',             0,             7,           0,           0,           0,              0,              0,              0);

INSERT INTO `npc_text`
(`ID`, `BroadcastTextID0`, `Probability0`, `BroadcastTextID1`, `Probability1`, `BroadcastTextID2`, `Probability2`, `BroadcastTextID3`, `Probability3`, `BroadcastTextID4`, `Probability4`, `BroadcastTextID5`, `Probability5`, `BroadcastTextID6`, `Probability6`, `BroadcastTextID7`, `Probability7`)
VALUES
(   2,                 20,              1,                  0,              0,                  0,              0,                  0,              0,                  0,              0,                  0,              0,                  0,              0,                  0,              0),
(   3,                 21,              1,                  0,              0,                  0,              0,                  0,              0,                  0,              0,                  0,              0,                  0,              0,                  0,              0);

INSERT INTO `gossip_scripts`
(`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `comments`)
VALUES
(  75,       0,        30,         43,           0,           0,           0,            0,         0,          0,          0,          0,   0,   0,   0,   0, 'Fly to Aerie Peak'),
(  76,       0,        30,         28,           0,           0,           0,            0,         0,          0,          0,          0,   0,   0,   0,   0, 'Fly to Astranaar'),
(  77,       0,        30,         26,           0,           0,           0,            0,         0,          0,          0,          0,   0,   0,   0,   0, 'Fly to Auberdine'),
(  78,       0,        30,         48,           0,           0,           0,            0,         0,          0,          0,          0,   0,   0,   0,   0, 'Fly to Bloodvenom Post'),
(  79,       0,        30,         18,           0,           0,           0,            0,         0,          0,          0,          0,   0,   0,   0,   0, 'Fly to Booty Bay (Horde)'),
(  80,       0,        30,         19,           0,           0,           0,            0,         0,          0,          0,          0,   0,   0,   0,   0, 'Fly to Booty Bay (Alliance)'),
(  81,       0,        30,         55,           0,           0,           0,            0,         0,          0,          0,          0,   0,   0,   0,   0, 'Fly to Brackenwall Village'),
(  82,       0,        30,         42,           0,           0,           0,            0,         0,          0,          0,          0,   0,   0,   0,   0, 'Fly to Camp Mojache'),
(  83,       0,        30,         77,           0,           0,           0,            0,         0,          0,          0,          0,   0,   0,   0,   0, 'Fly to Camp Taurajo'),
(  84,       0,        30,         72,           0,           0,           0,            0,         0,          0,          0,          0,   0,   0,   0,   0, 'Fly to Cenarion Hold (Horde)'),
(  85,       0,        30,         73,           0,           0,           0,            0,         0,          0,          0,          0,   0,   0,   0,   0, 'Fly to Cenarion Hold (Alliance)'),
(  86,       0,        30,         66,           0,           0,           0,            0,         0,          0,          0,          0,   0,   0,   0,   0, 'Fly to Chillwind Camp'),
(  87,       0,        30,         25,           0,           0,           0,            0,         0,          0,          0,          0,   0,   0,   0,   0, 'Fly to Crossroads'),
(  88,       0,        30,         12,           0,           0,           0,            0,         0,          0,          0,          0,   0,   0,   0,   0, 'Fly to Darkshire'),
(  89,       0,        30,         52,           0,           0,           0,            0,         0,          0,          0,          0,   0,   0,   0,   0, 'Fly to Everlook (Alliance)'),
(  90,       0,        30,         53,           0,           0,           0,            0,         0,          0,          0,          0,   0,   0,   0,   0, 'Fly to Everlook (Horde)'),
(  91,       0,        30,         41,           0,           0,           0,            0,         0,          0,          0,          0,   0,   0,   0,   0, 'Fly to Feathermoon'),
(  92,       0,        30,         70,           0,           0,           0,            0,         0,          0,          0,          0,   0,   0,   0,   0, 'Fly to Flame Crest'),
(  93,       0,        30,         30,           0,           0,           0,            0,         0,          0,          0,          0,   0,   0,   0,   0, 'Fly to Freewind Post'),
(  94,       0,        30,         39,           0,           0,           0,            0,         0,          0,          0,          0,   0,   0,   0,   0, 'Fly to Gadgetzan (Alliance)'),
(  95,       0,        30,         40,           0,           0,           0,            0,         0,          0,          0,          0,   0,   0,   0,   0, 'Fly to Gadgetzan (Horde)'),
(  96,       0,        30,         20,           0,           0,           0,            0,         0,          0,          0,          0,   0,   0,   0,   0, 'Fly to Grom''gol'),
(  97,       0,        30,         17,           0,           0,           0,            0,         0,          0,          0,          0,   0,   0,   0,   0, 'Fly to Hammerfall'),
(  98,       0,        30,          6,           0,           0,           0,            0,         0,          0,          0,          0,   0,   0,   0,   0, 'Fly to Ironforge'),
(  99,       0,        30,         21,           0,           0,           0,            0,         0,          0,          0,          0,   0,   0,   0,   0, 'Fly to Kargath'),
( 100,       0,        30,          5,           0,           0,           0,            0,         0,          0,          0,          0,   0,   0,   0,   0, 'Fly to Lakeshire'),
( 101,       0,        30,         67,           0,           0,           0,            0,         0,          0,          0,          0,   0,   0,   0,   0, 'Fly to Light''s Hope Chapel (Alliance)'),
( 102,       0,        30,         68,           0,           0,           0,            0,         0,          0,          0,          0,   0,   0,   0,   0, 'Fly to Light''s Hope Chapel (Horde)'),
( 103,       0,        30,          7,           0,           0,           0,            0,         0,          0,          0,          0,   0,   0,   0,   0, 'Fly to Menethil Harbor'),
( 104,       0,        30,         49,           0,           0,           0,            0,         0,          0,          0,          0,   0,   0,   0,   0, 'Fly to Moonglade (Alliance)'),
( 105,       0,        30,         69,           0,           0,           0,            0,         0,          0,          0,          0,   0,   0,   0,   0, 'Fly to Moonglade (Horde)'),
( 106,       0,        30,         71,           0,           0,           0,            0,         0,          0,          0,          0,   0,   0,   0,   0, 'Fly to Morgan''s Vigil'),
( 107,       0,        30,         45,           0,           0,           0,            0,         0,          0,          0,          0,   0,   0,   0,   0, 'Fly to Nethergarde Keep'),
( 108,       0,        30,         37,           0,           0,           0,            0,         0,          0,          0,          0,   0,   0,   0,   0, 'Fly to Nijel''s Point'),
( 109,       0,        30,         23,           0,           0,           0,            0,         0,          0,          0,          0,   0,   0,   0,   0, 'Fly to Orgrimmar'),
( 110,       0,        30,         16,           0,           0,           0,            0,         0,          0,          0,          0,   0,   0,   0,   0, 'Fly to Refuge Pointe'),
( 111,       0,        30,         76,           0,           0,           0,            0,         0,          0,          0,          0,   0,   0,   0,   0, 'Fly to Revantusk Village'),
( 112,       0,        30,         27,           0,           0,           0,            0,         0,          0,          0,          0,   0,   0,   0,   0, 'Fly to Rut''theran Village'),
( 113,       0,        30,          4,           0,           0,           0,            0,         0,          0,          0,          0,   0,   0,   0,   0, 'Fly to Sentinel Hill'),
( 114,       0,        30,         38,           0,           0,           0,            0,         0,          0,          0,          0,   0,   0,   0,   0, 'Fly to Shadowprey Village'),
( 115,       0,        30,         14,           0,           0,           0,            0,         0,          0,          0,          0,   0,   0,   0,   0, 'Fly to Southshore'),
( 116,       0,        30,         61,           0,           0,           0,            0,         0,          0,          0,          0,   0,   0,   0,   0, 'Fly to Splintertree Post'),
( 117,       0,        30,         56,           0,           0,           0,            0,         0,          0,          0,          0,   0,   0,   0,   0, 'Fly to Stonard'),
( 118,       0,        30,         33,           0,           0,           0,            0,         0,          0,          0,          0,   0,   0,   0,   0, 'Fly to Stonetalon Peak'),
( 119,       0,        30,          2,           0,           0,           0,            0,         0,          0,          0,          0,   0,   0,   0,   0, 'Fly to Stormwind'),
( 120,       0,        30,         29,           0,           0,           0,            0,         0,          0,          0,          0,   0,   0,   0,   0, 'Fly to Sun Rock Retreat'),
( 121,       0,        30,         65,           0,           0,           0,            0,         0,          0,          0,          0,   0,   0,   0,   0, 'Fly to Talonbranch Glade'),
( 122,       0,        30,         64,           0,           0,           0,            0,         0,          0,          0,          0,   0,   0,   0,   0, 'Fly to Talrendis Point'),
( 123,       0,        30,         13,           0,           0,           0,            0,         0,          0,          0,          0,   0,   0,   0,   0, 'Fly to Tarren Mill'),
( 124,       0,        30,         31,           0,           0,           0,            0,         0,          0,          0,          0,   0,   0,   0,   0, 'Fly to Thalanaar'),
( 125,       0,        30,         10,           0,           0,           0,            0,         0,          0,          0,          0,   0,   0,   0,   0, 'Fly to The Sepulcher'),
( 126,       0,        30,          8,           0,           0,           0,            0,         0,          0,          0,          0,   0,   0,   0,   0, 'Fly to Thelsamar'),
( 127,       0,        30,         32,           0,           0,           0,            0,         0,          0,          0,          0,   0,   0,   0,   0, 'Fly to Theramore'),
( 128,       0,        30,         74,           0,           0,           0,            0,         0,          0,          0,          0,   0,   0,   0,   0, 'Fly to Thorium Point (Alliance)'),
( 129,       0,        30,         75,           0,           0,           0,            0,         0,          0,          0,          0,   0,   0,   0,   0, 'Fly to Thorium Point (Horde)'),
( 130,       0,        30,         22,           0,           0,           0,            0,         0,          0,          0,          0,   0,   0,   0,   0, 'Fly to Thunder Bluff'),
( 131,       0,        30,         11,           0,           0,           0,            0,         0,          0,          0,          0,   0,   0,   0,   0, 'Fly to Undercity'),
( 132,       0,        30,         44,           0,           0,           0,            0,         0,          0,          0,          0,   0,   0,   0,   0, 'Fly to Valormok'),
( 133,       0,        30,         58,           0,           0,           0,            0,         0,          0,          0,          0,   0,   0,   0,   0, 'Fly to Zoram''gar Outpost');

DELETE FROM `gossip_menu` WHERE `entry` = 6944;

INSERT INTO `gossip_menu`
(`entry`, `text_id`, `condition_id`) VALUES
(  7419,          2,              0),
(  7420,          2,              0),
(  7421,          3,              0),
(  7422,          3,              0),
(  7423,       1256,              0),
(  7424,       5009,              0),
(  7425,       5453,              0),
(  7426,       5473,              0),
(  7427,       5474,              0),
(  7428,       5479,              0),
(  7429,       5454,              0),
(  7430,       5454,              0),
(  7431,       5495,              0),
(  7432,       5500,              0),
(  7433,       5516,              0),
(  7434,       5580,              0),
(  7435,       5582,              0),
(  7436,       7122,              0),
(  7437,       7123,              0),
(  7438,       7778,              0),
(  7439,       7315,              0),
(  7440,       7778,              0),
(  7441,       7778,              0),
(  7442,       7778,              0),
(  7443,       7778,              0),
(  7444,       7778,              0),
(  7445,       7778,              0),
(  7446,       7778,              0),
(  7447,       7778,              0),
(  7448,       7778,              0),
(  7449,       7778,              0),
(  7450,       7778,              0),
(  7451,       7778,              0),
(  7452,       7778,              0),
(  7453,       7778,              0),
(  7454,       7778,              0),
(  7455,       7778,              0),
(  7456,       7778,              0),
(  7457,       7778,              0),
(  7458,       7778,              0),
(  7459,       7778,              0),
(  7460,       7778,              0),
(  7461,       7778,              0),
(  7462,       7778,              0),
(  7463,       7778,              0),
(  7464,       7778,              0),
(  7465,       7778,              0),
(  7466,       7778,              0),
(  7467,       7778,              0),
(  7468,       7778,              0),
(  7469,       7778,              0),
(  7470,       7778,              0),
(  7471,       7778,              0),
(  7472,       7778,              0),
(  7473,       7778,              0),
(  7474,       7778,              0),
(  7475,       7778,              0),
(  7476,       7778,              0),
(  7477,       7778,              0),
(  7478,       7778,              0),
(  7479,       7778,              0),
(  7480,       7778,              0),
(  7481,       7778,              0);

DELETE FROM `gossip_menu_option` WHERE `menu_id` = 6944;

INSERT INTO `gossip_menu_option`
(`menu_id`, `id`, `option_icon`, `option_text`,                               `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `condition_id`)
VALUES
(     7419,    0,             2, 'Aerie Peak, The Hinterlands',                         1,                    1,                0,               0,                 75,           0,           0, NULL,                 5083),
(     7419,    1,             2, 'Booty Bay, Stranglethorn',                            1,                    1,                0,               0,                 80,           0,           0, NULL,                 5071),
(     7419,    2,             2, 'Chillwind Camp, Western Plaguelands',                 1,                    1,                0,               0,                 86,           0,           0, NULL,                 5118),
(     7419,    3,             2, 'Darkshire, Duskwood',                                 1,                    1,                0,               0,                 88,           0,           0, NULL,                 5072),
(     7419,    4,             2, 'Ironforge, Dun Morogh',                               1,                    1,                0,               0,                 98,           0,           0, NULL,                 5106),
(     7419,    5,             2, 'Lakeshire, Redridge',                                 1,                    1,                0,               0,                100,           0,           0, NULL,                 5073),
(     7419,    6,             2, 'Light''s Hope Chapel, Eastern Plaguelands',           1,                    1,                0,               0,                101,           0,           0, NULL,                 5112),
(     7419,    7,             2, 'Menethil Harbor, Wetlands',                           1,                    1,                0,               0,                103,           0,           0, NULL,                 5077),
(     7419,    8,             2, 'Morgan''s Vigil, Burning Steppes',                    1,                    1,                0,               0,                106,           0,           0, NULL,                 5115),
(     7419,    9,             2, 'Nethergarde Keep, Blasted Lands',                     1,                    1,                0,               0,                107,           0,           0, NULL,                 5101),
(     7419,   10,             2, 'Refuge Pointe, Arathi',                               1,                    1,                0,               0,                110,           0,           0, NULL,                 5082),
(     7419,   11,             2, 'Sentinel Hill, Westfall',                             1,                    1,                0,               0,                113,           0,           0, NULL,                 5075),
(     7419,   12,             2, 'Southshore, Hillsbrad',                               1,                    1,                0,               0,                115,           0,           0, NULL,                 5080),
(     7419,   13,             2, 'Stormwind, Elwynn',                                   1,                    1,                0,               0,                119,           0,           0, NULL,                 5105),
(     7419,   14,             2, 'Thelsamar, Loch Modan',                               1,                    1,                0,               0,                126,           0,           0, NULL,                 5076),
(     7419,   15,             2, 'Thorium Point, Searing Gorge',                        1,                    1,                0,               0,                128,           0,           0, NULL,                 5102),
(     7420,    0,             2, 'Astranaar, Ashenvale',                                1,                    1,                0,               0,                 76,           0,           0, NULL,                 5085),
(     7420,    1,             2, 'Auberdine, Darkshore',                                1,                    1,                0,               0,                 77,           0,           0, NULL,                 5087),
(     7420,    2,             2, 'Cenarion Hold, Silithus',                             1,                    1,                0,               0,                 85,           0,           0, NULL,                 5120),
(     7420,    3,             2, 'Everlook, Winterspring',                              1,                    1,                0,               0,                 89,           0,           0, NULL,                 5110),
(     7420,    4,             2, 'Feathermoon, Feralas',                                1,                    1,                0,               0,                 91,           0,           0, NULL,                 5099),
(     7420,    5,             2, 'Gadgetzan, Tanaris',                                  1,                    1,                0,               0,                 94,           0,           0, NULL,                 5096),
(     7420,    6,             2, 'Moonglade',                                           1,                    1,                0,               0,                104,           0,           0, NULL,                 5063),
(     7420,    7,             2, 'Nijel''s Point, Desolace',                            1,                    1,                0,               0,                108,           0,           0, NULL,                 5094),
(     7420,    8,             2, 'Rut''theran Village, Teldrassil',                     1,                    1,                0,               0,                112,           0,           0, NULL,                 5095),
(     7420,    9,             2, 'Stonetalon Peak, Stonetalon Mountains',               1,                    1,                0,               0,                118,           0,           0, NULL,                 5089),
(     7420,   10,             2, 'Talonbranch Glade, Felwood',                          1,                    1,                0,               0,                121,           0,           0, NULL,                 5109),
(     7420,   11,             2, 'Talrendis Point, Azshara',                            1,                    1,                0,               0,                122,           0,           0, NULL,                 5117),
(     7420,   12,             2, 'Thalanaar, Feralas',                                  1,                    1,                0,               0,                124,           0,           0, NULL,                 5091),
(     7420,   13,             2, 'Theramore, Dustwallow Marsh',                         1,                    1,                0,               0,                127,           0,           0, NULL,                 5093),
(     7421,    0,             2, 'Booty Bay, Stranglethorn',                            1,                    1,                0,               0,                 79,           0,           0, NULL,                 5065),
(     7421,    1,             2, 'Flame Crest, Burning Steppes',                        1,                    1,                0,               0,                 92,           0,           0, NULL,                 5079),
(     7421,    2,             2, 'Grom''gol, Stranglethorn',                            1,                    1,                0,               0,                 96,           0,           0, NULL,                 5066),
(     7421,    3,             2, 'Hammerfall, Arathi',                                  1,                    1,                0,               0,                 97,           0,           0, NULL,                 5067),
(     7421,    4,             2, 'Kargath, Badlands',                                   1,                    1,                0,               0,                 99,           0,           0, NULL,                 5068),
(     7421,    5,             2, 'Light''s Hope Chapel, Eastern Plaguelands',           1,                    1,                0,               0,                102,           0,           0, NULL,                 5113),
(     7421,    6,             2, 'Revantusk Village, The Hinterlands',                  1,                    1,                0,               0,                111,           0,           0, NULL,                 5119),
(     7421,    7,             2, 'Stonard, Swamp of Sorrows',                           1,                    1,                0,               0,                117,           0,           0, NULL,                 5074),
(     7421,    8,             2, 'Tarren Mill, Hillsbrad',                              1,                    1,                0,               0,                123,           0,           0, NULL,                 5081),
(     7421,    9,             2, 'The Sepulcher, Silverpine Forest',                    1,                    1,                0,               0,                125,           0,           0, NULL,                 5078),
(     7421,   10,             2, 'Thorium Point, Searing Gorge',                        1,                    1,                0,               0,                129,           0,           0, NULL,                 5103),
(     7421,   11,             2, 'Undercity, Tirisfal',                                 1,                    1,                0,               0,                131,           0,           0, NULL,                 5104),
(     7422,    0,             2, 'Bloodvenom Post, Felwood',                            1,                    1,                0,               0,                 78,           0,           0, NULL,                 5108),
(     7422,    1,             2, 'Brackenwall Village, Dustwallow Marsh',               1,                    1,                0,               0,                 81,           0,           0, NULL,                 5092),
(     7422,    2,             2, 'Camp Mojache, Feralas',                               1,                    1,                0,               0,                 82,           0,           0, NULL,                 5098),
(     7422,    3,             2, 'Camp Taurajo, The Barrens',                           1,                    1,                0,               0,                 83,           0,           0, NULL,                 5084),
(     7422,    4,             2, 'Cenarion Hold, Silithus',                             1,                    1,                0,               0,                 84,           0,           0, NULL,                 5121),
(     7422,    5,             2, 'Crossroads, The Barrens',                             1,                    1,                0,               0,                 87,           0,           0, NULL,                 5069),
(     7422,    6,             2, 'Everlook, Winterspring',                              1,                    1,                0,               0,                 90,           0,           0, NULL,                 5111),
(     7422,    7,             2, 'Freewind Post, Thousand Needles',                     1,                    1,                0,               0,                 93,           0,           0, NULL,                 5090),
(     7422,    8,             2, 'Gadgetzan, Tanaris',                                  1,                    1,                0,               0,                 95,           0,           0, NULL,                 5097),
(     7422,    9,             2, 'Moonglade',                                           1,                    1,                0,               0,                105,           0,           0, NULL,                 5064),
(     7422,   10,             2, 'Orgrimmar, Durotar',                                  1,                    1,                0,               0,                109,           0,           0, NULL,                 5070),
(     7422,   11,             2, 'Shadowprey Village, Desolace',                        1,                    1,                0,               0,                114,           0,           0, NULL,                 5114),
(     7422,   12,             2, 'Splintertree Post, Ashenvale',                        1,                    1,                0,               0,                116,           0,           0, NULL,                 5086),
(     7422,   13,             2, 'Sun Rock Retreat, Stonetalon Mountains',              1,                    1,                0,               0,                120,           0,           0, NULL,                 5088),
(     7422,   14,             2, 'Thunder Bluff, Mulgore',                              1,                    1,                0,               0,                130,           0,           0, NULL,                 5107),
(     7422,   15,             2, 'Valormok, Azshara',                                   1,                    1,                0,               0,                132,           0,           0, NULL,                 5100),
(     7422,   16,             2, 'Zoram''gar Outpost, Ashenvale',                       1,                    1,                0,               0,                133,           0,           0, NULL,                 5116),
(     7423,    0,             2, 'I need a ride.',                                      4,                    8,                0,               0,                  0,           0,           0, NULL,                    3),
(     7423,    1,             0, 'GOSSIP_OPTION_QUESTGIVER',                            2,                    2,                0,               0,                  0,           0,           0, NULL,                    0),
(     7423,    2,             2, 'I''d like to fly to an Alliance location.',           1,                    1,             7419,               0,                  0,           0,           0, NULL,                 5051),
(     7424,    0,             2, 'I need a ride.',                                      4,                    8,                0,               0,                  0,           0,           0, NULL,                    3),
(     7424,    1,             0, 'GOSSIP_OPTION_QUESTGIVER',                            2,                    2,                0,               0,                  0,           0,           0, NULL,                    0),
(     7424,    2,             2, 'I''d like to fly to an Alliance location.',           1,                    1,             7420,               0,                  0,           0,           0, NULL,                 5051),
(     7425,    0,             2, 'I need a ride.',                                      4,                    8,                0,               0,                  0,           0,           0, NULL,                    2),
(     7425,    1,             0, 'GOSSIP_OPTION_QUESTGIVER',                            2,                    2,                0,               0,                  0,           0,           0, NULL,                    0),
(     7425,    2,             2, 'I''d like to fly to a Horde location.',               1,                    1,             7422,               0,                  0,           0,           0, NULL,                 5055),
(     7426,    0,             2, 'I need a ride.',                                      4,                    8,                0,               0,                  0,           0,           0, NULL,                    3),
(     7426,    1,             2, 'I''d like to fly to an Alliance location.',           1,                    8,             7420,               0,                  0,           0,           0, NULL,                 5048),
(     7427,    0,             2, 'I need a ride.',                                      4,                    8,                0,               0,                  0,           0,           0, NULL,                    3),
(     7427,    1,             0, 'GOSSIP_OPTION_QUESTGIVER',                            2,                    2,                0,               0,                  0,           0,           0, NULL,                    0),
(     7427,    2,             2, 'I''d like to fly to an Alliance location.',           1,                    1,             7420,               0,                  0,           0,           0, NULL,                 5048),
(     7428,    0,             2, 'Sure! Let''s go for a ride.',                         4,                    8,                0,               0,                  0,           0,           0, NULL,                    3),
(     7428,    1,             2, 'I''d like to fly to an Alliance location.',           1,                    8,             7419,               0,                  0,           0,           0, NULL,                 5045),
(     7429,    0,             2, 'I need a ride.',                                      4,                    8,                0,               0,                  0,           0,           0, NULL,                    2),
(     7429,    1,             0, 'GOSSIP_OPTION_QUESTGIVER',                            2,                    2,                0,               0,                  0,           0,           0, NULL,                    0),
(     7429,    2,             2, 'I''d like to fly to a Horde location.',               1,                    1,             7421,               0,                  0,           0,           0, NULL,                 5054),
(     7430,    0,             2, 'I need a ride.',                                      4,                    8,                0,               0,                  0,           0,           0, NULL,                    2),
(     7430,    1,             0, 'GOSSIP_OPTION_QUESTGIVER',                            2,                    2,                0,               0,                  0,           0,           0, NULL,                    0),
(     7430,    2,             2, 'I''d like to fly to a Horde location.',               1,                    1,             7421,               0,                  0,           0,           0, NULL,                 5055),
(     7431,    0,             2, 'I need a ride.',                                      4,                    8,                0,               0,                  0,           0,           0, NULL,                    2),
(     7431,    1,             0, 'GOSSIP_OPTION_QUESTGIVER',                            2,                    2,                0,               0,                  0,           0,           0, NULL,                    0),
(     7431,    2,             2, 'I''d like to fly to a Horde location.',               1,                    1,             7422,               0,                  0,           0,           0, NULL,                 5054),
(     7432,    0,             2, 'I need a ride.',                                      4,                    8,                0,               0,                  0,           0,           0, NULL,                    2),
(     7432,    1,             2, 'I''d like to fly to a Horde location.',               1,                    8,             7422,               0,                  0,           0,           0, NULL,                 5060),
(     7433,    0,             2, 'I need a ride.',                                      4,                    8,                0,               0,                  0,           0,           0, NULL,                    2),
(     7433,    1,             0, 'GOSSIP_OPTION_QUESTGIVER',                            2,                    2,                0,               0,                  0,           0,           0, NULL,                    0),
(     7433,    2,             2, 'I''d like to fly to a Horde location.',               1,                    1,             7422,               0,                  0,           0,           0, NULL,                 5054),
(     7434,    0,             2, 'I need a ride.',                                      4,                    8,                0,               0,                  0,           0,           0, NULL,                    3),
(     7434,    1,             2, 'I''d like to fly to an Alliance location.',           1,                    8,             7419,               0,                  0,           0,           0, NULL,                 5044),
(     7435,    0,             2, 'I need a ride.',                                      4,                    8,                0,               0,                  0,           0,           0, NULL,                    3),
(     7435,    1,             0, 'GOSSIP_OPTION_QUESTGIVER',                            2,                    2,                0,               0,                  0,           0,           0, NULL,                    0),
(     7435,    2,             2, 'I''d like to fly to an Alliance location.',           1,                    1,             7419,               0,                  0,           0,           0, NULL,                 5044),
(     7436,    0,             2, 'I need a ride.',                                      4,                    8,                0,               0,                  0,           0,           0, NULL,                    3),
(     7436,    1,             2, 'I''d like to fly to an Alliance location.',           1,                    8,             7419,               0,                  0,           0,           0, NULL,                 5046),
(     7437,    0,             2, 'I need a ride.',                                      4,                    8,                0,               0,                  0,           0,           0, NULL,                    2),
(     7437,    1,             2, 'I''d like to fly to a Horde location.',               1,                    8,             7421,               0,                  0,           0,           0, NULL,                 5059),
(     7438,    0,             2, 'I need a ride.',                                      4,                    8,                0,               0,                  0,           0,           0, NULL,                    2),
(     7438,    1,             2, 'I''d like to fly to a Horde location.',               1,                    8,             7421,               0,                  0,           0,           0, NULL,                 5059),
(     7439,    0,             2, 'I need a ride.',                                      4,                    8,                0,               0,                  0,           0,           0, NULL,                    2), -- This one is a duplicate.
(     7439,    1,             2, 'I''d like to fly to a Horde location.',               1,                    8,             7422,               0,                  0,           0,           0, NULL,                 5060),
(     7440,    0,             2, 'Show me where I can fly.',                            4,                    8,                0,               0,                  0,           0,           0, NULL,                    3),
(     7440,    1,             0, 'GOSSIP_OPTION_QUESTGIVER',                            2,                    2,                0,               0,                  0,           0,           0, NULL,                    0),
(     7440,    2,             2, 'I''d like to fly to an Alliance location.',           1,                    1,             7419,               0,                  0,           0,           0, NULL,                 5051),
(     7441,    0,             2, 'Show me where I can fly.',                            4,                    8,                0,               0,                  0,           0,           0, NULL,                    2),
(     7441,    1,             0, 'GOSSIP_OPTION_QUESTGIVER',                            2,                    2,                0,               0,                  0,           0,           0, NULL,                    0),
(     7441,    2,             2, 'I''d like to fly to a Horde location.',               1,                    1,             7421,               0,                  0,           0,           0, NULL,                 5054),
(     7442,    0,             2, 'Show me where I can fly.',                            4,                    8,                0,               0,                  0,           0,           0, NULL,                    3),
(     7442,    1,             0, 'GOSSIP_OPTION_QUESTGIVER',                            2,                    2,                0,               0,                  0,           0,           0, NULL,                    0),
(     7442,    2,             2, 'I''d like to fly to an Alliance location.',           1,                    1,             7419,               0,                  0,           0,           0, NULL,                 5052),
(     7443,    0,             2, 'Show me where I can fly.',                            4,                    8,                0,               0,                  0,           0,           0, NULL,                    3),
(     7443,    1,             0, 'GOSSIP_OPTION_QUESTGIVER',                            2,                    2,                0,               0,                  0,           0,           0, NULL,                    0),
(     7443,    2,             2, 'I''d like to fly to an Alliance location.',           1,                    1,             7419,               0,                  0,           0,           0, NULL,                 5046),
(     7444,    0,             2, 'Show me where I can fly.',                            4,                    8,                0,               0,                  0,           0,           0, NULL,                    2),
(     7444,    1,             0, 'GOSSIP_OPTION_QUESTGIVER',                            2,                    2,                0,               0,                  0,           0,           0, NULL,                    0),
(     7444,    2,             2, 'I''d like to fly to a Horde location.',               1,                    1,             7421,               0,                  0,           0,           0, NULL,                 5056),
(     7445,    0,             2, 'Show me where I can fly.',                            4,                    8,                0,               0,                  0,           0,           0, NULL,                    3),
(     7445,    1,             0, 'GOSSIP_OPTION_QUESTGIVER',                            2,                    2,                0,               0,                  0,           0,           0, NULL,                    0),
(     7445,    2,             2, 'I''d like to fly to an Alliance location.',           1,                    1,             7419,               0,                  0,           0,           0, NULL,                 5052),
(     7446,    0,             2, 'Show me where I can fly.',                            4,                    8,                0,               0,                  0,           0,           0, NULL,                    3),
(     7446,    1,             0, 'GOSSIP_OPTION_QUESTGIVER',                            2,                    2,                0,               0,                  0,           0,           0, NULL,                    0),
(     7446,    2,             2, 'I''d like to fly to an Alliance location.',           1,                    1,             7419,               0,                  0,           0,           0, NULL,                 5052),
(     7447,    0,             2, 'Show me where I can fly.',                            4,                    8,                0,               0,                  0,           0,           0, NULL,                    3),
(     7447,    1,             0, 'GOSSIP_OPTION_QUESTGIVER',                            2,                    2,                0,               0,                  0,           0,           0, NULL,                    0),
(     7447,    2,             2, 'I''d like to fly to an Alliance location.',           1,                    1,             7419,               0,                  0,           0,           0, NULL,                 5053),
(     7448,    0,             2, 'Show me where I can fly.',                            4,                    8,                0,               0,                  0,           0,           0, NULL,                    2),
(     7448,    1,             0, 'GOSSIP_OPTION_QUESTGIVER',                            2,                    2,                0,               0,                  0,           0,           0, NULL,                    0),
(     7448,    2,             2, 'I''d like to fly to a Horde location.',               1,                    1,             7421,               0,                  0,           0,           0, NULL,                 5054),
(     7449,    0,             2, 'Show me where I can fly.',                            4,                    8,                0,               0,                  0,           0,           0, NULL,                    2),
(     7449,    1,             0, 'GOSSIP_OPTION_QUESTGIVER',                            2,                    2,                0,               0,                  0,           0,           0, NULL,                    0),
(     7449,    2,             2, 'I''d like to fly to a Horde location.',               1,                    1,             7421,               0,                  0,           0,           0, NULL,                 5054),
(     7450,    0,             2, 'Show me where I can fly.',                            4,                    8,                0,               0,                  0,           0,           0, NULL,                    3),
(     7450,    1,             0, 'GOSSIP_OPTION_QUESTGIVER',                            2,                    2,                0,               0,                  0,           0,           0, NULL,                    0),
(     7450,    2,             2, 'I''d like to fly to an Alliance location.',           1,                    1,             7420,               0,                  0,           0,           0, NULL,                 5048),
(     7451,    0,             2, 'Show me where I can fly.',                            4,                    8,                0,               0,                  0,           0,           0, NULL,                    2),
(     7451,    1,             0, 'GOSSIP_OPTION_QUESTGIVER',                            2,                    2,                0,               0,                  0,           0,           0, NULL,                    0),
(     7451,    2,             2, 'I''d like to fly to a Horde location.',               1,                    1,             7422,               0,                  0,           0,           0, NULL,                 5060),
(     7452,    0,             2, 'Show me where I can fly.',                            4,                    8,                0,               0,                  0,           0,           0, NULL,                    2),
(     7452,    1,             0, 'GOSSIP_OPTION_QUESTGIVER',                            2,                    2,                0,               0,                  0,           0,           0, NULL,                    0),
(     7452,    2,             2, 'I''d like to fly to a Horde location.',               1,                    1,             7422,               0,                  0,           0,           0, NULL,                 5061),
(     7453,    0,             2, 'Show me where I can fly.',                            4,                    8,                0,               0,                  0,           0,           0, NULL,                    3),
(     7453,    1,             0, 'GOSSIP_OPTION_QUESTGIVER',                            2,                    2,                0,               0,                  0,           0,           0, NULL,                    0),
(     7453,    2,             2, 'I''d like to fly to an Alliance location.',           1,                    1,             7420,               0,                  0,           0,           0, NULL,                 5049),
(     7454,    0,             2, 'Show me where I can fly.',                            4,                    8,                0,               0,                  0,           0,           0, NULL,                    3),
(     7454,    1,             0, 'GOSSIP_OPTION_QUESTGIVER',                            2,                    2,                0,               0,                  0,           0,           0, NULL,                    0),
(     7454,    2,             2, 'I''d like to fly to an Alliance location.',           1,                    1,             7420,               0,                  0,           0,           0, NULL,                 5053),
(     7455,    0,             2, 'Show me where I can fly.',                            4,                    8,                0,               0,                  0,           0,           0, NULL,                    3),
(     7455,    1,             0, 'GOSSIP_OPTION_QUESTGIVER',                            2,                    2,                0,               0,                  0,           0,           0, NULL,                    0),
(     7455,    2,             2, 'I''d like to fly to an Alliance location.',           1,                    1,             7420,               0,                  0,           0,           0, NULL,                 5048),
(     7456,    0,             2, 'Show me where I can fly.',                            4,                    8,                0,               0,                  0,           0,           0, NULL,                    2),
(     7456,    1,             0, 'GOSSIP_OPTION_QUESTGIVER',                            2,                    2,                0,               0,                  0,           0,           0, NULL,                    0),
(     7456,    2,             2, 'I''d like to fly to a Horde location.',               1,                    1,             7421,               0,                  0,           0,           0, NULL,                 5058),
(     7457,    0,             2, 'Show me where I can fly.',                            4,                    8,                0,               0,                  0,           0,           0, NULL,                    3),
(     7457,    1,             0, 'GOSSIP_OPTION_QUESTGIVER',                            2,                    2,                0,               0,                  0,           0,           0, NULL,                    0),
(     7457,    2,             2, 'I''d like to fly to an Alliance location.',           1,                    1,             7420,               0,                  0,           0,           0, NULL,                 5049),
(     7458,    0,             2, 'Show me where I can fly.',                            4,                    8,                0,               0,                  0,           0,           0, NULL,                    2),
(     7458,    1,             0, 'GOSSIP_OPTION_QUESTGIVER',                            2,                    2,                0,               0,                  0,           0,           0, NULL,                    0),
(     7458,    2,             2, 'I''d like to fly to a Horde location.',               1,                    1,             7422,               0,                  0,           0,           0, NULL,                 5061),
(     7459,    0,             2, 'Show me where I can fly.',                            4,                    8,                0,               0,                  0,           0,           0, NULL,                    3),
(     7459,    1,             0, 'GOSSIP_OPTION_QUESTGIVER',                            2,                    2,                0,               0,                  0,           0,           0, NULL,                    0),
(     7459,    2,             2, 'I''d like to fly to an Alliance location.',           1,                    1,             7420,               0,                  0,           0,           0, NULL,                 5053),
(     7460,    0,             2, 'Show me where I can fly.',                            4,                    8,                0,               0,                  0,           0,           0, NULL,                    2),
(     7460,    1,             0, 'GOSSIP_OPTION_QUESTGIVER',                            2,                    2,                0,               0,                  0,           0,           0, NULL,                    0),
(     7460,    2,             2, 'I''d like to fly to a Horde location.',               1,                    1,             7422,               0,                  0,           0,           0, NULL,                 5059),
(     7461,    0,             2, 'Show me where I can fly.',                            4,                    8,                0,               0,                  0,           0,           0, NULL,                    3),
(     7461,    1,             0, 'GOSSIP_OPTION_QUESTGIVER',                            2,                    2,                0,               0,                  0,           0,           0, NULL,                    0),
(     7461,    2,             2, 'I''d like to fly to an Alliance location.',           1,                    1,             7419,               0,                  0,           0,           0, NULL,                 5045),
(     7462,    0,             2, 'Show me where I can fly.',                            4,                    8,                0,               0,                  0,           0,           0, NULL,                    3),
(     7462,    1,             0, 'GOSSIP_OPTION_QUESTGIVER',                            2,                    2,                0,               0,                  0,           0,           0, NULL,                    0),
(     7462,    2,             2, 'I''d like to fly to an Alliance location.',           1,                    1,             7420,               0,                  0,           0,           0, NULL,                 5049),
(     7463,    0,             2, 'Show me where I can fly.',                            4,                    8,                0,               0,                  0,           0,           0, NULL,                    2),
(     7463,    1,             0, 'GOSSIP_OPTION_QUESTGIVER',                            2,                    2,                0,               0,                  0,           0,           0, NULL,                    0),
(     7463,    2,             2, 'I''d like to fly to a Horde location.',               1,                    1,             7422,               0,                  0,           0,           0, NULL,                 5062),
(     7464,    0,             2, 'Show me where I can fly.',                            4,                    8,                0,               0,                  0,           0,           0, NULL,                    3),
(     7464,    1,             0, 'GOSSIP_OPTION_QUESTGIVER',                            2,                    2,                0,               0,                  0,           0,           0, NULL,                    0),
(     7464,    2,             2, 'I''d like to fly to an Alliance location.',           1,                    1,             7419,               0,                  0,           0,           0, NULL,                 5053),
(     7465,    0,             2, 'Show me where I can fly.',                            4,                    8,                0,               0,                  0,           0,           0, NULL,                    2),
(     7465,    1,             0, 'GOSSIP_OPTION_QUESTGIVER',                            2,                    2,                0,               0,                  0,           0,           0, NULL,                    0),
(     7465,    2,             2, 'I''d like to fly to a Horde location.',               1,                    1,             7422,               0,                  0,           0,           0, NULL,                 5058),
(     7466,    0,             2, 'Show me where I can fly.',                            4,                    8,                0,               0,                  0,           0,           0, NULL,                    3),
(     7466,    1,             0, 'GOSSIP_OPTION_QUESTGIVER',                            2,                    2,                0,               0,                  0,           0,           0, NULL,                    0),
(     7466,    2,             2, 'I''d like to fly to an Alliance location.',           1,                    1,             7420,               0,                  0,           0,           0, NULL,                 5049),
(     7467,    0,             2, 'Show me where I can fly.',                            4,                    8,                0,               0,                  0,           0,           0, NULL,                    3),
(     7467,    1,             0, 'GOSSIP_OPTION_QUESTGIVER',                            2,                    2,                0,               0,                  0,           0,           0, NULL,                    0),
(     7467,    2,             2, 'I''d like to fly to an Alliance location.',           1,                    1,             7420,               0,                  0,           0,           0, NULL,                 5050),
(     7468,    0,             2, 'Show me where I can fly.',                            4,                    8,                0,               0,                  0,           0,           0, NULL,                    2),
(     7468,    1,             0, 'GOSSIP_OPTION_QUESTGIVER',                            2,                    2,                0,               0,                  0,           0,           0, NULL,                    0),
(     7468,    2,             2, 'I''d like to fly to a Horde location.',               1,                    1,             7422,               0,                  0,           0,           0, NULL,                 5059),
(     7469,    0,             2, 'Show me where I can fly.',                            4,                    8,                0,               0,                  0,           0,           0, NULL,                    2),
(     7469,    1,             0, 'GOSSIP_OPTION_QUESTGIVER',                            2,                    2,                0,               0,                  0,           0,           0, NULL,                    0),
(     7469,    2,             2, 'I''d like to fly to a Horde location.',               1,                    1,             7422,               0,                  0,           0,           0, NULL,                 5058),
(     7470,    0,             2, 'Show me where I can fly.',                            4,                    8,                0,               0,                  0,           0,           0, NULL,                    2),
(     7470,    1,             0, 'GOSSIP_OPTION_QUESTGIVER',                            2,                    2,                0,               0,                  0,           0,           0, NULL,                    0),
(     7470,    2,             2, 'I''d like to fly to a Horde location.',               1,                    1,             7422,               0,                  0,           0,           0, NULL,                 5058),
(     7471,    0,             2, 'Show me where I can fly.',                            4,                    8,                0,               0,                  0,           0,           0, NULL,                    2),
(     7471,    1,             0, 'GOSSIP_OPTION_QUESTGIVER',                            2,                    2,                0,               0,                  0,           0,           0, NULL,                    0),
(     7471,    2,             2, 'I''d like to fly to a Horde location.',               1,                    1,             7422,               0,                  0,           0,           0, NULL,                 5058),
(     7472,    0,             2, 'Show me where I can fly.',                            4,                    8,                0,               0,                  0,           0,           0, NULL,                    0),
(     7472,    1,             0, 'GOSSIP_OPTION_QUESTGIVER',                            2,                    2,                0,               0,                  0,           0,           0, NULL,                    0),
(     7472,    2,             2, 'I''d like to fly to an Alliance location.',           1,                    1,             7420,               0,                  0,           0,           0, NULL,                 5050),
(     7473,    0,             2, 'Show me where I can fly.',                            4,                    8,                0,               0,                  0,           0,           0, NULL,                    3),
(     7473,    1,             0, 'GOSSIP_OPTION_QUESTGIVER',                            2,                    2,                0,               0,                  0,           0,           0, NULL,                    0),
(     7473,    2,             2, 'I''d like to fly to an Alliance location.',           1,                    1,             7420,               0,                  0,           0,           0, NULL,                 5050),
(     7474,    0,             2, 'Show me where I can fly.',                            4,                    8,                0,               0,                  0,           0,           0, NULL,                    3),
(     7474,    1,             0, 'GOSSIP_OPTION_QUESTGIVER',                            2,                    2,                0,               0,                  0,           0,           0, NULL,                    0),
(     7474,    2,             2, 'I''d like to fly to an Alliance location.',           1,                    1,             7419,               0,                  0,           0,           0, NULL,                 5047),
(     7475,    0,             2, 'Show me where I can fly.',                            4,                    8,                0,               0,                  0,           0,           0, NULL,                    2),
(     7475,    1,             0, 'GOSSIP_OPTION_QUESTGIVER',                            2,                    2,                0,               0,                  0,           0,           0, NULL,                    0),
(     7475,    2,             2, 'I''d like to fly to a Horde location.',               1,                    1,             7422,               0,                  0,           0,           0, NULL,                 5058),
(     7476,    0,             2, 'Show me where I can fly.',                            4,                    8,                0,               0,                  0,           0,           0, NULL,                    3),
(     7476,    1,             0, 'GOSSIP_OPTION_QUESTGIVER',                            2,                    2,                0,               0,                  0,           0,           0, NULL,                    0),
(     7476,    2,             2, 'I''d like to fly to an Alliance location.',           1,                    1,             7419,               0,                  0,           0,           0, NULL,                 5046),
(     7477,    0,             2, 'Show me where I can fly.',                            4,                    8,                0,               0,                  0,           0,           0, NULL,                    2),
(     7477,    1,             0, 'GOSSIP_OPTION_QUESTGIVER',                            2,                    2,                0,               0,                  0,           0,           0, NULL,                    0),
(     7477,    2,             2, 'I''d like to fly to a Horde location.',               1,                    1,             7422,               0,                  0,           0,           0, NULL,                 5059),
(     7478,    0,             2, 'Show me where I can fly.',                            4,                    8,                0,               0,                  0,           0,           0, NULL,                    2),
(     7478,    1,             0, 'GOSSIP_OPTION_QUESTGIVER',                            2,                    2,                0,               0,                  0,           0,           0, NULL,                    0),
(     7478,    2,             2, 'I''d like to fly to a Horde location.',               1,                    1,             7421,               0,                  0,           0,           0, NULL,                 5059),
(     7479,    0,             2, 'Show me where I can fly.',                            4,                    8,                0,               0,                  0,           0,           0, NULL,                    3),
(     7479,    1,             0, 'GOSSIP_OPTION_QUESTGIVER',                            2,                    2,                0,               0,                  0,           0,           0, NULL,                    0),
(     7479,    2,             2, 'I''d like to fly to an Alliance location.',           1,                    1,             7420,               0,                  0,           0,           0, NULL,                 5050),
(     7480,    0,             2, 'Show me where I can fly.',                            4,                    8,                0,               0,                  0,           0,           0, NULL,                    2),
(     7480,    1,             0, 'GOSSIP_OPTION_QUESTGIVER',                            2,                    2,                0,               0,                  0,           0,           0, NULL,                    0),
(     7480,    2,             2, 'I''d like to fly to a Horde location.',               1,                    1,             7422,               0,                  0,           0,           0, NULL,                 5062),
(     7481,    0,             2, 'I need a ride.',                                      4,                    8,                0,               0,                  0,           0,           0, NULL,                    2),
(     7481,    1,             2, 'I''d like to fly to a Horde location.',               1,                    8,             7421,               0,                  0,           0,           0, NULL,                 5057);

UPDATE `creature_template` SET `gossip_menu_id` = 7423 WHERE `Entry` =   352;
UPDATE `creature_template` SET `gossip_menu_id` = 7424 WHERE `Entry` =   523;
UPDATE `creature_template` SET `gossip_menu_id` = 7435 WHERE `Entry` =  2226;
UPDATE `creature_template` SET `gossip_menu_id` = 7426 WHERE `Entry` =  3841;
UPDATE `creature_template` SET `gossip_menu_id` = 7427 WHERE `Entry` =  3838;
UPDATE `creature_template` SET `gossip_menu_id` = 7428 WHERE `Entry` =  2859;
UPDATE `creature_template` SET `gossip_menu_id` = 7429 WHERE `Entry` =  2858;
UPDATE `creature_template` SET `gossip_menu_id` = 7430 WHERE `Entry` =  4551;
UPDATE `creature_template` SET `gossip_menu_id` = 7431 WHERE `Entry` =  3615;
UPDATE `creature_template` SET `gossip_menu_id` = 7432 WHERE `Entry` =  2995;
UPDATE `creature_template` SET `gossip_menu_id` = 7433 WHERE `Entry` =  3310;
UPDATE `creature_template` SET `gossip_menu_id` = 7434 WHERE `Entry` =  1572;
UPDATE `creature_template` SET `gossip_menu_id` = 7435 WHERE `Entry` =  1573;
UPDATE `creature_template` SET `gossip_menu_id` = 7436 WHERE `Entry` =  2941;
UPDATE `creature_template` SET `gossip_menu_id` = 7437 WHERE `Entry` =  3305;
UPDATE `creature_template` SET `gossip_menu_id` = 7438 WHERE `Entry` =  4314;
UPDATE `creature_template` SET `gossip_menu_id` = 7439 WHERE `Entry` = 10378;
UPDATE `creature_template` SET `gossip_menu_id` = 7440 WHERE `Entry` =   931;
UPDATE `creature_template` SET `gossip_menu_id` = 7441 WHERE `Entry` =  1387;
UPDATE `creature_template` SET `gossip_menu_id` = 7442 WHERE `Entry` =  1571;
UPDATE `creature_template` SET `gossip_menu_id` = 7443 WHERE `Entry` =  2299;
UPDATE `creature_template` SET `gossip_menu_id` = 7444 WHERE `Entry` =  2389;
UPDATE `creature_template` SET `gossip_menu_id` = 7445 WHERE `Entry` =  2409;
UPDATE `creature_template` SET `gossip_menu_id` = 7446 WHERE `Entry` =  2432;
UPDATE `creature_template` SET `gossip_menu_id` = 7447 WHERE `Entry` =  2835;
UPDATE `creature_template` SET `gossip_menu_id` = 7448 WHERE `Entry` =  2851;
UPDATE `creature_template` SET `gossip_menu_id` = 7449 WHERE `Entry` =  2861;
UPDATE `creature_template` SET `gossip_menu_id` = 7450 WHERE `Entry` =  4267;
UPDATE `creature_template` SET `gossip_menu_id` = 7451 WHERE `Entry` =  4312;
UPDATE `creature_template` SET `gossip_menu_id` = 7452 WHERE `Entry` =  4317;
UPDATE `creature_template` SET `gossip_menu_id` = 7453 WHERE `Entry` =  4319;
UPDATE `creature_template` SET `gossip_menu_id` = 7454 WHERE `Entry` =  4321;
UPDATE `creature_template` SET `gossip_menu_id` = 7455 WHERE `Entry` =  4407;
UPDATE `creature_template` SET `gossip_menu_id` = 7456 WHERE `Entry` =  6026;
UPDATE `creature_template` SET `gossip_menu_id` = 7457 WHERE `Entry` =  6706;
UPDATE `creature_template` SET `gossip_menu_id` = 7458 WHERE `Entry` =  6726;
UPDATE `creature_template` SET `gossip_menu_id` = 7459 WHERE `Entry` =  7823;
UPDATE `creature_template` SET `gossip_menu_id` = 7460 WHERE `Entry` =  7824;
UPDATE `creature_template` SET `gossip_menu_id` = 7461 WHERE `Entry` =  8018;
UPDATE `creature_template` SET `gossip_menu_id` = 7462 WHERE `Entry` =  8019;
UPDATE `creature_template` SET `gossip_menu_id` = 7463 WHERE `Entry` =  8020;
UPDATE `creature_template` SET `gossip_menu_id` = 7464 WHERE `Entry` =  8609;
UPDATE `creature_template` SET `gossip_menu_id` = 7465 WHERE `Entry` =  8610;
UPDATE `creature_template` SET `gossip_menu_id` = 7466 WHERE `Entry` = 10897;
UPDATE `creature_template` SET `gossip_menu_id` = 7467 WHERE `Entry` = 11138;
UPDATE `creature_template` SET `gossip_menu_id` = 7468 WHERE `Entry` = 11139;
UPDATE `creature_template` SET `gossip_menu_id` = 7469 WHERE `Entry` = 11899;
UPDATE `creature_template` SET `gossip_menu_id` = 7470 WHERE `Entry` = 11900;
UPDATE `creature_template` SET `gossip_menu_id` = 7471 WHERE `Entry` = 15162;
UPDATE `creature_template` SET `gossip_menu_id` = 7472 WHERE `Entry` = 12577;
UPDATE `creature_template` SET `gossip_menu_id` = 7473 WHERE `Entry` = 12578;
UPDATE `creature_template` SET `gossip_menu_id` = 7474 WHERE `Entry` = 12596;
UPDATE `creature_template` SET `gossip_menu_id` = 7475 WHERE `Entry` = 12616;
UPDATE `creature_template` SET `gossip_menu_id` = 7476 WHERE `Entry` = 12617;
UPDATE `creature_template` SET `gossip_menu_id` = 7477 WHERE `Entry` = 12740;
UPDATE `creature_template` SET `gossip_menu_id` = 7478 WHERE `Entry` = 13177;
UPDATE `creature_template` SET `gossip_menu_id` = 7479 WHERE `Entry` = 15177;
UPDATE `creature_template` SET `gossip_menu_id` = 7480 WHERE `Entry` = 15178;
UPDATE `creature_template` SET `gossip_menu_id` = 7481 WHERE `Entry` = 12636;

UPDATE `gossip_scripts` SET `datalong` = 27 WHERE `command` = 30 AND `datalong` = 315;
UPDATE `gossip_scripts` SET `datalong` = 22 WHERE `command` = 30 AND `datalong` = 316;
UPDATE `gossip_scripts` SET `datalong` = 85 WHERE `command` = 30 AND `datalong` = 494;
UPDATE `gossip_scripts` SET `datalong` = 86 WHERE `command` = 30 AND `datalong` = 495;
UPDATE `gossip_scripts` SET `datalong` = 87 WHERE `command` = 30 AND `datalong` = 496;
