
create table type
(
    id   integer,
    name varchar NOT NULL,
    PRIMARY KEY (id)
);

create table manufacture
(
    id   integer,
    name varchar NOT NULL,
    PRIMARY KEY (id)
);

create table product
(
    id       integer,
    name     varchar NOT NULL,
    type_id  integer NOT NULL REFERENCES type,
    manuf_id integer NOT NULL REFERENCES manufacture,
    price    integer NOT NULL,
    PRIMARY KEY (id)
);


create table customer
(
    id          integer,
    first_name  varchar NOT NULL,
    second_name varchar,
    phone       integer NOT NULL,
    PRIMARY KEY (id)
);


create table card_info
(
    id         integer,
    owner_name varchar NOT NULL,
    data       integer NOT NULL,
    cvv        integer NOT NULL,
    PRIMARY KEY (id)
);


create table online_customer
(
    cus_id        integer REFERENCES customer,
    email         varchar,
    city          text,
    street        text,
    apartment_num integer,
    card_id       integer REFERENCES card_info
);

create table offline_customer
(
    cus_id          integer REFERENCES customer,
    amount_of_bonus integer
);


create table contract
(
    id                integer,
    cus_id            integer REFERENCES customer,
    duration_in_month integer,
    PRIMARY KEY (id)
);


create table purchase
(
    id         integer,
    order_date date    NOT NULL,
    season     varchar NOT NULL,
    region     varchar,
    store      varchar,
    total_sum  integer,
    payment    varchar,
    PRIMARY KEY (id)
);


create table cus_order
(
    order_id integer REFERENCES purchase,
    cus_id   integer REFERENCES customer
);

create table order_item
(
    order_id   integer REFERENCES purchase,
    product_id integer REFERENCES product,
    quantity   integer NOT NULL
);


create table shipper
(
    shipper_company_name varchar,
    phone                integer,
    PRIMARY KEY (shipper_company_name)
);

create table shipping
(
    track_code    integer,
    order_id      integer REFERENCES purchase,
    city          varchar,
    street        varchar,
    apartment     varchar,
    status        varchar,
    delivery_date date,
    company       varchar REFERENCES shipper
);


alter table shipping
    add PRIMARY KEY(track_code);


create table warehouse
(
    id integer,
    name varchar,
    phone integer,
    PRIMARY KEY(id)
);

create table product_amount
(
    wh_id integer REFERENCES warehouse,
    product_id integer REFERENCES product,
    amount integer NOT NULL
);

create table replenishment_in_wh
(
    id     integer,
    product_id integer REFERENCES product,
    status varchar,
    PRIMARY KEY (id)
);

ALTER table replenishment_in_wh
add column wh_id integer REFERENCES warehouse;

create table store
(
    id integer,
    city varchar NOT NULL,
    street varchar NOT NULL,
    PRIMARY KEY (id)
);

create table store_wh
(
    store_id integer REFERENCES store,
    product_id integer REFERENCES product,
    amount integer
);

create table request_to_replenich
(
    store_id integer REFERENCES store,
    product_id integer REFERENCES product,
    amount integer,
    status varchar
);

alter table customer
    alter column phone
type varchar;

alter table customer
add check(length(phone) = 11);

alter table card_info
add check(cvv % 100 > 0);

alter table product
alter column name
type text;

alter table product
drop column price;

alter table product
add column price$ integer;

alter table purchase
drop column store;

alter table purchase
add column store_id integer REFERENCES store;


alter table store
add column region varchar;

alter table shipping
add column promised_date date;
-------------------------------------------------------------------------------------------------


insert into customer(id,first_name,second_name,phone)
values(1,'Gulnora', 'Okhonova', 87479977508);
insert into customer(id,first_name,phone)
values(2,'Erlan', 87077777777);
insert into customer(id,first_name,second_name,phone)
values(3,'Ruslan','Demidov',87079999997);
insert into customer(id,first_name,phone)
values(4,'Adem', 87074573233);
insert into customer(id,first_name,phone)
values(5,'Ernar', 87031111011);
insert into customer(id,first_name,second_name,phone)
values(6,'Almira','Khalitova',87016616465);


select * from customer;


insert into card_info(id,owner_name,data,cvv)
values(1,'Gulnora', 134567899,478);

