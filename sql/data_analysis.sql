--Simple Exploratory Data Analysis

--Calculate daily, monthly, and yearly sales totals  
--Daily Sales total
SELECT
  trans_date date,
  sum(total_price) daily_sales_total
FROM
  sales_data
GROUP BY
  trans_date
ORDER BY
  trans_date;

--Monthly Sales total
SELECT
  date_trunc('month', trans_date) monthandyear,
  sum(total_price) monthly_sales_total
FROM
  sales_data
GROUP BY
  date_trunc('month', trans_date)
ORDER BY
  date_trunc('month', trans_date);

--Yearly Sales total
SELECT
  extract('year' FROM trans_date) years,
  sum(total_price) yearly_sales_total
FROM
  sales_data
GROUP BY
  extract('year' FROM trans_date) 
ORDER BY
  extract('year' FROM trans_date);

--Calculate growth rates
SELECT
  years,
  (yearly_sales_total - lag(yearly_sales_total) OVER (ORDER BY years)) * 100.0 / lag(yearly_sales_total) OVER (ORDER BY years) growth_rate
FROM
  (
    SELECT
      extract('year' FROM trans_date) years,
      sum(total_price) yearly_sales_total
    FROM
      sales_data
    GROUP BY
      extract('year' FROM trans_date)
    ORDER BY
      extract('year' FROM trans_date)
  ) yearly_sales_data;

--Identify best-selling products and categories 
--Best Selling Product
SELECT
  item_code product,
  sum(total_price) sold_amount,
  rank() OVER (ORDER BY sum(total_price) DESC)
FROM
  sales_data
GROUP BY
  item_code
ORDER BY
  sum(total_price) DESC
LIMIT 1;

--Best Selling Category
SELECT
  category,
  sum(total_price) sold_amount,
  rank() OVER (ORDER BY sum(total_price) DESC)
FROM
  sales_data
GROUP BY
  category
ORDER BY
  sum(total_price) DESC
LIMIT 1;

--Find peak shopping days
SELECT
  trans_date,
  count(cust_id) no_of_customers_shopped
FROM
  sales_data
GROUP BY
  trans_date
ORDER BY 2 DESC
LIMIT 10;

--Calculate customer purchase frequency
SELECT
  extract('year' FROM trans_date) years,
  count(trans_id) / count(DISTINCT cust_id) customer_purchase_frequency
FROM
  sales_data
GROUP BY
  extract('year' FROM trans_date)
ORDER BY 1, 2 DESC;
