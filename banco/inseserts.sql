-- 1. Inserindo dados na tabela de Usuários (Clientes)
INSERT INTO usuarios (nome, email, senha, saldo, data_criacao)
VALUES 
('João Silva', 'joao.silva@email.com', 'senha123', 100.00, CURRENT_TIMESTAMP),
('Maria Oliveira', 'maria.oliveira@email.com', 'senha456', 200.00, CURRENT_TIMESTAMP);

-- 2. Inserindo dados na tabela de Lojas (Mercados)
INSERT INTO lojas (nome, endereco, telefone, data_criacao)
VALUES 
('Supermercado ABC', 'Rua A, 123', '(11) 1234-5678', CURRENT_TIMESTAMP),
('Mercado XYZ', 'Rua B, 456', '(11) 8765-4321', CURRENT_TIMESTAMP);

-- 3. Inserindo dados na tabela de Produtos
INSERT INTO produtos (nome, descricao, preco, categoria, imagem, codigo_barras, data_cadastro, unidade_medida, id_loja)
VALUES 
('Arroz', 'Arroz branco tipo 1', 25.50, 'Alimentos', 'arroz.jpg', '123456789', CURRENT_TIMESTAMP, 'kg', 1),
('Feijão', 'Feijão preto tipo 1', 18.00, 'Alimentos', 'feijao.jpg', '987654321', CURRENT_TIMESTAMP, 'kg', 2);

-- 4. Inserindo dados na tabela de Pedidos
INSERT INTO pedidos (id_usuario, id_loja, valor_total, data_pedido, status)
VALUES 
(1, 1, 55.50, CURRENT_TIMESTAMP, 'pendente'),
(2, 2, 36.00, CURRENT_TIMESTAMP, 'pendente');

-- 5. Inserindo dados na tabela de Itens do Pedido
INSERT INTO itens_pedido (id_pedido, id_produto, quantidade, preco_unitario)
VALUES 
(1, 1, 2, 25.50),  -- 2 unidades de arroz
(1, 2, 1, 18.00),  -- 1 unidade de feijão
(2, 2, 2, 18.00);  -- 2 unidades de feijão

-- 6. Inserindo dados na tabela de Pagamentos
INSERT INTO pagamentos (id_usuario, id_pedido, valor, metodo, status, data_pagamento)
VALUES 
(1, 1, 55.50, 'Pix', 'pendente', CURRENT_TIMESTAMP),
(2, 2, 36.00, 'Cartão', 'pendente', CURRENT_TIMESTAMP);

-- 7. Inserindo dados na tabela de Transações
INSERT INTO transacoes (id_usuario, tipo, valor, descricao, data_transacao)
VALUES 
(1, 'credito', 100.00, 'Depósito inicial', CURRENT_TIMESTAMP),
(2, 'debito', 36.00, 'Pagamento pedido 2', CURRENT_TIMESTAMP);

-- 8. Inserindo dados na tabela de Estoque
INSERT INTO estoque (id_produto, quantidade, porcentagem_desconto)
VALUES 
(1, 50, 10),  -- 50 unidades de arroz com 10% de desconto
(2, 30, 5);   -- 30 unidades de feijão com 5% de desconto

-- 9. Inserindo dados na tabela de Relacionamento de Clientes com Lojas
INSERT INTO clientes_lojas (id_usuario, id_loja, data_relacionamento)
VALUES 
(1, 1, CURRENT_TIMESTAMP),  -- João está relacionado com o Supermercado ABC
(2, 2, CURRENT_TIMESTAMP);  -- Maria está relacionada com o Mercado XYZ
