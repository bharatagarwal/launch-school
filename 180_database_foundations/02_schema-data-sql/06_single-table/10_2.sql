select item, (menu_price - ingredient_cost) as "profit"
from menu_items
where (menu_price - ingredient_cost) = max(menu_price - ingredient_cost);

-- ERROR:  aggregate functions are not allowed in WHERE
-- LINE 3: where (menu_price - ingredient_cost) = max(menu_price - ingr...