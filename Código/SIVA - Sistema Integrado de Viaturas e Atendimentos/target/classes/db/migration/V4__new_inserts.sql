SET FOREIGN_KEY_CHECKS = 0;
TRUNCATE TABLE abastecimentos;
TRUNCATE TABLE ocorrencias;
TRUNCATE TABLE registros;
TRUNCATE TABLE servicos;
TRUNCATE TABLE carros;
TRUNCATE TABLE usuarios;
TRUNCATE TABLE tipo_carro;
SET FOREIGN_KEY_CHECKS = 1;

INSERT INTO tipo_carro (marca, modelo, ano, categoria) VALUES
('Toyota', 'Corolla', 2024, 'passeio'),
('Chevrolet', 'S10', 2023, 'utilidades'),
('Ford', 'Ranger', 2024, 'utilidades'),
('Volkswagen', 'Virtus', 2023, 'passeio'),
('Fiat', 'Cronos', 2022, 'passeio'),
('Renault', 'Oroch', 2023, 'utilidades'),
('Nissan', 'Frontier', 2024, 'utilidades'),
('Honda', 'HR-V', 2024, 'passeio'),
('Jeep', 'Renegade', 2023, 'passeio'),
('Ford', 'Transit', 2022, 'utilidades');

INSERT INTO usuarios (matricula, nome, email, senha, permissao, telefone, sexo, data_nascimento, cnh, status_funcionario) VALUES
('10001', 'Ana Silva', 'ana.silva@ipem.sp.gov.br', 'senha123', 'TECNICO', '11999990001', 'F', '1990-05-15', '12345678901', 'disponivel'),
('10002', 'Bruno Costa', 'bruno.costa@ipem.sp.gov.br', 'senha123', 'ADMINISTRADOR', '11999990002', 'M', '1985-08-20', '12345678902', 'disponivel'),
('10003', 'Carlos Souza', 'carlos.souza@ipem.sp.gov.br', 'senha123', 'TECNICO', '11999990003', 'M', '1992-03-10', '12345678903', 'em_servico'),
('10004', 'Daniela Lima', 'daniela.lima@ipem.sp.gov.br', 'senha123', 'TECNICO', '11999990004', 'F', '1995-11-22', '12345678904', 'disponivel'),
('10005', 'Eduardo Alves', 'eduardo.alves@ipem.sp.gov.br', 'senha123', 'ADMINISTRADOR', '11999990005', 'M', '1980-01-30', '12345678905', 'disponivel'),
('10006', 'Fernanda Rocha', 'fernanda.rocha@ipem.sp.gov.br', 'senha123', 'TECNICO', '11999990006', 'F', '1993-07-04', '12345678906', 'em_servico'),
('10007', 'Gabriel Martins', 'gabriel.martins@ipem.sp.gov.br', 'senha123', 'TECNICO', '11999990007', 'M', '1998-12-12', '12345678907', 'disponivel'),
('10008', 'Helena Duarte', 'helena.duarte@ipem.sp.gov.br', 'senha123', 'ADMINISTRADOR', '11999990008', 'F', '1975-06-18', '12345678908', 'disponivel'),
('10009', 'Igor Mendes', 'igor.mendes@ipem.sp.gov.br', 'senha123', 'TECNICO', '11999990009', 'M', '1991-09-09', '12345678909', 'em_servico'),
('10010', 'Juliana Ferreira', 'juliana.ferreira@ipem.sp.gov.br', 'senha123', 'TECNICO', '11999990010', 'F', '1994-02-28', '12345678910', 'disponivel'),
('10011', 'Kevin Santos', 'kevin.santos@ipem.sp.gov.br', 'senha123', 'TECNICO', '11999990011', 'M', '1996-04-14', '12345678911', 'disponivel'),
('10012', 'Larissa Gomes', 'larissa.gomes@ipem.sp.gov.br', 'senha123', 'TECNICO', '11999990012', 'F', '1997-10-30', '12345678912', 'disponivel');

