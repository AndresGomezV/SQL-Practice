SELECT title, score
FROM hacker_news
ORDER by score DESC
LIMIT 5;

/*Recent studies have found that online forums tend to be dominated by a small percentage of their users (1-9-90 Rule).

Is this true of Hacker News?

Is a small percentage of Hacker News submitters taking the majority of the points?

First, find the total score of all the stories.*/

SELECT SUM(score)
FROM hacker_news;

/*Next, we need to pinpoint the users who have accumulated a lot of points across their stories.

Find the individual users who have gotten combined scores of more than 200, and their combined scores.*/

SELECT user, SUM(score)
FROM hacker_news
GROUP BY user
HAVING SUM(score) > 200
ORDER BY 2 DESC;

/*Then, we want to add these users’ scores together and divide by the total to get the percentage.

Add their scores together and divide it by the total sum*/

SELECT (517 + 309 + 304 + 282) / 6366.0; /* 22% */

/*How many times has each offending user posted this link?*/

SELECT user, count (*)
FROM hacker_news
WHERE url LIKE '%watch?v=dQw4w9WgXcQ'
GROUP BY user
ORDER BY COUNT(*) DESC;

/* OR */

SELECT user, count (*)
FROM hacker_news
WHERE url LIKE '%watch?v=dQw4w9WgXcQ'
GROUP BY 1
ORDER BY 2 DESC;

/*Hacker News stories are essentially links that take users to other websites.

Which of these sites feed Hacker News the most:

GitHub, Medium, or New York Times?

First, we want to categorize each story based on their source.

We can do this using a CASE statement:

Next, build on the previous query:

Add a column for the number of stories from each URL using COUNT().

Also, GROUP BY the CASE statement.

Remember that you can refer to a column in GROUP BY using a number.*/

SELECT CASE
  WHEN url like '%github.com%' THEN 'GitHub'
  WHEN url like '%medium.com%' THEN 'Medium'
  WHEN url like '%nytimes.com%' THEN 'New York Times'
END AS 'Source',
COUNT(*)
FROM hacker_news
GROUP BY 1;

/*What's the best time to post a story?*/

SELECT strftime('%H', timestamp) AS 'Hour', ROUND(AVG(score)) AS 'Score/Hour', COUNT(*) AS 'Stories/Hour'
FROM hacker_news
WHERE timestamp IS NOT NULL
GROUP BY 1
ORDER BY 2 DESC;