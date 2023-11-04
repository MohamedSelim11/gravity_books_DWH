USE gravity_books_DWH
go

-- Dropping the foreign keys
IF EXISTS (SELECT *
           FROM   sys.foreign_keys
           WHERE  NAME = 'FK_SalesFact_BookDim'
           AND parent_object_id = Object_id('SalesFact'))
	ALTER TABLE SalesFact
    DROP CONSTRAINT FK_SalesFact_BookDim;

-- Drop and create the table
IF EXISTS (SELECT *
           FROM   sys.tables
           WHERE  NAME = 'BookDim')
	DROP TABLE BookDim
go
CREATE TABLE BookDim
  (
     Book_PK        INT NOT NULL IDENTITY(1, 1),   -- primary key       
     Book_BK        INT NOT NULL,              -- Business key
     title			VARCHAR(400),
     language       VARCHAR(50),
	 publisher	    VARCHAR(400),
	 author			VARCHAR(400),

	 -- SCD
     Valid_From        DATETIME NOT NULL DEFAULT (Getdate()),    
     Valid_To            DATETIME NULL,							               
     CONSTRAINT PK_BookDim PRIMARY KEY CLUSTERED (Book_PK)
  );

  -- Create Foreign Key
IF EXISTS (SELECT *
           FROM   sys.tables
           WHERE  NAME = 'SalesFact')
  ALTER TABLE SalesFact
    ADD CONSTRAINT FK_SalesFact_BookDim FOREIGN KEY (Book_SK)
    REFERENCES BookDim(Book_PK);

-- Create Indexs
IF EXISTS (SELECT *
           FROM   sys.indexes
           WHERE  NAME = 'BookDim_BookBK'
                  AND object_id = Object_id('BookDim'))
	DROP INDEX BookDim.BookDim_BookBK
go
CREATE INDEX BookDim_BookBK
ON BookDim(book_BK);
