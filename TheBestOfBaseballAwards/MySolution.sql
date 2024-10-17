--Heaviest Hitters

SELECT teams.name, ROUND(AVG(people.weight),2) AS Avg_weight, batting.yearid
FROM people
JOIN batting
    ON people.playerid = batting.playerid
JOIN teams
	ON batting.team_id = teams.id
GROUP BY teams.name, batting.yearid
ORDER BY Avg_weight DESC;

/*Shortest Sluggers*/

SELECT teams.name, ROUND(AVG(people.height),2) AS Avg_height, batting.yearid
FROM people
JOIN batting
    ON people.playerid = batting.playerid
JOIN teams
	ON batting.team_id = teams.id
GROUP BY teams.name, batting.yearid
ORDER BY Avg_height ASC;

/*Biggest Spenders*/

SELECT teams.name, SUM(salaries.salary) AS salary_sum, salaries.yearid
FROM salaries
LEFT JOIN teams
	ON salaries.teamid = teams.teamid
  AND salaries.yearid = teams.yearid
GROUP BY teams.name, salaries.yearid
ORDER BY salary_sum DESC;

/*Most Bang For Their Buck In 2010*/ 


 SELECT teams.name, ROUND(SUM(salaries.salary)/teams.w) AS cpw, salaries.yearid, teams.w
FROM salaries
LEFT JOIN teams
	ON salaries.teamid = teams.teamid
  AND salaries.yearid = teams.yearid
WHERE teams.yearid = 2010
GROUP BY teams.name, salaries.yearid, teams.w
ORDER BY cpw ASC;

/*Priciest Starter*/

SELECT people.namegiven, pitching.yearid, pitching.gs, ROUND(salaries.salary/pitching.g) AS cpg
FROM salaries
JOIN pitching
	ON salaries.playerid = pitching.playerid
  AND salaries.yearid = pitching.yearid
  AND salaries.teamid = pitching.teamid
JOIN people
	ON salaries.playerid = people.playerid
WHERE pitching.gs > 10
ORDER BY cpg DESC;