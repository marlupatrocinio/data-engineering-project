from dagster import job, op
from dagster_airbyte import airbyte_sync_op
from dagster_dbt import dbt_run_op

@op
def process_data(context, data):
    # Processar dados aqui
    pass

@job
def weather_pipeline():
    raw_data = airbyte_sync_op()
    transformed_data = dbt_run_op(raw_data)
    process_data(transformed_data)