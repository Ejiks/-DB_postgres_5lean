SELECT album_name, release_year from Album
WHERE release_year = 2018;

SELECT track_name, duration from Track
WHERE duration = (SELECT MAX(duration) FROM Track);

SELECT track_name, duration from Track
WHERE duration >= 3.5;

SELECT name from Collection_info
WHERE release_year BETWEEN 2018 and 2020;

SELECT nickname from Author
WHERE nickname NOT LIKE '% %';

SELECT track_name from Track
WHERE track_name LIKE 'my %' or track_name LIKE '% my %' or track_name LIKE '% my';