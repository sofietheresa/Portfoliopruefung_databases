CREATE TABLE reader_address(
	reader_address_id serial UNIQUE NOT NULL,
	primary key(reader_address_id),
	street_name character varying(300) NOT NULL,
	street_number character varying(4) NOT NULL,
	zip character varying(20),
	city character varying(40)
);

CREATE TABLE readers(
	readers_id serial UNIQUE NOT NULL,
	primary key(readers_id),
	f_name character varying(200) NOT NULL,
	l_name character varying(200) NOT NULL,
	phone_nr character varying(20),
	email character varying(300),
	sex character varying (1),
	reader_address integer not null,
	foreign key (reader_address) references reader_address(reader_address_id),
	date_joined date NOT NULL DEFAULT current_date
);

CREATE TABLE locations(
	locations_id serial UNIQUE NOT NULL,
	primary key(locations_id),
	street_name character varying(300) NOT NULL,
	street_number character varying(4) NOT NULL,
	zip character varying(20),
	city character varying(40)
);

CREATE TABLE media(
	media_id serial UNIQUE NOT NULL,
	primary key(media_id),
	title character varying(200) NOT NULL,
	category character varying(100) NOT NULL,
	ISBN character varying(60) NOT NULL,
	publisher character varying (100) NOT NULL,
	place_of_publication character varying(200) NOT NULL,
	year_of_publication character varying(20) NOT NULL,
	price numeric NOT NULL,
	locations integer not null,
	foreign key (locations) references locations(locations_id)
);

CREATE TABLE loan(
	loan_id serial UNIQUE NOT NULL,
	primary key(loan_id),
	reader integer not null,
	media integer not null,
	is_it_returned boolean not null,
	foreign key (reader) references readers(readers_id),
	foreign key (media) references media(media_id),
	loan_date date not null default current_date,
	return_date date not null default current_date+7
);

CREATE TABLE dun(
	dun_id serial UNIQUE NOT NULL,
	primary key(dun_id),
	loan integer,
	foreign key (loan) references loan(loan_id),
	first_dun date not null default current_date+8
);

CREATE TABLE author(
	author_id serial UNIQUE NOT NULL,
	primary key(author_id),
	f_name character varying(200) NOT NULL,
	l_name character varying(200) NOT NULL
);

CREATE TABLE rel_media_author(
	media integer, 
	author integer, 
	foreign key (media) references media(media_id),
	foreign key (author) references author(author_id)
);

CREATE TABLE employees(
	employees_id serial UNIQUE NOT NULL,
	primary key(employees_id),
	f_name character varying(200) NOT NULL,
	l_name character varying(200) NOT NULL,
	locations integer,
	foreign key (locations) references locations(locations_id)
)

