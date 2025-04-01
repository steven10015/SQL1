import os
import pandas as pd
from sqlalchemy import create_engine, text
from dotenv import load_dotenv

# Connect to the database
def connect():
    try:
        connection_string = f"postgresql://{os.getenv('DB_USER')}:{os.getenv('DB_PASSWORD')}@{os.getenv('DB_HOST')}:{os.getenv('DB_PORT')}/{os.getenv('DB_NAME')}"
        engine = create_engine(connection_string, isolation_level="AUTOCOMMIT")
        print("✅ Connected to the database successfully.")
        return engine
    except Exception as e:
        print(f"❌ Error connecting to the database: {e}")
        return None

# Execute a SQL script from file
def run_sql_script(engine, filepath):
    try:
        with open(filepath, 'r') as file:
            sql_script = file.read()
        with engine.connect() as connection:
            connection.execute(text(sql_script))
        print(f"✅ Executed script: {filepath}")
    except Exception as e:
        print(f"❌ Error executing script {filepath}: {e}")



def run_queries_from_file(engine, filepath):
    try:
        with open(filepath, 'r') as file:
            content = file.read()

        queries = [q.strip() for q in content.split(';') if q.strip()]
        for i, query in enumerate(queries, start=1):
            print(f"\n🔎 Query {i} result:")
            df = pd.read_sql(query, con=engine)
            print(df)
    except Exception as e:
        print(f"❌ Error processing queries from {filepath}: {e}")



if __name__ == "__main__":
    engine = connect()
    if engine:
        run_sql_script(engine, './src/sql/create.sql')
        run_sql_script(engine, './src/sql/insert.sql')
        run_sql_script(engine, './src/sql/queries.sql')
