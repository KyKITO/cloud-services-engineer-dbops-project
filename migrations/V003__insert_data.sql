-- Добавляем данные
INSERT INTO product (id, name, picture_url, price)
OVERRIDING SYSTEM VALUE
VALUES
  (1, 'Сливочная',    'https://res.cloudinary.com/sugrobov/image/upload/v1623323635/repos/sausages/6.jpg', 320.00),
  (2, 'Особая',       'https://res.cloudinary.com/sugrobov/image/upload/v1623323635/repos/sausages/5.jpg', 179.00),
  (3, 'Молочная',     'https://res.cloudinary.com/sugrobov/image/upload/v1623323635/repos/sausages/4.jpg', 225.00),
  (4, 'Нюренбергская','https://res.cloudinary.com/sugrobov/image/upload/v1623323635/repos/sausages/3.jpg', 315.00),
  (5, 'Мюнхенская',   'https://res.cloudinary.com/sugrobov/image/upload/v1623323635/repos/sausages/2.jpg', 330.00),
  (6, 'Русская',      'https://res.cloudinary.com/sugrobov/image/upload/v1623323635/repos/sausages/1.jpg', 189.00);

-- Заполняем таблицу orders 
INSERT INTO orders (id, status, date_created)
OVERRIDING SYSTEM VALUE
SELECT
  seq,
  (ARRAY['pending','shipped','cancelled'])[FLOOR(RANDOM() * 3 + 1)],
  CURRENT_DATE - ((RANDOM() * 30)::INT)
FROM generate_series(1, 1000000) AS seq;

-- Заполняем связь order_product
INSERT INTO order_product (quantity, order_id, product_id)
SELECT
  (RANDOM() * 50 + 1)::INT,
  seq,
  ((RANDOM() * 6)::INT % 6) + 1
FROM generate_series(1, 1000000) AS seq;