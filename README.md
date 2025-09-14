# 🎬 Netflix SQL Data Analyst Project
<p align="center">
  <img src="https://upload.wikimedia.org/wikipedia/commons/7/75/Netflix_icon.svg" alt="Netflix Logo" width="120"/>
</p>

## 📌 Introduction
This project analyzes **Netflix’s dataset** using **PostgreSQL** to extract meaningful insights about its content library.  
The goal is to demonstrate **SQL skills** in data exploration, transformation, and analysis.

---

## 🛠 Tools Used
- **PostgreSQL** → Database management & query execution  
- **pgAdmin** → SQL editor and database interface  

---

## 📂 Dataset Description
The dataset contains information about Netflix titles, including:  

- **title**  
- **type** (Movie / TV Show)  
- **director**  
- **casts**  
- **country**  
- **release_year**  
- **rating**  
- **duration**  
- **listed_in** (Genres)  
- **date_added** (When it was added to Netflix)  

---

## 🧩 SQL Concepts Used
- `SELECT & FROM`  
- `WHERE`  
- `GROUP BY`  
- `ORDER BY`  
- `LIMIT`  
- `DISTINCT`  
- **Aggregate Functions**  
- **Subqueries**  

---

## ❓ Questions & SQL Queries 
-- 1️⃣ How many Movies vs TV Shows are there?

SELECT 
    type,
    COUNT(*)
FROM netflix
GROUP BY 1;

-- 2️⃣ How many unique countries have content on Netflix?

SELECT COUNT(DISTINCT country) AS unique_countries 
FROM netflix;

-- 3️⃣ What’s the earliest and latest release year in the dataset?

SELECT MIN(release_year) AS earliest_year, MAX(release_year) AS latest_year
FROM netflix;

-- 4️⃣ Which 10 countries produce the most content?

SELECT country, COUNT(*) AS total_titles
FROM netflix
WHERE country IS NOT NULL
GROUP BY country
ORDER BY total_titles DESC
LIMIT 10;

-- 5️⃣ What are the top 10 most common genres?

SELECT genre, COUNT(*) AS total
FROM (
    SELECT unnest(string_to_array(listed_in, ', ')) AS genre
    FROM netflix
) AS genres
GROUP BY genre
ORDER BY total DESC
LIMIT 10;

-- 6️⃣ Which years had the most content released?

SELECT release_year, COUNT(*) AS total_titles
FROM netflix
GROUP BY release_year
ORDER BY total_titles DESC;

-- 7️⃣ What are the top 5 content ratings on Netflix?

SELECT rating, COUNT(*) AS total
FROM netflix
GROUP BY rating
ORDER BY total DESC
LIMIT 5;







