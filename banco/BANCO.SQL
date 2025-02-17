
CREATE TABLE usuarios (
    id SERIAL PRIMARY KEY,
    nome VARCHAR(255) NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL,
    senha VARCHAR(255) NOT NULL,
    saldo DECIMAL(10,2) DEFAULT 0.00,
    data_criacao TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);


CREATE TABLE lojas (
    id SERIAL PRIMARY KEY,
    nome VARCHAR(255) NOT NULL,
    endereco VARCHAR(255) NOT NULL,
    telefone VARCHAR(20),
    data_criacao TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);


CREATE TABLE produtos (
    id SERIAL PRIMARY KEY,
    nome VARCHAR(255) NOT NULL,
    descricao TEXT,
    preco DECIMAL(10,2) NOT NULL,
    categoria VARCHAR(100) NOT NULL,
    imagem TEXT,  
    codigo_barras VARCHAR(50) UNIQUE NOT NULL,
    data_cadastro TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    unidade_medida VARCHAR(50),
    id_loja INT REFERENCES lojas(id) ON DELETE CASCADE 
);


CREATE TABLE pedidos (
    id SERIAL PRIMARY KEY,
    id_usuario INT REFERENCES usuarios(id) ON DELETE CASCADE,
    id_loja INT REFERENCES lojas(id) ON DELETE CASCADE, 
    valor_total DECIMAL(10,2) NOT NULL,
    data_pedido TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    status VARCHAR(50) DEFAULT 'pendente' 
);

CREATE TABLE itens_pedido (
    id SERIAL PRIMARY KEY,
    id_pedido INT REFERENCES pedidos(id) ON DELETE CASCADE,
    id_produto INT REFERENCES produtos(id) ON DELETE CASCADE,
    quantidade INT NOT NULL,
    preco_unitario DECIMAL(10,2) NOT NULL
);


CREATE TABLE pagamentos (
    id SERIAL PRIMARY KEY,
    id_usuario INT REFERENCES usuarios(id) ON DELETE CASCADE,
    id_pedido INT REFERENCES pedidos(id) ON DELETE SET NULL,
    valor DECIMAL(10,2) NOT NULL,
    metodo VARCHAR(50) NOT NULL,
    status VARCHAR(50) DEFAULT 'pendente', 
    data_pagamento TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);


CREATE TABLE transacoes (
    id SERIAL PRIMARY KEY,
    id_usuario INT REFERENCES usuarios(id) ON DELETE CASCADE,
    tipo VARCHAR(50) NOT NULL, 
    valor DECIMAL(10,2) NOT NULL,
    descricao TEXT,
    data_transacao TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- 8. Estoque
CREATE TABLE estoque (
    id SERIAL PRIMARY KEY,
    id_produto INT REFERENCES produtos(id) ON DELETE CASCADE,
    quantidade INT NOT NULL,
    porcentagem_desconto INT -- Corrigido o nome do campo
);

-- 9. Tabela de Relacionamento de Clientes com Lojas
CREATE TABLE clientes_lojas (
    id SERIAL PRIMARY KEY,
    id_usuario INT REFERENCES usuarios(id) ON DELETE CASCADE,
    id_loja INT REFERENCES lojas(id) ON DELETE CASCADE,
    data_relacionamento TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);



-- ajustes feitos
