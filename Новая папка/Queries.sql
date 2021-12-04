
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

