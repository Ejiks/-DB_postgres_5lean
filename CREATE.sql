CREATE TABLE if not exists Genre (
	id_gene serial primary key,
	genre_name varchar(40) not null
);

CREATE TABLE if not exists Author (
	id_author serial primary key,
	nickname varchar(40) not null
);

CREATE TABLE if not exists Collection_info (
	id_collection serial primary key,
	name varchar(40) not null,
	release_year integer not null
);

CREATE TABLE if not exists Album (
	id_album serial primary key,
	album_name varchar(40) not null,
	release_year integer not null
);

CREATE TABLE if not exists Track (
	id_track serial primary key,
	track_name varchar(40) not null,
	duration numeric,
	id_album integer references Album(id_album)
);

CREATE TABLE if not exists Author_gene_llist(
	id_gene integer references Genre(id_gene), 
	id_author integer references Author(id_author), 
	constraint pk_Author_gene_llist primary key (id_gene, id_author)
);

CREATE TABLE if not exists Album_authors(
	id_album integer references Album(id_album), 
	id_author integer references Author(id_author), 
	constraint pk_Album_authors primary key (id_album, id_author)
);

CREATE TABLE if not exists Collection(
	id_track integer references Track(id_track), 
	id_collection integer references Collection_info(id_collection), 
	constraint pk_Collection primary key (id_track, id_collection)
);