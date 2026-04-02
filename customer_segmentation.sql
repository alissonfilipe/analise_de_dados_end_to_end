CREATE DATABASE data_analysis;
USE data_analysis;

-- mostrar tabelas
SHOW TABLES;
SELECT COUNT(*) FROM customer_clean;

SELECT * FROM customer_clean LIMIT 10;

-- receita total do sexo masculino em comparação com a do sexo feminino

SELECT gender, SUM(purchase_amount) AS revenue 
FROM customer_clean
GROUP BY gender;

-- quantos clientes usaram desconto e mesmo assim gastaram mais que a média
SELECT customer_id, purchase_amount
FROM customer_clean WHERE discount_applied = 'Yes' AND purchase_amount >= (SELECT AVG(purchase_amount) FROM customer_clean);

-- top 5 produtos com a melhor classificação
SELECT item_purchased, ROUND(AVG(review_rating),2) AS "Average Product rating"
FROM customer_clean 
GROUP BY item_purchased ORDER BY AVG(review_rating) DESC
LIMIT 5;

-- media de dois diferentes tipos de entrega

SELECT shipping_type,
ROUND(AVG(purchase_amount),2)
FROM customer_clean
WHERE shipping_type in ('Standard','Express')
group by shipping_type;

-- saber se o programa de incrição funcionou ou não
SELECT subscription_status,
COUNT(customer_id) AS total_customer,
ROUND(AVG(purchase_amount),2) AS avg_spend,
ROUND(SUM(purchase_amount),2) AS total_revenue
FROM customer_clean
GROUP BY subscription_status
ORDER BY total_revenue, avg_spend DESC;

-- qual dos 5 produtos tem a maior porcentagem de compras com o desconto aplicado 
-- quais produtos precisam de descontos para serem vendidos 
SELECT * FROM customer_clean;

SELECT item_purchased,
ROUND(100 * SUM(CASE WHEN discount_applied = 'yes' THEN 1 ELSE 0 END)/COUNT(*),2) AS disount_rate
FROM customer_clean
GROUP BY item_purchased
ORDER BY disount_rate DESC
LIMIT 5;

-- segmentar clientes, classificar em novos recorrentes, fiéis etc
SELECT * FROM customer_clean;

WITH costumer_type AS (
SELECT customer_id,previous_purchases,
CASE 
	WHEN previous_purchases = 1 THEN 'New'
    WHEN previous_purchases BETWEEN 2 AND 10 THEN 'Returning'
    ELSE 'Loyal'
    END AS costumer_segment
FROM customer_clean
)

SELECT customer_segment, COUNT(*) AS "Number of Customers" 
FROM customer_type
GROUP BY costumer_segment;

WITH customer_type AS (
SELECT customer_id, previous_purchases,
CASE 
    WHEN previous_purchases = 1 THEN 'New'
    WHEN previous_purchases BETWEEN 2 AND 10 THEN 'Returning'
    ELSE 'Loyal'
END AS customer_segment
FROM customer_clean
)

SELECT customer_segment, COUNT(*) AS "Number of Customers" 
FROM customer_type
GROUP BY customer_segment;

-- maiores compras por categoria
SELECT * FROM customer_clean;

WITH intem_counts AS (
SELECT category,
item_purchased,
COUNT(customer_id) AS total_orders,
ROW_NUMBER() OVER(PARTITION BY CATEGORY ORDER BY COUNT(customer_id) DESC) AS item_rank
FROM customer_clean
GROUP BY
category, item_purchased
)

SELECT item_rank, category, item_purchased, total_orders
FROM intem_counts
WHERE item_rank <=3;

-- pessoas que compram frequentemente são inscritas ?
SELECT * FROM customer_clean;

SELECT subscription_status, 
COUNT(customer_id) AS repeat_buyers
FROM customer_clean
WHERE previous_purchases > 5
GROUP BY subscription_status;

-- qual é a contribuição de cada grupo

SELECT * from customer_clean;

SELECT age_group,
SUM(purchase_amount) AS total_revenue
FROM customer_clean
GROUP BY age_group	
ORDER BY total_revenue DESC;

