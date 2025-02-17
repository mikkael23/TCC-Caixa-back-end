from flask import Flask, request, jsonify
import psycopg2

from connect import connect_banco
from produto import buscar_produto

app = Flask(__name__)


# GET
app.add_url_rule('/produto', 'buscar_produto', buscar_produto, methods=['GET'])





if __name__ == '__main__':
    app.run("192.168.0.10", debug=True)
