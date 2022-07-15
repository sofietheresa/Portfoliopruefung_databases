create view Borrowed_books_with_reader as
	SELECT loan.loan_id, 
    loan.reader, 
    loan.media, 
    loan.is_it_returned,
    media.media_id, 
    media.title, 
    media.locations, 
    readers.readers_id, 
    readers.f_name, 
    readers.l_name 
   FROM loan 
     JOIN media ON loan.media = media.media_id 
     JOIN readers ON readers.readers_id = loan.reader 
  WHERE loan.is_it_returned = false; 
  
create materialized view Reader_with_addresses as
	SELECT readers.readers_id, 
    readers.f_name, 
    readers.l_name, 
    readers.reader_address, 
    reader_address.reader_address_id, 
    reader_address.street_name, 
    reader_address.street_number, 
    reader_address.zip, 
    reader_address.city 
   FROM readers 
     JOIN reader_address ON readers.readers_id = reader_address.reader_address_id; 
	 
