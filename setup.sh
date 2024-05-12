#!/bin/bash

# Update package lists and install necessary packages
sudo apt update
sudo apt install -y python3-pip sqlite3 libpq-dev postgresql postgresql-contrib

# Install Python packages
pip3 install --upgrade awscli boto3
sudo pip3 install virtualenv 

# Create and activate virtual environment
virtualenv venv 
source venv/bin/activate

# Install Apache Airflow and dependencies
pip install "apache-airflow[postgres]==2.5.0" --constraint "https://raw.githubusercontent.com/apache/airflow/constraints-2.5.0/constraints-3.7.txt"
pip install pandas apache-airflow-providers-snowflake snowflake-connector-python snowflake-sqlalchemy

# Initialize Airflow database
airflow db init

# Set up PostgreSQL for Airflow
sudo -u postgres psql -c "CREATE DATABASE airflow;"
sudo -u postgres psql -c "CREATE USER airflow WITH PASSWORD 'airflow';"
sudo -u postgres psql -c "GRANT ALL PRIVILEGES ON DATABASE airflow TO airflow;"

# Configure Airflow
cd ~/airflow
sed -i 's#sqlite:////home/ubuntu/airflow/airflow.db#postgresql+psycopg2://airflow:airflow@localhost/airflow#g' airflow.cfg
sed -i 's#SequentialExecutor#LocalExecutor#g' airflow.cfg

# Create Airflow user and set up DAGs folder
airflow users create -u airflow -f airflow -l airflow -r Admin -e airflow1@gmail.com
mkdir /home/ubuntu/airflow/dags
sed -i 's/^load_examples = .*/load_examples = False/' airflow.cfg

# Initialize Airflow database again with updated configurations
airflow db init

# Start Airflow webserver and scheduler
airflow webserver -D
airflow scheduler -D















