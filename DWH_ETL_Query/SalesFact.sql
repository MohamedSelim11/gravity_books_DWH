select customer_id , price , OL.book_id , b.title  , cost ,order_date ,sm.method_id
from cust_order CO
inner join order_line OL
on CO.order_id = OL.order_id
inner join book B
on OL.book_id = B.book_id
inner join shipping_method SM
on CO.shipping_method_id = SM.method_id