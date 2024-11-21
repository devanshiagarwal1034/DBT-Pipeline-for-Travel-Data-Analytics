# Data Engineering Project Using DBT

This project is for anyone who wants to get started with **DBT (Data Build Tool)**.  I built it to learn the basics of DBT and how it works with Snowflake.

### What is DBT?  
DBT is a tool that helps you write SQL queries and organize your data transformations.  
But DBT doesn’t have its own storage—it needs a data warehouse like Snowflake to run queries.

### Goal  
The goal of this project is to learn how DBT works and practice its main features like connections, seeds, and configurations.

Tools I Used  - DBT Cloud (Trial version), Snowflake (Trial version) 

## lets start 
I have created a database and schema to store the raw data.  

```sql
CREATE DATABASE travel_db;  
CREATE SCHEMA raw;
``` 
I have added two tables to the raw schema:  

- `booking_details`  
- `customer_details`  

You can find the SQL scripts for these tables here:  
- [`Snowflake_code/customer_details.sql`](./Snowflake_code/customer_details.sql)  
- [`Snowflake_code/booking_details.sql`](./Snowflake_code/booking_details.sql)  

In DBT Cloud, I connected to Snowflake by adding:  Account ID, Database , Warehouse

first I have created the `profiles.yml` file.
This file tells DBT how to connect to Snowflake.


### Project File (`dbt_project.yml`)  
This file contains all the project settings like the database, schema, and project name.  

### DBT Concepts File  
I created a file called `dbt_concepts` to document all the DBT concepts I’m learning while building this project.  

---

## What Are Seeds?  
In DBT, seeds are CSV files that you can load as tables into your database.  
I used **4 seed files** in this project to load sample data.  






