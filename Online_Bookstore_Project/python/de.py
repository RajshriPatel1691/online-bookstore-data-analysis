from sqlalchemy import create_engine

engine = create_engine(
    "mysql+pymysql://root:root@127.0.0.1:3306/online_bookstore"
)

conn = engine.connect()
print("MYSQL CONNECTED SUCCESSFULLY")
conn.close()
