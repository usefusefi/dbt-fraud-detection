from kafka import KafkaProducer
import json
import time
import random

producer = KafkaProducer(
    bootstrap_servers='localhost:9092',
    value_serializer=lambda v: json.dumps(v).encode('utf-8')
)

transactions = [
    {"user_id": 1, "amount": 1200, "location": "NY", "is_fraudulent": True},
    {"user_id": 2, "amount": 50, "location": "CA", "is_fraudulent": False},
    {"user_id": 3, "amount": 3000, "location": "TX", "is_fraudulent": True},
]

while True:
    transaction = random.choice(transactions)
    producer.send('fraud_transactions', transaction)
    print(f"Sent: {transaction}")
    time.sleep(2)
