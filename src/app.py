import os
from dotenv import load_dotenv
from sqlalchemy import create_engine, text
import pandas as pd

# Load environment variables
load_dotenv()

# Read DB path from environment variable
DB_PATH = os.getenv('DB_PATH', './data/database.db')  # fallback to default
DB_URL = f'sqlite:///{DB_PATH}'

# Create database directory if it doesn't exist
os.makedirs(os.path.dirname(os.getenv("DB_PATH")), exist_ok=True)

# Connect to the SQLite database using SQLAlchemy
def connect():
    try:
        engine = create_engine(DB_URL)
        engine.connect()
        print("✅ Connected to SQLite database via SQLAlchemy.")
        return engine
    except Exception as e:
        print(f"❌ Error connecting to SQLite with SQLAlchemy: {e}")
        return None

# Execute a SQL script from a file
def run_sql_script(engine, filepath):
    try:
        with open(filepath, 'r') as file:
            sql_script = file.read()
        with engine.connect() as connection:
            for statement in sql_script.split(';'):
                stmt = statement.strip()
                if stmt:
                    connection.execute(text(stmt))
        print(f"✅ Executed script: {filepath}")
    except Exception as e:
        print(f"❌ Error executing script {filepath}: {e}")

# Example analysis: show total species per region
def show_species_per_region(engine):
    query = """
    SELECT r.name AS region, COUNT(DISTINCT s.id) AS total_species
    FROM species s
    JOIN regions r ON s.region_id = r.id
    GROUP BY r.name
    ORDER BY total_species DESC;
    """
    try:
        df = pd.read_sql(query, con=engine)
        print("\n📊 Species per Region:")
        print(df)
    except Exception as e:
        print(f"❌ Error executing query: {e}")

# Run student-defined queries from queries.sql
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

# Entry point
if __name__ == "__main__":
    engine = connect()
    if engine:
        run_sql_script(engine, './src/sql/create.sql')
        run_sql_script(engine, './src/sql/insert.sql')
        show_species_per_region(engine)
        run_queries_from_file(engine, './src/sql/queries.sql')




# import os
# import pandas as pd
# from sqlalchemy import create_engine, text
# from dotenv import load_dotenv


# load_dotenv() # Load environment variables from .env file

# # Create the database if it does not exist
# def create_database_if_not_exists():
#     try:
#         # Connect to the PostgreSQL server without specifying the database
#         connection_string = f"postgresql://{os.getenv('DB_USER')}:{os.getenv('DB_PASSWORD')}@{os.getenv('DB_HOST')}:{os.getenv('DB_PORT')}/postgres"
#         engine = create_engine(connection_string, isolation_level="AUTOCOMMIT")
#         with engine.connect() as connection:
#             # Check if the database exists
#             result = connection.execute(text(f"SELECT 1 FROM pg_database WHERE datname = '{os.getenv('DB_NAME')}';"))
#             if not result.fetchone():
#                 # Create the database if it does not exist
#                 connection.execute(text(f"CREATE DATABASE {os.getenv('DB_NAME')};"))
#                 print(f"✅ Database '{os.getenv('DB_NAME')}' created successfully.")
#             else:
#                 print(f"✅ Database '{os.getenv('DB_NAME')}' already exists.")
#     except Exception as e:
#         print(f"❌ Error creating database: {e}")

# # Connect to the database
# def connect():
#     try:
#         connection_string = f"postgresql://{os.getenv('DB_USER')}:{os.getenv('DB_PASSWORD')}@{os.getenv('DB_HOST')}:{os.getenv('DB_PORT')}/{os.getenv('DB_NAME')}"
#         engine = create_engine(connection_string, isolation_level="AUTOCOMMIT")
#         print("✅ Connected to the database successfully.")
#         return engine
#     except Exception as e:
#         print(f"❌ Error connecting to the database: {e}")
#         return None

# # Execute a SQL script from file
# def run_sql_script(engine, filepath):
#     try:
#         with open(filepath, 'r') as file:
#             sql_script = file.read()
#         with engine.connect() as connection:
#             connection.execute(text(sql_script))
#         print(f"✅ Executed script: {filepath}")
#     except Exception as e:
#         print(f"❌ Error executing script {filepath}: {e}")



# def run_queries_from_file(engine, filepath):
#     try:
#         with open(filepath, 'r') as file:
#             content = file.read()

#         queries = [q.strip() for q in content.split(';') if q.strip()]
#         for i, query in enumerate(queries, start=1):
#             print(f"\n🔎 Query {i} result:")
#             df = pd.read_sql(query, con=engine)
#             print(df)
#     except Exception as e:
#         print(f"❌ Error processing queries from {filepath}: {e}")


# if __name__ == "__main__":
#     # create_database_if_not_exists()
#     engine = connect()
#     if engine:
#         # run_sql_script(engine, './src/sql/create.sql')
#         # run_sql_script(engine, './src/sql/insert.sql')
#         run_sql_script(engine, './src/sql/queries.sql')
