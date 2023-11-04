select b.book_id , title , au.author_name , bl.language_name , pu.publisher_name from book b 
left outer join book_author  ba on b.book_id=ba.book_id 
 left outer join author au on au.author_id=ba.author_id
 left outer join book_language bl on bl.language_id=b.language_id
 left outer join publisher pu on pu.publisher_id=b.publisher_id