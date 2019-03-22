alter table temperatures
alter column rainfall type decimal(6, 3);

update temperatures
set rainfall = rainfall / 25.4;