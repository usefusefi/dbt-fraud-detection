# Monitoring dbt Pipelines

## 1. Enabling dbt Logging
Add this to `dbt_project.yml`:
```yaml
log-path: logs/
log-level: debug
```

## 2. Tracking dbt Runs
Run:
```bash
dbt run --log-format json
```

## 3. Querying dbt Artifacts
Use this SQL:
```sql
SELECT * FROM dbt.logs WHERE event_type = 'ERROR';
```
