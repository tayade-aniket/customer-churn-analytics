from sqlalchemy import create_engine

SERVER = 'localhost'
DATABASE = 'churn_analysis'
DRIVER = 'ODBC Driver 17 for SQL Server'

connection_string = (
    f'mssql+pyodbc://@{SERVER}/{DATABASE}'
    f'?driver={DRIVER.replace(" ", "+")}'
    '&trusted_connection=yes'
)

engine = create_engine(connection_string)

print("Database Connection Successful")