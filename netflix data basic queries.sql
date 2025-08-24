CREATE TABLE netflix
(
    show_id      VARCHAR(5),
    type         VARCHAR(10),
    title        VARCHAR(250),
    director     VARCHAR(550),
    casts        VARCHAR(1050),
    country      VARCHAR(550),
    date_added   VARCHAR(55),
    release_year INT,
    rating       VARCHAR(15),
    duration     VARCHAR(15),
    listed_in    VARCHAR(250),
    description  VARCHAR(550)
);



-- 1. Count how many Movies and TV Shows are in the dataset
SELECT 
    type,
    COUNT(*)
FROM netflix
GROUP BY 1;


-- 2. Find the total number of unique countries that have produced content for Netflix
SELECT COUNT(DISTINCT country) AS unique_countries 
FROM netflix;


-- 3. Get the earliest and latest release years of content available on Netflix
SELECT MIN(release_year) AS earliest_year, MAX(release_year) AS latest_year
FROM netflix;


-- 4. Top 10 countries producing the most Netflix content 
SELECT country, COUNT(*) AS total_titles
FROM netflix
WHERE country IS NOT NULL
GROUP BY country
ORDER BY total_titles DESC
LIMIT 10;


-- 5. Top 10 most common genres on Netflix
-- shows which content categories dominate the platform
SELECT genre, COUNT(*) AS total
FROM (
    SELECT unnest(string_to_array(listed_in, ', ')) AS genre
    FROM netflix
) AS genres
GROUP BY genre
ORDER BY total DESC
LIMIT 10;


-- 6. Total number of titles released each year, ordered from most to least

SELECT release_year, COUNT(*) AS total_titles
FROM netflix
GROUP BY release_year
ORDER BY total_titles DESC;


-- 7. Top 5 most common content ratings on Netflix 
-- helps understand target audience categories
SELECT rating, COUNT(*) AS total
FROM netflix
GROUP BY rating
ORDER BY total DESC
LIMIT 5;


-- 8. All content released in 2020

SELECT type, title
FROM netflix
WHERE release_year = 2020;


-- 9. All titles by the most frequent director on Netflix 
SELECT *
FROM netflix
WHERE director = (
    SELECT director
    FROM netflix
    WHERE director IS NOT NULL
    GROUP BY director
    ORDER BY COUNT(*) DESC
    LIMIT 1
);


-- 10. All titles featuring the actor "Salman Khan"
--  filtering by specific cast member
SELECT * 
FROM netflix
WHERE casts LIKE '%Salman Khan%';


-- 11. Top 10 most frequently appearing actors in Netflix content from Turkey
-- useful for understanding popular talent in a specific market
SELECT 
    UNNEST(STRING_TO_ARRAY(casts, ',')) AS actor,
    COUNT(*)
FROM netflix
WHERE country = 'Turkey'
GROUP BY actor
ORDER BY COUNT(*) DESC
LIMIT 10;


-- 12. Top 15 longest-running TV Shows (by number of seasons)

SELECT title, duration
FROM netflix
WHERE type = 'TV Show'
  AND CAST(SPLIT_PART(duration, ' ', 1) AS INTEGER) > 5
ORDER BY CAST(SPLIT_PART(duration, ' ', 1) AS INTEGER) DESC
LIMIT 15;




