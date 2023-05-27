UPDATE creature_template SET health_multiplier = health_multiplier * .43 WHERE entry IN (
    9043, -- Scarshield Grunt
    9044, -- Scarshield Sentry
    9046  -- Scarshield Quartermaster
);