insert into card_info(id,owner_name,data,cvv)
values(3,'Erlan', 515402113,111);


insert into card_info(id,owner_name,data,cvv)
values(2,'Almira', 648741327,425);


select * from card_info;


insert into online_customer(cus_id, email, city, street, apartment_num, card_id)
values(1,'ebebeb@h.com','New York','fall street',15,1);

insert into online_customer(cus_id, email, city, street, apartment_num, card_id)
values(3,'erafgs@e.com','California','winter street',22,3);

insert into online_customer(cus_id, email, city, street, apartment_num, card_id)
values(6,'satanana@ss.com','California','summer street',65,2);

update online_customer
set city = 'Loc Angeles'
where cus_id = 6 or cus_id = 3;


select * from online_customer;



insert into offline_customer(cus_id, amount_of_bonus)
values(2,30);
insert into offline_customer(cus_id, amount_of_bonus)
values(4,0);
insert into offline_customer(cus_id, amount_of_bonus)
values(5,20);


select * from offline_customer;



insert into manufacture(id, name)
values(1,'Apple');
insert into manufacture(id, name)
values(2,'Samsung');
insert into manufacture(id, name)
values(3,'Lg');
insert into manufacture(id, name)
values(4,'Sony');
insert into manufacture(id, name)
values(5,'Huawei');
insert into manufacture(id, name)
values(6,'OPPO');
insert into manufacture(id, name)
values(7,'Lenovo');
insert into manufacture(id, name)
values(8,'Acer');

select * from manufacture;

insert into type(id, name)
values(1,'Phone');
insert into type(id, name)
values(2,'TV');
insert into type(id, name)
values(3,'Laptop');
insert into type(id, name)
values(4,'Tablet');
insert into type(id, name)
values(5,'Headphone');


select * from type;


insert into product(id, name, type_id, manuf_id, price$)
values(1,'Iphone 13, 128GB',1,1,500);
insert into product(id, name, type_id, manuf_id, price$)
values(2,'Samsung S20, 128GB',1,2,428);
insert into product(id, name, type_id, manuf_id, price$)
values(3,'Lenovo Legion Y540',3,7,1000);
insert into product(id, name, type_id, manuf_id, price$)
values(4,'Samsung TVV 208',2,2,1200);
insert into product(id, name, type_id, manuf_id, price$)
values(5,'Iphone 12, 128GB',1,1,450);
insert into product(id, name, type_id, manuf_id, price$)
values(6,'Acer Nitro 5',3,8,970);
insert into product(id, name, type_id, manuf_id, price$)
values(7,'Huawei DFG 64GB',1,5,200);
insert into product(id, name, type_id, manuf_id, price$)
values(8,'Ipad Pro 2.0',4,1,700);
insert into product(id, name, type_id, manuf_id, price$)
values(9,'Galaxy Buds',5,2,100);
insert into product(id, name, type_id, manuf_id, price$)
values(10,'OPPO RED 128GB',1,6,320);
insert into product(id, name, type_id, manuf_id, price$)
values(11,'LG R1478',2,3,1250);
insert into product(id, name, type_id, manuf_id, price$)
values(12,'Sony Y5487',2,4,1500);


select * from product;


insert into contract(id, cus_id, duration_in_month)
values(1,1,6);

insert into contract(id, cus_id, duration_in_month)
values(2,2,1);

select * from contract;

insert into store(id, city, street)
values(1,'New York','Queen');
insert into store(id, city, street)
values(2,'Los Angeles','King');
insert into store(id, city, street)
values(3,'Almaty','Kabanbay Batyr');
insert into store(id, city, street)
values(4,'Nursultan','Baiterek');

update store
set region = 'California'
where id = 2;

select * from store;

