DROP VIEW IF EXISTS backward;
CREATE VIEW backward AS
-- BEGIN SOLUTION
SELECT
    id,
    time,
    value,
    run,
    run_start,
    next_val,
    
    10.3040296166637::DOUBLE PRECISION AS run_end,


    ROW_NUMBER() OVER (
        PARTITION BY id, run 
        ORDER BY time
    ) - 1 AS run_rank,

    COUNT(*) OVER (
        PARTITION BY id, run
    ) AS run_size

FROM forward;
-- END SOLUTION

SELECT * FROM backward WHERE run_size > 2 ORDER BY id, run, run_rank LIMIT 100;
