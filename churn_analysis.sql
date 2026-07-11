CREATE DATABASE bank_project;
use bank_project;
SELECT *
FROM bank_customer_churn
limit 10;
RENAME TABLE `bank customer churn prediction`
TO bank_customer_churn;
select 
	count(*) as total_rows,
	count(distinct customer_id) as unique_customer_id
from bank_customer_churn;

select customer_id,count(*)
from bank_customer_churn
group by customer_id
having count(*) > 1;
 
desc bank_customer_churn;

-- 이탈률 확인
select
	churn,
    count(*) as cnt
from bank_customer_churn
group by churn;
    
select
	churn,
    count(*) as cnt,
    round(count(*)*100.0/sum(count(*))over(),2) as pct
from bank_customer_churn
group by churn;

select
	churn,
    AVG(age) as avg_age
from bank_customer_churn
group by churn;

SELECT
    churn,
    AVG(tenure) AS avg_tenure
FROM bank_customer_churn
GROUP BY churn;

SELECT
    churn,
    AVG(balance) AS avg_balance
FROM bank_customer_churn
GROUP BY churn;

SELECT
    churn,
    AVG(estimated_salary) AS avg_salary
FROM bank_customer_churn
GROUP BY churn;

SELECT
    churn,
    AVG(credit_score) AS avg_credit_score
FROM bank_customer_churn
GROUP BY churn;

SELECT COUNT(*), COUNT(DISTINCT customer_id)
FROM bank_customer_churn;

DESC bank_customer_churn;

CREATE VIEW churn_view AS
SELECT
    customer_id,
    credit_score,
    country,
    gender,
    age,
    tenure,
    balance,
    products_number,
    credit_card,
    active_member,
    estimated_salary,
    churn
FROM bank_customer_churn;

SELECT *
FROM churn_view
LIMIT 5;

SELECT
    country,
    COUNT(*) AS customer_count
FROM bank_customer_churn
GROUP BY country;

SELECT
    country,
    churn,
    COUNT(*) AS customer_count
FROM bank_customer_churn
GROUP BY country, churn;

SELECT
    country,
    COUNT(*) AS total_customer,
    SUM(churn) AS churn_customer,
    ROUND(SUM(churn) * 100.0 / COUNT(*), 2) AS churn_rate
FROM bank_customer_churn
GROUP BY country;

SELECT
    gender,
    COUNT(*) AS total_customer,
    SUM(churn) AS churn_customer,
    ROUND(SUM(churn) * 100.0 / COUNT(*), 2) AS churn_rate
FROM bank_customer_churn
GROUP BY gender;

SELECT
    active_member,
    COUNT(*) AS total_customer,
    SUM(churn) AS churn_customer,
    ROUND(SUM(churn) * 100.0 / COUNT(*), 2) AS churn_rate
FROM bank_customer_churn
GROUP BY active_member;

SELECT
    credit_card,
    COUNT(*) AS total_customer,
    SUM(churn) AS churn_customer,
    ROUND(SUM(churn) * 100.0 / COUNT(*), 2) AS churn_rate
FROM bank_customer_churn
GROUP BY credit_card;

SELECT
    products_number,
    COUNT(*) AS customer_count
FROM bank_customer_churn
GROUP BY products_number
ORDER BY products_number;

SELECT
    products_number,
    COUNT(*) AS total_customer,
    SUM(churn) AS churn_customer,
    ROUND(SUM(churn) * 100.0 / COUNT(*), 2) AS churn_rate
FROM bank_customer_churn
GROUP BY products_number
ORDER BY products_number;

SELECT
    CASE
        WHEN age < 30 THEN '20대'
        WHEN age < 40 THEN '30대'
        WHEN age < 50 THEN '40대'
        ELSE '50대 이상'
    END AS age_group,
    COUNT(*) AS total_customer
FROM bank_customer_churn
GROUP BY age_group;

SELECT
    CASE
        WHEN age < 30 THEN '20대'
        WHEN age < 40 THEN '30대'
        WHEN age < 50 THEN '40대'
        ELSE '50대 이상'
    END AS age_group,
    COUNT(*) AS total_customer,
    SUM(churn) AS churn_customer,
    ROUND(SUM(churn) * 100.0 / COUNT(*), 2) AS churn_rate
FROM bank_customer_churn
GROUP BY age_group;

SELECT
    CASE
        WHEN age < 30 THEN '20대'
        WHEN age < 40 THEN '30대'
        WHEN age < 50 THEN '40대'
        ELSE '50대 이상'
    END AS age_group,
    COUNT(*) AS total_customer
FROM bank_customer_churn
GROUP BY age_group
HAVING COUNT(*) >= 2000;

SELECT
    country,
    COUNT(*) AS customer_count
FROM bank_customer_churn
GROUP BY country
HAVING COUNT(*) >= 3000;

use bank_project;

SELECT
    country,
    AVG(age) AS avg_age
FROM bank_customer_churn
GROUP BY country
HAVING AVG(age) >= 39
order by avg_age desc;

SELECT
    surname,
    country
FROM bank_customer_churn
ORDER BY country;
DESCRIBE bank_customer_churn;

SELECT
    customer_id,
    age
FROM bank_customer_churn
ORDER BY age DESC;

SELECT
    gender,
    AVG(balance) AS avg_balance
FROM bank_customer_churn
GROUP BY gender
ORDER BY avg_balance DESC;

SELECT
    customer_id,
    credit_score
FROM bank_customer_churn
ORDER BY credit_score DESC
LIMIT 5;

SELECT
    customer_id,
    age
FROM bank_customer_churn
ORDER BY age DESC
LIMIT 3;