insert into purchase(id, order_date, season, region, total_sum, payment)
values(1,now(),'autumn','California',2500,'card');
insert into purchase(id, order_date, season, region, store_id, total_sum, payment)
values(2,now(),'autumn','New York',1, 500,'cash');
insert into purchase(id, order_date, season, region, store_id, total_sum, payment)
values(3,now(),'summer','Akmola',4, 1500,'cash');
insert into purchase(id, order_date, season, region, store_id, total_sum, payment)
values(4,now(),'winter','Almaty',3, 400,'cash');
insert into purchase(id, order_date, season, region, total_sum, payment)
values(5,now(),'spring','California',4000,'card');
insert into purchase(id, order_date, season, region, store_id, total_sum, payment)
values(6,now(),'winter','California',2, 150,'cash');
insert into purchase(id, order_date, season, region, store_id, total_sum, payment)
values(7,now(),'summer','Akmola',4, 2000,'cash');
insert into purchase(id, order_date, season, region, total_sum, payment)
values(8,now(),'autumn','New York',10000,'card');
insert into purchase(id, order_date, season, region,store_id, total_sum, payment)
values(9,now(),'winter','Almaty',3,5500,'cash');
insert into purchase(id, order_date, season, region, total_sum, payment)
values(10,now(),'winter','California',970,'card');

update purchase
set total_sum = 1400
where total_sum = 5500;

update purchase
set total_sum = 1200
where total_sum = 2500;

update purchase
set total_sum = 6250
where total_sum = 10000;

update purchase
set total_sum = 428
where total_sum = 400;

update purchase
set total_sum = 200
where total_sum = 150;

select * from purchase
order by id;

update purchase
set order_date = '2020-09-14'
where id = 2;
update purchase
set order_date = '2021-06-14'
where id = 3;
update purchase
set order_date = '2020-11-19'
where id = 1;
update purchase
set order_date = '2021-03-08'
where id = 5;
update purchase
set order_date = '2021-07-20'
where id = 7;
update purchase
set order_date = '2021-10-11'
where id = 8;
update purchase
set order_date = '2021-02-23'
where id = 9;

update cus_order
set cus_id = 3
where order_id = 1 or order_id = 5;

update cus_order
set cus_id = 2
where order_id = 3 or order_id = 7;
update cus_order
set cus_id = 4
where order_id = 9;
update cus_order
set cus_id = 1
where order_id = 2 or order_id = 8;
update cus_order
set cus_id = 6
where order_id = 6;
update cus_order
set cus_id = 5
where order_id = 4;



insert into cus_order(order_id, cus_id)
values (1,6);
insert into cus_order(order_id, cus_id)
values (2,3);
insert into cus_order(order_id, cus_id)
values (3,3);
insert into cus_order(order_id, cus_id)
values (4,2);
insert into cus_order(order_id, cus_id)
values (5,2);
insert into cus_order(order_id, cus_id)
values (6,4);
insert into cus_order(order_id, cus_id)
values (7,1);
insert into cus_order(order_id, cus_id)
values (8,4);
insert into cus_order(order_id, cus_id)
values (9,1);
insert into cus_order(order_id, cus_id)
values (10,6);

select * from cus_order;

insert into order_item(order_id, product_id, quantity)
values(1,1,5);
insert into order_item(order_id, product_id, quantity)
values(2,1,1);
insert into order_item(order_id, product_id, quantity)
values(3,12,1);
insert into order_item(order_id, product_id, quantity)
values(4,2,1);
insert into order_item(order_id, product_id, quantity)
values(5,3,4);
insert into order_item(order_id, product_id, quantity)
values(6,7,1);
insert into order_item(order_id, product_id, quantity)
values(7,3,2);
insert into order_item(order_id, product_id, quantity)
values(8,11,5);
insert into order_item(order_id, product_id, quantity)
values(9,8,2);
insert into order_item(order_id, product_id, quantity)
values(10,6,1);

select * from order_item;

insert into shipper(shipper_company_name, phone)
values('Damu',4444);
insert into shipper(shipper_company_name, phone)
values('Satu',1221);
insert into shipper(shipper_company_name, phone)
values('Bolu',5151);


select * from shipper;

insert into shipping(track_code, order_id, city, street, apartment, status, delivery_date, company)
values(1,5,'Los Angeles','winter street',22,'done','2021-03-10','Damu');

insert into shipping(track_code, order_id, city, street, apartment, status, delivery_date, company)
values(2,1,'Los Angeles','winter street',22,'done','2021-11-21','Satu');

insert into shipping(track_code, order_id, city, street, apartment, status, delivery_date, company)
values(3,8,'Neq York','fall street',15,'done','2021-10-13','Bolu');

insert into shipping(track_code, order_id, city, street, apartment, status, delivery_date, company)
values(4,10,'Los Angeles','summer street',65,'in proccess','2021-01-04','Damu');

