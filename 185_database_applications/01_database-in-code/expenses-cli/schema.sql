-- when the expense was created
-- how much the expense was
-- what the expense was for

create table expenses (
  id serial primary key,
  amount numeric(6, 2) not null,
  memo text not null,
  created_on date not null
)

alter table expenses
add constrain positive_amount
check (amount > 0.00);

alter table expenses 
alter created_on set default now();
