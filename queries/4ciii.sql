DROP VIEW IF EXISTS likely_data;
CREATE VIEW likely_data AS
-- BEGIN SOLUTION

SELECT
    id,
    time,
    value,
    run,
    run_start,
    next_val,
    run_end,
    run_rank,
    run_size,
    CASE
        WHEN value IS NOT NULL THEN value
        ELSE run_start + (run_end - run_start) * run_rank::float / run_size
    END AS interpolated
FROM backward;


-- END SOLUTION

SELECT * FROM likely_data WHERE run_size > 2 ORDER BY id, time LIMIT 100;
