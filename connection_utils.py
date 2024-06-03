# helpers/connection_utils.py
import snowflake.snowpark as snowpark
import os
def get_session():
    connection_parameters = {
        "account": os.getenv("DBT_SNOWFLAKE_ACCOUNT"),
        "user": os.getenv("DBT_SNOWFLAKE_USERNAME"),
        "password": os.getenv("DBT_SNOWFLAKE_PW"),
        "role": "ACCOUNTADMIN",
        "warehouse": "COMPUTE_WH",
        "database": "DBT",
        "schema": "PUBLIC"
    }
    session = snowpark.Session.builder.configs(connection_parameters).create()
    return session
