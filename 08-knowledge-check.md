## quiz title: Knowledge check 

## Multiple Choice

You need to implement a data processing solution that monitors a social media feed and counts the number of posts containing the the hashtag "#datarocks" per minute for real-time reporting. What kind of data processing is required?
( ) Batch processing. {{Incorrect. The source is a continuous stream of data and the requirement is for real-time reporting. Batch processing would not be the best way to implement this functionality.}}
(x) Stream processing. {{Correct. Stream processing could be used to ingest the social media feed, aggregate the posts over one minute windows, and present the results in a real-time report.}}
( ) Offline processing. {{Incorrect. The source is a continuous stream of data and the requirement is for real-time reporting. This requires the data processing solution to be running continuously, not offline.}}

## Multiple Choice 

You need to process a stream of stock price data from a real-time stock market feed that is captured in an Azure Event Hub, filter the data to include only prices for a specific list of stocks, and store the filtered results in Azure SQL Database. Which service should you use to filter the data?
( ) Azure Batch. {{Incorrect. Azure Batch does not provide stream querying functionality.}}
( ) Azure Storage. {{Incorrect. Azure Storage does not provide stream querying functionality.}}
(x) Azure Stream Analytics {{Correct. Azure Stream Analytics can be used to query a stream of data from Azure Event Hubs and store the results in Azure SQL Database.}}

## Multiple Choice 

Which capability of Azure Synapse Analytics enables you to implement table-based stream processing for data in a data lake?
( ) Serverless SQL pool. {{Incorrect. Although Azure Synapse has support for serverless SQL pools, this is not used from stream processing.}}
(x) Spark pool and Delta Lake. {{Correct. Delta Lake support in a Spark pool enables you to use a table as a streaming source or sink.}}
( ) Pipelines. {{Incorrect. Azure Synapse pipelines are typically used to perform data ingestion and batch processing tasks.}}
