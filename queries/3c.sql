-- BEGIN SOLUTION
WITH class_units AS (
    SELECT 
        class,
        COUNT(DISTINCT units) AS distinct_units_count
    FROM metadata
    GROUP BY class
)

SELECT 
    BOOL_AND(distinct_units_count = 1) AS are_units_consistent
FROM class_units;

-- END SOLUTION
