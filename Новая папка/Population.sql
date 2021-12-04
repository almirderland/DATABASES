
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
