-- Write a SQL query to determine how profitable each item on
-- the menu is based on the amount of time it takes to prepare.
-- 
-- Assume that whoever is preparing the food is being
-- paid $13 an hour. List the most profitable items first.
-- 
-- Keep in mind that prep_time is represented in minutes
-- and ingredient_cost and menu_price are in dollars and cents).

--   item   | prep_time | ingredient_cost | sales | menu_price
-- ---------+-----------+-----------------+-------+------------
-- omelette |        10 |            1.50 |   182 |       7.99
-- tacos    |         5 |            2.00 |   254 |       8.99
-- oatmeal  |         1 |            0.50 |    79 |       5.99
-- (3 rows)

select item, menu_price, ingredient_cost, 
((13.0 / 60) * prep_time)::decimal(3, 2) as labour, 
(menu_price - ingredient_cost - ((13.0 / 60) * prep_time)::decimal(3, 2)) as profit
from menu_items 
order by profit desc;
