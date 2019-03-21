select item, (menu_price - ingredient_cost) as "profit"
from menu_items
order by "profit" desc;

-- ERROR:  aggregate functions are not allowed in WHERE
-- LINE 3: where (menu_price - ingredient_cost) = max(menu_price - ingr...