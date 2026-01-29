--Create stored procedure to dynamically create temporary tables to help update missing values in sales_data table

CREATE OR REPLACE PROCEDURE create_populate_temp_tables (tbl_name VARCHAR, categ_value VARCHAR) 
LANGUAGE plpgsql 
AS $$
BEGIN
	EXECUTE format('
    CREATE TEMP TABLE %I AS 
    SELECT 
    		item_code,
  			min(price_per_unit) AS price
		FROM
  			sales_data
		WHERE
  			category = %L
  		AND item_Code IS NOT NULL
		GROUP BY
  			item_code
		ORDER BY
  			item_code;;
    ', tbl_name, categ_value);
END;
$$;
