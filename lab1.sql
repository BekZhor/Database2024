create database lab1;

create table users(
    id            serial,
    firstname     varchar(50),
    lastname      varchar(50)
);

alter table users
    add column isadmin int;
alter table users
    alter column isadmin set data type boolean
    using isadmin::boolean ;

alter table users
    alter column isadmin set default false;


alter table users
    add  primary key(id);

create table tasks(
    id        serial,
    name      varchar(50),
    user_id   integer
);

alter table users
    drop column isadmin;

drop table tasks;




drop database lab1;