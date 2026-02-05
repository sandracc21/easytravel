-- =========================================
-- BASIC SELECT QUERIES
-- =========================================

SELECT * FROM role;

SELECT
    u.username,
    u.email,
    r.role_name
FROM user_account u
JOIN role r ON u.role_id = r.role_id;

SELECT * FROM customer;


-- =========================================
-- JOIN QUERIES
-- =========================================

SELECT
    c.first_name,
    c.last_name,
    b.booking_id,
    b.booking_status,
    b.total_cost
FROM customer c
JOIN booking b ON c.customer_id = b.customer_id;


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
-- OPTIONAL SERVICES
-- =========================================

SELECT
    b.booking_id,
    s.service_name,
    s.service_price
FROM booking b
JOIN booking_service bs ON b.booking_id = bs.booking_id
JOIN optional_service s ON bs.service_id = s.service_id;


-- =========================================
-- AGGREGATE FUNCTIONS
-- =========================================

SELECT SUM(amount) AS total_revenue FROM payment;
SELECT AVG(total_cost) AS average_booking_cost FROM booking;
SELECT MAX(total_cost) AS highest_booking_cost FROM booking;


-- =========================================
-- CASE STATEMENT
-- =========================================

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
-- TCL + ACID DEMONSTRATION
-- =========================================

BEGIN;

UPDATE booking
SET booking_status = 'Cancelled'
WHERE booking_id = 1;

ROLLBACK;


BEGIN;

UPDATE booking
SET booking_status = 'Confirmed'
WHERE booking_id = 1;

COMMIT;


-- =========================================
-- ACCESS LEVEL DEMONSTRATION
-- =========================================

-- Admin view
SET ROLE admin_role;
SELECT * FROM booking;

-- Travel Agent view
SET ROLE travel_agent_role;
SELECT booking_id, booking_status FROM booking;

-- Customer view
SET ROLE customer_role;
SELECT booking_id, total_cost FROM booking;

RESET ROLE;
