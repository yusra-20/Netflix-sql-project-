# 🎬 Netflix SQL Data Analyst Project

## 📌 Introduction
This project analyzes **Netflix’s dataset** using **PostgreSQL** to extract meaningful insights about its content library.  
The goal is to demonstrate **SQL skills** in data exploration, transformation, and analysis.

## 🛠 Tools Used
- **PostgreSQL** → Database management & query execution  
- **pgAdmin** → SQL editor and database interface  

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

## 🧩 SQL Concepts Used
- `SELECT & FROM`  
- `WHERE`  
- `GROUP BY`  
- `ORDER BY`  
- `LIMIT`  
- `DISTINCT`  
- **Aggregate Functions**  
- **Subqueries**  

## ❓ Questions & SQL Queries with Outputs

### 1️⃣ How many Movies vs TV Shows are there?
```sql
SELECT 
    type,
    COUNT(*)
FROM netflix
GROUP BY 1;
Output:

pgsql
Copy code
 type     | count
----------+-------
 Movie    | 6131
 TV Show  | 2676
2️⃣ How many unique countries have content on Netflix?
sql
Copy code
SELECT COUNT(DISTINCT country) AS unique_countries 
FROM netflix;
Output:

diff
Copy code
 unique_countries
------------------
 748
3️⃣ What’s the earliest and latest release year in the dataset?
sql
Copy code
SELECT MIN(release_year) AS earliest_year, MAX(release_year) AS latest_year
FROM netflix;
Output:

yaml
Copy code
 earliest_year | latest_year
---------------+-------------
 1925          | 2021
4️⃣ Which 10 countries produce the most content?
sql
Copy code
SELECT country, COUNT(*) AS total_titles
FROM netflix
WHERE country IS NOT NULL
GROUP BY country
ORDER BY total_titles DESC
LIMIT 10;
Output:

diff
Copy code
 country        | total_titles
----------------+--------------
 India          | 972
 United Kingdom | 419
 Japan          | 245
 South Korea    | 199
 Canada         | 181
 Spain          | 145
 France         | 124
 Mexico         | 110
 Egypt          | 106
5️⃣ What are the top 10 most common genres?
sql
Copy code
SELECT genre, COUNT(*) AS total
FROM (
    SELECT unnest(string_to_array(listed_in, ', ')) AS genre
    FROM netflix
) AS genres
GROUP BY genre
ORDER BY total DESC
LIMIT 10;
Output:

yaml
Copy code
 genre                     | total
---------------------------+-------
 Dramas                    | 2427
 Comedies                  | 1674
 International TV Shows    | 1351
 Documentaries             | 869
 Action & Adventure        | 859
 TV Dramas                 | 763
6️⃣ Which years had the most content released?
sql
Copy code
SELECT release_year, COUNT(*) AS total_titles
FROM netflix
GROUP BY release_year
ORDER BY total_titles DESC;
Output:

yaml
Copy code
 release_year | total_titles
--------------+--------------
 2018         | 1147
 2017         | 1032
 2019         | 1030
 2020         | 953
 2016         | 902
 2021         | 592
 2015         | 560
7️⃣ What are the top 5 content ratings on Netflix?
sql
Copy code
SELECT rating, COUNT(*) AS total
FROM netflix
GROUP BY rating
ORDER BY total DESC
LIMIT 5;
Output:

yaml
Copy code
 rating | total
--------+------
 TV-MA  | 3207
 TV-14  | 2160
 TV-PG  | 863
 R      | 799
 PG-13  | 490
yaml
Copy code

---







