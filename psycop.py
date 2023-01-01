import psycopg2

# Connect to your postgres DB
conn = psycopg2.connect("dbname=teste user=postgres password=postgres")

# Open a cursor to perform database operations
cur = conn.cursor()

# Execute a query
cur.execute("SELECT * FROM clients")

# Retrieve query results
records = cur.fetchall()
print(records)