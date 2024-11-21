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

### DBT Concepts File  
I created a file called `dbt_concepts` to document all the DBT concepts I’m learning while building this project.  

### `profiles.yml` -

`profiles.yml` file configures the connection between DBT and Snowflake. It defines how DBT should authenticate and connect to our Snowflake data warehouse.
When we run DBT commands, such as dbt run or dbt test, the profiles.yml file tells DBT how to connect to our Snowflake database using the specified configuration. By setting up the target as dev, DBT uses the connection details under the dev output.
This setup is flexible and allows us to add other environments like prod for production-level settings if needed.
- [`profiles.yml`](dbt/profiles.yml)


### `dbt_project.yml` -
The dbt_project.yml file is the configuration file that tells DBT how to run your project. It contains essential details about the project, including its name, version, profiles, model configuration, and more.
- [`dbt_project.yml`](dbt/dbt_project.yml)

### Seeds - 
In DBT, seeds are CSV files that we can load as tables into our database.  
I have used **4 seed files** in this project to load static data. 
- [`seeds`](dbt/seeds)

### `sources.yml` -
The sources.yml file is a configuration file to define metadata for the source data that we will use in our models. 
- [`sources.yml`](dbt/models/sources.yml)
  
This sources.yml file defines the metadata for two source tables in the TRAVEL_DB Snowflake database: booking_details and customer_details. It specifies the schema (raw) and provides descriptions for each table and its columns.

I have use **Freshness** parameter to ensure that the data being ingested or transformed is current and valid. Both the booking_details and customer_details tables have freshness checks that trigger:
  - A warning if the data is older than 1 hour.
  - An error if the data is older than 24 hours.
I have use Data Quality Tests to ensure things like booking_id is unique, essential fields like customer_id are not null, and status are always one of the accepted options.

### Models -
In DBT, models are SQL files where we define transformations to manipulate and clean our raw data. Each model represents a specific transformation or view that gets created in the database. These models help us break down complex processes into manageable, reusable parts, making the pipeline more efficient and easier to maintain.

To keep everything clear and organized, I have divided the DBT models into three distinct layers: Staging, Intermediate, and Marts.

1. Staging:
This layer contains models that load raw data directly from the source tables.

models/staging/stg_booking_details.sql
models/staging/stg_customer_details.sql

Both of these staging models are designed to structure raw data from the source tables in a way that makes it easier to work with in later stages of the pipeline.


2. Intermediate:
The intermediate models take the clean data from the staging layer and apply further transformations.

**int_booking_details** -
**Config Block**:
- **Materialization**: The model is set to be materialized incrementally (`materialized='incremental'`), meaning only new or changed records will be processed rather than reprocessing the entire dataset.
- **Pre-Hook and Post-Hook**: 
  - **Pre-hook**: Before the model runs, it inserts a log entry into the `model_run_log` table to track when the model execution starts.
  - **Post-hook**: After the model execution finishes successfully, it inserts another log entry to mark the model as complete.
   - The model pulls data from the `stg_booking_details` staging table (via `{{ ref('stg_booking_details') }}`) and joins it with other tables (`destination_types`, `customer_segments`, `country_codes`, and `currency_exchange_rates`).
   - This creates a more enriched version of the `booking_details` table
This setup ensures that only new and updated bookings are processed, and it logs the model's execution times for tracking purposes. It efficiently manages growing datasets by leveraging DBT’s incremental model functionality, reducing processing time and resources.

**int_customer_details** -
This model takes the data from the Staging layer (stg_customer_details.sql) and prepare it for business analysis and reporting. The joins with customer_segments and country_codes add valuable context to the data, allowing us to better understand customer demographics.

4. Marts:
The marts layer contains models that are optimized for business users and reporting tools.









