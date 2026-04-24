DELIMITER $$

DROP TRIGGER IF EXISTS trg_valida_disponibilidade_carro$$
CREATE TRIGGER trg_valida_disponibilidade_carro
BEFORE INSERT ON servicos
FOR EACH ROW
BEGIN
    DECLARE status_atual VARCHAR(20);
    SELECT status_veiculo INTO status_atual FROM carros WHERE prefixo = NEW.car_prefixo;
    
    IF status_atual != 'disponivel' THEN
        SIGNAL SQLSTATE '45000' 
        SET MESSAGE_TEXT = 'Erro: Esta viatura não está disponível para uso no momento.';
    END IF;
END$$

DROP TRIGGER IF EXISTS trg_atualiza_km_e_oleo$$
CREATE TRIGGER trg_atualiza_km_e_oleo
AFTER INSERT ON registros
FOR EACH ROW
BEGIN
    DECLARE v_km_oleo FLOAT;
    
    -- Atualiza KM atual do carro
    UPDATE carros 
    SET km_atual = NEW.km_registro
    WHERE prefixo = (SELECT car_prefixo FROM servicos WHERE id = NEW.servico_id);

    -- Verifica necessidade de manutenção
    SELECT proxima_troca_oleo_km INTO v_km_oleo 
    FROM carros WHERE prefixo = (SELECT car_prefixo FROM servicos WHERE id = NEW.servico_id);
    
    IF NEW.km_registro >= v_km_oleo THEN
        UPDATE carros 
        SET status_veiculo = 'manutencao',
            observacoes = CONCAT(IFNULL(observacoes, ''), ' - ALERTA: Troca de óleo necessária.')
        WHERE prefixo = (SELECT car_prefixo FROM servicos WHERE id = NEW.servico_id);
    END IF;
END$$

DROP TRIGGER IF EXISTS trg_inicia_servico_status$$
CREATE TRIGGER trg_inicia_servico_status
AFTER INSERT ON servicos
FOR EACH ROW
BEGIN
    UPDATE carros SET status_veiculo = 'em_uso' WHERE prefixo = NEW.car_prefixo;
END$$

DROP TRIGGER IF EXISTS trg_limpa_uso_apos_cancelamento$$
CREATE TRIGGER trg_limpa_uso_apos_cancelamento
AFTER INSERT ON ocorrencias
FOR EACH ROW
BEGIN
    IF NEW.tipo_ocorrencia = 'CANCELAMENTO' THEN
        UPDATE carros SET status_veiculo = 'disponivel' 
        WHERE prefixo = (SELECT car_prefixo FROM servicos WHERE id = NEW.servico_id);
    END IF;
END$$

DELIMITER ;
