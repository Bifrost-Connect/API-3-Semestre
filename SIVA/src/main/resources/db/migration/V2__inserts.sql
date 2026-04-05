INSERT INTO tipo_carro (marca, modelo, ano, categoria, data_criacao, data_atualizacao) VALUES
('Toyota', 'Corolla', 2020, 'passeio', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
('Honda', 'Civic', 2019, 'passeio', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
('Ford', 'Ranger', 2021, 'utilidades', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
('Chevrolet', 'S10', 2022, 'utilidades', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
('Volkswagen', 'Gol', 2018, 'passeio', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);

INSERT INTO usuarios (num_registro, nome, email, senha, permissao, data_criacao, data_atualizacao) VALUES
(10001, 'Ana Silva', 'ana.silva@example.com', 'senha123', 'tecnico', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
(10002, 'Bruno Costa', 'bruno.costa@example.com', 'senha123', 'administrador', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
(10003, 'Carlos Souza', 'carlos.souza@example.com', 'senha123', 'tecnico', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
(10004, 'Daniela Lima', 'daniela.lima@example.com', 'senha123', 'tecnico', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
(10005, 'Eduardo Alves', 'eduardo.alves@example.com', 'senha123', 'administrador', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
(10006, 'Fernanda Rocha', 'fernanda.rocha@example.com', 'senha123', 'tecnico', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
(10007, 'Gabriel Martins', 'gabriel.martins@example.com', 'senha123', 'tecnico', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
(10008, 'Helena Duarte', 'helena.duarte@example.com', 'senha123', 'administrador', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
(10009, 'Igor Mendes', 'igor.mendes@example.com', 'senha123', 'tecnico', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
(10010, 'Juliana Ferreira', 'juliana.ferreira@example.com', 'senha123', 'tecnico', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);

INSERT INTO carros (prefixo, placa, tip_id, combustivel, km_atual, proxima_troca_oleo_km, disponivel, data_criacao, data_atualizacao) VALUES
('CAR001', 'ABC1234', 1, 'Gasolina', 15000.0, 20000.0, TRUE, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
('CAR002', 'DEF5678', 2, 'Gasolina', 22000.0, 27000.0, TRUE, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
('CAR003', 'GHI9012', 3, 'Diesel', 5000.0, 10000.0, TRUE, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
('CAR004', 'JKL3456', 4, 'Diesel', 8000.0, 13000.0, TRUE, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
('CAR005', 'MNO7890', 5, 'Etanol', 30000.0, 35000.0, TRUE, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);

INSERT INTO servicos (car_prefixo, usuario_registro, data_saida, quilometragem_saida, destino_requisitante, data_criacao, data_atualizacao) VALUES
('CAR001', 10001, '2026-03-10 08:00:00', 15000.0, 'São Paulo', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
('CAR002', 10003, '2026-03-11 09:00:00', 22000.0, 'Campinas', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
('CAR003', 10006, '2026-03-12 07:30:00', 5000.0, 'Rio de Janeiro', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);

INSERT INTO registros (servico_id, tipo_registro, data_registro, km_registro, anotacao, data_criacao, data_atualizacao) VALUES
(1, 'CHECK_OUT', '2026-03-10 08:00:00', 15000.0, 'Saída para São Paulo', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
(1, 'ABASTECIMENTO', '2026-03-10 10:30:00', 15200.0, 'Posto BR', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
(2, 'CHECK_OUT', '2026-03-11 09:00:00', 22000.0, 'Saída para Campinas', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
(2, 'OCORRENCIA', '2026-03-11 11:15:00', 22100.0, 'Pneu furado', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
(3, 'CHECK_OUT', '2026-03-12 07:30:00', 5000.0, 'Saída para RJ', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
(3, 'ABASTECIMENTO', '2026-03-12 12:45:00', 5200.0, 'Shell', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);

INSERT INTO abastecimentos (registro_id, litros, preco_litro, valor_total, nota_fiscal, data_criacao, data_atualizacao) VALUES
(2, 40.0, 5.500, 220.00, 'NF123', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
(6, 50.0, 5.300, 265.00, 'NF124', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);