import psycopg2


def connect_banco():
    return psycopg2.connect(
        dbname="smart-pay",
        user="mikaelmaster", 
        password="jardim23",  
        host="50.19.176.239",  
        port="5432"
    )