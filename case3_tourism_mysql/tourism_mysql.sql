CREATE DATABASE tourism;
USE tourism;

CREATE TABLE tours (
    tour_id INT AUTO_INCREMENT PRIMARY KEY,
    tour_name VARCHAR(100),
    country VARCHAR(50),
    price DECIMAL(10, 2)
);

CREATE TABLE customers (
    customer_id INT AUTO_INCREMENT PRIMARY KEY,
    full_name VARCHAR(100),
    phone VARCHAR(20)
);

CREATE TABLE services (
    service_id INT AUTO_INCREMENT PRIMARY KEY,
    service_name VARCHAR(100),
    service_price DECIMAL(10, 2)
);

CREATE TABLE managers (
    manager_id INT AUTO_INCREMENT PRIMARY KEY,
    full_name VARCHAR(100)
);

CREATE TABLE tour_orders (
    order_id INT AUTO_INCREMENT PRIMARY KEY,
    tour_id INT,
    customer_id INT,
    service_id INT,
    manager_id INT,
    order_date DATE,
    tourists_count INT,
    total_amount DECIMAL(10, 2),
    FOREIGN KEY (tour_id) REFERENCES tours(tour_id),
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id),
    FOREIGN KEY (service_id) REFERENCES services(service_id),
    FOREIGN KEY (manager_id) REFERENCES managers(manager_id)
);

INSERT INTO tours (tour_name, country, price)
VALUES ('Золотое кольцо', 'Россия', 42000);

INSERT INTO customers (full_name, phone)
VALUES ('Иванов Иван Иванович', '+7-900-111-22-33');

INSERT INTO services (service_name, service_price)
VALUES ('Страховка', 1500);

INSERT INTO managers (full_name)
VALUES ('Смирнова Ольга Павловна');

INSERT INTO tour_orders
    (tour_id, customer_id, service_id, manager_id, order_date, tourists_count, total_amount)
VALUES
    (1, 1, 1, 1, '2026-07-01', 1, 43500);

SELECT
    tour_orders.order_id,
    customers.full_name,
    tours.tour_name,
    services.service_name,
    managers.full_name
FROM tour_orders
JOIN customers ON customers.customer_id = tour_orders.customer_id
JOIN tours ON tours.tour_id = tour_orders.tour_id
JOIN services ON services.service_id = tour_orders.service_id
JOIN managers ON managers.manager_id = tour_orders.manager_id;
