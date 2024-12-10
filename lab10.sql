create database lab10;

create table books(
    book_id   Integer primary key ,
    title Varchar,
    author Varchar,
     price Decimal,
    quantity Integer
);

create table orders(
    order_id Integer primary key ,
    book_id Integer references books(book_id),
    customer_id Integer,
    order_date Date,
    quantity Integer
);


create table customers(
    customer_id Integer primary key ,
    name Varchar,
    emai Varchar
);

insert into books  values ( 1 , 'Database 101', 'A. Smith' , 40.00 , 10 ),
                          (2 , 'Learn SQL' , 'B. Johnson' , 35.00 , 15),
                          (3 , 'Advanced DB' , 'C. Lee' , 50.00 , 5);

insert into customers values (101 , 'John Doe' , 'johndoe@example.com' ),
                             ( 102 , 'Jane Doe' , 'janedoe@example.com' );


begin transaction isolation level read committed;
insert into orders values (1,1,101,now(),2);
update books
set quantity=quantity-2 where book_id=1;
commit;

select * from orders;

select * from books;





begin transaction;
    insert into orders values (3,3,102,now(),10);

    select books.quantity from books
    where book_id=3;



    do
    $$
    begin
        if (select quantity from orders where order_id=3)>(select quantity from books where book_id=3) then
            rollback;
        else
            update books
            set quantity=quantity-10 where book_id=3;
        end if;
    end;
    $$



commit;



begin transaction isolation level read committed
update books
set price=price-5 where book_id=1;
commit;

begin transaction isolation level read committed
select price from books
where book_id=1;
commit;

begin transaction isolation level read committed
update customers
set emai='asd' where customer_id=101;
commit;

select * from customers;
