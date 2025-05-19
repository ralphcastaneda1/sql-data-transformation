-- BEGIN SOLUTION
WITH multi_match_buildings AS (
    SELECT building_name
    FROM real_estate_metadata
    GROUP BY building_name
    HAVING COUNT(*) > 1
)

SELECT 
    bsm.building,
    JSON_AGG(
        json_build_object(
            'location', rem.location,
            'building', rem.building,
            'building_name', rem.building_name,
            'address', rem.address,
            'city_name', rem.city_name,
            'county', rem.county
        )
    ) AS json_agg
FROM buildings_site_mapping bsm
JOIN real_estate_metadata rem
  ON bsm.building = rem.building_name
WHERE bsm.building IN (
    SELECT building_name FROM multi_match_buildings
)
GROUP BY bsm.building
ORDER BY bsm.building ASC;

-- END SOLUTION
