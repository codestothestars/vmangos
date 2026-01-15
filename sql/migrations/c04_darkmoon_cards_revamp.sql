-- Makes the Darkmoon Cards obtainable through new quests started from the Ace in each set.
-- Overall makes them easier to obtain without simply handing them out.
-- The intent is for the player to earn them through exploration rather than random drops.

-- Add a new version of the Ace in each set that starts the quest for its Deck.
INSERT INTO `item_template`
(`entry`, `class`, `subclass`, `name`,              `display_id`, `Quality`, `Flags`, `buy_count`, `buy_price`, `sell_price`, `inventory_type`, `allowable_class`, `allowable_race`, `item_level`, `required_level`, `required_skill`, `required_skill_rank`, `required_spell`, `required_honor_rank`, `Required_city_rank`, `required_reputation_faction`, `required_reputation_rank`, `max_count`, `stackable`, `container_slots`, `stat_type1`, `stat_value1`, `stat_type2`, `stat_value2`, `stat_type3`, `stat_value3`, `stat_type4`, `stat_value4`, `stat_type5`, `stat_value5`, `stat_type6`, `stat_value6`, `stat_type7`, `stat_value7`, `stat_type8`, `stat_value8`, `stat_type9`, `stat_value9`, `stat_type10`, `stat_value10`, `dmg_min1`, `dmg_max1`, `dmg_type1`, `dmg_min2`, `dmg_max2`, `dmg_type2`, `dmg_min3`, `dmg_max3`, `dmg_type3`, `dmg_min4`, `dmg_max4`, `dmg_type4`, `dmg_min5`, `dmg_max5`, `dmg_type5`, `armor`, `holy_res`, `fire_res`, `nature_res`, `frost_res`, `shadow_res`, `arcane_res`, `delay`, `ammo_type`, `range_mod`, `spellid_1`, `spelltrigger_1`, `spellcharges_1`, `spellppmRate_1`, `spellcooldown_1`, `spellcategory_1`, `spellcategorycooldown_1`, `spellid_2`, `spelltrigger_2`, `spellcharges_2`, `spellppmRate_2`, `spellcooldown_2`, `spellcategory_2`, `spellcategorycooldown_2`, `spellid_3`, `spelltrigger_3`, `spellcharges_3`, `spellppmRate_3`, `spellcooldown_3`, `spellcategory_3`, `spellcategorycooldown_3`, `spellid_4`, `spelltrigger_4`, `spellcharges_4`, `spellppmRate_4`, `spellcooldown_4`, `spellcategory_4`, `spellcategorycooldown_4`, `spellid_5`, `spelltrigger_5`, `spellcharges_5`, `spellppmRate_5`, `spellcooldown_5`, `spellcategory_5`, `spellcategorycooldown_5`, `bonding`, `description`,                                                                               `page_text`, `page_language`, `page_material`, `start_quest`, `lock_id`, `material`, `sheath`, `random_property`, `block`, `set_id`, `max_durability`, `area_bound`, `map_bound`, `bag_family`, `disenchant_id`, `food_type`, `min_money_loot`, `max_money_loot`, `duration`, `extra_flags`)
VALUES
(      1,      15,          0, 'Ace of Beasts',           31756,          3,       0,           1,       50000,        12500,                0,                -1,               -1,            1,                0,                0,                     0,                0,                     0,                    0,                             0,                          0,           0,           1,                 0,            0,             0,            0,             0,            0,             0,            0,             0,            0,             0,            0,             0,            0,             0,            0,             0,            0,             0,             0,              0,          0,          0,           0,          0,          0,           0,          0,          0,           0,          0,          0,           0,          0,          0,           0,       0,          0,          0,            0,           0,            0,            0,       0,           0,           0,           0,                0,                0,                0,                -1,                 0,                        -1,           0,                0,                0,                0,                -1,                 0,                        -1,           0,                0,                0,                0,                -1,                 0,                        -1,           0,                0,                0,                0,                -1,                 0,                        -1,           0,                0,                0,                0,                -1,                 0,                        -1,         0, 'The dog, the wolf and that which comes up out of the deeps.',                                         0,               0,               0,            41,         0,          0,        0,                 0,       0,        0,                0,            0,           0,            0,               0,           0,                0,                0,          0,             0),
(      2,      15,          0, 'Ace of Warlords',         31760,          3,       0,           1,       50000,        12500,                0,                -1,               -1,            1,                0,                0,                     0,                0,                     0,                    0,                             0,                          0,           0,           1,                 0,            0,             0,            0,             0,            0,             0,            0,             0,            0,             0,            0,             0,            0,             0,            0,             0,            0,             0,             0,              0,          0,          0,           0,          0,          0,           0,          0,          0,           0,          0,          0,           0,          0,          0,           0,       0,          0,          0,            0,           0,            0,            0,       0,           0,           0,           0,                0,                0,                0,                -1,                 0,                        -1,           0,                0,                0,                0,                -1,                 0,                        -1,           0,                0,                0,                0,                -1,                 0,                        -1,           0,                0,                0,                0,                -1,                 0,                        -1,           0,                0,                0,                0,                -1,                 0,                        -1,         0, 'It has walked upon the asp and the basilisk and has trodden down the lion and the dragon.',           0,               0,               0,            42,         0,          0,        0,                 0,       0,        0,                0,            0,           0,            0,               0,           0,                0,                0,          0,             0),
(      3,      15,          0, 'Ace of Elementals',       31762,          3,       0,           1,       50000,        12500,                0,                -1,               -1,            1,                0,                0,                     0,                0,                     0,                    0,                             0,                          0,           0,           1,                 0,            0,             0,            0,             0,            0,             0,            0,             0,            0,             0,            0,             0,            0,             0,            0,             0,            0,             0,             0,              0,          0,          0,           0,          0,          0,           0,          0,          0,           0,          0,          0,           0,          0,          0,           0,       0,          0,          0,            0,           0,            0,            0,       0,           0,           0,           0,                0,                0,                0,                -1,                 0,                        -1,           0,                0,                0,                0,                -1,                 0,                        -1,           0,                0,                0,                0,                -1,                 0,                        -1,           0,                0,                0,                0,                -1,                 0,                        -1,           0,                0,                0,                0,                -1,                 0,                        -1,         0, 'It has one foot upon the earth and one upon waters.',                                                 0,               0,               0,            43,         0,          0,        0,                 0,       0,        0,                0,            0,           0,            0,               0,           0,                0,                0,          0,             0),
(      4,      15,          0, 'Ace of Portals',          31767,          3,       0,           1,       50000,        12500,                0,                -1,               -1,            1,                0,                0,                     0,                0,                     0,                    0,                             0,                          0,           0,           1,                 0,            0,             0,            0,             0,            0,             0,            0,             0,            0,             0,            0,             0,            0,             0,            0,             0,            0,             0,             0,              0,          0,          0,           0,          0,          0,           0,          0,          0,           0,          0,          0,           0,          0,          0,           0,       0,          0,          0,            0,           0,            0,            0,       0,           0,           0,           0,                0,                0,                0,                -1,                 0,                        -1,           0,                0,                0,                0,                -1,                 0,                        -1,           0,                0,                0,                0,                -1,                 0,                        -1,           0,                0,                0,                0,                -1,                 0,                        -1,           0,                0,                0,                0,                -1,                 0,                        -1,         0, 'Pictures are like doors which open into unexpected chambers.',                                        0,               0,               0,            44,         0,          0,        0,                 0,       0,        0,                0,            0,           0,            0,               0,           0,                0,                0,          0,             0);

