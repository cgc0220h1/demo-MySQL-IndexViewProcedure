USE classicmodels;
SELECT * FROM customers WHERE customerNumber = 175;
EXPLAIN SELECT * FROM customers WHERE customerNumber = 175;

ALTER TABLE customers ADD INDEX idx_customerNumber (customerNumber);
EXPLAIN SELECT * FROM customers WHERE customerNumber = 175;

ALTER TABLE customers ADD INDEX idx_fullName (contactFirstName, contactLastName);
EXPLAIN SELECT * FROM customers WHERE contactFirstName = 'Jean' OR contactFirstName = 'King';

ALTER TABLE customers DROP INDEX idx_fullName;