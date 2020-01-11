-- Makes the Darkmoon Cards obtainable through new quests started from the Ace in each set.
-- Overall makes them easier to obtain without simply handing them out.
-- The intent is for the player to earn them through exploration rather than random drops.

-- Add a new version of the Ace in each set that starts the quest for its Deck
INSERT INTO `item_template`
(`entry`, `class`, `subclass`, `name`,              `display_id`, `Quality`, `Flags`, `buy_count`, `buy_price`, `sell_price`, `inventory_type`, `allowable_class`, `allowable_race`, `item_level`, `required_level`, `required_skill`, `required_skill_rank`, `required_spell`, `required_honor_rank`, `Required_city_rank`, `required_reputation_faction`, `required_reputation_rank`, `max_count`, `stackable`, `container_slots`, `stat_type1`, `stat_value1`, `stat_type2`, `stat_value2`, `stat_type3`, `stat_value3`, `stat_type4`, `stat_value4`, `stat_type5`, `stat_value5`, `stat_type6`, `stat_value6`, `stat_type7`, `stat_value7`, `stat_type8`, `stat_value8`, `stat_type9`, `stat_value9`, `stat_type10`, `stat_value10`, `dmg_min1`, `dmg_max1`, `dmg_type1`, `dmg_min2`, `dmg_max2`, `dmg_type2`, `dmg_min3`, `dmg_max3`, `dmg_type3`, `dmg_min4`, `dmg_max4`, `dmg_type4`, `dmg_min5`, `dmg_max5`, `dmg_type5`, `armor`, `holy_res`, `fire_res`, `nature_res`, `frost_res`, `shadow_res`, `arcane_res`, `delay`, `ammo_type`, `range_mod`, `spellid_1`, `spelltrigger_1`, `spellcharges_1`, `spellppmRate_1`, `spellcooldown_1`, `spellcategory_1`, `spellcategorycooldown_1`, `spellid_2`, `spelltrigger_2`, `spellcharges_2`, `spellppmRate_2`, `spellcooldown_2`, `spellcategory_2`, `spellcategorycooldown_2`, `spellid_3`, `spelltrigger_3`, `spellcharges_3`, `spellppmRate_3`, `spellcooldown_3`, `spellcategory_3`, `spellcategorycooldown_3`, `spellid_4`, `spelltrigger_4`, `spellcharges_4`, `spellppmRate_4`, `spellcooldown_4`, `spellcategory_4`, `spellcategorycooldown_4`, `spellid_5`, `spelltrigger_5`, `spellcharges_5`, `spellppmRate_5`, `spellcooldown_5`, `spellcategory_5`, `spellcategorycooldown_5`, `bonding`, `description`,                                                                               `page_text`, `page_language`, `page_material`, `start_quest`, `lock_id`, `material`, `sheath`, `random_property`, `block`, `set_id`, `max_durability`, `area_bound`, `map_bound`, `bag_family`, `disenchant_id`, `food_type`, `min_money_loot`, `max_money_loot`, `duration`, `extra_flags`)
VALUES
(      1,      15,          0, 'Ace of Beasts',           31756,          3,       0,           1,       50000,        12500,                0,                -1,               -1,            1,                0,                0,                     0,                0,                     0,                    0,                             0,                          0,           0,           1,                 0,            0,             0,            0,             0,            0,             0,            0,             0,            0,             0,            0,             0,            0,             0,            0,             0,            0,             0,             0,              0,          0,          0,           0,          0,          0,           0,          0,          0,           0,          0,          0,           0,          0,          0,           0,       0,          0,          0,            0,           0,            0,            0,       0,           0,           0,           0,                0,                0,                0,                -1,                 0,                        -1,           0,                0,                0,                0,                -1,                 0,                        -1,           0,                0,                0,                0,                -1,                 0,                        -1,           0,                0,                0,                0,                -1,                 0,                        -1,           0,                0,                0,                0,                -1,                 0,                        -1,         0, 'The dog, the wolf and that which comes up out of the deeps.',                                         0,               0,               0,            41,         0,          0,        0,                 0,       0,        0,                0,            0,           0,            0,               0,           0,                0,                0,          0,             0),
(      2,      15,          0, 'Ace of Warlords',         31760,          3,       0,           1,       50000,        12500,                0,                -1,               -1,            1,                0,                0,                     0,                0,                     0,                    0,                             0,                          0,           0,           1,                 0,            0,             0,            0,             0,            0,             0,            0,             0,            0,             0,            0,             0,            0,             0,            0,             0,            0,             0,             0,              0,          0,          0,           0,          0,          0,           0,          0,          0,           0,          0,          0,           0,          0,          0,           0,       0,          0,          0,            0,           0,            0,            0,       0,           0,           0,           0,                0,                0,                0,                -1,                 0,                        -1,           0,                0,                0,                0,                -1,                 0,                        -1,           0,                0,                0,                0,                -1,                 0,                        -1,           0,                0,                0,                0,                -1,                 0,                        -1,           0,                0,                0,                0,                -1,                 0,                        -1,         0, 'It has walked upon the asp and the basilisk and has trodden down the lion and the dragon.',           0,               0,               0,            42,         0,          0,        0,                 0,       0,        0,                0,            0,           0,            0,               0,           0,                0,                0,          0,             0),
(      3,      15,          0, 'Ace of Elementals',       31762,          3,       0,           1,       50000,        12500,                0,                -1,               -1,            1,                0,                0,                     0,                0,                     0,                    0,                             0,                          0,           0,           1,                 0,            0,             0,            0,             0,            0,             0,            0,             0,            0,             0,            0,             0,            0,             0,            0,             0,            0,             0,             0,              0,          0,          0,           0,          0,          0,           0,          0,          0,           0,          0,          0,           0,          0,          0,           0,       0,          0,          0,            0,           0,            0,            0,       0,           0,           0,           0,                0,                0,                0,                -1,                 0,                        -1,           0,                0,                0,                0,                -1,                 0,                        -1,           0,                0,                0,                0,                -1,                 0,                        -1,           0,                0,                0,                0,                -1,                 0,                        -1,           0,                0,                0,                0,                -1,                 0,                        -1,         0, 'It has one foot upon the earth and one upon waters.',                                                 0,               0,               0,            43,         0,          0,        0,                 0,       0,        0,                0,            0,           0,            0,               0,           0,                0,                0,          0,             0),
(      4,      15,          0, 'Ace of Portals',          31767,          3,       0,           1,       50000,        12500,                0,                -1,               -1,            1,                0,                0,                     0,                0,                     0,                    0,                             0,                          0,           0,           1,                 0,            0,             0,            0,             0,            0,             0,            0,             0,            0,             0,            0,             0,            0,             0,            0,             0,            0,             0,             0,              0,          0,          0,           0,          0,          0,           0,          0,          0,           0,          0,          0,           0,          0,          0,           0,       0,          0,          0,            0,           0,            0,            0,       0,           0,           0,           0,                0,                0,                0,                -1,                 0,                        -1,           0,                0,                0,                0,                -1,                 0,                        -1,           0,                0,                0,                0,                -1,                 0,                        -1,           0,                0,                0,                0,                -1,                 0,                        -1,           0,                0,                0,                0,                -1,                 0,                        -1,         0, 'Pictures are like doors which open into unexpected chambers.',                                        0,               0,               0,            44,         0,          0,        0,                 0,       0,        0,                0,            0,           0,            0,               0,           0,                0,                0,          0,             0);

