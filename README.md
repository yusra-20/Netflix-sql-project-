# Netflix sql data analyst project

![Netflix_logo](https://github.com/yusra-20/Netflix-sql-project-/blob/main/LOGO.png)
## Introduction

This project analyzes Netflix’s dataset using PostgreSQL to extract meaningful insights about its content library.
The goal is to demonstrate SQL skills in data exploration, transformation, and analysis.

## Tools Used

PostgreSQL – Database management & query execution
pgAdmin – SQL editor and database interface

## Dataset Description
The dataset contains information about Netflix titles, including:

title   Name of the movie/show
type    Whether it's a Movie or TV Show
director   Director(s) of the content
casts  Actors featured
country   Country of origin
release_year    Year of release
rating  Content rating (TV-MA, PG-13, etc.)
duration  Runtime (Movies: minutes, TV Shows: seasons)
listed_in    Genre(s) of the title
date_added  When it was added to Netflix

##SQL Concepts Used

SELECT & FROM : Retrieving specific columns and data from tables.
WHERE : Filtering data based on conditions (WHERE release_year = 2020, WHERE casts LIKE '%Salman Khan%').
GROUP BY : Summarizing data by categories (GROUP BY type, GROUP BY country).
ORDER BY : Sorting results (ORDER BY total_titles DESC, ORDER BY release_year).
LIMIT : Restricting number of results (LIMIT 10, LIMIT 15).
DISTINCT : Getting unique values (COUNT(DISTINCT country)).
Aggregate Functions : COUNT(), MIN(), MAX().
String Functions : STRING_TO_ARRAY(), UNNEST(), SPLIT_PART(), LIKE.
Subqueries : Finding the director with the most titles.

## Questions & SQL Queries

1.How many Movies vs TV Shows are there?
2. How many unique countries have content on Netflix?
3. What’s the earliest and latest release year in the dataset?
4.Which 10 countries produce the most content?
5.What are the top 10 most common genres?
6. Which years had the most content released?
7. What are the top 5 content ratings on Netflix?
8. Who is the most featured director on Netflix?
9. What are the longest-running TV Shows (more than 5 seasons)?
10. What titles feature actor Salman Khan?
