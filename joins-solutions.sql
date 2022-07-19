-- Questions 

-- 1. Get all customers and their addresses.
SELECT * FROM "customers" JOIN "addresses" ON "customers"."id" = "addresses"."customer_id";

-- 2. Get all orders and their line items (orders, quantity and product).
SELECT * FROM "orders" JOIN "line_items" ON "orders"."id" = "line_items"."order_id";

-- 3. Which warehouses have cheetos?
SELECT * FROM "warehouse" JOIN "warehouse_product" ON "warehouse_product"."warehouse_id" = "warehouse"."id"
JOIN "products" ON "products"."id" = "warehouse_product"."product_id" 
WHERE "products"."description" = 'cheetos';

-- 4. Which warehouses have diet pepsi?
SELECT * FROM "warehouse" JOIN "warehouse_product" ON "warehouse_product"."warehouse_id" = "warehouse"."id"
JOIN "products" ON "products"."id" = "warehouse_product"."product_id" 
WHERE "products"."description" = 'diet pepsi';

-- 5. Get the number of orders for each customer. NOTE: It is OK if those without orders are not included in results.
SELECT "first_name", count("orders"."address_id") AS "total_orders" FROM "customers" 
JOIN "addresses" ON "addresses"."customer_id" = "customers"."id"
JOIN "orders" ON "orders"."address_id" = "addresses"."id"
GROUP BY "first_name" ORDER BY "total_orders";

-- 6. How many customers do we have?
SELECT count(id) FROM customers; 

-- 7. How many products do we carry?
SELECT count(id) FROM products;

-- 8. What is the total available on-hand quantity of diet pepsi?
SELECT sum(warehouse_product.on_hand) FROM warehouse_product 
WHERE warehouse_product.product_id = 6;
