-- BEGIN SOLUTION
SELECT NOT EXISTS (
    SELECT subject
    FROM ontology
    WHERE predicate = 'http://www.w3.org/2000/01/rdf-schema#subClassOf'
    GROUP BY subject
    HAVING COUNT(DISTINCT object) > 1
) AS is_tree;

-- END SOLUTION
