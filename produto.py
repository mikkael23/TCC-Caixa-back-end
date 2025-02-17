from flask import jsonify, request

from connect import connect_banco


def buscar_produto():
    try:
        codigo_barras = request.args.get('codigo')
        print(codigo_barras)
        if not codigo_barras:
            return jsonify({"erro": "Código de barras não fornecido"}), 400

        conn = connect_banco()
        cur = conn.cursor()

        cur.execute("SELECT * FROM produtos WHERE codigo_barras = %s", (codigo_barras,))
        produto = cur.fetchone()

        cur.close()
        conn.close()

        if produto:
            colunas = ["id", "nome", "descricao", "preco", "categoria", "imagem", "codigo_barras", "data_cadastro", "unidade_medida", "id_loja"]
            produto_dict = dict(zip(colunas, produto))
            return jsonify(produto_dict)
        else:
            return jsonify({"erro": "Produto não encontrado"}), 404

    except Exception as e:
        return jsonify({"erro": str(e)}), 500