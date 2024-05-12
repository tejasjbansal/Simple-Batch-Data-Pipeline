from pyspark.sql import SparkSession

def main():
    # Initialize Spark session
    spark = SparkSession.builder.appName("airflow_with_emr").getOrCreate()
    
    # Specify the S3 location of input data
    s3_location = "s3://irisflowerdataset/input_folder/"
    
    # Read CSV data from S3 location into a DataFrame
    iris = spark.read.format("csv").option("inferSchema", "true").load(s3_location).toDF(
        'SEPAL_LENGTH', 'SEPAL_WIDTH', 'PETAL_LENGTH', 'PETAL_WIDTH', 'CLASS_NAME'
    )
    
    # Group data by 'CLASS_NAME' column and count occurrences
    ms = iris.groupBy("CLASS_NAME").count()
    
    # Write the result to S3 in Parquet format
    ms.coalesce(1).write.format("parquet").mode('overwrite').save("s3://irisflowerdataset/output_folder/")

if __name__ == "__main__":
    main()
