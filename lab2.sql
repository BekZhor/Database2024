create database lab2;

create table countries(
    country_id serial primary key ,
    country_name varchar,
    region_id integer,
    population integer
);


insert into countries(country_name,region_id,population) values('austria',12,10000000);
select * from countries;
insert into countries(country_name) values('france');

update countries
set region_id=null;

insert into countries values
    (

    default,'egupt',default,98000000
    ),
    (default,'japan',default,123000000),
    (default,'uk',default,68000000);

alter table countries
alter column country_name set default 'Kazakhstan';


insert into countries values (default,default,default,default);


create table countries_new(
    like countries including all
);

insert into countries_new select * from countries;

select * from countries_new;

update countries
    set region_id=1 where region_id is null;


update countries
    set population=population*1.1
    returning country_name , population as new_population;

insert into countries(population) values (28000);

delete from countries
    where population<100000;

delete from countries_new using countries
    where countries_new.country_id=countries.country_id
    returning *;

delete from countries
    returning *;


drop table countries_new;