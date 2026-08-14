/* ============================================================================== 
   ADVANCED JOINS
=============================================================================== */

/*========================
	LEFT ANTI JOIN
=======================*/
/* Get all customers who haven't placed any order */

USE MyDatabase;


SELECT *
FROM customers AS C
LEFT JOIN orders AS O
ON C.id = O.customer_id
WHERE O.customer_id IS NULL;


/*=================
RIGHT ANTI JOIN
=================*/

/* Get all orders without matching customers */

SELECT *
FROM customers AS c
RIGHT JOIN orders AS o
ON c.id = o.customer_id
WHERE c.id IS NULL;

-- Alternative to RIGHT ANTI JOIN using LEFT JOIN
/* Get all orders without matching customers */

SELECT *
FROM orders AS O
LEFT JOIN customers AS C
ON C.id = O.customer_id
WHERE C.id IS NULL;

-- Alternative to INNER JOIN using LEFT JOIN
/* Get all customers along with their orders, 
   but only for customers who have placed an order */
SELECT *
FROM customers AS c
LEFT JOIN orders AS o
ON c.id = o.customer_id
WHERE o.customer_id IS NOT NULL;

/*====================
    FULL ANTI JOIN
    ========================*/

/* Find customers without orders and orders without customers */
SELECT
    c.id,
    c.first_name,
    o.order_id,
    o.customer_id,
    o.sales
FROM customers AS c 
FULL JOIN orders AS o 
ON c.id = o.customer_id
WHERE o.customer_id IS NULL OR c.id IS NULL;

/*=======================
        CROSS JOIN
        =======================*/

/* Generate all possible combinations of customers and orders */

SELECT *
FROM customers
CROSS JOIN orders;