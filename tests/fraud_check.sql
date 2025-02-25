SELECT *
FROM {{ ref('fact_fraud_detection') }}
WHERE fraud_transactions > total_transactions;
