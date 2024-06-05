import sys
import os
import snowflake.snowpark as snowpark
import connection_utils
import logging
def main():
    # Set up logging configuration
    logging.basicConfig(level=logging.INFO)
    # Check command-line arguments
    if len(sys.argv) != 2:
        logging.info("Usage: dbt_artifacts.py <load|download>")
        sys.exit(1)
    action_type = sys.argv[1]
    artifacts_stage = "@PUBLIC.dbt_internal"
    # Determine file path
    script_dir = os.path.dirname(os.path.abspath(__file__))
    dbt_project_dir =  os.path.normpath(os.path.join(script_dir, '../../../transformed'))
    file_path = ('target/manifest.json')
    logging.info(f"Script directory: {script_dir}")
    logging.info(f"DBT project directory: {dbt_project_dir}")
    logging.info(f"Manifest file path: {file_path}")
    # Check if the manifest.json file exists when loading
    if action_type == 'load' and not os.path.exists(file_path):
        logging.error(f"File doesn't exist: {file_path}")
        sys.exit(1)
    # Establish Snowflake session
    try:
        session = connection_utils.get_session()
    except Exception as err:
        logging.error(f"Error establishing Snowflake session: {err}")
        sys.exit(1)
    # Perform action based on command-line argument
    try:
        if action_type == 'load':
            load_artifacts(session, artifacts_stage, file_path)
        elif action_type == 'download':
            unload_artifacts(session, artifacts_stage, dbt_project_dir)
        else:
            logging.error("Usage: dbt_artifacts.py <load|download>")
            raise ValueError("Incorrect value for action_type")
    except Exception as err:
        logging.error(f"Error during {action_type} operation: {err}")
        raise
    finally:
        session.close()
    return 'SUCCESS'
def load_artifacts(session: snowpark.Session, stage: str, file_path: str) -> None:
    try:
        session.sql(f"CREATE STAGE IF NOT EXISTS {stage[1:]} FILE_FORMAT = (TYPE = 'JSON')").collect()
        logging.info(f"{stage} created successfully")
        session.file.put(file_path, stage, auto_compress=False, overwrite=True)
        logging.info(f"{file_path} loaded successfully into {stage}")
    except snowpark.exceptions.SnowparkSQLException as err:
        logging.error(f"Unexpected error: {err}")
        raise
    else:
        res = session.sql(f"LS {stage}").collect()
        logging.info(f"Files in {stage}: {res}")
def unload_artifacts(session: snowpark.Session, stage: str, target_directory: str) -> None:
    try:
        session.file.get(stage, target_directory)
        logging.info(f"Files unloaded successfully into {target_directory}")
    except Exception as err:
        logging.error(f"Unexpected error: {err}")
        raise
if __name__ == "__main__":
    main()