INSERT INTO carros (prefixo, placa, tip_id, combustivel, km_atual, proxima_troca_oleo_km, status_veiculo, cor) VALUES
('CAR001', 'ABC1001', 1, 'Gasolina', 15000.0, 20000.0, 'disponivel', 'Prata'),
('CAR002', 'DEF1002', 2, 'Diesel', 45000.0, 45050.0, 'manutencao', 'Branco'),
('CAR003', 'GHI1003', 3, 'Diesel', 8900.0, 15000.0, 'em_uso', 'Preto'),
('CAR004', 'JKL1004', 1, 'Gasolina', 5500.0, 10000.0, 'disponivel', 'Vermelho'),
('CAR005', 'MNO1005', 4, 'Gasolina', 22000.0, 25000.0, 'disponivel', 'Azul'),
('CAR006', 'PQR1006', 5, 'Gasolina', 30000.0, 35000.0, 'disponivel', 'Cinza'),
('CAR007', 'STU1007', 6, 'Diesel', 12000.0, 20000.0, 'indisponivel', 'Branco'),
('CAR008', 'VWX1008', 7, 'Diesel', 95000.0, 100000.0, 'disponivel', 'Preto'),
('CAR009', 'YZA1009', 8, 'Gasolina', 5000.0, 10000.0, 'disponivel', 'Branco'),
('CAR010', 'BCD1010', 9, 'Gasolina', 4000.0, 10000.0, 'disponivel', 'Prata');

INSERT INTO servicos (car_prefixo, usuario_registro, data_saida, quilometragem_saida, destino_requisitante, descricao) VALUES
('CAR001', '10001', '2026-04-01 08:00:00', 15000.0, 'São Paulo', 'Fiscalização'),
('CAR003', '10003', '2026-04-02 09:00:00', 8900.0, 'Campinas', 'Visita Técnica'),
('CAR004', '10004', '2026-04-03 07:30:00', 5500.0, 'Santos', 'Transporte de materiais'),
('CAR005', '10006', '2026-04-04 08:00:00', 22000.0, 'Sorocaba', 'Reunião'),
('CAR006', '10007', '2026-04-05 10:00:00', 30000.0, 'Jundiaí', 'Fiscalização'),
('CAR008', '10009', '2026-04-06 08:00:00', 95000.0, 'São José dos Campos', 'Manutenção'),
('CAR009', '10010', '2026-04-07 09:00:00', 5000.0, 'Taubaté', 'Entrega'),
('CAR010', '10011', '2026-04-08 08:30:00', 4000.0, 'Jacareí', 'Verificação'),
('CAR001', '10012', '2026-04-09 07:00:00', 15200.0, 'Guarulhos', 'Visita'),
('CAR003', '10001', '2026-04-10 08:00:00', 9200.0, 'Osasco', 'Fiscalização');


INSERT INTO servicos (car_prefixo, usuario_registro, data_saida, quilometragem_saida, destino_requisitante, descricao) VALUES ('CAR001', '10001', '2026-04-01 08:00:00', 15000.0, 'São Paulo', 'Fiscalização');
INSERT INTO registros (servico_id, tipo_registro, data_registro, km_registro, anotacao) VALUES (LAST_INSERT_ID(), 'CHECK_OUT', '2026-04-01 08:00:00', 15000.0, 'Saída SP');
INSERT INTO registros (servico_id, tipo_registro, data_registro, km_registro, anotacao) VALUES (LAST_INSERT_ID(), 'ABASTECIMENTO', '2026-04-01 10:00:00', 15100.0, 'Posto BR');
INSERT INTO abastecimentos (registro_id, litros, preco_litro, valor_total, nota_fiscal) VALUES (LAST_INSERT_ID(), 50.0, 5.80, 290.00, 'NF1001');

