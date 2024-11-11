create database lab7;


create table coutries
(
    name varchar
);

create table employees(
    name varchar,
    surname varchar,
    salary int,
    department_id int
);

create table department(
    department_id int,
    budget int
);


create index countries_index on coutries using hash (name);

create index employees_index on employees  (name,surname);

create unique index employees_unique_index on employees (salary);

create index employees_fun_index on employees (substring(name,1,4));

create index index_test on employees  (salary,department_id);

create index index_test1 on department (budget,department_id);

SELECT * FROM pg_catalog.pg_indexes
WHERE schemaname = 'public';
