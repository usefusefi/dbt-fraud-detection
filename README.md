# Real-Time Fraud Detection with dbt, Kafka & Snowflake

## Overview
This project implements **real-time fraud detection** using:
- **Kafka** (Streaming transaction events)
- **Snowflake** (Data warehouse for storing transactions)
- **dbt** (Data transformations, anomaly detection, and aggregations)
- **Jupyter Notebook** (For querying and analyzing results)

## Setup & Installation
### 1. Clone the repository
```bash
git clone https://github.com/usefusefi/dbt-fraud-detection.git
cd dbt-fraud-detection
```

### 2. Install dbt & dependencies
```bash
pip install dbt-core dbt-snowflake kafka-python pandas
```

### 3. Configure dbt (Update profiles.yml)
```yaml
default:
  outputs:
    dev:
      type: snowflake
      account: your_snowflake_account
      user: your_user
      password: your_password
      role: your_role
      warehouse: your_warehouse
      schema: fraud_detection
      threads: 4
  target: dev
 ```
 
### 4. Run dbt transformations
```bash
dbt run
```

### 5. Start Kafka producer (Streaming transactions)
```bash
python scripts/kafka_fraud_producer.py
```

### 6. Analyze results in Snowflake
Run this SQL in Snowflake:
```sql
SELECT * FROM fact_fraud_detection ORDER BY fraud_transactions DESC;
```
