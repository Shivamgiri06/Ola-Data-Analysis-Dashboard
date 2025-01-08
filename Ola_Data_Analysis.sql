Use ola;

#1) Retrieve All successful bookings:
select * from bookings
where Booking_Status = 'Success';
select * from successful_bookings;

#2) Find the average ride distance for each vehicle type:

select Vehicle_Type, avg(Ride_Distance)
as avg_distance from bookings
group by Vehicle_Type;

#3) Get the total number of canceled rides by customer:
Create View canceled_rides_by_customers As
Select count(*) from bookings
where Booking_Status = 'Canceled by Customer';

select * from canceled_rides_by_customers;

#4) List the top 5 customers who booked the highest number of rides:
create view 5_customer_highest_rides as
select Customer_ID, count(Booking_ID) as total_rides
from bookings
group by Customer_ID
order by  total_rides desc limit 5;

#5) Get the number of rides canceled by drivers due to personal and car related issues:
create view Rides_Canceled_by_Driver_P_C_Issues as
select count(*) from bookings
where Canceled_Rides_by_Driver = 'Personal & Car related issue';

#6) Find the maximum and minimum driver ratings for prime sedan bookings:
create view Max_Min_Driver_Rating as
select max(Driver_Ratings) as max_ratings,
min(Driver_Ratings) as min_ratings from bookings
where Vehicle_Type = 'Prime sedan';

#7) Retrieve all rides where payment was made using UPI:
Create view UPI_Payment as
select * from bookings
where Payment_Method = 'UPI';

#8) Find the average customer ratings per vehicle type:
create view Avg_customer_rating as
select Vehicle_Type, avg(Customer_Rating) as avg_customer_rating
from bookings
group by Vehicle_Type;

#9) Calculate the total bookings value of rides completed successfully:
create view Total_successful_rides as
select sum(Booking_Value) as total_sum_of_successful_rides from bookings
where Booking_Status = 'Success';

#10) List all incomplete rides along with the reason:
create view Incomplete_Rides as
select Booking_ID, Incomplete_Rides_Reason from bookings
where Incomplete_Rides = 'Yes';