-- Add a new quest started from the new Ace in each set.
INSERT INTO `quest_template`
(`entry`, `Method`, `ZoneOrSort`, `MinLevel`, `QuestLevel`, `Type`, `RequiredClasses`, `RequiredRaces`, `RequiredSkill`, `RequiredSkillValue`, `RepObjectiveFaction`, `RepObjectiveValue`, `RequiredMinRepFaction`, `RequiredMinRepValue`, `RequiredMaxRepFaction`, `RequiredMaxRepValue`, `SuggestedPlayers`, `LimitTime`, `QuestFlags`, `SpecialFlags`, `PrevQuestId`, `NextQuestId`, `ExclusiveGroup`, `NextQuestInChain`, `SrcItemId`, `SrcItemCount`, `SrcSpell`, `Title`,             `Details`,                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      `Objectives`,                              `OfferRewardText`,                                 `RequestItemsText`,                   `EndText`, `ObjectiveText1`,           `ObjectiveText2`, `ObjectiveText3`, `ObjectiveText4`, `ReqItemId1`, `ReqItemId2`, `ReqItemId3`, `ReqItemId4`, `ReqItemCount1`, `ReqItemCount2`, `ReqItemCount3`, `ReqItemCount4`, `ReqSourceId1`, `ReqSourceId2`, `ReqSourceId3`, `ReqSourceId4`, `ReqSourceCount1`, `ReqSourceCount2`, `ReqSourceCount3`, `ReqSourceCount4`, `ReqCreatureOrGOId1`, `ReqCreatureOrGOId2`, `ReqCreatureOrGOId3`, `ReqCreatureOrGOId4`, `ReqCreatureOrGOCount1`, `ReqCreatureOrGOCount2`, `ReqCreatureOrGOCount3`, `ReqCreatureOrGOCount4`, `ReqSpellCast1`, `ReqSpellCast2`, `ReqSpellCast3`, `ReqSpellCast4`, `RewChoiceItemId1`, `RewChoiceItemId2`, `RewChoiceItemId3`, `RewChoiceItemId4`, `RewChoiceItemId5`, `RewChoiceItemId6`, `RewChoiceItemCount1`, `RewChoiceItemCount2`, `RewChoiceItemCount3`, `RewChoiceItemCount4`, `RewChoiceItemCount5`, `RewChoiceItemCount6`, `RewItemId1`, `RewItemId2`, `RewItemId3`, `RewItemId4`, `RewItemCount1`, `RewItemCount2`, `RewItemCount3`, `RewItemCount4`, `RewRepFaction1`, `RewRepFaction2`, `RewRepFaction3`, `RewRepFaction4`, `RewRepFaction5`, `RewRepValue1`, `RewRepValue2`, `RewRepValue3`, `RewRepValue4`, `RewRepValue5`, `RewOrReqMoney`, `RewMoneyMaxLevel`, `RewSpell`, `RewSpellCast`, `RewMailTemplateId`, `RewMailDelaySecs`, `PointMapId`, `PointX`, `PointY`, `PointOpt`, `DetailsEmote1`, `DetailsEmote2`, `DetailsEmote3`, `DetailsEmote4`, `DetailsEmoteDelay1`, `DetailsEmoteDelay2`, `DetailsEmoteDelay3`, `DetailsEmoteDelay4`, `IncompleteEmote`, `CompleteEmote`, `OfferRewardEmote1`, `OfferRewardEmote2`, `OfferRewardEmote3`, `OfferRewardEmote4`, `OfferRewardEmoteDelay1`, `OfferRewardEmoteDelay2`, `OfferRewardEmoteDelay3`, `OfferRewardEmoteDelay4`, `StartScript`, `CompleteScript`)
VALUES
(     41,        2,         -364,          1,           55,      0,                 0,               0,               0,                    0,                     0,                   0,                       0,                     0,                       0,                     0,                  0,           0,            0,              2,             0,             0,                0,                  0,       19227,              1,          0, 'Ace of Beasts',     'Shimmering on its surface is a beautifully drawn image of a wolf''s head. The art is like nothing you''ve ever seen before, and exudes antiquity. Although transfixed by the image, you wonder why someone would carry around such an ancient, yet simple curio in a place like this. You place it aside, moving to continue searching your enemy for spoils, only to realize that it is still in your hand.$B$BThere must be others like it. Perhaps you will find them in other places as dangerous as this.',                               'Collect the remaining Beasts cards.',     'Oh, my...$B$BSo they''ve resurfaced once again.', 'Do you have some business with me?', '',        'Beasts set collected',     '',               '',               '',                          0,            0,            0,            0,               0,               0,               0,               0,              0,              0,              0,              0,                 0,                 0,                 0,                 0,                    0,                    0,                    0,                    0,                       0,                       0,                       0,                       0,           23677,               0,               0,               0,                  0,                  0,                  0,                  0,                  0,                  0,                     0,                     0,                     0,                     0,                     0,                     0,            0,            0,            0,            0,               0,               0,               0,               0,              909,                0,                0,                0,                0,            350,              0,              0,              0,              0,               0,                  0,          0,              0,                   0,                  0,            0,        0,        0,          0,               0,               0,               0,               0,                    0,                    0,                    0,                    0,                 0,               1,                   0,                   0,                   0,                   0,                        0,                        0,                        0,                        0,             0,                0),
(     42,        2,         -364,          1,           55,      0,                 0,               0,               0,                    0,                     0,                   0,                       0,                     0,                       0,                     0,                  0,           0,            0,              2,             0,             0,                0,                  0,       19258,              1,          0, 'Ace of Warlords',   'Shimmering on its surface is a beautifully drawn image of a dual-bladed axe. The art is like nothing you''ve ever seen before, and exudes antiquity. Although transfixed by the image, you wonder why someone would carry around such an ancient, yet simple curio in a place like this. You place it aside, moving to continue searching your enemy for spoils, only to realize that it is still in your hand.$B$BThere must be others like it. Perhaps you will find them in other places as dangerous as this.',                            'Collect the remaining Warlords cards.',   'Oh, my...$B$BSo they''ve resurfaced once again.', 'Do you have some business with me?', '',        'Warlords set collected',   '',               '',               '',                          0,            0,            0,            0,               0,               0,               0,               0,              0,              0,              0,              0,                 0,                 0,                 0,                 0,                    0,                    0,                    0,                    0,                       0,                       0,                       0,                       0,           23678,               0,               0,               0,                  0,                  0,                  0,                  0,                  0,                  0,                     0,                     0,                     0,                     0,                     0,                     0,            0,            0,            0,            0,               0,               0,               0,               0,              909,                0,                0,                0,                0,            350,              0,              0,              0,              0,               0,                  0,          0,              0,                   0,                  0,            0,        0,        0,          0,               0,               0,               0,               0,                    0,                    0,                    0,                    0,                 0,               1,                   0,                   0,                   0,                   0,                        0,                        0,                        0,                        0,             0,                0),
(     43,        2,         -364,          1,           55,      0,                 0,               0,               0,                    0,                     0,                   0,                       0,                     0,                       0,                     0,                  0,           0,            0,              2,             0,             0,                0,                  0,       19268,              1,          0, 'Ace of Elementals', 'Shimmering on its surface is a beautifully drawn image of flames and water intertwined. The art is like nothing you''ve ever seen before, and exudes antiquity. Although transfixed by the image, you wonder why someone would carry around such an ancient, yet simple curio in a place like this. You place it aside, moving to continue searching your enemy for spoils, only to realize that it is still in your hand.$B$BThere must be others like it. Perhaps you will find them in other places as dangerous as this.',                 'Collect the remaining Elementals cards.', 'Oh, my...$B$BSo they''ve resurfaced once again.', 'Do you have some business with me?', '',        'Elementals set collected', '',               '',               '',                          0,            0,            0,            0,               0,               0,               0,               0,              0,              0,              0,              0,                 0,                 0,                 0,                 0,                    0,                    0,                    0,                    0,                       0,                       0,                       0,                       0,           23679,               0,               0,               0,                  0,                  0,                  0,                  0,                  0,                  0,                     0,                     0,                     0,                     0,                     0,                     0,            0,            0,            0,            0,               0,               0,               0,               0,              909,                0,                0,                0,                0,            350,              0,              0,              0,              0,               0,                  0,          0,              0,                   0,                  0,            0,        0,        0,          0,               0,               0,               0,               0,                    0,                    0,                    0,                    0,                 0,               1,                   0,                   0,                   0,                   0,                        0,                        0,                        0,                        0,             0,                0),
(     44,        2,         -364,          1,           55,      0,                 0,               0,               0,                    0,                     0,                   0,                       0,                     0,                       0,                     0,                  0,           0,            0,              2,             0,             0,                0,                  0,       19276,              1,          0, 'Ace of Portals',    'Shimmering on its surface is a beautifully drawn image of a grand vista visible through an oval window. The art is like nothing you''ve ever seen before, and exudes antiquity. Although transfixed by the image, you wonder why someone would carry around such an ancient, yet simple curio in a place like this. You place it aside, moving to continue searching your enemy for spoils, only to realize that it is still in your hand.$B$BThere must be others like it. Perhaps you will find them in other places as dangerous as this.', 'Collect the remaining Portals cards.',    'Oh, my...$B$BSo they''ve resurfaced once again.', 'Do you have some business with me?', '',        'Portals set collected',    '',               '',               '',                          0,            0,            0,            0,               0,               0,               0,               0,              0,              0,              0,              0,                 0,                 0,                 0,                 0,                    0,                    0,                    0,                    0,                       0,                       0,                       0,                       0,           23680,               0,               0,               0,                  0,                  0,                  0,                  0,                  0,                  0,                     0,                     0,                     0,                     0,                     0,                     0,            0,            0,            0,            0,               0,               0,               0,               0,              909,                0,                0,                0,                0,            350,              0,              0,              0,              0,               0,                  0,          0,              0,                   0,                  0,            0,        0,        0,          0,               0,               0,               0,               0,                    0,                    0,                    0,                    0,                 0,               1,                   0,                   0,                   0,                   0,                        0,                        0,                        0,                        0,             0,                0);

