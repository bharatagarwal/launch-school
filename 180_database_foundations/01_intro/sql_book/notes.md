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

alter table
---

`alter table` only alters the schema, it doesn't alter the data.

```
ALTER TABLE table_to_change
HOW TO CHANGE THE TABLE
additional arguments;
```

`ALTER TABLE table_name RENAME TO new_name`\
`ALTER TABLE table_name RENAME COLUMN col_name TO col`
`ALTER TABLE table_name ALTER COLUMN col_name TYPE type;`

note: can't alter to type `serial` because it is not a true data type,
it's a shorthand for various steps that have to be taken manually if
you want to make changes to a column to have the same properties
and make these changes after table definition.

constraints
---

`NOT NULL` and `DEFAULT` are considered column constraints.
`UNIQUE` is a table constraint.

adding a column constraint takes the format:\
`ALTER TABLE table_name ALTER COLUMN column_name
SET constraint_clause`

adding a table constraint takes the format:\
`ALTER TABLE table_name ADD CONSTRAINT constraint_name constraint_clause`

use `DROP` like so:

column constraint:\
`ALTER TABLE table_name ALTER COLUMN column_name DROP constraint_name`

table constraint:\
`ALTER TABLE table_name DROP CONSTRAINT constraint_name`

adding and removing columns
---

`ALTER TABLE table_name ADD COLUMN col_name col_type constraints`\
`now();` is an sql function

`ALTER TABLE table_name DROP COLUMN column_name`

