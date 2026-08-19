/* ==============================================================================
   SQL Date & Time Functions
-------------------------------------------------------------------------------
   This script demonstrates various date and time functions in SQL.
   It covers functions such as GETDATE, DATETRUNC, DATENAME, DATEPART,
   YEAR, MONTH, DAY, EOMONTH, FORMAT, CONVERT, CAST, DATEADD, DATEDIFF,
   and ISDATE.
   
   Table of Contents:
     1. GETDATE | Date Values
     2. Date Part Extractions (DATETRUNC, DATENAME, DATEPART, YEAR, MONTH, DAY)
     3. DATETRUNC
     4. EOMONTH
     5. Date Parts
     6. FORMAT
     7. CONVERT
     8. CAST
     9. DATEADD / DATEDIFF
    10. ISDATE
===============================================================================
*/

USE SalesDB;

SELECT * FROM Sales.Orders;
/* ==============================================================================
   GETDATE() | DATE VALUES
===============================================================================*/

SELECT
    OrderID,
    CreationTime,
    OrderDate,
    ShipDate
FROM Sales.Orders;

SELECT
    OrderID,
    CreationTime,
    '2025-08-20' HardCoded
FROM Sales.Orders;

SELECT
    OrderID,
    CreationTime,
    GETDATE() Today
FROM Sales.Orders;


/* TASK 1:
   Display OrderID, CreationTime, a hard-coded date, and the current system date.
*/
SELECT
    OrderID,
    CreationTime,
    '2026-08-20' AS HardCoded,
    GETDATE() AS Today
FROM Sales.Orders;

/* ==============================================================================
   DATE PART EXTRACTIONS
   (DATETRUNC, DATENAME, DATEPART, YEAR, MONTH, DAY)
===============================================================================*/

/*===============================
    YEAR, MONTH, DAY
==============================*/

SELECT
    OrderID,
    CreationTime,
    YEAR(CreationTime) AS year,
    MONTH(CreationTime) AS month,
    DAY(CreationTime) AS day
FROM Sales.Orders;

/*==============================
       DATEPART(part, Date);
==========================*/

SELECT
    OrderID,
    CreationTime,
    DATEPART(year, CreationTime) AS Year_dp,
    DATEPART(month, CreationTime) AS Month_dp,
    DATEPART(day, CreationTime) AS Day_dp,
    DATEPART(hour, CreationTime) AS Hours_dp,
    DATEPART(quarter, CreationTime) AS Quarter_dp,
    DATEPART(week, CreationTime) AS Week_dp
FROM Sales.Orders;

/*=======================
    DATENAME(PART, DATE))
=======================*/

SELECT
    OrderID,
    CreationTime,
    DATENAME(month, CreationTime) AS Month_dn,
    DATENAME(weekday, CreationTime) AS WeekDay_dn,
    DATENAME(day, CreationTime) AS Day_dn,
    DATENAME(year, CreationTime) AS Year_dn
FROM Sales.Orders;
    
 /*=======================
    DATETRUNC(PART, DATE))
=======================*/

SELECT
    OrderID,
    CreationTime,
    DATETRUNC(minute, CreationTime) AS Minute_dt,
    DATETRUNC(day, CreationTime) AS Day_dt,
    DATETRUNC(year, CreationTime) AS Year_dt
FROM Sales.Orders;

/* ==============================================================================
   EOMONTH()
===============================================================================*/

/* TASK 4:
   Display OrderID, CreationTime, and the end-of-month date for CreationTime.
*/
SELECT
    OrderID,
    CreationTime,
    EOMONTH(CreationTime) AS EndOfMonth
FROM Sales.Orders;