-- Add a condition for each new quest and non-Ace card.
INSERT INTO `conditions`
(`condition_entry`, `type`, `value1`, `value2`, `flags`)
VALUES
(             1204,     23,    19230,        1,       1), -- Does NOT have Two of Beasts
(             1205,     23,    19231,        1,       1), -- Does NOT have Three of Beasts
(             1206,     23,    19232,        1,       1), -- Does NOT have Four of Beasts
(             1207,     23,    19233,        1,       1), -- Does NOT have Five of Beasts
(             1208,     23,    19234,        1,       1), -- Does NOT have Six of Beasts
(             1209,     23,    19235,        1,       1), -- Does NOT have Seven of Beasts
(             1210,     23,    19236,        1,       1), -- Does NOT have Eight of Beasts
(             1211,     23,    19259,        1,       1), -- Does NOT have Two of Warlords
(             1212,     23,    19260,        1,       1), -- Does NOT have Three of Warlords
(             1213,     23,    19261,        1,       1), -- Does NOT have Four of Warlords
(             1214,     23,    19262,        1,       1), -- Does NOT have Five of Warlords
(             1215,     23,    19263,        1,       1), -- Does NOT have Six of Warlords
(             1216,     23,    19264,        1,       1), -- Does NOT have Seven of Warlords
(             1217,     23,    19265,        1,       1), -- Does NOT have Eight of Warlords
(             1218,     23,    19269,        1,       1), -- Does NOT have Two of Elementals
(             1219,     23,    19270,        1,       1), -- Does NOT have Three of Elementals
(             1220,     23,    19271,        1,       1), -- Does NOT have Four of Elementals
(             1221,     23,    19272,        1,       1), -- Does NOT have Five of Elementals
(             1222,     23,    19273,        1,       1), -- Does NOT have Six of Elementals
(             1223,     23,    19274,        1,       1), -- Does NOT have Seven of Elementals
(             1224,     23,    19275,        1,       1), -- Does NOT have Eight of Elementals
(             1225,     23,    19278,        1,       1), -- Does NOT have Two of Portals
(             1226,     23,    19279,        1,       1), -- Does NOT have Three of Portals
(             1227,     23,    19280,        1,       1), -- Does NOT have Four of Portals
(             1228,     23,    19281,        1,       1), -- Does NOT have Five of Portals
(             1229,     23,    19282,        1,       1), -- Does NOT have Six of Portals
(             1230,     23,    19283,        1,       1), -- Does NOT have Seven of Portals
(             1231,     23,    19284,        1,       1), -- Does NOT have Eight of Portals
(             1232,      9,       41,        1,       0), -- Has quest Ace of Beasts
(             1233,      9,       42,        1,       0), -- Has quest Ace of Warlords
(             1234,      9,       43,        1,       0), -- Has quest Ace of Elementals
(             1235,      9,       44,        1,       0), -- Has quest Ace of Portals
(             1236,     -1,     1204,     1232,       0), -- Does NOT have Two of Beasts AND Has quest Ace of Beasts
(             1237,     -1,     1205,     1232,       0), -- Does NOT have Three of Beasts AND Has quest Ace of Beasts
(             1238,     -1,     1206,     1232,       0), -- Does NOT have Four of Beasts AND Has quest Ace of Beasts
(             1239,     -1,     1207,     1232,       0), -- Does NOT have Five of Beasts AND Has quest Ace of Beasts
(             1240,     -1,     1208,     1232,       0), -- Does NOT have Six of Beasts AND Has quest Ace of Beasts
(             1241,     -1,     1209,     1232,       0), -- Does NOT have Seven of Beasts AND Has quest Ace of Beasts
(             1242,     -1,     1210,     1232,       0), -- Does NOT have Eight of Beasts AND Has quest Ace of Beasts
(             1243,     -1,     1211,     1233,       0), -- Does NOT have Two of Warlords AND Has quest Ace of Warlords
(             1244,     -1,     1212,     1233,       0), -- Does NOT have Three of Warlords AND Has quest Ace of Warlords
(             1245,     -1,     1213,     1233,       0), -- Does NOT have Four of Warlords AND Has quest Ace of Warlords
(             1246,     -1,     1214,     1233,       0), -- Does NOT have Five of Warlords AND Has quest Ace of Warlords
(             1247,     -1,     1215,     1233,       0), -- Does NOT have Six of Warlords AND Has quest Ace of Warlords
(             1248,     -1,     1216,     1233,       0), -- Does NOT have Seven of Warlords AND Has quest Ace of Warlords
(             1249,     -1,     1217,     1233,       0), -- Does NOT have Eight of Warlords AND Has quest Ace of Warlords
(             1250,     -1,     1218,     1234,       0), -- Does NOT have Two of Elementals AND Has quest Ace of Elementals
(             1251,     -1,     1219,     1234,       0), -- Does NOT have Three of Elementals AND Has quest Ace of Elementals
(             1252,     -1,     1220,     1234,       0), -- Does NOT have Four of Elementals AND Has quest Ace of Elementals
(             1253,     -1,     1221,     1234,       0), -- Does NOT have Five of Elementals AND Has quest Ace of Elementals
(             1254,     -1,     1222,     1234,       0), -- Does NOT have Six of Elementals AND Has quest Ace of Elementals
(             1255,     -1,     1223,     1234,       0), -- Does NOT have Seven of Elementals AND Has quest Ace of Elementals
(             1256,     -1,     1224,     1234,       0), -- Does NOT have Eight of Elementals AND Has quest Ace of Elementals
(             1257,     -1,     1225,     1235,       0), -- Does NOT have Two of Portals AND Has quest Ace of Portals
(             1258,     -1,     1226,     1235,       0), -- Does NOT have Three of Portals AND Has quest Ace of Portals
(             1259,     -1,     1227,     1235,       0), -- Does NOT have Four of Portals AND Has quest Ace of Portals
(             1260,     -1,     1228,     1235,       0), -- Does NOT have Five of Portals AND Has quest Ace of Portals
(             1261,     -1,     1229,     1235,       0), -- Does NOT have Six of Portals AND Has quest Ace of Portals
(             1262,     -1,     1230,     1235,       0), -- Does NOT have Seven of Portals AND Has quest Ace of Portals
(             1263,     -1,     1231,     1235,       0); -- Does NOT have Eight of Portals AND Has quest Ace of Portals

