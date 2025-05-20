/*display all the data of customers */
SELECT * FROM Customer; 

/*Display the product_name and category for products which their price is between 5000 and 10000*/
SELECT product_name, category FROM Product WHERE Price BETWEEN 5000 AND 10000;

/*Display all the data of products sorted in descending order of price*/
SELECT * FROM Product ORDER BY Price DESC;

/*Display the total number of orders, the average amount, the highest total amount and the lower total amountFor each product_id, display the number of orders*/
SELECT COUNT(*) AS total_orders, 
       AVG(total_amount) AS average_amount, 
       MAX(total_amount) AS highest_amount, 
       MIN(total_amount) AS lowest_amount 
FROM Orders;

/*- Display the customer_id which has more than 2 orders:*/
SELECT Customer_id FROM Orders GROUP BY Customer_id HAVING COUNT(*) > 2;

/*For each month of the 2020 year, display the number of orders:*/
SELECT MONTH(OrderDate) AS month, COUNT(*) AS number_of_orders 
FROM Orders WHERE YEAR(OrderDate) = 2020 GROUP BY MONTH(OrderDate);

/*- For each order, display the product_name, the customer_name, and the date of the order*/
SELECT Orders.OrderDate, Product.product_name, Customer.customer_Name 
FROM Orders 
JOIN Product ON Orders.Product_id = Product.Product_id 
JOIN Customer ON Orders.Customer_id = Customer.Customer_id;

/*Display all the orders made three months ago:*/
SELECT * FROM Orders WHERE OrderDate = DATE_SUB(CURDATE(), INTERVAL 3 MONTH);

/*Display customers (customer_id) who have never ordered a product:*/
SELECT Customer_id FROM Customer WHERE Customer_id NOT IN (SELECT Customer_id FROM Orders);