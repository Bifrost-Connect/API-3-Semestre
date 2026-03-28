-- Tipos de carros
INSERT INTO tipo_carro (marca, modelo, ano, categoria) VALUES
    ('Toyota', 'Corolla', 2020, 'passeio'),
    ('Honda', 'Civic', 2019, 'passeio'),
    ('Ford', 'Ranger', 2021, 'utilidades'),
    ('Chevrolet', 'S10', 2022, 'utilidades'),
    ('Volkswagen', 'Gol', 2018, 'passeio');

-- Usuários
INSERT INTO usuarios (num_registro, nome, email, senha, permissao) VALUES
    (10001, 'Ana Silva', 'ana.silva@example.com', 'senha123', 'tecnico'),
    (10002, 'Bruno Costa', 'bruno.costa@example.com', 'senha123', 'administrador'),
    (10003, 'Carlos Souza', 'carlos.souza@example.com', 'senha123', 'tecnico'),
    (10004, 'Daniela Lima', 'daniela.lima@example.com', 'senha123', 'tecnico'),
    (10005, 'Eduardo Alves', 'eduardo.alves@example.com', 'senha123', 'administrador'),
    (10006, 'Fernanda Rocha', 'fernanda.rocha@example.com', 'senha123', 'tecnico'),
    (10007, 'Gabriel Martins', 'gabriel.martins@example.com', 'senha123', 'tecnico'),
    (10008, 'Helena Duarte', 'helena.duarte@example.com', 'senha123', 'administrador'),
    (10009, 'Igor Mendes', 'igor.mendes@example.com', 'senha123', 'tecnico'),
    (10010, 'Juliana Ferreira', 'juliana.ferreira@example.com', 'senha123', 'tecnico');

-- Carros
INSERT INTO carros (prefixo, placa, tip_id, combustivel, km_atual, proxima_troca_oleo_km) VALUES
    ('CAR001', 'ABC1234', 1, 'Gasolina', 15000, 20000),
    ('CAR002', 'DEF5678', 2, 'Gasolina', 22000, 27000),
    ('CAR003', 'GHI9012', 3, 'Diesel', 5000, 10000),
    ('CAR004', 'JKL3456', 4, 'Diesel', 8000, 13000),
    ('CAR005', 'MNO7890', 5, 'Etanol', 30000, 35000);

-- Serviços
INSERT INTO servicos (car_prefixo, usuario_registro, data_saida, km_saida, destino_requisitante) VALUES
    ('CAR001', 10001, '2026-03-10 08:00:00', 15000, 'São Paulo'),
    ('CAR002', 10003, '2026-03-11 09:00:00', 22000, 'Campinas'),
    ('CAR003', 10006, '2026-03-12 07:30:00', 5000, 'Rio de Janeiro');

-- Registros
INSERT INTO registros (servico_id, tipo_registro, km_registro, anotacao) VALUES
    (1, 'CHECK_OUT', 15000, 'Saída para São Paulo'),
    (1, 'ABASTECIMENTO', 15200, 'Posto BR'),
    (2, 'CHECK_OUT', 22000, 'Saída para Campinas'),
    (2, 'OCORRENCIA', 22100, 'Pneu furado'),
    (3, 'CHECK_OUT', 5000, 'Saída para RJ'),
    (3, 'ABASTECIMENTO', 5200, 'Shell');

-- Abastecimentos
INSERT INTO abastecimentos (registro_id, litros, preco_litro, valor_total, nota_fiscal) VALUES
    (2, 40, 5.500, 220.00, 'NF123'),
    (6, 50, 5.300, 265.00, 'NF124');
