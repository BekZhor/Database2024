create database lab9;

create


insert into employee values('ben','greenfen',36);
insert into employee default values ;
select * from employee;

create function increase_vale(val int) returns int as
    $$
    begin
    return val+10;
    end;

    $$
language plpgsql;

select increase_vale(10);

create or replace function compare_numbers(val int,val2 int,out gr numeric,out ls numeric,out eq numeric)  as
    $$
    begin
        if exists(select val,val2 where val=val2) then
            eq := val;
        else

        gr := greatest(val,val2);
        ls := least(val,val2);
        end if;
    end;
    $$
language plpgsql;

select compare_numbers(7,2);
drop function number_series(val int);

create or replace function number_series(val int) returns int[] as
    $$
    declare
        r int;
        arr int[];
    begin
        r:=0;
       while r<=val loop
        arr:= array_append(arr,r);
        r:=r+1;


        end loop;
        return arr;
    end;
    $$
language plpgsql;
select number_series(10);


drop function find_employee(n varchar);

create or replace function find_employee(n varchar,out sur varchar,out ag int)   as
$$
    begin
        sur:=  (select surname from employee
        where name=n);
        ag :=(select age from employee
                          where name=n);
    end;

$$
language plpgsql;

select find_employee('ben');

select * from find_employee('null');


create function square(a int) returns int as
    $$
    begin
        return a*a;
    end;
    $$
language plpgsql;
drop function pifagor(a int, b int, out c int);


create or replace function pifagor(a int,b int,out c float) as
    $$
    begin
        c := sqrt(square(a)+square(b));
    end;
    $$
language plpgsql;
select square(2);
select pifagor(1,1);





create or replace function complex_calculations(inout a int,inout b varchar,inout c float,inout d char(2),inout e date default '2024-11-26')  as
    $$
    <<main_block>>
    begin

    a:=a+1;

        <<first_block>>
        begin
            a:=a+10;
            b:=b||'ban';
        end first_block;




        <<second_block>>
        begin
            c:=c+1.344;
            d:=upper(d);
        end second_block;


    end main_block;
    $$
language plpgsql;


select complex_calculations(1,'ban',1.122,'we');
