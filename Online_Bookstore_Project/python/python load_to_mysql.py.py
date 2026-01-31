import pandas as pd
from sqlalchemy import create_engine

# Step 1: Database connection
engine = create_engine(
    "mysql+pymysql://root:root@127.0.0.1:3306/online_bookstore"
)

# Step 2: CSV read
books = pd.read_csv(r"C:\Users\Admin\Desktop\DS\Online_Bookstore_Project\data\books_clean.csv")
customers = pd.read_csv(r"C:\Users\Admin\Desktop\DS\Online_Bookstore_Project\data\customers_clean.csv")
orders = pd.read_csv(r"C:\Users\Admin\Desktop\DS\Online_Bookstore_Project\data\orders_clean.csv")

# Step 3: Load into MySQL
books.to_sql("books", engine, if_exists="replace", index=False)
customers.to_sql("customers", engine, if_exists="replace", index=False)
orders.to_sql("orders", engine, if_exists="replace", index=False)

print("DONE")


