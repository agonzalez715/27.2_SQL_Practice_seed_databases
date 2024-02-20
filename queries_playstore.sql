-- Find the app with an ID of 1880:
SELECT * FROM apps WHERE app_id = 1880;

-- Find the ID and app name for all apps that were last updated on August 01, 2018:
SELECT app_id, app_name FROM apps WHERE last_updated = '2018-08-01';

-- Count the number of apps in each category:
SELECT category, COUNT(*) FROM apps GROUP BY category;

-- Find the top 5 most-reviewed apps and the number of reviews for each:
SELECT app_name, reviews FROM apps ORDER BY reviews DESC LIMIT 5;

-- Find the app that has the most reviews with a rating greater than or equal to 4.8:
SELECT app_name FROM apps WHERE rating >= 4.8 ORDER BY reviews DESC LIMIT 1;

-- Find the average rating for each category ordered by the highest rated to lowest rated:
SELECT category, AVG(rating) AS avg_rating FROM apps GROUP BY category ORDER BY avg_rating DESC;

-- Find the name, price, and rating of the most expensive app with a rating that’s less than 3:
SELECT app_name, price, rating FROM apps WHERE rating < 3 ORDER BY price DESC LIMIT 1;

-- Find all apps with a min install not exceeding 50, that have a rating. Order your results by highest rated first:
SELECT * FROM apps WHERE min_installs <= 50 AND rating IS NOT NULL ORDER BY rating DESC;

-- Find the names of all apps that are rated less than 3 with at least 10000 reviews:
SELECT app_name FROM apps WHERE rating < 3 AND reviews >= 10000;

-- Find the top 10 most-reviewed apps that cost between 10 cents and a dollar:
SELECT app_name FROM apps WHERE price >= 0.10 AND price <= 1.00 ORDER BY reviews DESC LIMIT 10;

-- Find the most out of date app.
SELECT * FROM apps ORDER BY last_updated ASC LIMIT 1;

-- Find the most expensive app:
SELECT * FROM apps ORDER BY price DESC LIMIT 1;

-- Count all the reviews in the Google Play Store:
SELECT SUM(reviews) AS total_reviews FROM apps;

-- Find all the categories that have more than 300 apps in them:
SELECT category FROM apps GROUP BY category HAVING COUNT(*) > 300;

-- Find the app that has the highest proportion of min_installs to reviews, among apps that have been installed at least 100,000 times:
SELECT app_name, reviews, min_installs, (min_installs / reviews) AS proportion
FROM apps
WHERE min_installs >= 100000
ORDER BY proportion DESC
LIMIT 1;
