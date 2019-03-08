alter table famous_people 
rename to celebrities;

--

alter table celebrities 
rename column name to full_name;
  
alter table celebrities 
alter column full_name type varchar(80);

--

alter table celebrities 
add column last_name varchar(100) not null;

--

alter table celebrities 
alter column date_of_birth type date
using date_of_birth::date;

alter table celebrities 
alter column date_of_birth 
set not null;

--

alter table animals 
alter column max_weight_kg type decimal(10,4);

--

alter table animals
add constraint unique_binomial_name UNIQUE (binomial_name);

--

\c ls_burger

alter table orders
add column customer_email varchar(50),
add column customer_loyalty_points integer default 0;

--

alter table orders
add column burger_cost decimal(4,2) default 0,
add column side_cost decimal(4, 2) default 0,
add column drink_cost decimal(4, 2) default 0;

--

alter table orders
drop column order_total;