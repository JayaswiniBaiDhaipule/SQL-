/* ==============================================================================
   SQL Joins 
-------------------------------------------------------------------------------
   This document provides an overview of SQL joins, which allow combining data
   from multiple tables to retrieve meaningful insights.

   Table of Contents:
     1. Basic Joins
        - INNER JOIN
        - LEFT JOIN
        - RIGHT JOIN
        - FULL JOIN
     2. Advanced Joins
        - LEFT ANTI JOIN
        - RIGHT ANTI JOIN
        - ALTERNATIVE INNER JOIN
        - FULL ANTI JOIN
        - CROSS JOIN
     3. Multiple Table Joins (4 Tables)
=================================================================================
*/

/* ============================================================================== 
   BASIC JOINS 
=============================================================================== */

/* ===============================
          No Join
================================*/

-- Retrieve all data from customers and orders as separate results

USE MyDatabase;

SELECT * FROM customers;
SELECT * FROM orders;

/* ================================
        INNER JOIN
================================*/

/* Get all customers along with their orders, 
   but only for customers who have placed an order */
   SELECT * 
   FROM customers
   INNER JOIN orders
   ON customers.id = orders.customer_id;

   SELECT 
       c.id,
       c.first_name,
       o.order_id,
       o.sales
   FROM customers AS c
   INNER JOIN orders AS o
   ON c.id = o.customer_id;

/*==============================
        LEFT JOIN
 ============================*/

/* Get all customers along with their orders, 
   including those without orders */

   SELECT * FROM customers;

   SELECT 
       c.id,
       c.first_name,
       o.order_id,
       o.sales
   FROM customers AS C
   LEFT JOIN orders AS O
   ON C.id = O.customer_id;

/*===========================
        RIGHT JOIN
==========================*/
/* Get all customers along with their orders, 
   including orders without matching customers */

SELECT
     c.id,
     c.first_name,
     o.order_id,
     o.sales
FROM customers AS C
RIGHT JOIN orders AS O
ON C.id = O.customer_id;

-- Alternative to RIGHT JOIN using LEFT JOIN
/* Get all customers along with their orders, 
   including orders without matching customers */
SELECT
    c.id,
    c.first_name,
    o.order_id,
    o.sales
FROM orders AS o 
LEFT JOIN customers AS c
ON c.id = o.customer_id;

/*============================
FULL JOIN
==========================*/

/* Get all customers and all orders, even if there’s no match */

SELECT
    c.id,
    c.first_name,
    o.order_id,
    o.customer_id,
    o.sales
FROM customers AS C
FULL JOIN orders AS O
ON C.id = O.customer_id;