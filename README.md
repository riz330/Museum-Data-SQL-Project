# MuseumData_Project

Project Overview:
The MuseumData_Project contains a database that includes various tables such as museum, artist, work, product_size, museum_hours, and more. This project demonstrates SQL queries used for various data retrieval and manipulation tasks, such as joining tables, grouping data, calculating aggregates, and more.

Files and Queries Overview:
Database Creation:

The database is named museumdata and includes several tables storing information about artists, artworks, museums, and associated metadata (canvas sizes, product sizes, etc.).
sql
Copy code
create database museumdata;
use museumdata;
Table Viewing and Exploration:

This step retrieves data from all major tables (artist, museum, work, etc.) for exploration.
sql
Copy code
show tables;
select * from artist;
select * from work;
Joins and Data Queries:

Various SQL queries use joins to link related tables and retrieve detailed insights. For example, joining work, artist, and museum to show which artist’s works are displayed in which museums.
sql
Copy code
select a.full_name, w.name as workname, m.name as museumname
from work as w
inner join artist as a on a.artist_id = w.artist_id
inner join museum as m on w.museum_id = m.museum_id;
Aggregations and Grouping:

Queries that aggregate data, such as counting the number of works by each artist or finding the total sale price of their works.
sql
Copy code
select full_name, count(*) as CountOfWorkDoneByArtist 
from data
group by full_name
order by CountOfWorkDoneByArtist desc;
Top Museums and Works:

SQL queries that retrieve the top 5 museums with the most works displayed, as well as other queries that show the most profitable works and highest-selling artists.
sql
Copy code
select museumname, count(*) as noofwork  
from abc
group by museumname
order by noofwork desc
limit 5;
Conditional Queries:

Example queries retrieve works with specific conditions, such as artworks sold for less than their regular price.
sql
Copy code
select * from xux
where sale_price < regular_price
order by sale_price desc;
Summarizing Data:

Calculations like the average height and width of works, the maximum sale price per museum, and artists with more than 3 works in the database.
sql
Copy code
select artwork, avg(width), avg(height)
from qwe
group by artwork;
How to Use This Project:
Set Up Database:

Run the provided SQL commands to create the database museumdata and its associated tables.
Populate tables with appropriate data using INSERT statements or import scripts.
Query Execution:

Execute the SQL queries provided in the project to extract insights from the dataset, such as which artists' works are displayed in specific museums or sales-related information.
Modifications:

Users can modify and extend the SQL queries to suit their specific needs. For example, adding new conditions, adjusting groupings, or applying different filtering criteria.
Important Notes:
This project assumes the user is familiar with basic SQL concepts, including joins, groupings, and aggregations.
Ensure that the data within the tables follows the expected structure (e.g., artist_id and work_id are correctly linked between the artist and work tables).
For performance improvements, it is recommended to use indexing on columns used frequently in join and group operations (e.g., artist_id, museum_id, etc.).
