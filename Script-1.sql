create table if not exists Genres(
	genres_id SERIAL not null primary key,
	title VARCHAR(150) not null
);
create table if not exists Performers(
	perfomers_id SERIAL not null primary key,
	nickname VARCHAR(150) not null
);
create table if not exists GenresPerformers(
	id SERIAL not null primary key,
	genres_id integer not null references Genres(genres_id),
	perfomers_id integer not null references Performers(perfomers_id),
	UNIQUE (genres_id, perfomers_id)
);
create table if not exists Albums(
	albums_id SERIAL not null primary key,
	traks_id integer not null references Tracks(tracks_id),
	albums_name VARCHAR(150) not null,
	year_of_release DATE not null
);
create table if not exists PerformersAlbums(
	id SERIAL not null primary key,
	perfomers_id integer not null references Performers(perfomers_id),
	albums_id integer not null references Albums(albums_id),
	UNIQUE (perfomers_id, albums_id)
);
create table if not exists Tracks(
	tracks_id SERIAL not null primary key,
	track_name VARCHAR(150) not null,
	duration interval not null
);
create table if not exists Collections(
	collections_id SERIAL not null primary key,
	collection_name VARCHAR(150) not null,
	year_of_release DATE not null
);
create table if not exists CollectionsTrack(
	id SERIAL not null primary key,
	collections_id integer not null references Collections(collections_id),
	tracks_id integer not null references Tracks(tracks_id),
	UNIQUE (collections_id, tracks_id)
);