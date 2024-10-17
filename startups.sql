SELECT * 
FROM startups;

SELECT COUNT(*) 
FROM startups;

SELECT SUM(valuation) 
FROM startups;

SELECT MAX(raised) 
FROM startups;

SELECT MAX(raised) 
FROM startups
WHERE stage = 'Seed'; 

SELECT MIN(founded)
FROM startups;

SELECT AVG(valuation)
FROM startups;

SELECT category, AVG(valuation)
FROM startups
GROUP BY category;

SELECT category, ROUND(AVG(valuation), 2)
FROM startups
GROUP BY category;

/*Return the average valuation, in each category.
Round the averages to two decimal places.
Lastly, order the list from highest averages to lowest.*/
SELECT category, ROUND(AVG(valuation), 2)
FROM startups
GROUP BY 1
ORDER BY 2 DESC;

/*First, return the name of each category with the total number of companies that belong to it.*/
SELECT category, COUNT(*)
FROM startups
GROUP BY category;

/*Next, filter the result to only include categories that have more than three companies in them.*/
SELECT category, COUNT(*)
FROM startups
GROUP BY category
HAVING COUNT(*) > 3;

/*What is the average size of a startup in each location?*/
SELECT location, ROUND(AVG(employees))
FROM startups
GROUP BY location;

/*What is the average size of a startup in each location, with average sizes above 500?*/
SELECT location, ROUND(AVG(employees))
FROM startups
GROUP BY location
HAVING AVG(employees) > 500;