# Project Name: Simple Batch Data Pipeline

## Description:

Welcome to the Simple Batch Data Pipeline project! This project aims to demonstrate how to set up a basic data pipeline using various AWS services, Python, and Airflow for workflow management.

The pipeline consists of the following key steps:

1. **Data Ingestion**: We start by creating an EMR cluster on AWS. Then, we download data from the internet in CSV or JSON format and store it in an S3 bucket (Landing Layer).

2. **Data Transformation**: Using PySpark, we perform necessary transformations on the ingested data. The transformed data is stored back in an S3 bucket (Curated Layer).

3. **Data Loading**: Finally, we load the transformed data into a Snowflake external table.

These steps are orchestrated and managed by Airflow, running on an EC2 instance.


## Project Architecture
![Blank diagram](https://github.com/tejasjbansal/Simple-Batch-Data-Pipeline/assets/56173595/6d8ca2a5-1969-4cd1-bf03-1da8e69f1f3d)

## Airflow Dag
![image](https://github.com/tejasjbansal/Simple-Batch-Data-Pipeline/assets/56173595/d395fe06-a9e2-4b32-904c-2a6aecbf628a)

## Technologies:

- Python 3.10 (minimum)
- EC2 Machine
- Airflow
- EMR (AWS)
- S3 (AWS)
- PySpark
- Snowflake

## Getting Started:

To get started with this project, follow these steps:

1. **Set up AWS Environment**: Ensure you have an AWS account set up. Configure necessary permissions and create an S3 bucket for storing data.

2. **Set up EC2 Instance**: Launch an EC2 instance and install Airflow. You can follow the official Airflow documentation for installation instructions.

3. **Set up Airflow**: Configure Airflow with necessary connections to your AWS account and set up the DAGs (Directed Acyclic Graphs) for orchestrating the pipeline steps. Sample DAGs are provided in the `dags/` directory.

4. **Run the Pipeline**: Trigger the DAGs in Airflow to start the pipeline execution. Monitor the progress in the Airflow UI and check the S3 buckets and Snowflake tables for data.

5. **Explore and Customize**: Explore the project structure and codebase to understand how each component works. Feel free to customize the pipeline according to your requirements.

## Contributions:

Contributions to this project are welcome! If you find any bugs, issues, or have suggestions for improvements, please open an issue or submit a pull request on GitHub.

## License:

This project is licensed under the [MIT License](LICENSE). Feel free to use and modify it according to your needs.

---

Thank you for choosing Simple Batch Data Pipeline for your data processing needs! If you have any questions or need further assistance, don't hesitate to reach out to the project maintainers. Happy data engineering! 🚀
