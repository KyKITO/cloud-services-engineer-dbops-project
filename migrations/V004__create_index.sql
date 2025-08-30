-- Создаем индекс orders_status_date_idx
CREATE INDEX orders_status_date_idx
    ON orders (status, date_created);

-- Индекс ускоряет связь order_product и orders
CREATE INDEX order_product_order_id_idx
    ON order_product (order_id);