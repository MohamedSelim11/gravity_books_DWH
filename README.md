# gravity_books_DWH
Gravity Books Data Warehouse is a data integration and analytics solution designed to provide insights into the operations of a fictional bookstore, Gravity Books. 
This documentation provides an overview of the project's structure, its source data, data transformations, and the resulting data warehouse schema.

# Project Overview
# ETL Tool: SQL Server Integration Services (SSIS)
![AllControlFlow](https://github.com/MohamedSelim11/gravity_books_DWH/assets/127447294/387cd048-18c1-4b16-9c8e-75926c9254d1)

# Source Database: Gravity Books (SQL Server)
![278431339-9123c5ea-3a79-4638-84df-1039c2733510](https://github.com/MohamedSelim11/gravity_books_DWH/assets/127447294/0ac08680-a550-4777-9843-d6db0211134a)

Dimensions: Book Dimension, Customer Dimension, Date Dimension Fact Table: Order Fact Table Source Data The source data for this data warehouse project originates from the Gravity Books database, which consists of the following tables:

country: Information about countries. address: Details about addresses. 
customer_address: Relationships between customers and their addresses. 
customer: Customer information. address_status: Address status information. order_line: Details of individual order lines. 
order_status: Order status information. order_history: Order history records. 
cust_order: Customer order information. shipping_method: Shipping methods. 
book_language: Languages in which books are available. book: Book information. 
publisher: Publishers' details. 
book_author: Relationships between books and authors. author: Author information.
![278429155-0698af76-47b8-4595-8504-8afa520930db](https://github.com/MohamedSelim11/gravity_books_DWH/assets/127447294/bbe1190e-899d-4de4-ac29-1fdeb3d03b26)

# ETL Process
The ETL (Extract, Transform, Load) process using SQL Server Integration Services (SSIS) involved the following steps:
Data Extraction: Data was extracted from the source tables in the Gravity Books database.

Data Transformation: The data was transformed to create denormalized tables for the three dimensions (Book, Customer, Date), including adding appropriate attributes and aggregations where necessary. 
For example, the Date Dimension includes various attributes related to dates.

Data Loading: The transformed data was loaded into the data warehouse tables.

# Data Warehouse Schema
![Screenshot (10)](https://github.com/MohamedSelim11/gravity_books_DWH/assets/127447294/9f5bb213-e862-4873-b232-d8ae291bc7fe)


# Dimensions

# 1-Book Dimension:
book_key: Primary key for the book dimension. book_title: Title of the book. author_name: Author's name. Other book-related attributes. Book Dim Run Success
![BookDim](https://github.com/MohamedSelim11/gravity_books_DWH/assets/127447294/669621f2-9623-46d8-88b7-7ffd5e9c00c1)

# 2-Customer Dimension:
customer_key: Primary key for the customer dimension. customer_name: Customer's name. Other customer-related attributes.
![CustomerDim](https://github.com/MohamedSelim11/gravity_books_DWH/assets/127447294/2c9bcb7f-f7e3-43b1-821b-d10888d5952f)
# 3-Shipping Dimension:
Shipping_key: Primary key for the Shipping dimension. Shipping_Method: Shipping's Method.
![ShippingDim](https://github.com/MohamedSelim11/gravity_books_DWH/assets/127447294/29d262d9-e638-41f7-88bd-b283b8b31716)

# 4-Date Dimension:
date_key: Primary key for the date dimension. date: Date in various formats (e.g., YYYY-MM-DD). Other date-related attributes (e.g., day of the week, month, year).

# Fact Table
Order Fact Table: order_key: Primary key for the order fact table. book_key: Foreign key referencing the Book Dimension. customer_key: Foreign key referencing the Customer Dimension. date_key: Foreign key referencing the Date Dimension. order_quantity: The quantity of books ordered. Other order-related measures.
![SalesFact2](https://github.com/MohamedSelim11/gravity_books_DWH/assets/127447294/c207c7c1-6a61-4d69-882a-f8bb18297f37)

# How to Use
To use this data warehouse, you can connect to it using your preferred reporting or analytics tool. Query the dimensions and the fact table to gain insights into Gravity Books' operations.

# Conclusion
Gravity Books Data Warehouse serves as a structured and efficient data repository for analyzing the bookstore's activities. The documentation outlined the source data, the ETL process, and the resulting data warehouse schema. Feel free to explore and analyze the data for valuable insights.
