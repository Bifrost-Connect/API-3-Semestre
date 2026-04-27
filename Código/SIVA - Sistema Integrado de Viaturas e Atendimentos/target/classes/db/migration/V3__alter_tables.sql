ALTER TABLE usuarios 
ADD COLUMN telefone VARCHAR(20),
ADD COLUMN sexo VARCHAR(20),
ADD COLUMN data_nascimento DATE,
ADD COLUMN cnh VARCHAR(20),
ADD COLUMN status_funcionario ENUM('disponivel', 'em_servico', 'desligado') DEFAULT 'disponivel';

ALTER TABLE carros 
ADD COLUMN cor VARCHAR(30),
ADD COLUMN cnh_necessaria VARCHAR(20),
ADD COLUMN status_veiculo ENUM('disponivel', 'em_uso', 'manutencao', 'indisponivel') DEFAULT 'disponivel';

CREATE TABLE ocorrencias (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    servico_id BIGINT,
    tipo_ocorrencia ENUM('CANCELAMENTO', 'DEFEITO') NOT NULL,
    localizacao VARCHAR(255),
    solicitar_suporte BOOLEAN DEFAULT FALSE,
    descricao TEXT,
    data_criacao TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    data_atualizacao TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    CONSTRAINT fk_ocorrencia_servico FOREIGN KEY (servico_id) REFERENCES servicos(id)
);
