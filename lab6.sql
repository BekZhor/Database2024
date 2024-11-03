create database lab6;

create table locations(
    locations_id serial primary key ,
    street_adress varchar(25),
    postal_code varchar(12),
    city varchar(30),
    state_province varchar(12)
);

create table departments(
    departments_id serial primary key ,
    department_name varchar(50) UNIQUE ,
    budget int,
    locations_id int references locations
);


create table employees(
    employees_id serial primary key ,
    first_name varchar(50),
    last_name varchar(50),
    email varchar(50),
    phone_number varchar(20),
    salary int,
    departments_id int references  departments
);

select * from locations;
select * from departments;
select  * from employees;






insert into locations default values ;
insert into locations values (default,'flemm','1234','Almaty','Oblast'),
                             (default,'jolk','1235','Ben','Kol');

insert into departments values (default,'mon',50000,1),
                               (default,'von',23000,2);

insert into employees values (default,'Ken','Fom','fom@mail','3456',45000,1),
                             (default,'Koln','Lofn','lofn@mail','6789',60000,3);

insert into departments default values ;

insert into employees default values ;


select employees.first_name,employees.last_name,departments.department_name,departments.departments_id from employees inner join departments on employees.departments_id=departments.departments_id;

select employees.first_name,employees.last_name,departments.department_name,departments.departments_id from employees inner join departments on department_name='mon' and employees.departments_id=departments.departments_id;

select employees.first_name,employees.last_name,departments.department_name,locations.city,locations.state_province from employees join (departments cross join locations) on employees.departments_id=departments.departments_id and departments.locations_id=locations.locations_id;

select department_name,d.departments_id,budget,locations_id from employees  right join departments d on d.departments_id = employees.departments_id



select employees.first_name,employees.last_name,departments.departments_id,departments.department_name from employees left join departments on employees.departments_id=departments.departments_id;

