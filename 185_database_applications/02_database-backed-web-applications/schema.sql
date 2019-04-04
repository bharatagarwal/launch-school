create table list (
  id serial primary key,
  name text unique not null
);

create table todo (
  id serial primary key,
  name text not null,
  completed boolean default false,
  list_id integer not null references list(id) on delete cascade
);