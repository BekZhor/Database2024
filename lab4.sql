create database lab4;



create table warehouse(
    code serial,
    location varchar(255),
    capacity int
);

create table boxes(
    code char(4),
    contents varchar(255),
    value real,
    warehouse int
);


insert into warehouse (location, capacity) values ('Chicago',3),
                                                  ('Chicago',4),
                                                  ('New York',7),
                                                  ('Los Angeles',2),
                                                  ('San Francisco',8);

insert into boxes values('OMN7','Rocks',180,3),
                        ('4H8P','Rocks',250,1),
                        ('4RT3','Scissors',190,4),
                        ('7G3H','Rocks',200,1),
                        ('8JN6','Papers',75,1),
                        ('8Y6U','Papers',50,3),
                        ('9J6F','Papers',175,2),
                        ('LL08','Rocks',140,4),
                        ('P0H6','Scissors',125,1),
                        ('P2T6','Scissors',150,2),
                        ('TU55','Papers',90,5);

select * from boxes;
select   * from warehouse;


select contents , sum(value) from boxes
group by contents;







select * from boxes
where value>150;


select distinct on(boxes.contents) * from boxes;

select warehouse.code  from warehouse;
select warehouse, count(contents) from boxes
group by boxes.warehouse
having count(contents)>2
order by warehouse;

insert into warehouse(location, capacity) values ('New York',3);


insert into boxes values ('H5RT','Papers',200,2);


select * from boxes
order by value desc
limit 1
offset 2;

update boxes
set value=value*0.85
where value=all( select value from boxes order by value desc limit 1 offset 2);

select * from boxes
order by value desc;


delete from boxes
where value<150;

delete from boxes using warehouse
where boxes.warehouse=warehouse.code and warehouse.code=3 or warehouse=warehouse.code and warehouse.code=6
returning *;

