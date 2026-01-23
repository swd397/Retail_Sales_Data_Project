## Retail Sales Data Analysis

	The project uses a retail sales dataset to analyse purchasing patterns, customer behavior and product performance.

### Motivation

 A simple data project to showcase,
 - Creation of a database in a Docker container 
 - Transfer data from a .csv file into the DB via a Python script 
 - Carry out data cleaning and exploratory data analysis using a SQL client

### Build Status

 Added the dataset required for the project
 Created a Docker Compose file to run Postgresql and PgAdmin services as containers
 Created a Dockerfile to build a Python script image and defined the Python application service in the docker compose file
 Wrote a Python ingestion script to upload the data from csv to the PG database using Pandas library and SQLAlchemy as the SQL toolkit

### Tech Stack

 - **Programming Language:** Python
 - **Database:** PostgreSQL
 - **Tools:** Docker | PGAdmin 
 
### System Requirements
 
 - Operating System: Ubuntu 22.04 and higher
 - RAM: Minimum 4 GB
 - Disk Space: At least 20 GB

### Installation
	
	The project has been created in Ubuntu OS and so the below steps of installation would be suitable only for Ubuntu users.
	
	[Docker Installation] https://tomerklein.dev/step-by-step-tutorial-installing-docker-and-docker-compose-on-ubuntu-a98a1b7aaed0
	
### Replication Steps


### Acknowledgement
 
 The dataset on which the project revolves around has been acquired from Kaggle [Link] https://www.kaggle.com/datasets/ahmedmohamed2003/retail-store-sales-dirty-for-data-cleaning
	
