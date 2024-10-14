create database lab5;

create table customers(
    customer_id int,
    cust_name varchar,
    city varchar,
    grade int,
    salesman_id int
);

create table orders(
    ord_no int,
    purch_amt float,
    ord_date date,
    customer_id int,
    salesman_id int
);

create table salesman(
    salesman_id int,
    name varchar,
    city varchar,
    comission float

);

INSERT INTO customers (customer_id, cust_name, city, grade, salesman_id) VALUES
(3002, 'Nick Rimando', 'New York', 100, 5001),
(3005, 'Graham Zusi', 'California', 200, 5002),
(3001, 'Brad Guzan', 'London', 100, 5005),
(3004, 'Fabian Johns', 'Paris', 300, 5006),
(3007, 'Brad Davis', 'New York', 200, 5001),
(3009, 'Geoff Camero', 'Berlin', 100, 5003),
(3008, 'Julian Green', 'London', 300, 5002);
INSERT INTO orders (ord_no, purch_amt, ord_date, customer_id, salesman_id) VALUES
(70001, 150.50, '2012-10-05', 3005, 5002),
(70009, 270.65, '2012-09-10', 3001, 5005),
(70002, 65.26, '2012-10-05', 3002, 5001),
(70004, 110.50, '2012-08-17', 3009, 5003),
(70007, 948.50, '2012-09-10', 3005, 5002),
(70005, 2400.60, '2012-07-27', 3007, 5001),
(70008, 5760.00, '2012-09-10', 3002, 5001);
INSERT INTO salesman (salesman_id, name, city, comission) VALUES
(5001, 'James Hoog', 'New York', 0.15),
(5002, 'Nail Knite', 'Paris', 0.13),
(5005, 'Pit Alex', 'London', 0.11),
(5006, 'Mc Lyon', 'Paris', 0.14),
(5003, 'Lauson Hen', 'London', 0.12),
(5007, 'Paul Adam', 'Rome', 0.13);


select * from customers;
select * from orders;
select * from salesman;


select sum(orders.purch_amt) from orders;

select avg(orders.purch_amt) from orders;

select count(cust_name) from customers
where cust_name is not null;

select min(orders.purch_amt) from orders;

select * from customers
where cust_name like '%o';


select ord_no,purch_amt,ord_date,orders.customer_id,orders.salesman_id from orders,customers
where orders.customer_id=customers.customer_id and customers.city='New York';

select distinct on(customers.customer_id) customers.customer_id,cust_name,city,grade,customers.salesman_id from customers,orders
where orders.customer_id=customers.customer_id and purch_amt>100;


select sum(customers.grade) from customers;


select customers.cust_name from customers
where cust_name is not null;

select max(customers.grade) from customers;
