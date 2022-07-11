Insert into reader_address (street_name, street_number, zip, city)
	values
	('Musterstraße', '67', '69115', 'Mannheim'),
	('Feldweg', '13', '69115', 'Heidelberg'),
	('Hauptstaße', '152', '69115', 'Mannheim'),
	('Rosenweg', '12', '69115', 'Mannheim'),
	('Kaiser-Wilhelm-Straße', '5', '67061', 'Ludwigshafen'),
	('Schulweg', '24', '69115', 'Mannheim'),
	('Schulweg', '24', '69115', 'Mannheim');


Insert into readers (f_name, l_name, phone_nr, email, sex, reader_address)
	values
	('Lea', 'Müller', 0643276348, 'lea.müller@gmx.de', 'f', 1),
	('Tobias', 'Kraußmann', 06432862458, 'tobias.kraussmann@gmail.com', 'm', 2),
	('Harald', 'Job', 0623145289, 'h.job@gmx.de', 'm', 3),
	('Sarah', 'Deutsch', 06231649802, 'deutsch.sarah@googlemail.com', 'f', 4),
	('Peter', 'Hohl', 06543348233, 'peter.hohl@gmail.com', 'm', 5),
	('Markus', 'Meier', 0654352437, 'meier.markus@gmx.de', 'm', 6),
	('Johanna', 'Meier', 0654352437, 'meier.johanna@gmx.de', 'f', 7);
	
Insert into locations (street_name, street_number, zip, city)
	values
	('Holunderbütenstraße', '4', '68159', 'Mannheim' ),
	('Hauptstraße', '132', '68159', 'Mannheim' ),
	('Feldweg', '24', '69115', 'Heidelberg' );
	
insert into media (title, category, isbn, publisher, place_of_publication, year_of_publication, price, locations)
	values
	('Freiheit für alle: Das Ende der Arbeit wie wir sie kannten', 'Fachbücher für Sozialwissenschaft', '3442315514', 'Goldmann Verlag', 'NaN', '2022', 24.00, 1),
	('oxen. Noctis', 'Thriller', '3423263245', 'dtv Verlagsgesellschaft mbH & Co. KG', 'NaN', '2022', 16.95, 1),
	('Die Rezeptur', 'Thriller', '3944676351', 'Kafel Verlag', 'NaN', '2022', 10.99, 1),
	('Der böse Mann', 'Thriller', '3944676319', 'Kafel Verlag','NaN', '2021', 10.99, 2),
	('Gesunde Ernährung 3 in 1 Kochbuch', 'Ratgeber', '979-8689228419', 'Independently published', 'NaN', '2020', 14.95, 2),
	('Die Paradiese von gestern', 'Roman', '3963116145', 'Mitteldeutscher Verlag', 'NaN', '2022', 28.00, 2),
	('Single Bald Female', 'Roman', '152907424X', 'Macmillan', 'NaN', '2022', 18.79, 1),
	('Kein Wort mehr über Liebe', 'Roman', '3499008319', 'Rowohlt Taschenbuch', 'NaN', '2021', 12.00, 3),
	('Die Anomalie', 'Thriller', '-', 'Rowohlt', 'NaN', '2021', 22.00, 3 ),
	('Der Salzpfad', 'Roman', '-', 'DUMONT REISEVERLAG', 'NaN', '2019', 10.00, 3 ),
	('Die Betrogene', 'Krimi', '978-3-7341-0085-7', 'Blanvalet', 'NaN', '2015', 10.99, 1),
	('Das Rosie-Projekt', 'Roman', '978-3-596-19700-2', 'Fischer Taschenbuch', 'NaN', '2015', 11.00, 2 ),
	('Er ist wieder da', 'Roman', '978-3-404-17178-1', 'Bastei Lübbe', 'NaN', '2014', 11.00, 3 ),
	('Vielleicht mag ich dich morgen', 'Roman', '978-3-426-51647-8', 'Knaur Taschenbuch', 'NaN', '2014', 10.99, 1 ),
	('Vielleicht mag ich dich morgen', 'Roman', '978-3-426-51647-8', 'Knaur Taschenbuch', 'NaN', '2014', 10.99, 2 ),
	('Vielleicht mag ich dich morgen', 'Roman', '978-3-426-51647-8', 'Knaur Taschenbuch', 'NaN', '2014', 10.99, 2 ),
	('Die Paradiese von gestern', 'Roman', '3963116145', 'Mitteldeutscher Verlag', 'NaN', '2022', 28.00, 3 );
	
	
Insert into author (f_name, l_name)
	values
	('Catherine', 'Sheperd'),
	('Lidia', 'Ahlers'),
	('Mario', 'Schneider'),
	('Laura', 'Price'),
	('Herve', 'Le Tellier'),
	('Romy', 'Ritte'),
	('Jürgen', 'Ritte'),
	('Raynor', 'Winn'),
	('Christa', 'Prummer-Lehmair'),
	('Heide', 'Horn'),
	('Charlotte', 'Link'),
	('Graeme', 'Simsion'),
	('Timur', 'Vermes'),
	('Mhairi', 'McFaralane'),
	('Richard David', 'Precht'),
	('Jens Henrik', 'Jensen'),
	('Friederike', 'Buchinger');
	
	
	
Insert into employees (f_name, l_name, locations)
	values
	('Hannah', 'Grab', 1),
	('Felix', 'Schmitz', 1),
	('Simon', 'Lutz', 2),
	('Fabienne', 'Fußer', 2),
	('Lena', 'Kurz', 3),
	('Rebecca', 'Bossert', 3);
	

Insert into loan (reader, media, is_it_returned)
	values
	(4, 10, 'no'),
	(3, 16, 'no'),
	(5, 7, 'no'),
	(1, 8, 'no');
	

Insert into rel_media_author (media, author)
	values
	(1, 15),
	(2, 16),
	(2, 17),
	(3, 1),
	(4, 1),
	(5, 2),
	(6, 3),
	(7, 4),
	(8, 5),
	(8, 6),
	(8, 7),
	(9, 5),
	(9, 6),
	(9, 7),
	(10, 8),
	(10, 9),
	(10, 10),
	(11, 11),
	(12, 12),
	(13, 13),
	(14, 14),
	(15, 14),
	(16, 14),
	(17, 3);
	
	