-- Add a new quest started from the new Ace in each set
INSERT INTO `quest_template`
(`entry`, `Method`, `ZoneOrSort`, `MinLevel`, `QuestLevel`, `Type`, `RequiredClasses`, `RequiredRaces`, `RequiredSkill`, `RequiredSkillValue`, `RepObjectiveFaction`, `RepObjectiveValue`, `RequiredMinRepFaction`, `RequiredMinRepValue`, `RequiredMaxRepFaction`, `RequiredMaxRepValue`, `SuggestedPlayers`, `LimitTime`, `QuestFlags`, `SpecialFlags`, `PrevQuestId`, `NextQuestId`, `ExclusiveGroup`, `NextQuestInChain`, `SrcItemId`, `SrcItemCount`, `SrcSpell`, `Title`,             `Details`,                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      `Objectives`,                              `OfferRewardText`,                                 `RequestItemsText`,                   `EndText`, `ObjectiveText1`,           `ObjectiveText2`, `ObjectiveText3`, `ObjectiveText4`, `ReqItemId1`, `ReqItemId2`, `ReqItemId3`, `ReqItemId4`, `ReqItemCount1`, `ReqItemCount2`, `ReqItemCount3`, `ReqItemCount4`, `ReqSourceId1`, `ReqSourceId2`, `ReqSourceId3`, `ReqSourceId4`, `ReqSourceCount1`, `ReqSourceCount2`, `ReqSourceCount3`, `ReqSourceCount4`, `ReqCreatureOrGOId1`, `ReqCreatureOrGOId2`, `ReqCreatureOrGOId3`, `ReqCreatureOrGOId4`, `ReqCreatureOrGOCount1`, `ReqCreatureOrGOCount2`, `ReqCreatureOrGOCount3`, `ReqCreatureOrGOCount4`, `ReqSpellCast1`, `ReqSpellCast2`, `ReqSpellCast3`, `ReqSpellCast4`, `RewChoiceItemId1`, `RewChoiceItemId2`, `RewChoiceItemId3`, `RewChoiceItemId4`, `RewChoiceItemId5`, `RewChoiceItemId6`, `RewChoiceItemCount1`, `RewChoiceItemCount2`, `RewChoiceItemCount3`, `RewChoiceItemCount4`, `RewChoiceItemCount5`, `RewChoiceItemCount6`, `RewItemId1`, `RewItemId2`, `RewItemId3`, `RewItemId4`, `RewItemCount1`, `RewItemCount2`, `RewItemCount3`, `RewItemCount4`, `RewRepFaction1`, `RewRepFaction2`, `RewRepFaction3`, `RewRepFaction4`, `RewRepFaction5`, `RewRepValue1`, `RewRepValue2`, `RewRepValue3`, `RewRepValue4`, `RewRepValue5`, `RewOrReqMoney`, `RewMoneyMaxLevel`, `RewSpell`, `RewSpellCast`, `RewMailTemplateId`, `RewMailDelaySecs`, `PointMapId`, `PointX`, `PointY`, `PointOpt`, `DetailsEmote1`, `DetailsEmote2`, `DetailsEmote3`, `DetailsEmote4`, `DetailsEmoteDelay1`, `DetailsEmoteDelay2`, `DetailsEmoteDelay3`, `DetailsEmoteDelay4`, `IncompleteEmote`, `CompleteEmote`, `OfferRewardEmote1`, `OfferRewardEmote2`, `OfferRewardEmote3`, `OfferRewardEmote4`, `OfferRewardEmoteDelay1`, `OfferRewardEmoteDelay2`, `OfferRewardEmoteDelay3`, `OfferRewardEmoteDelay4`, `StartScript`, `CompleteScript`)
VALUES
(     41,        2,         -364,          1,           55,      0,                 0,               0,               0,                    0,                     0,                   0,                       0,                     0,                       0,                     0,                  0,           0,            0,              2,             0,             0,                0,                  0,       19227,              1,          0, 'Ace of Beasts',     'Shimmering on its surface is a beautifully drawn image of a wolf''s head. The art is like nothing you''ve ever seen before, and exudes antiquity. Although transfixed by the image, you wonder why someone would carry around such an ancient, yet simple curio in a place like this. You place it aside, moving to continue searching your enemy for spoils, only to realize that it is still in your hand.$B$BThere must be others like it. Perhaps you will find them in other places as dangerous as this.',                               'Collect the remaining Beasts cards.',     'Oh, my...$B$BSo they''ve resurfaced once again.', 'Do you have some business with me?', '',        'Beasts set collected',     '',               '',               '',                          0,            0,            0,            0,               0,               0,               0,               0,              0,              0,              0,              0,                 0,                 0,                 0,                 0,                    0,                    0,                    0,                    0,                       0,                       0,                       0,                       0,           23677,               0,               0,               0,                  0,                  0,                  0,                  0,                  0,                  0,                     0,                     0,                     0,                     0,                     0,                     0,            0,            0,            0,            0,               0,               0,               0,               0,              909,                0,                0,                0,                0,            350,              0,              0,              0,              0,               0,                  0,          0,              0,                   0,                  0,            0,        0,        0,          0,               0,               0,               0,               0,                    0,                    0,                    0,                    0,                 0,               1,                   0,                   0,                   0,                   0,                        0,                        0,                        0,                        0,             0,                0),
(     42,        2,         -364,          1,           55,      0,                 0,               0,               0,                    0,                     0,                   0,                       0,                     0,                       0,                     0,                  0,           0,            0,              2,             0,             0,                0,                  0,       19258,              1,          0, 'Ace of Warlords',   'Shimmering on its surface is a beautifully drawn image of a dual-bladed axe. The art is like nothing you''ve ever seen before, and exudes antiquity. Although transfixed by the image, you wonder why someone would carry around such an ancient, yet simple curio in a place like this. You place it aside, moving to continue searching your enemy for spoils, only to realize that it is still in your hand.$B$BThere must be others like it. Perhaps you will find them in other places as dangerous as this.',                            'Collect the remaining Warlords cards.',   'Oh, my...$B$BSo they''ve resurfaced once again.', 'Do you have some business with me?', '',        'Warlords set collected',   '',               '',               '',                          0,            0,            0,            0,               0,               0,               0,               0,              0,              0,              0,              0,                 0,                 0,                 0,                 0,                    0,                    0,                    0,                    0,                       0,                       0,                       0,                       0,           23678,               0,               0,               0,                  0,                  0,                  0,                  0,                  0,                  0,                     0,                     0,                     0,                     0,                     0,                     0,            0,            0,            0,            0,               0,               0,               0,               0,              909,                0,                0,                0,                0,            350,              0,              0,              0,              0,               0,                  0,          0,              0,                   0,                  0,            0,        0,        0,          0,               0,               0,               0,               0,                    0,                    0,                    0,                    0,                 0,               1,                   0,                   0,                   0,                   0,                        0,                        0,                        0,                        0,             0,                0),
(     43,        2,         -364,          1,           55,      0,                 0,               0,               0,                    0,                     0,                   0,                       0,                     0,                       0,                     0,                  0,           0,            0,              2,             0,             0,                0,                  0,       19268,              1,          0, 'Ace of Elementals', 'Shimmering on its surface is a beautifully drawn image of flames and water intertwined. The art is like nothing you''ve ever seen before, and exudes antiquity. Although transfixed by the image, you wonder why someone would carry around such an ancient, yet simple curio in a place like this. You place it aside, moving to continue searching your enemy for spoils, only to realize that it is still in your hand.$B$BThere must be others like it. Perhaps you will find them in other places as dangerous as this.',                 'Collect the remaining Elementals cards.', 'Oh, my...$B$BSo they''ve resurfaced once again.', 'Do you have some business with me?', '',        'Elementals set collected', '',               '',               '',                          0,            0,            0,            0,               0,               0,               0,               0,              0,              0,              0,              0,                 0,                 0,                 0,                 0,                    0,                    0,                    0,                    0,                       0,                       0,                       0,                       0,           23679,               0,               0,               0,                  0,                  0,                  0,                  0,                  0,                  0,                     0,                     0,                     0,                     0,                     0,                     0,            0,            0,            0,            0,               0,               0,               0,               0,              909,                0,                0,                0,                0,            350,              0,              0,              0,              0,               0,                  0,          0,              0,                   0,                  0,            0,        0,        0,          0,               0,               0,               0,               0,                    0,                    0,                    0,                    0,                 0,               1,                   0,                   0,                   0,                   0,                        0,                        0,                        0,                        0,             0,                0),
(     44,        2,         -364,          1,           55,      0,                 0,               0,               0,                    0,                     0,                   0,                       0,                     0,                       0,                     0,                  0,           0,            0,              2,             0,             0,                0,                  0,       19276,              1,          0, 'Ace of Portals',    'Shimmering on its surface is a beautifully drawn image of a grand vista visible through an oval window. The art is like nothing you''ve ever seen before, and exudes antiquity. Although transfixed by the image, you wonder why someone would carry around such an ancient, yet simple curio in a place like this. You place it aside, moving to continue searching your enemy for spoils, only to realize that it is still in your hand.$B$BThere must be others like it. Perhaps you will find them in other places as dangerous as this.', 'Collect the remaining Portals cards.',    'Oh, my...$B$BSo they''ve resurfaced once again.', 'Do you have some business with me?', '',        'Portals set collected',    '',               '',               '',                          0,            0,            0,            0,               0,               0,               0,               0,              0,              0,              0,              0,                 0,                 0,                 0,                 0,                    0,                    0,                    0,                    0,                       0,                       0,                       0,                       0,           23680,               0,               0,               0,                  0,                  0,                  0,                  0,                  0,                  0,                     0,                     0,                     0,                     0,                     0,                     0,            0,            0,            0,            0,               0,               0,               0,               0,              909,                0,                0,                0,                0,            350,              0,              0,              0,              0,               0,                  0,          0,              0,                   0,                  0,            0,        0,        0,          0,               0,               0,               0,               0,                    0,                    0,                    0,                    0,                 0,               1,                   0,                   0,                   0,                   0,                        0,                        0,                        0,                        0,             0,                0);

