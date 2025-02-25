WITH transactions AS (
    SELECT
        transaction_id,
        user_id,
        merchant_id,
        amount,
        timestamp,
        location,
        card_type,
        is_fraudulent
    FROM raw.transactions
)
SELECT * FROM transactions;
