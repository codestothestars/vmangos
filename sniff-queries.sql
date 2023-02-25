-- Get spell cast delays from previous, by creature guid.
-- First row is first cast diffed with aggro time.
SELECT caster_guid, current_action, previous_action, current_action - previous_action delay
FROM (
    -- First cast after aggro
--     SELECT spell_cast_start.caster_guid, MIN(spell_cast_start.unixtimems) current_action, MIN(creature_guid_values_update.unixtimems) previous_action
--     FROM spell_cast_start
--         JOIN creature_guid_values_update ON spell_cast_start.caster_guid = creature_guid_values_update.guid
--     WHERE spell_cast_start.caster_id = 10316 AND spell_cast_start.spell_id = 16045 AND creature_guid_values_update.field_name = 'Target'
--     GROUP BY spell_cast_start.caster_guid, spell_cast_start.spell_id
--     UNION
    -- Remaining casts
    SELECT `current`.caster_guid, `current`.unixtimems current_action, MAX(COALESCE(previous_same.unixtimems, previous.unixtimems)) previous_action
    FROM spell_cast_start `current`
        JOIN spell_cast_start previous ON `current`.caster_guid = previous.caster_guid AND `current`.spell_id = previous.spell_id AND `current`.unixtimems > previous.unixtimems
        LEFT JOIN spell_cast_start previous_same ON previous.caster_guid = previous_same.caster_guid AND previous.spell_id = previous_same.spell_id AND previous.unixtimems > previous_same.unixtimems AND (previous.unixtimems - 2000) < previous_same.unixtimems
    WHERE `current`.caster_id = 10316 AND `current`.spell_id = 16045
    GROUP BY `current`.caster_guid, `current`.unixtimems
) q
ORDER BY caster_guid, current_action;

-- Get spell cast delays from previous, by spell.
-- First row is first cast diffed with aggro time.
SELECT spell_id, current_action, previous_action, current_action - previous_action delay
FROM (
    -- First cast after aggro
    SELECT spell_cast_start.spell_id, MIN(spell_cast_start.unixtimems) current_action, MIN(creature_guid_values_update.unixtimems) previous_action
    FROM spell_cast_start
        JOIN creature_guid_values_update ON spell_cast_start.caster_guid = creature_guid_values_update.guid
    WHERE spell_cast_start.caster_id = 9816 AND creature_guid_values_update.field_name = 'Target'
    GROUP BY spell_cast_start.spell_id
    HAVING current_action >= previous_action
    UNION
    -- Remaining casts
    SELECT `current`.spell_id, `current`.unixtimems current_action, MAX(COALESCE(previous_same.unixtimems, previous.unixtimems)) previous_action
    FROM spell_cast_start `current`
        JOIN spell_cast_start previous ON `current`.caster_guid = previous.caster_guid AND `current`.spell_id = previous.spell_id AND `current`.unixtimems > previous.unixtimems
        LEFT JOIN spell_cast_start previous_same ON previous.caster_guid = previous_same.caster_guid AND previous.spell_id = previous_same.spell_id AND previous.unixtimems > previous_same.unixtimems AND (previous.unixtimems - 2000) < previous_same.unixtimems
    WHERE `current`.caster_id = 9816
    GROUP BY `current`.spell_id, `current`.unixtimems
--     HAVING (current_action - 2000) > previous_action
) q
ORDER BY spell_id, current_action;