-- Make the spell that creates each deck complete the new quest for that deck.
UPDATE `spell_template` SET `Effect2` = 16, `EffectMiscValue2` = 41 WHERE `entry` = 23677;
UPDATE `spell_template` SET `Effect2` = 16, `EffectMiscValue2` = 42 WHERE `entry` = 23678;
UPDATE `spell_template` SET `Effect2` = 16, `EffectMiscValue2` = 43 WHERE `entry` = 23679;
UPDATE `spell_template` SET `Effect2` = 16, `EffectMiscValue2` = 44 WHERE `entry` = 23680;

-- Remove the Ace of Elementals from the loot template of the additional elemental enemies
-- for consistency with the other sets.
DELETE FROM `creature_loot_template`
WHERE
    `item` = 19268 AND
    `entry` <> 9017;

-- Replace the original Ace of each set with the new Ace for the creature who drops the original Ace.
UPDATE `creature_loot_template` SET item = 1 WHERE item = 19227;
UPDATE `creature_loot_template` SET item = 2 WHERE item = 19258;
UPDATE `creature_loot_template` SET item = 3 WHERE item = 19268;
UPDATE `creature_loot_template` SET item = 4 WHERE item = 19276;

-- Make each new Ace a guaranteed drop.
UPDATE `creature_loot_template`
SET
    `ChanceOrQuestChance` = 100,
    `maxcount` = 2, -- Expected number of players
    `mincountOrRef` = 2
