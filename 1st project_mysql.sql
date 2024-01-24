/*we want yo run some queries for the reorganization of a car-sales company*/ 
select * from products
select * from orderdetails
select * from orders
/*we want to see what product(vehicle) had the most orders*/
/*we will join the orderdetails with the products table*/
select m1.productCode,m1.productName,count(*) as orders_per_vehicle from products m1 
inner join orderdetails m2 on m1.productCode=m2.productCode
group by m1.productCode,m1.productName
order by orders_per_vehicle desc
/*we see that the most orders come from a 1992 ferrari*/
/*Now we are going to see if there is a relationship between the price of every product and its sales*/
select m1.productCode,m1.productName,count(*)*m2.quantityOrdered*m2.priceEach
as sales_per_vehicle,m1.buyPrice 
from products m1 
inner join orderdetails m2 on m1.productCode=m2.productCode
group by m1.productCode,m1.productName
order by sales_per_vehicle desc
/*we see a patern here,that the higher the buyPrice the more the sales*/
/* we see that people prefer the most 'vintage' cars*/
use mintclassics;
select * from warehouses
select * from customers
select * from payments;
/*we want to examine how much each customer payed each year
so we will join the 2 tables customers and payments along with some groupbys around the date*/
select year(p.paymentDate),c.customerNumber,c.customerName,
concat(c.contactLastName,' ',c.contactFirstName) as full_ContactName,sum(amount) as total_amount
from payments as p 
inner join customers as c on p.customerNumber=c.customerNumber
group by year(p.paymentDate),c.customerNumber,c.customerName,full_contactName
order by year(p.paymentDate) asc,total_amount desc
/*through this query we see each year from 2003 to 2005 the total amount each customer payed to our company*/
select * from employees;
/*now we will do a simple self join to see all the employess and who the are reporting to */
select e1.lastName,e1.firstName,e2.firstName,e2.lastName
from employees e1
left join employees e2
on e1.reportsTo=e2.employeeNumber
/*now we are going to see how many products exist in each warehouse*/

