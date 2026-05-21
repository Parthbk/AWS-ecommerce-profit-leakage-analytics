-- “ 1. Which products are causing profit loss?”
SELECT product_name,
ROUND(SUM(sales),2) AS total_sales,
ROUND(SUM(profit),2) AS total_profit
FROM clean
GROUP BY product_name
ORDER BY total_profit ASC;

-- “ 2.Which regions are underperforming?”
SELECT customer_region,
ROUND(SUM(sales),2) AS total_sales,
ROUND(SUM(profit),2) AS total_profit
FROM clean
GROUP BY customer_region
ORDER BY total_profit ASC;

-- “ 3.Do discounts reduce profit?”
SELECT discount,
ROUND(AVG(profit),2) AS avg_profit
FROM clean
GROUP BY discount
ORDER BY discount;

-- “ 4.Who are the top customers?”
SELECT customer_name,
ROUND(SUM(sales),2) AS total_spent
FROM clean
GROUP BY customer_name
ORDER BY total_spent DESC
LIMIT 10;

-- “ 5.Which category is most profitable?”
SELECT customer_category,
ROUND(SUM(profit),2) AS total_profit
FROM clean
GROUP BY customer_category
ORDER BY total_profit DESC;

-- “ 6.Monthly sales trend?”
SELECT 
    month(date_parse(order_date,'%m/%e/%Y')) AS month,
    ROUND(SUM(sales),2) AS monthly_sales
FROM clean
GROUP BY month(date_parse(order_date,'%m/%e/%Y'))
ORDER BY month;

-- “ 7.Shipping performance analysis”
SELECT ship_mode,
ROUND(AVG(profit),2) AS avg_profit,
COUNT(*) AS total_orders
FROM clean
GROUP BY ship_mode;

-- “ 8.Profit Margin Analysis”
SELECT customer_segment,
ROUND((SUM(profit)/SUM(sales))*100,2) AS profit_margin_percent
FROM clean
GROUP BY customer_segment
ORDER BY profit_margin_percent DESC;