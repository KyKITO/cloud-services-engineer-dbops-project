# Пререквизиты перед выполнением миграций

## Создаём базу store, в которой будут проходить миграции
```sql
CREATE DATABASE store;
```

## Создаем пользователя, с помощью которого будут выполняться миграции
```sql
CREATE USER migrations WITH PASSWORD <password>;
```

## Выдаем все права на базу store
```sql
GRANT ALL PRIVILEGES ON DATABASE store TO migrations;
```
## Сделаем пользователя владельцем схемы public
```sql
ALTER SCHEMA public OWNER TO migrations;
```

## Выдаем все права на схему 
```sql
GRANT ALL PRIVILEGES ON ALL TABLES IN SCHEMA public TO migrations;
GRANT ALL PRIVILEGES ON ALL SEQUENCES IN SCHEMA public TO migrations;
GRANT USAGE, CREATE ON SCHEMA public TO migrations;
```

# Количество заказанных сосисок по дням за последние 7 суток
```sql
SELECT
    DATE(o.date_created) AS order_date,
    SUM(op.quantity) AS total_sold
FROM orders o
INNER JOIN order_product op 
    ON o.id = op.order_id
WHERE 
    o.status = 'shipped'
    AND o.date_created >= CURRENT_DATE - INTERVAL '7 days'
    AND o.date_created < CURRENT_DATE
GROUP BY 
    DATE(o.date_created)
ORDER BY 
    order_date DESC;
```