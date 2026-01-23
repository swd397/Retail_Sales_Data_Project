FROM python:3.9

# Sets the working directory to app instead of the root folder in the docker container
WORKDIR /app

# Copies the files from source/host directory on which the Dockerfile is located to the docker container's working directory
COPY insert_retail_data_csv.py .
COPY requirements.txt .
COPY retail_store_sales.csv .

# Installs required libraries or toolkits mentioned in the requirements file using pip in python
RUN pip install --no-cache-dir -r requirements.txt

# To execute the python script
ENTRYPOINT ["python","insert_retail_data_csv.py"]
