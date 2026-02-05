TRUNCATE TABLE
role,
user_account,
customer,
booking,
flight,
accommodation,
payment,
optional_service,
booking_service
CASCADE;


INSERT INTO role (role_name) VALUES
('Admin'),
('TravelAgent'),
('Customer');


INSERT INTO user_account (username, email, password, role_id) VALUES
('admin1','admin1@easytravel.com','adminpass',(SELECT role_id FROM role WHERE role_name='Admin')),
('agent1','agent1@easytravel.com','agentpass',(SELECT role_id FROM role WHERE role_name='TravelAgent')),

('customer1','customer1@easytravel.com','pass',(SELECT role_id FROM role WHERE role_name='Customer')),
('customer2','customer2@easytravel.com','pass',(SELECT role_id FROM role WHERE role_name='Customer')),
('customer3','customer3@easytravel.com','pass',(SELECT role_id FROM role WHERE role_name='Customer')),
('customer4','customer4@easytravel.com','pass',(SELECT role_id FROM role WHERE role_name='Customer')),
('customer5','customer5@easytravel.com','pass',(SELECT role_id FROM role WHERE role_name='Customer')),
('customer6','customer6@easytravel.com','pass',(SELECT role_id FROM role WHERE role_name='Customer')),
('customer7','customer7@easytravel.com','pass',(SELECT role_id FROM role WHERE role_name='Customer')),
('customer8','customer8@easytravel.com','pass',(SELECT role_id FROM role WHERE role_name='Customer')),
('customer9','customer9@easytravel.com','pass',(SELECT role_id FROM role WHERE role_name='Customer')),
('customer10','customer10@easytravel.com','pass',(SELECT role_id FROM role WHERE role_name='Customer')),
('customer11','customer11@easytravel.com','pass',(SELECT role_id FROM role WHERE role_name='Customer')),
('customer12','customer12@easytravel.com','pass',(SELECT role_id FROM role WHERE role_name='Customer')),
('customer13','customer13@easytravel.com','pass',(SELECT role_id FROM role WHERE role_name='Customer')),
('customer14','customer14@easytravel.com','pass',(SELECT role_id FROM role WHERE role_name='Customer')),
('customer15','customer15@easytravel.com','pass',(SELECT role_id FROM role WHERE role_name='Customer')),
('customer16','customer16@easytravel.com','pass',(SELECT role_id FROM role WHERE role_name='Customer')),
('customer17','customer17@easytravel.com','pass',(SELECT role_id FROM role WHERE role_name='Customer')),
('customer18','customer18@easytravel.com','pass',(SELECT role_id FROM role WHERE role_name='Customer')),
('customer19','customer19@easytravel.com','pass',(SELECT role_id FROM role WHERE role_name='Customer')),
('customer20','customer20@easytravel.com','pass',(SELECT role_id FROM role WHERE role_name='Customer')),
('customer21','customer21@easytravel.com','pass',(SELECT role_id FROM role WHERE role_name='Customer')),
('customer22','customer22@easytravel.com','pass',(SELECT role_id FROM role WHERE role_name='Customer')),
('customer23','customer23@easytravel.com','pass',(SELECT role_id FROM role WHERE role_name='Customer')),
('customer24','customer24@easytravel.com','pass',(SELECT role_id FROM role WHERE role_name='Customer')),
('customer25','customer25@easytravel.com','pass',(SELECT role_id FROM role WHERE role_name='Customer')),
('customer26','customer26@easytravel.com','pass',(SELECT role_id FROM role WHERE role_name='Customer')),
('customer27','customer27@easytravel.com','pass',(SELECT role_id FROM role WHERE role_name='Customer')),
('customer28','customer28@easytravel.com','pass',(SELECT role_id FROM role WHERE role_name='Customer')),
('customer29','customer29@easytravel.com','pass',(SELECT role_id FROM role WHERE role_name='Customer')),
('customer30','customer30@easytravel.com','pass',(SELECT role_id FROM role WHERE role_name='Customer'));


INSERT INTO customer (user_id, first_name, last_name, email, loyalty_points)
SELECT
    user_id,
    'Customer' || SUBSTRING(username FROM 9),
    'Test',
    email,
    (random()*300)::int
FROM user_account
WHERE username LIKE 'customer%';


INSERT INTO booking (customer_id, booking_date, booking_status, total_cost)
SELECT
    customer_id,
    CURRENT_DATE,
    'Confirmed',
    (800 + (random()*1500))::int
FROM customer;


INSERT INTO flight (booking_id, airline, departure, destination, seat_class, price)
SELECT
    booking_id,
    'British Airways',
    'London',
    'Barcelona',
    'Economy',
    500
FROM booking;


INSERT INTO accommodation (booking_id, name, location, room_type, price_per_night)
SELECT
    booking_id,
    'SeaView Hotel',
    'Barcelona',
    'Double Room',
    150
FROM booking;


INSERT INTO payment (booking_id, payment_method, payment_date, amount, payment_status)
SELECT
    booking_id,
    'Credit Card',
    CURRENT_DATE,
    total_cost,
    'Paid'
FROM booking;


INSERT INTO optional_service (service_name, service_price)
VALUES
('Extra Baggage',50),
('Taxi Transfer',80);


INSERT INTO booking_service (booking_id, service_id)
SELECT
    b.booking_id,
    s.service_id
FROM booking b
CROSS JOIN optional_service s;



-- =========================================
-- ACCESS CONTROL IMPLEMENTATION (DCL)
-- =========================================

CREATE ROLE admin_role;
CREATE ROLE travel_agent_role;
CREATE ROLE customer_role;

-- Admin full access
GRANT ALL PRIVILEGES ON ALL TABLES IN SCHEMA public TO admin_role;

-- Travel agent limited access
GRANT SELECT, INSERT, UPDATE ON booking TO travel_agent_role;
GRANT SELECT ON customer TO travel_agent_role;

-- Customer limited access
GRANT SELECT, UPDATE ON booking TO customer_role;
GRANT SELECT ON customer TO customer_role;
