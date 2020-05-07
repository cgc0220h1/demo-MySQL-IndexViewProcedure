USE classicmodels;
CREATE OR REPLACE VIEW customer_view AS
    SELECT customerNumber, customerName, contactFirstName, contactLastName, phone
FROM customers
WHERE city = 'Nantes';

DROP VIEW customer_view;