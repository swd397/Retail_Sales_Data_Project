import os # to get parameters from Docker compose file's environment variables
import pandas as pd # to read the csv and 
from sqlalchemy import create_engine # to connect to postgres database for data transfer
from time import time # to calculate the time taken for insertion

if __name__ == '__main__':
	# Environment variables acquired from docker compose
	host = os.getenv('DB_HOST')
	user = os.getenv('DB_USER')
	password = os.getenv('DB_PASSWORD')
	port = int(os.getenv('DB_PORT'))
	db = os.getenv('DB_NAME')
	table_name = 'sales_data'
	
	engine = create_engine(f'postgresql://{user}:{password}@{host}:{port}/{db}') # setting the database connection
	print('DB connected successfully..trying to insert data')
	try:
		df = pd.read_csv('retail_store_sales.csv') # read csv file
		new_column_names = ['trans_id', 'cust_id', 'category', 'item_code', 'price_per_unit', 'quantity', 'total_price', 'pay_type', 'location', 'trans_date', 'discount_applied']
		df.columns = new_column_names # to provide proper column names to database table
		df.trans_date = pd.to_datetime(df.trans_date) # converting the text column in csv to a date column in sql
		df.head(n=0).to_sql(name = table_name, con = engine, if_exists = 'replace') #df.head(n=0) takes only the column names and so this code helps in creating a new table in the db with just the table structure
		t_start = time()
		df.to_sql(name = table_name, con = engine, if_exists = 'append') #to generate SQL query to add data into the table sales_data
		t_end = time()
		print('Data insertion completed in %.3f seconds\nSuccess!' % (t_end-t_start))	
	except:
		print('Something went wrong! Try again :(') 	