SELECT
    CASE
        WHEN age < 30 THEN '20대'
        WHEN age < 40 THEN '30대'
        WHEN age < 50 THEN '40대'
        ELSE '50대 이상'
    END AS age_group,
    COUNT(*) AS customer_count
FROM bank_customer_churn
GROUP BY age_group;

SELECT
    SUM(balance) AS total_balance
FROM bank_customer_churn;

SELECT
    MAX(age) AS max_age
FROM bank_customer_churn;

SELECT 
    MIN(age) AS min_age
FROM bank_customer_churn;

SELECT
    country,
    MAX(credit_score) AS max_credit_score
FROM bank_customer_churn
GROUP BY country;

SELECT
    country,
    SUM(balance) AS total_balance
FROM bank_customer_churn
GROUP BY country
ORDER BY total_balance DESC;

CREATE TABLE customer (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(20),
    country VARCHAR(20)
);

CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    product VARCHAR(20),
    price INT
);

INSERT INTO customer
VALUES
(1, '김철수', 'Korea'),
(2, '이영희', 'Korea'),
(3, '박민수', 'USA'),
(4, '최지은', 'Japan');

INSERT INTO orders
VALUES
(101, 1, '노트북', 1500000),
(102, 1, '마우스', 30000),
(103, 2, '키보드', 100000),
(104, 3, '모니터', 400000);

SELECT * FROM customer;
SELECT * FROM orders;

SELECT
    customer.customer_name,
    orders.product
FROM customer
INNER JOIN orders
ON customer.customer_id = orders.customer_id;

SELECT
    customer_id,
    credit_score
FROM bank_customer_churn
WHERE credit_score >
(
    SELECT AVG(credit_score)
    FROM bank_customer_churn
);

SELECT
    COUNT(*) AS customer_count
FROM bank_customer_churn
WHERE age >
(
    SELECT AVG(age)
    FROM bank_customer_churn
);

SELECT *
FROM bank_customer_churn
WHERE customer_id IN (
    SELECT customer_id
    FROM bank_customer_churn
    WHERE credit_score >= 800
);

SELECT *
FROM bank_customer_churn
WHERE customer_id IN (
    SELECT customer_id
    FROM bank_customer_churn
    WHERE balance > (
        SELECT AVG(balance)
        FROM bank_customer_churn
    )
);

SELECT *
FROM bank_customer_churn
WHERE customer_id IN (
    SELECT customer_id
    FROM bank_customer_churn
    WHERE credit_score >= 800
);

SELECT *
FROM bank_customer_churn
WHERE customer_id IN (
    SELECT customer_id
    FROM bank_customer_churn
    WHERE balance = 0
);

SELECT *
FROM bank_customer_churn
WHERE customer_id IN (
    SELECT customer_id
    FROM bank_customer_churn
    WHERE churn = 1
);

SELECT *
FROM bank_customer_churn
WHERE customer_id IN (
    SELECT customer_id
    FROM bank_customer_churn
    WHERE credit_card = 1
);

SELECT *
FROM bank_customer_churn
WHERE customer_id IN (
    SELECT customer_id
    FROM bank_customer_churn
    WHERE active_member = 1
);

SELECT *
FROM bank_customer_churn
WHERE country IN (
    SELECT country
    FROM bank_customer_churn
    WHERE churn = 1
);

SELECT *
FROM bank_customer_churn b1
WHERE balance >
(
    SELECT AVG(balance)
    FROM bank_customer_churn b2
    WHERE b2.country = b1.country
);

WITH country_avg AS (
    SELECT country,
           AVG(balance) AS avg_balance
    FROM bank_customer_churn
    GROUP BY country
)

SELECT b.customer_id,
       b.country,
       b.balance,
       c.avg_balance
FROM bank_customer_churn b
JOIN country_avg c
ON b.country = c.country;

WITH country_avg AS (
    SELECT country,
           AVG(balance) AS avg_balance
    FROM bank_customer_churn
    GROUP BY country
)

SELECT b.customer_id,
       b.country,
       b.balance,
       c.avg_balance
FROM bank_customer_churn b
JOIN country_avg c
ON b.country = c.country
WHERE b.balance > c.avg_balance;

SELECT customer_id,
       country,
       balance,
       ROW_NUMBER() OVER (
           PARTITION BY country
           ORDER BY balance DESC
       ) AS rn
FROM bank_customer_churn;

WITH ranked AS (
    SELECT customer_id,
           country,
           balance,
           ROW_NUMBER() OVER (
               PARTITION BY country
               ORDER BY balance DESC
           ) AS rn
    FROM bank_customer_churn
)

SELECT *
FROM ranked
WHERE rn = 1;

SELECT
    products_number,
    COUNT(*) AS total_customer
FROM bank_customer_churn
GROUP BY products_number;

SELECT
    products_number,
    COUNT(*) AS total_customer,
    SUM(churn) AS churn_customer,
    ROUND(SUM(churn) * 100.0 / COUNT(*), 2) AS churn_rate
FROM bank_customer_churn
GROUP BY products_number;

SELECT
    credit_card,
    COUNT(*) AS total_customer,
    SUM(churn) AS churn_customer,
    ROUND(SUM(churn) * 100.0 / COUNT(*), 2) AS churn_rate
FROM bank_customer_churn
GROUP BY credit_card;

SELECT
    active_member,
    COUNT(*) AS total_customer,
    SUM(churn) AS churn_customer,
    ROUND(SUM(churn) * 100.0 / COUNT(*), 2) AS churn_rate
FROM bank_customer_churn
GROUP BY active_member;