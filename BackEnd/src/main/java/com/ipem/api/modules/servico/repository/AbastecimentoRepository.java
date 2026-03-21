package com.ipem.api.modules.servico.repository;

import com.ipem.api.modules.servico.model.Abastecimento;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.Optional;

@Repository
public interface AbastecimentoRepository extends JpaRepository<Abastecimento, Long> {

    // Busca o último abastecimento do mesmo carro, excluindo o atual, ordenando pela criação
    Optional<Abastecimento> findFirstByServicoCarroPrefixoAndIdNotOrderByDataCriacaoDesc(String prefixo, Long id);
}