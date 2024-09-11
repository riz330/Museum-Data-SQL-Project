-- create database museumdata;
use museumdata;

-- use database 
show tables;





-- show tables

show tables;

-- Checking data of all tables 
select * from museum;
select * from artist;
show tables;
select * from museum_hours;
select * from canvas_size;
select * from product_size;
select * from subject;
select * from work;

-- Joining Tables:
-- 1. Retrieve the full name of artists along with the names of the museums where their works are displayed.
select a.full_name,w.name as workname,m.name as museumname from work as w
inner join artist as a
on a.artist_id =w.artist_id
inner join museum as m
on w.museum_id=m.museum_id;


-- 2. Group By and Count:
-- How many works does each artist have in the database? Display the artist's full name along with the count of their works, ordered by the count in descending order.
create view data as
select a.full_name,w.name as workname,m.name as museumname from work as w
inner join artist as a
on a.artist_id =w.artist_id
inner join museum as m
on w.museum_id=m.museum_id;

select * from data;



select full_name,count(*) as CountOfWorkDoneByArtist from  data
group by full_name
order by CountOfWorkDoneByArtist desc;




-- 3. Order By and Limit:
-- List the top 5 museums with the highest number of works displayed in the database, along with their respective counts.


create view abc as
select w.work_id,w.name as workname,artist_id,city,m.name as museumname from work as w
inner join 
museum as m
on w.museum_id=m.museum_id;

select museumname,count(*) as noofwork  from abc
group by museumname
order by noofwork desc
limit 5;

-- 4. Join, Order By, and Limit:
-- Display the names and styles of the works along with the corresponding museum names, ordered by the museum name in ascending order. Limit the results to 10.
show tables;
select w.name,w.style,m.name as museumname from work as w
inner join
museum as m
on w.museum_id=m.museum_id
order by museumname
limit 10;






-- 5.Join, Group By, and Sum:
-- Show the total sale price for each artist's works. Display the artist's full name along with the total sale price, ordered by the total sale price in descending order.
create view xyx as 
select a.full_name,p.sale_price from artist as a
inner join work as w
on a.artist_id=w.artist_id
inner join product_size as p
on w.work_id=p.work_id;

select full_name,sum(sale_price) as totalsales from xyx
group by full_name
order by totalsales desc;


-- 6. Join, Group By, and Having:
-- List artists who have more than 3 works in the database, along with the count of their works.
create view fx as
select  a.artist_id,a.full_name,w.work_id from artist as a
inner join 
work as w
on a.artist_id=w.artist_id;
select full_name,count(*) as workcount from fx
group by full_name
having workcount>3
order by workcount
;



-- 7. Join, Where, and Order By:
-- Retrieve the names of works and their corresponding artists' full names for works that have a sale price smaller than their regular price. 
create view xux as
select a.full_name,w.name as workname,p.sale_price,p.regular_price  from work as w
inner join
artist as a
on w.artist_id=a.artist_id
inner join
product_size as p
on w.work_id=p.work_id
;
select * from product_size;
select * from xux
where sale_price < regular_price
order by sale_price desc;



-- 8. Join, Group By, and Average:
-- Calculate the average height and width of the artworks in the database. Display the average height and width.



create view qwe as
select w.name as artwork,c.width,c.height from product_size as p
inner join
canvas_size as c
on p.size_id=c.size_id
inner join
work as w
on p.work_id=w.work_id
;
select artwork,avg(width),avg(height) from qwe
group by artwork
order by avg(width);


-- Join, Group By, and Max:
-- 9 Find the maximum sale price among all the works in each museum. Display the museum name along with the maximum sale price.

create view salemus as
select m.name,p.sale_price from work as w
inner join
product_size as p
on w.work_id=p.work_id
inner join museum as m
on w.museum_id=m.museum_id;
  
select name as museumname,max(sale_price) as maximumsaleprice from salemus  
group by museumname
order by maximumsaleprice desc ;


-- Join, Group By, and Concatenate:
-- 10. Concatenate the first name and last name of artists along with their nationality, separated by a comma. Display the concatenated string along with the count of works by each artist, ordered by the count in descending order.
create view fgh as
select concat_ws(',',first_name,last_name,nationality) from artist;

alter view fgh as
select concat_ws(',',first_name,last_name,nationality) as Intro,full_name from artist;


create view intro as
select f.Intro,a.full_name,w.work_id,a.artist_id from fgh 
inner join 
artist as a
on f.full_name=a.full_name
inner join
work as w
on a.artist_id=w.artist_id
;

select intro,count(*) as countofwork from intro
group by intro
order by countofwork desc;