-- Add a condition for each new quest and non-Ace card
INSERT INTO `conditions`
(`condition_entry`, `type`, `value1`, `value2`)
VALUES
(              551,      2,    19230,        1),
(              552,      2,    19231,        1),
(              553,      2,    19232,        1),
(              554,      2,    19233,        1),
(              555,      2,    19234,        1),
(              556,      2,    19235,        1),
(              557,      2,    19236,        1),
(              558,      2,    19259,        1),
(              559,      2,    19260,        1),
(              560,      2,    19261,        1),
(              561,      2,    19262,        1),
(              562,      2,    19263,        1),
(              563,      2,    19264,        1),
(              564,      2,    19265,        1),
(              565,      2,    19269,        1),
(              566,      2,    19270,        1),
(              567,      2,    19271,        1),
(              568,      2,    19272,        1),
(              569,      2,    19273,        1),
(              570,      2,    19274,        1),
(              571,      2,    19275,        1),
(              572,      2,    19278,        1),
(              573,      2,    19279,        1),
(              574,      2,    19280,        1),
(              575,      2,    19281,        1),
(              576,      2,    19282,        1),
(              577,      2,    19283,        1),
(              578,      2,    19284,        1),
(              579,      9,       41,        1),
(              580,      9,       42,        1),
(              581,      9,       43,        1),
(              582,      9,       44,        1),
(              583,     -3,      551,        0),
(              584,     -3,      552,        0),
(              585,     -3,      553,        0),
(              586,     -3,      554,        0),
(              587,     -3,      555,        0),
(              588,     -3,      556,        0),
(              589,     -3,      557,        0),
(              590,     -3,      558,        0),
(              591,     -3,      559,        0),
(              592,     -3,      560,        0),
(              593,     -3,      561,        0),
(              594,     -3,      562,        0),
(              595,     -3,      563,        0),
(              596,     -3,      564,        0),
(              597,     -3,      565,        0),
(              598,     -3,      566,        0),
(              599,     -3,      567,        0),
(              600,     -3,      568,        0),
(              601,     -3,      569,        0),
(              602,     -3,      570,        0),
(              603,     -3,      571,        0),
(              604,     -3,      572,        0),
(              605,     -3,      573,        0),
(              606,     -3,      574,        0),
(              607,     -3,      575,        0),
(              608,     -3,      576,        0),
(              609,     -3,      577,        0),
(              610,     -3,      578,        0),
(              611,     -1,      579,      583),
(              612,     -1,      579,      584),
(              613,     -1,      579,      585),
(              614,     -1,      579,      586),
(              615,     -1,      579,      587),
(              616,     -1,      579,      588),
(              617,     -1,      579,      589),
(              618,     -1,      580,      590),
(              619,     -1,      580,      591),
(              620,     -1,      580,      592),
(              621,     -1,      580,      593),
(              622,     -1,      580,      594),
(              623,     -1,      580,      595),
(              624,     -1,      580,      596),
(              625,     -1,      581,      597),
(              626,     -1,      581,      598),
(              627,     -1,      581,      599),
(              628,     -1,      581,      600),
(              629,     -1,      581,      601),
(              630,     -1,      581,      602),
(              631,     -1,      581,      603),
(              632,     -1,      582,      604),
(              633,     -1,      582,      605),
(              634,     -1,      582,      606),
(              635,     -1,      582,      607),
(              636,     -1,      582,      608),
(              637,     -1,      582,      609),
(              638,     -1,      582,      610);

