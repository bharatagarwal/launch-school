sql sub-languages
---

ddl: data definition language\
dml: data manipulation langauge\
dcl: data control language\

schema and data
---

the database is also part of the schema.\
ddl is used for creating the schema

table creation syntax
---

column name and data type are required for each column definition.\
constraints are optional -- they can be defined at column or table level.

```sql
CREATE TABLE table_name (
  column_1_name column_1_data_type [constraints, ...],
  column_2_name column_2_data_type [constraints, ...],
  .
  .
  .
  constraints
);
```

each column definition is comma separated.

keys and constraints
---

indexes are a way of storing a quick-reference to \
values in a particular column.

comments
---

two kinds of comments in sql: block `/* */` and inline `-- `