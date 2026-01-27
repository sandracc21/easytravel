-- =========================================
-- BASIC SELECT QUERIES
-- =========================================

-- Show all roles
SELECT * FROM role;

-- Show all users and their roles
SELECT
    u.username,
    u.email,
    r.role_name
FROM user_account u
JOIN role r ON u.role_id = r.role_id;

-- Show all customers
SELECT * FROM customer;

-- =========================================
-- JOIN QUERIES (CORE BUSINESS QUERIES)
-- =========================================

-- Show customers and their bookings
SELECT
    c.first_name,
    c.last_name,
    b.booking_id,
    b.booking_status,
    b.total_cost
FROM customer c
JOIN booking b ON c.customer_id = b.customer_id;

-- Full booking summary (customer, flight, accommodation, payment)
SELECT
    c.first_name,
    c.last_name,
    f.airline,
    f.departure,
    f.destination,
    a.name AS accommodation_name,
    p.payment_method,
    p.payment_status,
    p.amount
FROM customer c
JOIN booking b ON c.customer_id = b.customer_id
JOIN flight f ON b.booking_id = f.booking_id
JOIN accommodation a ON b.booking_id = a.booking_id
JOIN payment p ON b.booking_id = p.booking_id;

-- =========================================
-- OPTIONAL SERVICES (MANY-TO-MANY)
-- =========================================

-- Show optional services per booking
SELECT
    b.booking_id,
    s.service_name,
    s.service_price
FROM booking b
JOIN booking_service bs ON b.booking_id = bs.booking_id
JOIN optional_service s ON bs.service_id = s.service_id;

-- =========================================
-- AGGREGATE FUNCTIONS (REPORTING)
-- =========================================

-- Total revenue generated
SELECT SUM(amount) AS total_revenue
FROM payment;

-- Average booking cost
SELECT AVG(total_cost) AS average_booking_cost
FROM booking;

-- Highest booking cost
SELECT MAX(total_cost) AS highest_booking_cost
FROM booking;

-- =========================================
-- CASE STATEMENT (BUSINESS LOGIC)
-- =========================================

-- Categorise bookings by value
SELECT
    booking_id,
    total_cost,
    CASE
        WHEN total_cost >= 2000 THEN 'High Value Booking'
        WHEN total_cost >= 1000 THEN 'Medium Value Booking'
        ELSE 'Low Value Booking'
    END AS booking_category
FROM booking;

-- =========================================
-- ROLE-BASED DATA VIEW (SECURITY CONTEXT)
-- =========================================

-- View customer-accessible booking details
SELECT
    b.booking_id,
    b.booking_status,
    b.total_cost
FROM booking b;
