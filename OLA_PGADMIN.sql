SELECT * FROM OLA;

--retrieve all successful bookings;
select booking_id, booking_status from OLA where (booking_status = 'Success')

--find average ride distance from each vehicle
select vehicle_type as vehcile, round(avg(ride_distance),2)
as avg_distance from OLA
group by vehicle_type



--list of top 5 customers who books the highest number of rides
select customer_id, count(booking_id) as total_rides
from OLA
group by customer_id
order by total_rides desc limit 5

--find min and max driver rating for prime sedan bookings
select min(driver_ratings) as min_driver_rating_of_sedan, 
max(driver_ratings) as max_driver_rating_of_sedan
from OLA where(vehicle_type = 'Prime Sedan') 

--retrieve all rides where payment were made using upi
select COUNT(*)booking_id from OLA where(payment_method ='UPI')

--find average customer rating per vehicle type
select vehicle_type, round(avg(customer_rating)::numeric, 2) as avg_customer_rating from OLA 
group by vehicle_type order by avg_customer_rating desc

--list all inclomplete rides with the reason
SELECT incomplete_rides_reason,
COUNT(*) AS total
FROM OLA
WHERE incomplete_rides = 'Yes'
GROUP BY incomplete_rides_reason
order by total