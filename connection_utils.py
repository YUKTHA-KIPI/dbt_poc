# helpers/connection_utils.py
import snowflake.snowpark as snowpark
import os
def get_session():
    connection_parameters = {
        "account": "bm12759.ap-south-1.aws",
        "user": "AMBYINT_TEST",
        "password": "Ambyint1234",
        "role": "ACCOUNTADMIN",
        "warehouse": "COMPUTE_WH",
        "database": "DBT",
        "schema": "PUBLIC"
    }
    session = snowpark.Session.builder.configs(connection_parameters).create()
    return session
