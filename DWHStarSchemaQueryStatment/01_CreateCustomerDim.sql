USE gravity_books_DWH
go

-- Dropping the foreign keys
IF EXISTS (SELECT *
           FROM   sys.foreign_keys
           WHERE  NAME = 'FK_SalesFact_CustomerDim'
           AND parent_object_id = Object_id('SalesFact'))
	ALTER TABLE SalesFact
    DROP CONSTRAINT FK_SalesFact_CustomerDim;

-- Drop and create the table
IF EXISTS (SELECT *
           FROM   sys.tables
           WHERE  NAME = 'CustomerDim')
	DROP TABLE CustomerDim
go
CREATE TABLE CustomerDim
  (
     customer_PK        INT NOT NULL IDENTITY(1, 1),  --primary key          
     customer_BK        INT NOT NULL,              -- Business key
     customer_name      VARCHAR(200),
     city               VARCHAR(200),
	 country	        VARCHAR(200),    
	 -- SCD
     Valid_From        DATETIME NOT NULL DEFAULT (Getdate()),    
     Valid_To            DATETIME NULL,							               
     CONSTRAINT PK_CustomerDim PRIMARY KEY CLUSTERED (customer_PK)
  );

  -- Create Foreign Key
IF EXISTS (SELECT *
           FROM   sys.tables
           WHERE  NAME = 'SalesFact')
  ALTER TABLE SalesFact
    ADD CONSTRAINT FK_SalesFact_CustomerDim FOREIGN KEY (customer_SK)
    REFERENCES CustomerDim(customer_PK);

-- Create Indexes
IF EXISTS (SELECT *
           FROM   sys.indexes
           WHERE  NAME = 'CustomerDim_customerBK'
                  AND object_id = Object_id('CustomerDim'))
	DROP INDEX CustomerDim.CustomerDim_customerBK
go
CREATE INDEX CustomerDim_customerBK
ON CustomerDim(customer_BK);
