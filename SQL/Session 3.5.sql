SELECT 
    SUM(o.quantityOrdered) AS Total_Purchased,
    p.productName AS Product_Name
FROM
    products p
        INNER JOIN
    orderdetails o ON p.productCode = o.productCode
GROUP BY p.productCode
ORDER BY Total_Purchased DESC;

SELECT 
    SUM(o.quantityOrdered) AS Total_Purchased,
    p.productLine AS Product_Line
FROM
    products p
        INNER JOIN
    orderdetails o ON p.productCode = o.productCode
GROUP BY p.productLine
ORDER BY Total_Purchased DESC;

SELECT * from orders;


-- SELECT 
--     p.productName
-- FROM
--     orderdetails od
--         INNER JOIN
--     products p ON p.productCode = od.productCode
--         INNER JOIN
--     orders o ON od.orderNumber = o.orderNumber
-- WHERE
--     o.customerNumber IN (
-- 		SELECT 
--             c.customerNumber, c.customerName, c.addressLine1, c.phone
--         FROM
--             orders o
--                 INNER JOIN
--             customers c ON o.customerNumber = c.customerNumber
--                 INNER JOIN
--             orderdetails od ON o.orderNumber = od.orderNumber
--         GROUP BY c.customerNumber
--         HAVING SUM(od.priceEach * od.quantityOrdered) > 100000 
--         
--         UNION DISTINCT 
--         
--         SELECT 
--             c.customerNumber, c.customerName, c.addressLine1, c.phone
--         FROM
--             orders o
--                 INNER JOIN
--             customers c ON o.customerNumber = c.customerNumber
--         GROUP BY c.customerNumber
--         HAVING COUNT(o.customerNumber) > 3);

SELECT c.customerNumber,
         customerName,
        phone,
        postalCode,
        addressLine1,
        addressLine2,
        COUNT(distinct orderNumber) as num_or_amt_of_purchase
FROM customers c INNER JOIN orders o
ON c.customerNumber = o.customerNumber
GROUP BY customerNumber
HAVING num_or_amt_of_purchase > 3
UNION ALL
SELECT c.customerNumber,
        customerName,
        phone,
        postalCode,
        addressLine1,
        addressLine2,
        SUM(amount) as num_or_amt_of_purchase
FROM customers c INNER JOIN payments p
ON c.customerNumber = p.customerNumber
GROUP BY customerNumber
HAVING num_or_amt_of_purchase > 100000
ORDER BY customerNumber;