update shipping
set city = 'New York'
where track_code = 3;

update shipping
set promised_date = '2021-11-01'
where company = 'Satu';


select * from shipping;


insert into warehouse(id, name, phone)
values (1,'first_one',111);
insert into warehouse(id, name, phone)
values (2,'second_one',222);
insert into warehouse(id, name, phone)
values (3,'third_one',333);

select * from warehouse;

insert into product_amount(wh_id, product_id, amount)
values(1,1,50);
insert into product_amount(wh_id, product_id, amount)
values(1,2,40);
insert into product_amount(wh_id, product_id, amount)
values(1,3,150);
insert into product_amount(wh_id, product_id, amount)
values(1,4,10);

insert into product_amount(wh_id, product_id, amount)
values(2,5,5);
insert into product_amount(wh_id, product_id, amount)
values(2,6,0);
insert into product_amount(wh_id, product_id, amount)
values(2,7,25);
insert into product_amount(wh_id, product_id, amount)
values(2,8,31);

insert into product_amount(wh_id, product_id, amount)
values(3,9,84);
insert into product_amount(wh_id, product_id, amount)
values(3,10,49);
insert into product_amount(wh_id, product_id, amount)
values(3,11,10);
insert into product_amount(wh_id, product_id, amount)
values(3,12,14);

select * from product_amount;

insert into replenishment_in_wh(id,wh_id, product_id, status)
values(1,2,6,'in proccess');
insert into replenishment_in_wh(id,wh_id, product_id, status)
values(2,2,5,'in proccess');
insert into replenishment_in_wh(id,wh_id, product_id, status)
values(3,1,4,'in proccess');
insert into replenishment_in_wh(id,wh_id, product_id, status)
values(4,3,11,'in proccess');

select * from replenishment_in_wh;

insert into store_wh(store_id, product_id, amount)
values(1,1,15);
insert into store_wh(store_id, product_id, amount)
values(1,2,5);
insert into store_wh(store_id, product_id, amount)
values(1,3,10);
insert into store_wh(store_id, product_id, amount)
values(1,4,12);
insert into store_wh(store_id, product_id, amount)
values(1,5,3);
insert into store_wh(store_id, product_id, amount)
values(1,6,4);
insert into store_wh(store_id, product_id, amount)
values(1,7,8);
insert into store_wh(store_id, product_id, amount)
values(1,8,0);
insert into store_wh(store_id, product_id, amount)
values(1,9,1);
insert into store_wh(store_id, product_id, amount)
values(1,10,3);
insert into store_wh(store_id, product_id, amount)
values(1,11,0);
insert into store_wh(store_id, product_id, amount)
values(1,12,12);

insert into store_wh(store_id, product_id, amount)
values(2,1,15);
insert into store_wh(store_id, product_id, amount)
values(2,2,5);
insert into store_wh(store_id, product_id, amount)
values(2,3,1);
insert into store_wh(store_id, product_id, amount)
values(2,4,1);
insert into store_wh(store_id, product_id, amount)
values(2,5,6);
insert into store_wh(store_id, product_id, amount)
values(2,6,4);
insert into store_wh(store_id, product_id, amount)
values(2,7,8);
insert into store_wh(store_id, product_id, amount)
values(2,8,7);
insert into store_wh(store_id, product_id, amount)
values(2,9,1);
insert into store_wh(store_id, product_id, amount)
values(2,10,3);
insert into store_wh(store_id, product_id, amount)
values(2,11,5);
insert into store_wh(store_id, product_id, amount)
values(2,12,0);

insert into store_wh(store_id, product_id, amount)
values(3,1,1);
insert into store_wh(store_id, product_id, amount)
values(3,2,5);
insert into store_wh(store_id, product_id, amount)
values(3,3,10);
insert into store_wh(store_id, product_id, amount)
values(3,4,15);
insert into store_wh(store_id, product_id, amount)
values(3,5,20);
insert into store_wh(store_id, product_id, amount)
values(3,6,4);
insert into store_wh(store_id, product_id, amount)
values(3,7,0);
insert into store_wh(store_id, product_id, amount)
values(3,8,5);
insert into store_wh(store_id, product_id, amount)
values(3,9,1);
insert into store_wh(store_id, product_id, amount)
values(3,10,3);
insert into store_wh(store_id, product_id, amount)
values(3,11,7);
insert into store_wh(store_id, product_id, amount)
values(3,12,12);

