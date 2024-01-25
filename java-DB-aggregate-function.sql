-- java-DB-aggregate-function

-- 1. Select the total number of Orders.
select count(order_id) as total_orders
from orders;

-- 2. Select number of orders that have ship region.
select count(order_id) as orders_with_ship_region
from orders
where ship_region is not null;

-- 3. Select the most expensive product.
select  product_name, unit_price
from products
where unit_price IN (select max(unit_price)
					 from products
					);

-- 4. Select total price of order with id = 10258;
select order_id, sum((unit_price * quantity) - discount * (unit_price * quantity)) as total_price
from order_details
where order_id = 10258
group by order_id;

-- 5. Select the least expensive product from order with id = 10263
select  unit_price
from ( select min(p.unit_price) as unit_price
	  from products p join order_details od on p.product_id = od.product_id
	  where  od.order_id = 10263
	 ) AS Product_10263 

-- 6. Select all products that have price which is above the average price.
select product_name, unit_price
from products
GROUP BY product_name, unit_price
having avg(unit_price) < unit_price

-- 7. Calculate number of products from category Seafood.
