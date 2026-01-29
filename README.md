## Data Project - Retail Sales Data

 The project uses python script to ingest data into a database from a csv file and carry out simple data analysis such as purchasing patterns, customer behavior and product performance on the retail sales data.

### Motivation

 A simple data project to showcase,
 - Creation of a database in a docker container 
 - Transfer data from a .csv file into the DB via a python script 
 - Carry out data cleaning and exploratory data analysis using a SQL client

### Build Status

 - Added the dataset required for the project
 - Created a Docker Compose file to run Postgresql and PgAdmin services as containers
 - Created a Dockerfile to build a Python script image and defined the python application service in the docker compose file
 - Wrote a Python ingestion script to upload the data from CSV to the PG database using pandas library and SQLAlchemy as the SQL toolkit
 - Identified missing data and updated them dynamically using stored procedures in SQL
 - Carried out simple exploratory sales data analysis

### Tech Stack

 - **Programming Language:** Python
 - **Database:** PostgreSQL
 - **Tools:** Docker | PGAdmin 
 
### System Requirements
 
 - Operating System: Ubuntu 22.04 and higher
 - RAM: Minimum 4 GB
 - Disk Space: At least 20 GB

### Installation
	
 - The project has been created in Ubuntu OS and so the below steps of installation would be suitable only for Ubuntu users.
 - Refer this to install docker - [Docker Installation](https://tomerklein.dev/step-by-step-tutorial-installing-docker-and-docker-compose-on-ubuntu-a98a1b7aaed0)
	
### Replication Steps

 - Place the Dockerfile, docker-compose.yaml, insert_retail_data_csv.py, requirements.txt and .csv file in the same directory.
 - Create a .env file in the same directory and replace the below values between << and >> with your personal db and pgadmin credentials.
	
 .env:
 ```ini
 POSTGRES_DB=<<db_name>>
 POSTGRES_USER=<<postgres_user>>
 POSTGRES_PASSWORD=<<postgres_password>>
 POSTGRES_PORT=<<postgres_port_number>>

 PGADMIN_DEFAULT_EMAIL=<<pgadmin_email>>
 PGADMIN_DEFAULT_PASSWORD=<<pgadmin_password>>
 PGADMIN_PORT=<<pgadmin_port_number>> 
 
 HOST=<<postgres_service_name>>
 ```
 
 - Build the python app docker container and run the docker-compose.yaml via command prompt.
 ```bash
 docker compose up --build -d
 ```
 
 - Find the status of all the containers.
 ```bash
 docker ps -a
 ```
 
 - Copy the docker container id of python app. Using the below prompt, check the docker log and find the output of the python script.
 ```bash
 docker logs <<python_container_id>>
 ```
 
 - The success message in the docker log indicates that the script has transferred data from the csv file to the postgres db.
 - Go to the web browser and type, localhost:<<pgadmin_port_number>>
 - The pgadmin webpage opens, enter the pgadmin's username and password as mentioned in the .env file and login.
 - After logging in, click on 'Add New Server'. 
 - Under the `General` tab, provide a server name. 
 - On the `Connection` tab, enter the postgres service name as Host name/address postgres, then the postgres db credentials and click Save.
 - On the left side of the screen, the added server and databases could be seen.
 
 - Run the select query to confirm the data transfer to the postgres database.
 ```sql
 select * from sales_data;
 ```
 - The dataset used in the project has values missing in item_code, price_per_unit, quantity and total_price columns.
 - The missing item values can be deduced from Price Per Unit and Total Spent wherever possible.
 - Create temp tables to get item_code and price_per_unit for every category. Then join the temp table and sales_data table values. The missing values would be updated with appropriate values and data consistency would be achieved.
 - Run the query in `sp_create_populate_temp_tables.sql` file in the retail_db database to create a dynamic stored procedure for the above requirement. Call the stored procedure using queries in `run_sp_create_populate_temp_tables.sql` file.
 - Update the missing values with the help of the created temp tables using another dynamic stored procedure in `sp_update_missing_values.sql` and call them using queries in `run_sp_update_missing_values.sql`.
 - All the missing values in the important columns required for data analysis would be updated.
 - The EDA can then be carried out using queries in `data_analysis.sql`.
 - To exit out of the docker containers after completion, use the below prompt.
 ```bash
 docker compose down
 ```
 
 For detailed explanation on the project and analysis, refer [here](Project_Explanaion.md).
  
### Acknowledgements
 
 - The project is based on a dataset acquired from Kaggle, [Link](https://www.kaggle.com/datasets/ahmedmohamed2003/retail-store-sales-dirty-for-data-cleaning).
 - Learnt about the use of docker, docker compose and the way of creating a dockerized python ingestion script from [Data Engineering Zoomcamp](https://github.com/DataTalksClub/data-engineering-zoomcamp).
	
