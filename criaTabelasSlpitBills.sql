drop table house
;
drop table bills 
;
drop table residents 
;
drop table split
;
drop table bill_type 
;
create table house (cod_house integer primary key autoincrement
, adress varchar not null
, nick_name varchar)
;
insert into house (adress, nick_name) values('34 Westerfield Drive','Happy House')
;
create table residents(cod_resident integer primary key autoincrement
, name varchar
, couple boolean
, email varchar
, mobile varchar
, cod_house integer not null
, dt_in date not null
, dt_out date not null
, foreign key(cod_house) references house(cod_house)
)
;
create table bills(cod_bills integer primary key autoincrement
, name varchar
, amount float
, dead_line date
, attachment blob
, paid_day date
, cod_house integer not null
, dt_from date
, dt_to date
, cod_bill_type integer not null
, send boolean
,FOREIGN KEY(cod_house) REFERENCES house(cod_house)
,FOREIGN KEY(cod_bill_type) REFERENCES bill_type(cod_bill_type))
;
create table split(cod_split integer primary key autoincrement
, amount float
, split_date date
, payed_day date
, cod_bills integer not null
, cod_resident integer not null
, FOREIGN KEY(cod_bills) REFERENCES bills(cod_bills) on Delete cascade 
, FOREIGN KEY(cod_resident) REFERENCES residents(cod_resident))
;
create table bill_type (cod_bill_type integer primary key autoincrement
,type varchar)
;
insert into bill_type(type)
values('Internet'), ('Gas'), ('Water'), ('Eletricity'), ('Cleaning Stuff')
;