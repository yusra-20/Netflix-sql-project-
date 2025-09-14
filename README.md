# 🎬 Netflix SQL Data Analyst Project

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

## ❓ Questions & SQL Queries with Outputs  

### 1️⃣ How many Movies vs TV Shows are there?
```sql
SELECT 
    type,
    COUNT(*)
FROM netflix
GROUP BY 1;

 type     | count
----------+-------
 Movie    | 6131
 TV Show  | 2676

### 2️⃣ QUERY: How many unique countries have content on Netflix?
```sql
SELECT COUNT(DISTINCT country) AS unique_countries 
FROM netflix;

 unique_countries
------------------
 748









