import pandas as pd

books = pd.read_csv("data/Books.csv") 
customers = pd.read_csv("data/Customers.csv")
orders = pd.read_csv("data/Orders.csv")


print(books.head())
print(customers.head())
print(orders.head())


print(books.info())
print(customers.info())
print(orders.info())

print(books.isnull().sum())
print(customers.isnull().sum())
print(orders.isnull().sum())


orders['Order_Date'] = pd.to_datetime(orders['Order_Date'])

# New columns create

orders['Order_Year'] = orders['Order_Date'].dt.year
orders['Order_Month'] = orders['Order_Date'].dt.month

orders.drop_duplicates(inplace=True)

books.to_csv("data/books_clean.csv", index=False)
customers.to_csv("data/customers_clean.csv", index=False)
orders.to_csv("data/orders_clean.csv", index=False)

print(books.columns)
