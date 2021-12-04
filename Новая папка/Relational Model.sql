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