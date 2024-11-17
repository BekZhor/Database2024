create database lab8;

create table salesman(
    salesman_id int,
    name varchar,
    city varchar,
    commission float
);

create table customers(
    customer_id int,
    cust_name varchar,
    city varchar,
    grade int,
    salesman_id int
);

create table orders
(
    ord_no      int,
    purch_amt   float,
    ord_date    date,
    customer_id int,
    salesman_id int
);

insert into salesman values (5001,
'James Hoog',
'New York',
0.15),(
5002,
'Nail Knite',
'Paris',
0.13),(
5005,
'Pit Alex',
'London',
0.11),(
5006,
'Mc Lyon',
'Paris',
0.14),(
5003,
'Lauson Hen',default,
0.12),(
5007,
'Paul Adam',
'Rome',
0.13);

select * from salesman;


insert into customers values (3002,
'Nick Rimando',
'New York',
100,
5001),(
3005,
'Graham Zusi',
'California',
200,
5002),(
3001,
'Brad Guzan',
'London',default,
5005),(
3004,
'Fabian Johns',
'Paris',
300,
5006),(
3007,
'Brad Davis',
'New York',
200,
5001),(
3009,
'Geoff Camero',
'Berlin',
100,
5003),(
3008,
'Julian Green','London',
300,
5002);


select * from customers;


insert into orders values (70001,
150.5,
'2012-10-05', 3005,
5002),(
70009,
270.65,
'2012-09-10', 3001,
5005),(
70002,
65.26,
'2012-10-05' ,3002,
5001),(
70004,
110.5,
'2012-08-17', 3009,
5003),(
70007,
948.5,
'2012-09-10', 3005,
5002),(
70005,
2400.6,
'2012-07-27' ,3007,
5001),(
70008,
5760,
'2012-09-10' ,3002,
5001);


create role junior_dev login;

select rolname from pg_roles;

create view salesman_from_NY as
    select * from salesman
where city='New York';

select * from salesman_from_NY;

create view ord_tab as
    select ord_no,salesman.name,customers.cust_name from orders,salesman,customers
    where orders.salesman_id=salesman.salesman_id and orders.customer_id=customers.customer_id;

select * from ord_tab;

create role superusers superuser ;

grant superusers to junior_dev;

create view cust_tab as
    select cust_name,grade  from customers
    where grade =all (select max(grade) from customers);

select * from cust_tab;

alter role junior_dev nosuperuser ;

alter role junior_dev nologin;

grant select on lab8.public.customers to junior_dev;


create or replace view num_tab as
    select city,count(name) from salesman
    group by city
    having city is not null;

select * from num_tab;

create view cust_num as
    select name,count(cust_name) from salesman, customers
    where customers.salesman_id=salesman.salesman_id
    group by name ;

create role intern;

grant junior_dev to intern;