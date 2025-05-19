DROP VIEW IF EXISTS labeled_data;
CREATE VIEW labeled_data AS

-- BEGIN SOLUTION
WITH sensor_medians AS (
    SELECT 
        id,
        PERCENTILE_DISC(0.5) WITHIN GROUP (ORDER BY value) AS median
    FROM data
    GROUP BY id
),

absolute_deviations AS (
    SELECT 
        d.time,
        d.id,
        d.value,
        sm.median,
        ABS(d.value - sm.median) AS abs_deviation
    FROM data d
    JOIN sensor_medians sm ON d.id = sm.id
),

sensor_mads AS (
    SELECT 
        id,
        PERCENTILE_DISC(0.5) WITHIN GROUP (ORDER BY abs_deviation) AS mad
    FROM absolute_deviations
    GROUP BY id
)

SELECT 
    d.time,
    d.id,
    d.value,
    sm.median,
    mad.mad,
    CASE
        WHEN mad.mad = 0 THEN FALSE
        WHEN ABS(d.value - sm.median) > (3 * 1.4826 * mad.mad) THEN TRUE
        ELSE FALSE
    END AS is_outlier
FROM data d
JOIN sensor_medians sm ON d.id = sm.id
JOIN sensor_mads mad ON d.id = mad.id;

-- END SOLUTION

(SELECT * FROM labeled_data WHERE is_outlier ORDER BY time, id LIMIT 50)
UNION ALL
(SELECT * FROM labeled_data WHERE NOT is_outlier ORDER BY time, id LIMIT 50);
