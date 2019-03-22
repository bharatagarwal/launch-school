create table birds (
  name text,
  length decimal(3, 1),
  wingspan decimal(3, 1),
  family text,
  extinct boolean
);

\d birds

select * from birds;