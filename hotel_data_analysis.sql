Create database Hotel_booking;
use Hotel_booking;

-- 1. View first few rows of the dataset
SELECT *
FROM hotel_bookings
LIMIT 10;


-- 2. Total number of bookings
SELECT COUNT(*) AS total_bookings
FROM hotel_bookings;


-- 3. Booking status distribution
-- Shows confirmed, cancelled, failed bookings
SELECT booking_status,
       COUNT(*) AS total_bookings
FROM hotel_bookings
GROUP BY booking_status
ORDER BY total_bookings DESC;


-- 4. Cancellation rate
-- Percentage of bookings that were cancelled
SELECT 
ROUND(
SUM(CASE WHEN booking_status = 'Cancelled' THEN 1 ELSE 0 END) * 100.0 / COUNT(*)
,2) AS cancellation_rate
FROM hotel_bookings;


-- 5. Booking distribution by channel
-- Web, Mobile App, Travel Agent
SELECT booking_channel,
       COUNT(*) AS total_bookings
FROM hotel_bookings
GROUP BY booking_channel
ORDER BY total_bookings DESC;


-- 6. Average booking value by channel
-- Helps identify high value booking channels
SELECT booking_channel,
       ROUND(AVG(booking_value),2) AS avg_booking_value
FROM hotel_bookings
GROUP BY booking_channel
ORDER BY avg_booking_value DESC;



-- 7. Room type distribution
-- Shows popularity of room categories
SELECT room_type,
       COUNT(*) AS total_bookings
FROM hotel_bookings
GROUP BY room_type
ORDER BY total_bookings DESC;


-- 8. Average booking value by room type
-- Identifies higher revenue room types
SELECT room_type,
       ROUND(AVG(booking_value),2) AS avg_booking_value
FROM hotel_bookings
GROUP BY room_type
ORDER BY avg_booking_value DESC;



-- 9. Booking distribution by star rating
-- Shows hotel category demand
SELECT star_rating,
       COUNT(*) AS total_bookings
FROM hotel_bookings
GROUP BY star_rating
ORDER BY star_rating;



-- 10. Average booking value by star rating
-- Shows spending pattern by hotel category
SELECT star_rating,
       ROUND(AVG(booking_value),2) AS avg_booking_value
FROM hotel_bookings
GROUP BY star_rating
ORDER BY star_rating;



-- 11. Monthly booking trend
-- Helps identify seasonal demand
SELECT MONTH(booking_date) AS booking_month,
       COUNT(*) AS total_bookings
FROM hotel_bookings
GROUP BY booking_month
ORDER BY booking_month;



-- 12. Top cities by number of bookings
-- Shows most popular travel destinations
SELECT city,
       COUNT(*) AS total_bookings
FROM hotel_bookings
GROUP BY city
ORDER BY total_bookings DESC
LIMIT 10;



-- 13. Average stay length
-- Calculated using check-in and check-out dates
SELECT 
AVG(DATEDIFF(check_out_date, check_in_date)) AS avg_stay_length
FROM hotel_bookings
WHERE check_in_date IS NOT NULL
AND check_out_date IS NOT NULL;



-- 14. Profitability analysis
-- Profit per booking = selling_price - costprice
SELECT 
ROUND(AVG(selling_price - costprice),2) AS avg_profit
FROM hotel_bookings;



-- 15. Profit by room type
-- Helps identify most profitable room categories
SELECT room_type,
       ROUND(AVG(selling_price - costprice),2) AS avg_profit
FROM hotel_bookings
GROUP BY room_type
ORDER BY avg_profit DESC;



-- 16. Coupon usage distribution
-- Shows how many bookings used coupons
SELECT `Coupon Used?`,
       COUNT(*) AS total_bookings
FROM hotel_bookings
GROUP BY `Coupon Used?`;



-- 17. Cashback analysis
-- Average and maximum cashback offered
SELECT 
ROUND(AVG(cashback),2) AS avg_cashback,
MAX(cashback) AS max_cashback
FROM hotel_bookings;



-- 18. Cancellation by booking channel
-- Identifies channels with higher cancellations
SELECT booking_channel,
       COUNT(*) AS cancelled_bookings
FROM hotel_bookings
WHERE booking_status = 'Cancelled'
GROUP BY booking_channel
ORDER BY cancelled_bookings DESC;