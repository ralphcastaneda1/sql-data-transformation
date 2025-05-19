DROP VIEW IF EXISTS gaps;
CREATE VIEW gaps AS

-- BEGIN SOLUTION
WITH quantized_data AS (
    SELECT 
        id,
        DATE_TRUNC('minute', time) AS time,
        value
    FROM data
),

lagged_data AS (
    SELECT 
        id,
        time,
        value,
        LAG(time) OVER (PARTITION BY id ORDER BY time) AS lag_time,
        LAG(value) OVER (PARTITION BY id ORDER BY time) AS lag_value,
        (time - LAG(time) OVER (PARTITION BY id ORDER BY time)) AS time_diff
    FROM quantized_data
)

SELECT 
    id,
    time,
    value,
    lag_time,
    lag_value,
    time_diff
FROM lagged_data
WHERE time_diff >= INTERVAL '30 minutes';

-- END SOLUTION

SELECT * FROM gaps ORDER BY id, time;
