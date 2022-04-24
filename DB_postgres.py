from pprint import pprint
import sqlalchemy

engine = sqlalchemy.create_engine('postgresql://postgres:delphi098@localhost:5432/music_shop2')
engine
connection = engine.connect()

for i in range(1,11):
    connection.execute(
    f"""INSERT INTO Genre(id_gene, genre_name)
    VALUES(default, 'genre{str(i)}');
    """)

for i in range(1,11):
    connection.execute(
    f"""INSERT INTO Author
    VALUES(default, 'author{str(i)}');
    """)

for i in range(1,11):
    connection.execute(
    f"""INSERT INTO Author_gene_llist
    VALUES({i}, {str(i)});
    """)

for i in range(1,10):
    connection.execute(
    f"""INSERT INTO collection_info
    VALUES(default, 'name{str(i)}', 201{i});
    """)

for i in range(1,10):
    connection.execute(
    f"""INSERT INTO Album
    VALUES(default, 'album_name{str(i)}', 201{i});
    """)

for i in range(1,16):
    connection.execute(
    f"""INSERT INTO Track
    VALUES(default, 'track_name{str(i)}', {1/2*i}, {i/2});
    """)

for i in range(1,10):
    connection.execute(
    f"""INSERT INTO Album_authors
    VALUES({i}, {i});
    """)

for i in range(1,9):
    connection.execute(
    f"""INSERT INTO Collection
    VALUES({i}, {i});
    """)

for i in range(1,19):
    connection.execute(
    f"""UPDATE Track
    SET track_name = 'my track_name{i}'
    WHERE id_album = {i/5};
    """)
