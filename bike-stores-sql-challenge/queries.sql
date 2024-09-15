-- consultas --

-- listar todos os clientes que nao realizaram uma compra --
SELECT c.customer_id, c.first_name, c.last_name FROM customers c LEFT JOIN orders o ON c.customer_id = o.customer_id WHERE o.costumer_id IS NULL;

-- listar os produtos que nao foram comprados --
SELECT p.product_id, p.product_name FROM products p LEFT JOIN stocks s ON p.product_id = s.product_id WHERE s.quantity IS NULL OR s.quantity = 0;

-- agrupar a quantidade de vendas por marcar e por loja -- 
SELECT b.brand_name, s.store_name, COUNT(oi.item_id) AS total_sales FROM order_items oi JOIN products p ON oi.product_id = p.product_id JOIN brands b ON p.brand_id = b.brand_id JOIN orders o ON oi.order_id = o.order_id JOIN stores s ON o.store_id = s.store_id GROUP BY b.brand_name, s.store_name;

-- listar funcionarios que nao estejam relacionados a pedidos --
SELECT st.staff_id, st.first_name, st.last_name FROM staffs st LEFT JOIN orders o ON st.staff_id = o.staff_id WHERE o.staff_id IS NULL;