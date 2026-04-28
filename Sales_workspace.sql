select *
from brightmotors.carsales.Sales
limit 100;


---------------------------------------------------------------------------------------------------------------
--Distinct values to understand the important and relevant data
---------------------------------------------------------------------------------------------------------------

--Different colors
select distinct color
from brightmotors.carsales.sales;

--Different car models
select distinct model
from brightmotors.carsales.sales;

--Different Locations
select distinct state
from brightmotors.carsales.sales;

--Different car Make
select distinct make
from brightmotors.carsales.sales;

--Distinct selling price
select distinct sellingprice
from brightmotors.carsales.sales
order by sellingprice asc;

---------------------------------------------------------------------------------------------------------------
--Cleaning up null values
---------------------------------------------------------------------------------------------------------------

--Car make
select
      ifnull(make, 'Not_selected') as make
from brightmotors.carsales.sales;

--Car model
select
      ifnull(model, 'Not selected') as model
from brightmotors.carsales.sales;

--Empty Color Data
select
      ifnull(color, 'Not selected') as color
from brightmotors.carsales.sales;


------------------------------------------------------------------------------------------------------------------------
--Revenue Data
------------------------------------------------------------------------------------------------------------------------

--Units sold
select count (*) as Units_sold
from brightmotors.carsales.sales;

--Total revenue for all sales
select sum(sellingprice) as Total_revenue
from brightmotors.carsales.sales; 

--Revenue per car make
select make, sum(sellingprice) as Revenue_per_make
from brightmotors.carsales.sales
group by make;

--Revenue per car model
select model, sum (sellingprice) as Revenue_per_model
from brightmotors.carsales.sales
group by model;

--Average selling price
select avg(sellingprice) as Average_selling_price
from brightmotors.carsales.sales;

--Total sales by Region
select state,
       sum(sellingprice) as Total_revenue_by_state
from brightmotors.carsales.sales
group by state;

--Average selling price by region
select
      state,
      avg(sellingprice) as Average_sale_per_state
from brightmotors.carsales.sales
group by state;

--Highest sales by region
select
      state,
      max(sellingprice) as Highest_sale_per_state
from brightmotors.carsales.sales
group by state;

--Minimum sale by region
select
      state,
      min(sellingprice) as Minimum_sales_per_state
from brightmotors.carsales.sales
group by state;


----------------------------------------------------------------------------------------------------------------------
--Sales by timebuckets
----------------------------------------------------------------------------------------------------------------------

--Extracting Year, Month, Day, Hour, Minute, Second
select
      cast (to_timestamp(saledate, 'EEE MMM dd yyyy HH:mm:ss')) as Sales_timeline
from brightmotors.carsales.sales;

--Returning selling date, make, model
select
      make,
      model,
      saledate
from brightmotors.carsales.sales;

--Selling dates
select
      saledate,
      to_timestamp(saledate, 'yyyy MM dd HH:mm:ss') as sale_day,
from brightmotors.carsales.sales;

--Sales by year
select
      year(saledate) as Transaction_year
from brightmotors.carsales.sales;


---------------------------------------------------------------------------------------------------------------------
--Seller information
---------------------------------------------------------------------------------------------------------------------
--Different car sellers
select distinct seller
from brightmotors.carsales.sales;

--Best seller by State
select state, count (seller) as number_of_sellers
from brightmotors.carsales.sales
group by state;

--Number of vehicles purchased per seller
select seller, count (vin) as number_of_vehicles_sold
from brightmotors.carsales.sales
group by seller
order by number_of_vehicles_sold desc;

--Best seller by state
select state, count (vin) as best_seller_by_state
from brightmotors.carsales.sales
group by state
order by best_seller_by_state desc;

--Minimum, average, maximum cars sold
select model, min(seller) as highest_sales
from brightmotors.carsales.sales
group by model
order by highest_sales desc;

select seller, avg(model) as average_sales
from brightmotors.carsales.sales
group by seller;

--Top 10 models sold
select make, max (model) as top_10_models_sold
from brightmotors.carsales.sales
group by make
limit 10;

--Bottom 10 models sold
select make, min(model) as bottom_10_models_sold
from brightmotors.carsales.sales
group by make
limit 10;


--Most cars sold by make
select make, count (model) as most_sold_model
from brightmotors.carsales.sales
group by make;

--Best selling model
select model, count (vin) as best_selling_model
from brightmotors.carsales.sales
group by model
order by best_selling_model desc;

--Worst selling model
select model, count (vin) as least_selling_model
from brightmotors.carsales.sales
group by model
order by least_selling_model asc;

--Best selling model by seller
select model, seller, count (vin) as best_selling_model
from brightmotors.carsales.sales
group by model, seller
order by best_selling_model desc;

--Worst selling model by seller
select model, seller, count (vin) as worst_selling_model
from brightmotors.carsales.sales
group by model, seller
order by worst_selling_model asc;

--Top 10 best selling vehicles types by model
select body, count (model) as best_selling_body_type
from brightmotors.carsales.sales
group by body
order by best_selling_body_type desc
limit 10;

--Top 10 worst
select body, count (model) as worst_selling_body_type
from brightmotors.carsales.sales
group by body
order by worst_selling_body_type asc
limit 10;