insert into store_wh(store_id, product_id, amount)
values(4,1,6);
insert into store_wh(store_id, product_id, amount)
values(4,2,3);
insert into store_wh(store_id, product_id, amount)
values(4,3,10);
insert into store_wh(store_id, product_id, amount)
values(4,4,12);
insert into store_wh(store_id, product_id, amount)
values(4,5,3);
insert into store_wh(store_id, product_id, amount)
values(4,6,14);
insert into store_wh(store_id, product_id, amount)
values(4,7,1);
insert into store_wh(store_id, product_id, amount)
values(4,8,4);
insert into store_wh(store_id, product_id, amount)
values(4,9,7);
insert into store_wh(store_id, product_id, amount)
values(4,10,9);
insert into store_wh(store_id, product_id, amount)
values(4,11,5);
insert into store_wh(store_id, product_id, amount)
values(4,12,4);

select * from store_wh;


insert into request_to_replenich(store_id, product_id, amount, status)
values(1,8,10,'in proccess');
insert into request_to_replenich(store_id, product_id, amount, status)
values(1,9,15,'in proccess');
insert into request_to_replenich(store_id, product_id, amount, status)
values(1,11,12,'in proccess');
insert into request_to_replenich(store_id, product_id, amount, status)
values(2,3,11,'in proccess');
insert into request_to_replenich(store_id, product_id, amount, status)
values(2,4,9,'in proccess');
insert into request_to_replenich(store_id, product_id, amount, status)
values(2,9,14,'in proccess');
insert into request_to_replenich(store_id, product_id, amount, status)
values(2,12,10,'in proccess');
insert into request_to_replenich(store_id, product_id, amount, status)
values(3,1,13,'in proccess');
insert into request_to_replenich(store_id, product_id, amount, status)
values(3,7,8,'in proccess');
insert into request_to_replenich(store_id, product_id, amount, status)
values(3,9,6,'in proccess');
insert into request_to_replenich(store_id, product_id, amount, status)
values(4,7,11,'in proccess');

-------------------------------------------------------------------------------------------------------

insert into purchase(id, order_date, season, region, total_sum, payment, store_id)
values(17,'2021-11-30','autumn', 'Almaty',450,'card',3);

insert into cus_order(order_id, cus_id)
values(11,1);

update cus_order set cus_id = 1
where order_id = 11;

insert into order_item(order_id, product_id, quantity)
values(11,5,1);

insert into shipping(track_code, order_id, city, street, apartment, status, company)
values(123456,11,'Almaty','Karasu',26,'canceled','Satu');

--1 find a customer using a delivery tracker

select customer.first_name,customer.phone, shipper.phone
from customer, shipper, shipping, cus_order
where shipping.track_code = 123456
and shipping.order_id = cus_order.order_id
and cus_order.cus_id = customer.id
and shipping.company = shipper.shipper_company_name;

--2 best buyer
select c.first_name, sum(total_sum)
from purchase p, customer c, cus_order co
where p.id = co.order_id
and c.id = co.cus_id
and Extract(YEAR from p.order_date::date ) = 2021
group by c.first_name
order by sum(total_sum) desc limit(1);

select * from purchase;

--3 top 2 bestsellers by amount
select pr.name, sum(total_sum)
from purchase p, product pr, order_item ot
where p.id = ot.order_id
and pr.id = ot.product_id
and Extract(YEAR from p.order_date::date ) = 2021
group by pr.name
order by sum(total_sum) desc limit(2);

--4 top 2 bestsellers by quantity
select pr.name, sum(quantity), pr.id
from purchase p, product pr, order_item ot
where p.id = ot.order_id
and pr.id = ot.product_id
and Extract(YEAR from p.order_date::date ) = 2021
group by pr.name, pr.id
order by sum(quantity) desc limit(2);

--5 out of stock in california
select pr.id,pr.name, wh.amount
from product pr, store_wh wh, store s
where wh.amount = 0
and pr.id = wh.product_id
and s.id = wh.store_id
and s.region = 'California';

--6 undelivered parcels
select *
from shipping
where promised_date < delivery_date;

