data manipulation language
---

insert
select
update
delete

aka crud (create read update delete)

insert
---

```sql
insert into table ( col1, col2, col3...)
values ( val1, val2, val3 );
```
if you don't specify a value for a column specified, you'll get an error.
if you leave out a column, it will put null / default value into the column.

`rows == tuples`

```sql
insert into table (col1, col2)
values (val1, val2, val3), (val1', val2', val3');
```

