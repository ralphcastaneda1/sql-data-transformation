DROP VIEW IF EXISTS complete;
CREATE VIEW complete AS

-- BEGIN SOLUTION
WITH generated_readings AS (
    SELECT
        g.id,
        g.lag_time + (n * INTERVAL '15 minutes') AS time,
        NULL::double precision AS value
    FROM gaps g
    CROSS JOIN GENERATE_SERIES(
        1,
        (EXTRACT(EPOCH FROM (g.time - g.lag_time))/60/15)::int - 1
    ) AS n
)

SELECT id, time, value FROM data
UNION ALL
SELECT id, time, value FROM generated_readings
ORDER BY id, time;
-- END SOLUTION

SELECT * FROM complete ORDER BY id, time LIMIT 100;
