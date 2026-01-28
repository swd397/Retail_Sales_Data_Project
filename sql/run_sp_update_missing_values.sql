--Run the stored procedure, update_missing_values with the below values to ensure data consistency

CALL update_missing_values('furniture', 'Furniture');
CALL update_missing_values('comp_elec_access', 'Computers and electric accessories');
CALL update_missing_values('food', 'Food');
CALL update_missing_values('elec_hous_essen', 'Electric household essentials');
CALL update_missing_values('milk_products', 'Milk Products');
CALL update_missing_values('butchers', 'Butchers');
CALL update_missing_values('patisserie', 'Patisserie');
CALL update_missing_values('beverages', 'Beverages');
