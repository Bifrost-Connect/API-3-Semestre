CREATE TABLE tipo_carro (
    id INT AUTO_INCREMENT PRIMARY KEY,
    marca VARCHAR(100) NOT NULL,
    modelo VARCHAR(100) NOT NULL,
    ano INT NOT NULL,
    categoria ENUM('passeio', 'utilidades') NOT NULL,
    data_criacao TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    data_atualizacao TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

CREATE TABLE usuarios (
    num_registro INT(5) PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    senha VARCHAR(255) NOT NULL,
    permissao ENUM('tecnico', 'administrador') NOT NULL,
    data_criacao TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    data_atualizacao TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

CREATE TABLE carros (
    prefixo VARCHAR(20) PRIMARY KEY,
    placa VARCHAR(10) NOT NULL UNIQUE,
    tip_id INT NOT NULL,
    combustivel VARCHAR(20),
    km_atual FLOAT DEFAULT 0,
    proxima_troca_oleo_km FLOAT,
    disponivel BOOLEAN DEFAULT TRUE,
    data_criacao TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    data_atualizacao TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    CONSTRAINT fk_carro_tipo FOREIGN KEY (tip_id) REFERENCES tipo_carro(id)
);

CREATE TABLE servicos (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    car_prefixo VARCHAR(20) NOT NULL,
    usuario_registro INT(5) NOT NULL,
    data_saida TIMESTAMP NOT NULL,
    data_chegada TIMESTAMP NULL,
    km_saida FLOAT NOT NULL,
    km_chegada FLOAT NULL,
    destino_requisitante TEXT,
    data_criacao TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    data_atualizacao TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    CONSTRAINT fk_servico_carro FOREIGN KEY (car_prefixo) REFERENCES carros(prefixo),
    CONSTRAINT fk_servico_usuario FOREIGN KEY (usuario_registro) REFERENCES usuarios(num_registro)
);

CREATE TABLE registros (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    servico_id BIGINT NOT NULL,
    tipo_registro ENUM('CHECK_IN', 'CHECK_OUT', 'ABASTECIMENTO', 'OCORRENCIA') NOT NULL,
    data_registro TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    km_registro FLOAT NOT NULL,
    anotacao TEXT,
    data_criacao TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    data_atualizacao TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    CONSTRAINT fk_registro_servico FOREIGN KEY (servico_id) REFERENCES servicos(id)
);

CREATE TABLE abastecimentos (
    registro_id BIGINT PRIMARY KEY,
    litros FLOAT NOT NULL,
    preco_litro DECIMAL(10,3) NOT NULL,
    valor_total DECIMAL(10,2) NOT NULL,
    nota_fiscal VARCHAR(50),
    data_criacao TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    data_atualizacao TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    CONSTRAINT fk_abastecimento_registro FOREIGN KEY (registro_id) REFERENCES registros(id) ON DELETE CASCADE
);