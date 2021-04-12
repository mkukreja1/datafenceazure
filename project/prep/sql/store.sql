CREATE DATABASE store;
GO

CREATE TABLE [product] (
    [productID] INTEGER NOT NULL IDENTITY(1, 1),
    [product_code] VARCHAR(255) NULL,
    [product_name] VARCHAR(255) NULL,
    [product_category ] VARCHAR(MAX) NULL,
    PRIMARY KEY ([productID])
);
GO

INSERT INTO product([product_code],[product_name],[product_category ]) VALUES ('1001','Watch','Wearables'),('1002','Vaccum','HomeAppliance'),('1003','Airconditioner','HomeAppliance'),('1004','Microwave','HomeAppliance'),('1005','DVD','HomeEntertainment'),('1006','TV','HomeEntertainment'),('1007','Keyboard','Computers'),('1008','Mice','Computers'),('1009','Monitor','Computers'),('1010','Mobile','Phones');