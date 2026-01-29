--Create stored procedure to dynamically carry out the missing data updates and provide consistent data for analysis

CREATE OR REPLACE PROCEDURE update_missing_values (source_tbl_name VARCHAR, categ_value VARCHAR) 
LANGUAGE plpgsql 
AS $$
BEGIN
	EXECUTE format('
        UPDATE sales_data sd
        SET 
            item_code = t.item_code, 
			price_per_unit = t.price
        FROM 
            %I t
        WHERE 
			sd.item_code IS NULL 
		AND sd.category = %L 
		AND (sd.price_per_unit = t.price OR (sd.total_price/sd.quantity) = t.price);
    ', source_tbl_name, categ_value);

	EXECUTE format('
		UPDATE sales_data sd 
		SET 
            quantity = 1, 
		    total_price = t.price 
		FROM 
            %I t 
		WHERE 
            sd.category = %L 
		AND sd.item_code = t.item_Code
		AND sd.total_price IS NULL 
		AND sd.quantity IS NULL;
	', source_tbl_name, categ_value);
END;
$$;
