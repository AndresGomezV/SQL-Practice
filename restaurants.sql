SELECT DISTINCT neighborhood
FROM nomnom;

SELECT DISTINCT cuisine
FROM nomnom;

SELECT *
FROM nomnom
WHERE cuisine = 'Chinese';

SELECT *
FROM nomnom
WHERE review > 4;

SELECT *
FROM nomnom
WHERE cuisine = 'Italian' AND price = '$$$' /*Price is exactly*/

/*OR*/

SELECT *
FROM nomnom
WHERE cuisine = 'Italian' AND price LIKE '%$$$%' /*price is at least $$$*/

SELECT *
FROM nomnom
WHERE name LIKE '%meatball%'

SELECT *
FROM nomnom
WHERE neighborhood = 'Midtown'
    OR neighborhood = 'Downtown' 
    OR neighborhood = 'Chinatown';

SELECT *
FROM nomnom
WHERE health IS NULL;

SELECT *
FROM nomnom
ORDER BY review DESC
LIMIT 10;

SELECT name,
  CASE
    WHEN review > 4.5 THEN 'Extraordinary'
    WHEN review > 4 THEN 'Excellent'
    WHEN review > 3 THEN 'Good'
    WHEN review > 2 THEN 'Fair'
    ELSE 'Poor'
  END AS 'Clasification'
FROM nomnom;