-- Create Snowflake stage and tables

DROP DATABASE IF EXISTS s3_to_snowflake;
CREATE DATABASE IF NOT EXISTS s3_to_snowflake;
USE ROLE accountadmin;
USE DATABASE s3_to_snowflake;
CREATE OR REPLACE STAGE snow_simple URL='s3://irisflowerdataset/output_folder/' CREDENTIALS=(AWS_KEY_ID='' AWS_SECRET_KEY='');
CREATE OR REPLACE FILE FORMAT my_parquet_format TYPE = 'parquet';
CREATE OR REPLACE EXTERNAL TABLE Iris_dataset (CLASS_NAME VARCHAR(20) AS (Value:CLASS_NAME::VARCHAR), Count_Value NUMBER AS (Value:COUNT::NUMBER)) LOCATION = @snow_simple FILE_FORMAT = 'my_parquet_format';



-- Execute Snowflake queries
SELECT * FROM s3_to_snowflake.PUBLIC.Iris_dataset;