-- Make the spell that creates each deck complete the new quest for that deck
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

-- Replace the original Ace of each set with the new Ace for the creature who drops the original Ace
UPDATE `creature_loot_template` SET item = 1 WHERE item = 19227;
UPDATE `creature_loot_template` SET item = 2 WHERE item = 19258;
UPDATE `creature_loot_template` SET item = 3 WHERE item = 19268;
UPDATE `creature_loot_template` SET item = 4 WHERE item = 19276;

-- Make each new Ace a guaranteed drop
UPDATE `creature_loot_template`
SET
    `ChanceOrQuestChance` = 100,
    `maxcount` = 2, -- Expected number of players
    `mincountOrRef` = 2
WHERE `item` IN (1, 2, 3, 4);

-- Make each non-Ace card of each set require the new quest for that set and not drop if the player already has it
UPDATE `creature_loot_template` SET `condition_id` = 611 WHERE `item` = 19230;
UPDATE `creature_loot_template` SET `condition_id` = 612 WHERE `item` = 19231;
UPDATE `creature_loot_template` SET `condition_id` = 613 WHERE `item` = 19232;
UPDATE `creature_loot_template` SET `condition_id` = 614 WHERE `item` = 19233;
UPDATE `creature_loot_template` SET `condition_id` = 615 WHERE `item` = 19234;
UPDATE `creature_loot_template` SET `condition_id` = 616 WHERE `item` = 19235;
UPDATE `creature_loot_template` SET `condition_id` = 617 WHERE `item` = 19236;
UPDATE `creature_loot_template` SET `condition_id` = 618 WHERE `item` = 19259;
UPDATE `creature_loot_template` SET `condition_id` = 619 WHERE `item` = 19260;
UPDATE `creature_loot_template` SET `condition_id` = 620 WHERE `item` = 19261;
UPDATE `creature_loot_template` SET `condition_id` = 621 WHERE `item` = 19262;
UPDATE `creature_loot_template` SET `condition_id` = 622 WHERE `item` = 19263;
UPDATE `creature_loot_template` SET `condition_id` = 623 WHERE `item` = 19264;
UPDATE `creature_loot_template` SET `condition_id` = 624 WHERE `item` = 19265;
UPDATE `creature_loot_template` SET `condition_id` = 625 WHERE `item` = 19269;
UPDATE `creature_loot_template` SET `condition_id` = 626 WHERE `item` = 19270;
UPDATE `creature_loot_template` SET `condition_id` = 627 WHERE `item` = 19271;
UPDATE `creature_loot_template` SET `condition_id` = 628 WHERE `item` = 19272;
UPDATE `creature_loot_template` SET `condition_id` = 629 WHERE `item` = 19273;
UPDATE `creature_loot_template` SET `condition_id` = 630 WHERE `item` = 19274;
UPDATE `creature_loot_template` SET `condition_id` = 631 WHERE `item` = 19275;
UPDATE `creature_loot_template` SET `condition_id` = 632 WHERE `item` = 19278;
UPDATE `creature_loot_template` SET `condition_id` = 633 WHERE `item` = 19279;
UPDATE `creature_loot_template` SET `condition_id` = 634 WHERE `item` = 19280;
UPDATE `creature_loot_template` SET `condition_id` = 635 WHERE `item` = 19281;
UPDATE `creature_loot_template` SET `condition_id` = 636 WHERE `item` = 19282;
UPDATE `creature_loot_template` SET `condition_id` = 637 WHERE `item` = 19283;
UPDATE `creature_loot_template` SET `condition_id` = 638 WHERE `item` = 19284;

-- Remove patch-specific loot info for non-Ace cards
-- for universal applicability of this
DELETE FROM `creature_loot_template`
WHERE
    `patch_max` < 10 AND
    `condition_id` IN (
        611,
        612,
        613,
        614,
        615,
        616,
        617,
        618,
        619,
        620,
        621,
        622,
        623,
        624,
        625,
        626,
        627,
        628,
        629,
        630,
        631,
        632,
        633,
        634,
        635,
        636,
        637,
        638
    );


-- Make the non-Ace cards grouped guaranteed drops
UPDATE `creature_loot_template`
SET
    `ChanceOrQuestChance` = 0,
    `groupid` = 1,
    `maxcount` = 1,
    `mincountOrRef` = 1
WHERE `condition_id` IN (
    611,
    612,
    613,
    614,
    615,
    616,
    617,
    618,
    619,
    620,
    621,
    622,
    623,
    624,
    625,
    626,
    627,
    628,
    629,
    630,
    631,
    632,
    633,
    634,
    635,
    636,
    637,
    638
);
