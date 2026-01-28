--Run the stored procedure, create_populate_temp_tables with the below values to create the temporary tables with required data

CALL create_populate_temp_tables('furniture', 'Furniture');
CALL create_populate_temp_tables('comp_elec_access', 'Computers and electric accessories');
CALL create_populate_temp_tables('food', 'Food');
CALL create_populate_temp_tables('elec_hous_essen', 'Electric household essentials');
CALL create_populate_temp_tables('milk_products', 'Milk Products');
CALL create_populate_temp_tables('butchers', 'Butchers');
CALL create_populate_temp_tables('patisserie', 'Patisserie');
CALL create_populate_temp_tables('beverages', 'Beverages');