WHERE `item` IN (1, 2, 3, 4);

-- Make each non-Ace card of each set require the new quest for that set and not drop if the player already has it.
UPDATE  `creature_loot_template` SET `condition_id` = 1236 WHERE `item` = 19230;
UPDATE  `creature_loot_template` SET `condition_id` = 1237 WHERE `item` = 19231;
UPDATE  `creature_loot_template` SET `condition_id` = 1238 WHERE `item` = 19232;
UPDATE  `creature_loot_template` SET `condition_id` = 1239 WHERE `item` = 19233;
UPDATE  `creature_loot_template` SET `condition_id` = 1240 WHERE `item` = 19234;
UPDATE  `creature_loot_template` SET `condition_id` = 1241 WHERE `item` = 19235;
UPDATE  `creature_loot_template` SET `condition_id` = 1242 WHERE `item` = 19236;
UPDATE  `creature_loot_template` SET `condition_id` = 1243 WHERE `item` = 19259;
UPDATE  `creature_loot_template` SET `condition_id` = 1244 WHERE `item` = 19260;
UPDATE  `creature_loot_template` SET `condition_id` = 1245 WHERE `item` = 19261;
UPDATE  `creature_loot_template` SET `condition_id` = 1246 WHERE `item` = 19262;
UPDATE  `creature_loot_template` SET `condition_id` = 1247 WHERE `item` = 19263;
UPDATE  `creature_loot_template` SET `condition_id` = 1248 WHERE `item` = 19264;
UPDATE  `creature_loot_template` SET `condition_id` = 1249 WHERE `item` = 19265;
UPDATE  `creature_loot_template` SET `condition_id` = 1250 WHERE `item` = 19269;
UPDATE  `creature_loot_template` SET `condition_id` = 1251 WHERE `item` = 19270;
UPDATE  `creature_loot_template` SET `condition_id` = 1252 WHERE `item` = 19271;
UPDATE  `creature_loot_template` SET `condition_id` = 1253 WHERE `item` = 19272;
UPDATE  `creature_loot_template` SET `condition_id` = 1254 WHERE `item` = 19273;
UPDATE  `creature_loot_template` SET `condition_id` = 1255 WHERE `item` = 19274;
UPDATE  `creature_loot_template` SET `condition_id` = 1256 WHERE `item` = 19275;
UPDATE  `creature_loot_template` SET `condition_id` = 1257 WHERE `item` = 19278;
UPDATE  `creature_loot_template` SET `condition_id` = 1258 WHERE `item` = 19279;
UPDATE  `creature_loot_template` SET `condition_id` = 1259 WHERE `item` = 19280;
UPDATE  `creature_loot_template` SET `condition_id` = 1260 WHERE `item` = 19281;
UPDATE  `creature_loot_template` SET `condition_id` = 1261 WHERE `item` = 19282;
UPDATE  `creature_loot_template` SET `condition_id` = 1262 WHERE `item` = 19283;
UPDATE  `creature_loot_template` SET `condition_id` = 1263 WHERE `item` = 19284;
UPDATE `reference_loot_template` SET `condition_id` = 1236 WHERE `item` = 19230;
UPDATE `reference_loot_template` SET `condition_id` = 1237 WHERE `item` = 19231;
UPDATE `reference_loot_template` SET `condition_id` = 1238 WHERE `item` = 19232;
UPDATE `reference_loot_template` SET `condition_id` = 1239 WHERE `item` = 19233;
UPDATE `reference_loot_template` SET `condition_id` = 1240 WHERE `item` = 19234;
UPDATE `reference_loot_template` SET `condition_id` = 1241 WHERE `item` = 19235;
UPDATE `reference_loot_template` SET `condition_id` = 1242 WHERE `item` = 19236;
UPDATE `reference_loot_template` SET `condition_id` = 1243 WHERE `item` = 19259;
UPDATE `reference_loot_template` SET `condition_id` = 1244 WHERE `item` = 19260;
UPDATE `reference_loot_template` SET `condition_id` = 1245 WHERE `item` = 19261;
UPDATE `reference_loot_template` SET `condition_id` = 1246 WHERE `item` = 19262;
UPDATE `reference_loot_template` SET `condition_id` = 1247 WHERE `item` = 19263;
UPDATE `reference_loot_template` SET `condition_id` = 1248 WHERE `item` = 19264;
UPDATE `reference_loot_template` SET `condition_id` = 1249 WHERE `item` = 19265;
UPDATE `reference_loot_template` SET `condition_id` = 1250 WHERE `item` = 19269;
UPDATE `reference_loot_template` SET `condition_id` = 1251 WHERE `item` = 19270;
UPDATE `reference_loot_template` SET `condition_id` = 1252 WHERE `item` = 19271;
UPDATE `reference_loot_template` SET `condition_id` = 1253 WHERE `item` = 19272;
UPDATE `reference_loot_template` SET `condition_id` = 1254 WHERE `item` = 19273;
UPDATE `reference_loot_template` SET `condition_id` = 1255 WHERE `item` = 19274;
UPDATE `reference_loot_template` SET `condition_id` = 1256 WHERE `item` = 19275;
UPDATE `reference_loot_template` SET `condition_id` = 1257 WHERE `item` = 19278;
UPDATE `reference_loot_template` SET `condition_id` = 1258 WHERE `item` = 19279;
UPDATE `reference_loot_template` SET `condition_id` = 1259 WHERE `item` = 19280;
UPDATE `reference_loot_template` SET `condition_id` = 1260 WHERE `item` = 19281;
UPDATE `reference_loot_template` SET `condition_id` = 1261 WHERE `item` = 19282;
UPDATE `reference_loot_template` SET `condition_id` = 1262 WHERE `item` = 19283;
UPDATE `reference_loot_template` SET `condition_id` = 1263 WHERE `item` = 19284;

-- Make the non-Ace cards grouped guaranteed drops.
UPDATE `creature_loot_template`
SET
    `ChanceOrQuestChance` = 0,
    `groupid` = 1,
    `maxcount` = 1,
    `mincountOrRef` = 1
WHERE `condition_id` IN (
    1236,
    1237,
    1238,
    1239,
    1240,
    1241,
    1242,
    1243,
    1244,
    1245,
    1246,
    1247,
    1248,
    1249,
    1250,
    1251,
    1252,
    1253,
    1254,
    1255,
    1256,
    1257,
    1258,
    1259,
    1260,
    1261,
    1262,
    1263
);
UPDATE `reference_loot_template`
SET
    `ChanceOrQuestChance` = 0,
    `groupid` = 1,
    `maxcount` = 1,
    `mincountOrRef` = 1
WHERE `condition_id` IN (
    1236,
    1237,
    1238,
    1239,
    1240,
    1241,
    1242,
    1243,
    1244,
    1245,
    1246,
    1247,
    1248,
    1249,
    1250,
    1251,
    1252,
    1253,
    1254,
    1255,
    1256,
    1257,
    1258,
    1259,
    1260,
    1261,
    1262,
    1263
);
