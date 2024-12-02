CREATE DATABASE IF NOT EXISTS case_study_module_3;
USE case_study_module_3;

-- Create table Customer
CREATE TABLE customer
(
    id         INT AUTO_INCREMENT PRIMARY KEY,
    name       VARCHAR(100) NOT NULL,
    address    VARCHAR(255),
    phone      VARCHAR(20),
    email      VARCHAR(100),
    is_deleted BOOLEAN DEFAULT FALSE
);

-- Create table Account
CREATE TABLE account
(
    id          INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT UNIQUE,
    username    VARCHAR(50) UNIQUE NOT NULL,
    password    VARCHAR(255)       NOT NULL,
    created_at  DATETIME DEFAULT CURRENT_TIMESTAMP,
    is_deleted  BOOLEAN  DEFAULT FALSE,
    FOREIGN KEY (customer_id) REFERENCES customer (id)
);

-- Create table ProductCategory
CREATE TABLE product_category
(
    id           INT AUTO_INCREMENT PRIMARY KEY,
    product_name VARCHAR(100) NOT NULL
);

-- Create table Product
CREATE TABLE product
(
    id                  INT AUTO_INCREMENT PRIMARY KEY,
    product_category_id INT,
    product_name        VARCHAR(100) NOT NULL,
    description         TEXT,
	quantity   			INT,
    price               DOUBLE       NOT NULL,
    image               TEXT,
    created_at          DATETIME DEFAULT CURRENT_TIMESTAMP,
    is_deleted          BOOLEAN  DEFAULT FALSE,
    FOREIGN KEY (product_category_id) REFERENCES product_category (id)
);

-- Create table Order
CREATE TABLE order_bill
(
    id         INT AUTO_INCREMENT PRIMARY KEY,
    account_id INT,
    order_date DATETIME DEFAULT CURRENT_TIMESTAMP,
    status     BOOLEAN  DEFAULT FALSE,
    is_deleted BOOLEAN  DEFAULT FALSE,
    FOREIGN KEY (account_id) REFERENCES account (id)
);

-- Create table OrderDetails
CREATE TABLE order_details
(
    id         INT AUTO_INCREMENT PRIMARY KEY,
    order_id   INT,
    product_id INT,
    quantity   INT NOT NULL,
    FOREIGN KEY (order_id) REFERENCES order_bill (id),
    FOREIGN KEY (product_id) REFERENCES product (id)
);

-- Create table Role
CREATE TABLE role
(
    id   INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50)
);

-- Create table Permissions
CREATE TABLE permissions
(
    id         INT PRIMARY KEY AUTO_INCREMENT,
    role_id    INT,
    account_id INT,
    FOREIGN KEY (role_id) REFERENCES role (id),
    FOREIGN KEY (account_id) REFERENCES account (id)
);