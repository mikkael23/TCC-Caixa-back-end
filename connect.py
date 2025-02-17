import psycopg2


def connect_banco():
    return psycopg2.connect(
        dbname="facepay",
        user="postgres", 
        password="1234",  
        host="localhost",  
        port="5432"
    )