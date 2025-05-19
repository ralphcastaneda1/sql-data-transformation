-- BEGIN SOLUTION
WITH multi_match_buildings AS (
    -- Find building_names with multiple distinct site mappings
    SELECT rem.building_name
    FROM real_estate_metadata rem
    JOIN buildings_site_mapping bsm ON rem.building_name = bsm.building
    GROUP BY rem.building_name
    HAVING COUNT(DISTINCT bsm.site) > 1  
)

SELECT 
    rem.building_name,
    JSON_AGG(DISTINCT bsm) AS json_agg  
FROM real_estate_metadata rem
JOIN buildings_site_mapping bsm ON rem.building_name = bsm.building
WHERE rem.building_name IN (SELECT building_name FROM multi_match_buildings)
GROUP BY rem.building_name
ORDER BY rem.building_name ASC
LIMIT 4;  

-- END SOLUTION
