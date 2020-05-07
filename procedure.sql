USE classicmodels;
DELIMITER //
CREATE PROCEDURE findALlCustomer()
BEGIN
    SELECT * FROM customers;
end //

CALL findALlCustomer();
DROP PROCEDURE IF EXISTS findALlCustomer;
DELIMITER //
CREATE PROCEDURE findALLCustomer()
BEGIN
    SELECT * FROM classicmodels.customers WHERE customerNumber = 175;
END;
DELIMITER ;
CALL findALLCustomer();

--Query Customer
USE classicmodels;

DELIMITER //
CREATE PROCEDURE getCusById (IN cusNUm INT(11))
BEGIN
    SELECT * FROM customers WHERE  customerNumber = cusNUm;
END //
DELIMITER ;

CALL getCusById(175);

USE classicmodels;
DELIMITER //
CREATE PROCEDURE getCustomersCountByCity
    (IN in_city VARCHAR(10),
    OUT total INT
    )
BEGIN
    SELECT COUNT(customerNumber)
        AS total
    FROM customers
        WHERE city = in_city;
END //
DELIMITER ;
CALL getCustomersCountByCity('Lyon', @total);
SELECT @total;

USE classicmodels;
DELIMITER //
CREATE PROCEDURE setCounter(IN inc INT,
                            INOUT counter INT)
BEGIN
    SET counter = counter + inc;
END //
DELIMITER ;
SET @Counter = 1;
CALL setCounter(1,@Counter);
SELECT @Counter;
CALL setCounter(1,@Counter);
SELECT @Counter;
CALL setCounter(5,@Counter);
SELECT @Counter;