INSERT INTO servicos (car_prefixo, usuario_registro, data_saida, quilometragem_saida, destino_requisitante, descricao) VALUES ('CAR003', '10003', '2026-04-02 09:00:00', 8900.0, 'Campinas', 'Visita Técnica');
INSERT INTO registros (servico_id, tipo_registro, data_registro, km_registro, anotacao) VALUES (LAST_INSERT_ID(), 'CHECK_OUT', '2026-04-02 09:00:00', 8900.0, 'Saída Campinas');
INSERT INTO registros (servico_id, tipo_registro, data_registro, km_registro, anotacao) VALUES (LAST_INSERT_ID(), 'OCORRENCIA', '2026-04-02 11:00:00', 9000.0, 'Pneu furado');
INSERT INTO ocorrencias (servico_id, tipo_ocorrencia, localizacao, solicitar_suporte, descricao) VALUES (2, 'DEFEITO', 'Rodovia Bandeirantes KM 50', TRUE, 'Pneu furado, aguardando socorro');

INSERT INTO servicos (car_prefixo, usuario_registro, data_saida, quilometragem_saida, destino_requisitante, descricao) VALUES ('CAR004', '10004', '2026-04-03 07:30:00', 5500.0, 'Santos', 'Transporte');
INSERT INTO registros (servico_id, tipo_registro, data_registro, km_registro, anotacao) VALUES (LAST_INSERT_ID(), 'CHECK_OUT', '2026-04-03 07:30:00', 5500.0, 'Saída Santos');
INSERT INTO registros (servico_id, tipo_registro, data_registro, km_registro, anotacao) VALUES (LAST_INSERT_ID(), 'ABASTECIMENTO', '2026-04-03 10:00:00', 5700.0, 'Posto Shell');
INSERT INTO abastecimentos (registro_id, litros, preco_litro, valor_total, nota_fiscal) VALUES (LAST_INSERT_ID(), 40.0, 5.75, 230.00, 'NF1002');

INSERT INTO servicos (car_prefixo, usuario_registro, data_saida, quilometragem_saida, destino_requisitante, descricao) VALUES ('CAR005', '10006', '2026-04-04 08:00:00', 22000.0, 'Sorocaba', 'Reunião');
INSERT INTO registros (servico_id, tipo_registro, data_registro, km_registro, anotacao) VALUES (LAST_INSERT_ID(), 'CHECK_OUT', '2026-04-04 08:00:00', 22000.0, 'Saída Sorocaba');
INSERT INTO registros (servico_id, tipo_registro, data_registro, km_registro, anotacao) VALUES (LAST_INSERT_ID(), 'ABASTECIMENTO', '2026-04-04 12:00:00', 22200.0, 'Posto Ale');
INSERT INTO abastecimentos (registro_id, litros, preco_litro, valor_total, nota_fiscal) VALUES (LAST_INSERT_ID(), 30.0, 5.90, 177.00, 'NF1003');

INSERT INTO servicos (car_prefixo, usuario_registro, data_saida, quilometragem_saida, destino_requisitante, descricao) VALUES ('CAR006', '10007', '2026-04-05 10:00:00', 30000.0, 'Jundiaí', 'Fiscalização');
INSERT INTO registros (servico_id, tipo_registro, data_registro, km_registro, anotacao) VALUES (LAST_INSERT_ID(), 'CHECK_OUT', '2026-04-05 10:00:00', 30000.0, 'Saída Jundiaí');
INSERT INTO registros (servico_id, tipo_registro, data_registro, km_registro, anotacao) VALUES (LAST_INSERT_ID(), 'ABASTECIMENTO', '2026-04-05 15:00:00', 30200.0, 'Posto Ipiranga');
INSERT INTO abastecimentos (registro_id, litros, preco_litro, valor_total, nota_fiscal) VALUES (LAST_INSERT_ID(), 60.0, 5.60, 336.00, 'NF1004');

INSERT INTO servicos (car_prefixo, usuario_registro, data_saida, quilometragem_saida, destino_requisitante, descricao) VALUES ('CAR008', '10009', '2026-04-06 08:00:00', 95000.0, 'SJC', 'Manutenção');
INSERT INTO registros (servico_id, tipo_registro, data_registro, km_registro, anotacao) VALUES (LAST_INSERT_ID(), 'CHECK_OUT', '2026-04-06 08:00:00', 95000.0, 'Saída SJC');
INSERT INTO registros (servico_id, tipo_registro, data_registro, km_registro, anotacao) VALUES (LAST_INSERT_ID(), 'ABASTECIMENTO', '2026-04-06 14:00:00', 95150.0, 'Posto Rede');
INSERT INTO abastecimentos (registro_id, litros, preco_litro, valor_total, nota_fiscal) VALUES (LAST_INSERT_ID(), 45.0, 5.85, 263.25, 'NF1005');

