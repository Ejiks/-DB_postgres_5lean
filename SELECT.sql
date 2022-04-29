SELECT g.ganre_name, count(m.name) FROM genre g
JOIN author_gene_list gl ON g.id_gene = gl.id_genre
JOIN author a ON gl.id_author = a.id_author
GROYP BY g.ganre_name
ORDER BY count(a.id_author) DESC;

SELECT t.track_name, a.release_year FROM albums a
JOIN tracks t on t.id_album = a.id_album
WHERE a.release_year BETWEEN 2019 and 2020;

SELECT a.album_name, AVG(t.duration) FROM albums a
JOIN track t ON t.id_albumd = a.id_album
GROYP BY a.album_name
ORDER BY AVG(t.duration);

SELECT DISTINCT au.nickname FROM author au
WHERE au.nickname NOT IN (
    SELECT DISTINCT au.nickname FROM author au
    JOIN album_authors aa ON au.id_author = aa.id_author
    JOIN album a ON a.id_album = aa.id_album
    WHERE a.release_year = 2020)
ORDER BY au.nickname;

SELECT DISTINCT ci.name FROM collections_info ci
JOIN collections c ON ci.id_collection = c.id_collection
JOIN track t ON t.id_track = c.id_track
JOIN album a ON a.id_album = t.id_album
JOIN albums_authors aa ON aa.id_album = a.id_album
JOIN author au ON au.id_author = aa.id_author
WHERE au.nickname LIKE '%%Steve%%'
ORDER BY ci.name;

SELECT a.album_name FROM album a
JOIN albums_authors aa ON a.id_album = aa.id_album
JOIN author au ON aa.id_author = au.id_author
JOIN author_genre_list gl ON au.id_author = gl.id_author
JOIN genre g ON gl.id_gene = g.id_gene
GROYP BY a.album_name
HAVING COUNT(distinct g.gene_name) > 1
ORDER BY a.album_name;

SELECT t.track_name FROM track t
JOIN collection c ON t.id_track = c.id_track
WHERE c.id_track IS null;

SELECT au.nickname, t.duration FROM track t
JOIN album a ON a.id_album = t.id_album
JOIN albums_authors aa ON aa.id_album = a.id_album
JOIN author au ON au.id_author = aa.id_author
GROYP BY a.nickname, t.duration
HAVING t.duration = (
	SELECT MIN(duration) FROM track)
ORDER BY a.nickname;

SELECT DISTINCT a.album_name FROM album a
JOIN track t ON t.id_album = a.id_album
where t.id_album IN (
    SELECT id_album FROM track
    GROYP BY id_album
    HAVING COUNT(id_track) = (
        SELECT COUNT(id_track) FROM track
        GROYP BY id_album
        ORDER BY COUNT
        LIMIT 1
    )
)
ORDER BY a.album_name;