# gravity_books_DWH
Gravity Books Data Warehouse is a data integration and analytics solution designed to provide insights into the operations of a fictional bookstore, Gravity Books. 
This documentation provides an overview of the project's structure, its source data, data transformations, and the resulting data warehouse schema.

# Project Overview
# ETL Tool: SQL Server Integration Services (SSIS)
![AllControlFlow](https://github.com/MohamedSelim11/gravity_books_DWH/assets/127447294/387cd048-18c1-4b16-9c8e-75926c9254d1)

# Source Database: Gravity Books (SQL Server)


Dimensions: Book Dimension, Customer Dimension, Date Dimension Fact Table: Order Fact Table Source Data The source data for this data warehouse project originates from the Gravity Books database, which consists of the following tables:

country: Information about countries. address: Details about addresses. 
customer_address: Relationships between customers and their addresses. 
customer: Customer information. address_status: Address status information. order_line: Details of individual order lines. 
order_status: Order status information. order_history: Order history records. 
cust_order: Customer order information. shipping_method: Shipping methods. 
book_language: Languages in which books are available. book: Book information. 
publisher: Publishers' details. 
book_author: Relationships between books and authors. author: Author information. data base schema

ETL Process
The ETL (Extract, Transform, Load) process using SQL Server Integration Services (SSIS) involved the following steps:

Data Extraction: Data was extracted from the source tables in the Gravity Books database.

Data Transformation: The data was transformed to create denormalized tables for the three dimensions (Book, Customer, Date), including adding appropriate attributes and aggregations where necessary. For example, the Date Dimension includes various attributes related to dates.

Data Loading: The transformed data was loaded into the data warehouse tables.

Data Warehouse Schema
StarSchema

Dimensions
Customer Dim BooksFact Book Dim

Book Dimension:
book_key: Primary key for the book dimension. book_title: Title of the book. author_name: Author's name. Other book-related attributes. Book Dim Run Success

Customer Dimension:
Customer Dim Run Success

customer_key: Primary key for the customer dimension. customer_name: Customer's name. Other customer-related attributes.

Date Dimension:
date_key: Primary key for the date dimension. date: Date in various formats (e.g., YYYY-MM-DD). Other date-related attributes (e.g., day of the week, month, year).

Fact Table
BooksFact

Order Fact Table: order_key: Primary key for the order fact table. book_key: Foreign key referencing the Book Dimension. customer_key: Foreign key referencing the Customer Dimension. date_key: Foreign key referencing the Date Dimension. order_quantity: The quantity of books ordered. Other order-related measures.

How to Use
To use this data warehouse, you can connect to it using your preferred reporting or analytics tool. Query the dimensions and the fact table to gain insights into Gravity Books' operations.

Conclusion
Gravity Books Data Warehouse serves as a structured and efficient data repository for analyzing the bookstore's activities. The documentation outlined the source data, the ETL process, and the resulting data warehouse schema. Feel free to explore and analyze the data for valuable insights.
