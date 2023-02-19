-- Урок 2. SQL – создание объектов, простые запросы выборки
-- Используя операторы языка SQL, создайте табличку “sales”. Заполните ее данными
-- Сгруппируйте значений количества в 3 сегмента — меньше 100, 100-300 и больше 300.
-- Создайте таблицу “orders”, заполните ее значениями. Покажите “полный” статус заказа, используя оператор CASE

-- Используя операторы языка SQL, создайте табличку “sales”. Заполните ее данными

USE hw;

CREATE TABLE sales
(id INT PRIMARY KEY AUTO_INCREMENT,
order_date DATE,
count_product INT  
);
INSERT INTO sales (order_date, count_product) VALUES ('2020-01-01', 156);
INSERT INTO sales (order_date, count_product) VALUES ('2020-01-02', 180);
INSERT INTO sales (order_date, count_product) VALUES ('2020-01-03', 21);
INSERT INTO sales (order_date, count_product) VALUES ('2020-01-04', 124);
INSERT INTO sales (order_date, count_product) VALUES ('2020-01-05', 341);

DELETE FROM sales
WHERE id = 7;

DELETE FROM sales;

TRUNCATE TABLE sales;

-- Сгруппируйте значений количества в 3 сегмента — меньше 100, 100-300 и больше 300.

SELECT 
	id AS "id заказа",
    IF (count_product < 100, "Маленький заказ", 
		IF (count_product >= 100 AND count_product <= 300, "Средний заказ",
			IF (count_product > 300, "Большой заказ", "Не определено")))
	AS "Тип заказа"
FROM sales;

SELECT id,
CASE
	WHEN count_product < 100 THEN "Маленький заказ"
    WHEN count_product >= 100 AND count_product <= 300 THEN "Средний заказ"
    ELSE "Большой заказ"
    END AS "Тип заказа"
FROM sales;

-- Создайте таблицу “orders”, заполните ее значениями. Покажите “полный” статус заказа, используя оператор CASE

CREATE TABLE orders
(id INT PRIMARY KEY AUTO_INCREMENT,
employee_id VARCHAR(5),
amount DECIMAL(5,2),
order_status VARCHAR(10)
);

INSERT INTO orders (employee_id, amount, order_status) VALUES ('e03', 15.00,'OPEN');
INSERT INTO orders (employee_id, amount, order_status) VALUES ('e01', 25.50,'OPEN');
INSERT INTO orders (employee_id, amount, order_status) VALUES ('e05', 100.70,'CLOSED');
INSERT INTO orders (employee_id, amount, order_status) VALUES ('e02', 22.18,'OPEN');
INSERT INTO orders (employee_id, amount, order_status) VALUES ('e04', 9.50,'CANCELLED');

SELECT *,
CASE
	WHEN order_status = 'OPEN' THEN "Order is in open state"
    WHEN order_status = 'CLOSED' THEN "Order is closed"
    ELSE "Order is cancelled"
    END AS "full_order_status"
FROM orders;


