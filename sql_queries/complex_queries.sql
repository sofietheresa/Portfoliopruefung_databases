-- inner join: show books which are currently borrowed and the reader who has it and the date they have to return it
select med.media_id, med.title, r.f_name, r.l_name, l.return_date from loan l
inner join media med on l.media = med.media_id
inner join readers r on l.reader = r.readers_id
where l.is_it_returned = 'false'

-- renaming: Tobias and Lea got married - Tobias changes his last name (he has to authenticate with his id)
update readers set l_name = 'Müller' where readers_id=2;


-- aggregate function (count): amount of books every author has written in the inventory of the library
select rel.author, aut.f_name ||' '|| aut.l_name as author, count(rel.media) from author aut
right join rel_media_author rel on rel.author = aut.author_id 
group by rel.author, aut.f_name, aut.l_name, author
order by count desc;

-- nested function: show all authors who wrote at least one book of the inventory of the library which is written before 2020 and the respective book(s) 
select distinct aut.f_name, aut.l_name, med.title, med.year_of_publication from rel_media_author rel
right join media med on med.media_id = rel.media
right join author aut on aut.author_id = rel.author
where (select cast(med.year_of_publication as int) from media med where med.media_id = rel.media) < 2020;

-- count media on every location
select loc.locations_id, loc.city, count(med.title) from locations loc
left join media med on med.locations = loc.locations_id
group by loc.locations_id, loc.city

-- set operation: create list of all people having a connection to the library either as customer or as employee
select emp.f_name, emp.l_name from employees emp
union select re.f_name, re.l_name from readers re

-- get complete personal information of all readers living in Mannheim
select radd.reader_address_id, re.f_name, re.l_name, radd.street_name, radd.street_number, radd.city, re.phone_nr, re.email from reader_address radd
inner join readers re on re.readers_id = radd.reader_address_id 
where radd.city = 'Mannheim'

-- find publisher with the most books in the inventory of the library
select max(med.publisher) as most_occuring_publisher from media med

-- show in which locations medium with media_id=1 is located 
select med.media_id, med.title, loc.locations_id, loc.city from media med
inner join locations loc on loc.locations_id = med.locations
where med.media_id = 1

-- show books written by Mhairi McFaralane, its media descriptions and where it is located
select aut.author_id, aut.f_name ||' '|| aut.l_name, med.media_id, med.title, med.category, med.isbn, med.publisher, med.year_of_publication, med.price, med.locations from author aut
inner join rel_media_author rel on aut.author_id = rel.author
inner join media med on med.media_id = rel.media
where aut.f_name = 'Mhairi' and aut.l_name = 'McFaralane'

-- show amount of feminin customers
select count(*) from readers
where sex = 'f'

-- show amount of book 'Vielleicht mag ich dich morgen' written by Mhairi McFaralane in every location
select loc.locations_id, sum(case when med.title='Vielleicht mag ich dich morgen' and aut.author_id = 14 and aut.f_name = 'Mhairi' and aut.l_name = 'McFaralane' then 1 else 0 end) from locations loc 
left join media med on loc.locations_id = med.locations
left join rel_media_author rel on med.media_id = rel.media
left join author aut on rel.author = aut.author_id
group by loc.locations_id;

-- loan with id=2 is getting returned at the current day --> loan table needs to get updated 
update loan set is_it_returned = 'true', return_date = current_date
where loan_id = 2;
select * from loan
order by loan_id;