INSERT INTO servicos (car_prefixo, usuario_registro, data_saida, quilometragem_saida, destino_requisitante, descricao) VALUES ('CAR009', '10010', '2026-04-07 09:00:00', 5000.0, 'Taubaté', 'Entrega');
INSERT INTO registros (servico_id, tipo_registro, data_registro, km_registro, anotacao) VALUES (LAST_INSERT_ID(), 'CHECK_OUT', '2026-04-07 09:00:00', 5000.0, 'Saída Taubaté');
INSERT INTO registros (servico_id, tipo_registro, data_registro, km_registro, anotacao) VALUES (LAST_INSERT_ID(), 'ABASTECIMENTO', '2026-04-07 13:00:00', 5200.0, 'Posto BR');
INSERT INTO abastecimentos (registro_id, litros, preco_litro, valor_total, nota_fiscal) VALUES (LAST_INSERT_ID(), 55.0, 5.70, 313.50, 'NF1006');

INSERT INTO servicos (car_prefixo, usuario_registro, data_saida, quilometragem_saida, destino_requisitante, descricao) VALUES ('CAR010', '10011', '2026-04-08 08:30:00', 4000.0, 'Jacareí', 'Verificação');
INSERT INTO registros (servico_id, tipo_registro, data_registro, km_registro, anotacao) VALUES (LAST_INSERT_ID(), 'CHECK_OUT', '2026-04-08 08:30:00', 4000.0, 'Saída Jacareí');
INSERT INTO registros (servico_id, tipo_registro, data_registro, km_registro, anotacao) VALUES (LAST_INSERT_ID(), 'ABASTECIMENTO', '2026-04-08 12:00:00', 4200.0, 'Posto Shell');
INSERT INTO abastecimentos (registro_id, litros, preco_litro, valor_total, nota_fiscal) VALUES (LAST_INSERT_ID(), 35.0, 5.95, 208.25, 'NF1007');

INSERT INTO servicos (car_prefixo, usuario_registro, data_saida, quilometragem_saida, destino_requisitante, descricao) VALUES ('CAR001', '10012', '2026-04-09 07:00:00', 15200.0, 'Guarulhos', 'Visita');
INSERT INTO registros (servico_id, tipo_registro, data_registro, km_registro, anotacao) VALUES (LAST_INSERT_ID(), 'CHECK_OUT', '2026-04-09 07:00:00', 15200.0, 'Saída Guarulhos');
INSERT INTO registros (servico_id, tipo_registro, data_registro, km_registro, anotacao) VALUES (LAST_INSERT_ID(), 'ABASTECIMENTO', '2026-04-09 11:00:00', 15400.0, 'Posto Ipiranga');
INSERT INTO abastecimentos (registro_id, litros, preco_litro, valor_total, nota_fiscal) VALUES (LAST_INSERT_ID(), 40.0, 5.80, 232.00, 'NF1008');

INSERT INTO servicos (car_prefixo, usuario_registro, data_saida, quilometragem_saida, destino_requisitante, descricao) VALUES ('CAR003', '10001', '2026-04-10 08:00:00', 9200.0, 'Osasco', 'Fiscalização');
INSERT INTO registros (servico_id, tipo_registro, data_registro, km_registro, anotacao) VALUES (LAST_INSERT_ID(), 'CHECK_OUT', '2026-04-10 08:00:00', 9200.0, 'Saída Osasco');
INSERT INTO registros (servico_id, tipo_registro, data_registro, km_registro, anotacao) VALUES (LAST_INSERT_ID(), 'ABASTECIMENTO', '2026-04-10 16:00:00', 9400.0, 'Posto Ale');
INSERT INTO abastecimentos (registro_id, litros, preco_litro, valor_total, nota_fiscal) VALUES (LAST_INSERT_ID(), 50.0, 5.75, 287.50, 'NF1009');
