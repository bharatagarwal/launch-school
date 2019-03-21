select item, (menu_price - ingredient_cost) as "profit"
from menu_items
order by (menu_price - ingredient_cost) desc
limit 1;