WITH transactions AS (
    SELECT * FROM {{ ref('stg_transactions') }}
)
SELECT
    user_id,
    COUNT(transaction_id) AS total_transactions,
    SUM(amount) AS total_amount,
    SUM(CASE WHEN is_fraudulent THEN 1 ELSE 0 END) AS fraud_transactions
FROM transactions
GROUP BY user_id;
