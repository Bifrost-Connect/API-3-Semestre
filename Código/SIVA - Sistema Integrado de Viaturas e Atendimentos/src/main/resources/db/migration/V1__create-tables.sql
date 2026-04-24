CREATE TABLE tipo_carro (
    id INT AUTO_INCREMENT PRIMARY KEY,
    marca VARCHAR(100),
    modelo VARCHAR(100),
    ano INT,
    categoria ENUM('passeio', 'utilidades'),
    data_criacao TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    data_atualizacao TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

CREATE TABLE usuarios (
    matricula VARCHAR(50) PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(255) NOT NULL UNIQUE,
    senha VARCHAR(255) NOT NULL,
    permissao VARCHAR(50) NOT NULL,
    data_criacao TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    data_atualizacao TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

CREATE TABLE carros (
    prefixo VARCHAR(20) PRIMARY KEY,
    placa VARCHAR(10),
    tip_id INT,
    combustivel VARCHAR(20),
    km_atual FLOAT,
    proxima_troca_oleo_km FLOAT,
    disponivel BOOLEAN,
    observacoes TEXT,
    data_criacao TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    data_atualizacao TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    CONSTRAINT fk_carro_tipo FOREIGN KEY (tip_id) REFERENCES tipo_carro(id)
);

CREATE TABLE servicos (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    car_prefixo VARCHAR(20),
    usuario_registro VARCHAR(50),
    data_saida DATETIME,
    data_chegada DATETIME,
    data_finalizacao DATETIME,
    quilometragem_saida FLOAT,
    quilometragem_chegada FLOAT,
    destino_requisitante VARCHAR(255),
    descricao TEXT,
    data_criacao TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    data_atualizacao TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    CONSTRAINT fk_servico_carro FOREIGN KEY (car_prefixo) REFERENCES carros(prefixo),
    CONSTRAINT fk_servico_usuario FOREIGN KEY (usuario_registro) REFERENCES usuarios(matricula)
);

CREATE TABLE registros (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    servico_id BIGINT,
    tipo_registro ENUM('CHECK_IN', 'CHECK_OUT', 'ABASTECIMENTO', 'OCORRENCIA'),
    data_registro DATETIME,
    km_registro FLOAT,
    anotacao VARCHAR(255),
    data_criacao TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    data_atualizacao TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    CONSTRAINT fk_registro_servico FOREIGN KEY (servico_id) REFERENCES servicos(id)
);

CREATE TABLE abastecimentos (
    registro_id BIGINT PRIMARY KEY,
    litros FLOAT,
    preco_litro DOUBLE,
    valor_total DOUBLE,
    nota_fiscal VARCHAR(50),
    data_criacao TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    data_atualizacao TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    CONSTRAINT fk_abastecimento_registro FOREIGN KEY (registro_id) REFERENCES registros(id) ON DELETE CASCADE
);