CREATE DATABASE demo;
CREATE TABLE Products
(
    id                 INT AUTO_INCREMENT PRIMARY KEY,
    productCode        varchar(15) NOT NULL UNIQUE,
    productName        varchar(50) NOT NULL,
    productPrice       INT,
    productAmount      INT,
    productDescription TEXT,
    productStatus      BIT
);

CREATE UNIQUE INDEX Idx_productCode ON Products (productCode);
CREATE INDEX Idx_Composite_index ON Products (productName, productPrice);

CREATE OR REPLACE VIEW product_view AS
SELECT productCode, productName, productPrice, productStatus
FROM Products;
DROP VIEW product_view;

DELIMITER //
CREATE PROCEDURE getProductDetail()
BEGIN
    SELECT * FROM Products;
end //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE addProduct(IN productCode varchar(15),
                            IN productName varchar(50),
                            IN productPrice INT,
                            IN productAmount INT,
                            IN productDescription TEXT,
                            IN productStatus BIT)
BEGIN
    INSERT INTO Products(productCode, productName, productPrice, productAmount, productDescription, productStatus)
    VALUES (productCode, productName, productPrice, productAmount, productDescription, productStatus);
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE editProduct(IN id INT,
                             IN productCode varchar(15),
                             IN productName varchar(50),
                             IN productPrice INT,
                             IN productAmount INT,
                             IN productDescription TEXT,
                             IN productStatus BIT)
BEGIN
    UPDATE Products
    SET productCode        = productCode,
        productName        = productName,
        productPrice       = productPrice,
        productAmount      = productAmount,
        productDescription = productDescription,
        productStatus      = productStatus
    WHERE id = id;
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE deleteProduct(IN id1 INT)
BEGIN
    DELETE FROM Products
        WHERE id = id1;
END //
DELIMITER ;

