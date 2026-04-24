<<<<<<< HEAD:SIVA/SIVA/src/main/java/com/ipem/api/modules/servico/repository/ServicoRepository.java
package com.ipem.api.modules.servico.repository;

import com.ipem.api.modules.servico.model.Servico;
import org.springframework.data.jpa.repository.JpaRepository;

public interface ServicoRepository extends JpaRepository<Servico, Long> {
}
=======
package com.ipem.api.modules.servico.repository;

import com.ipem.api.modules.servico.model.Servico;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.time.LocalDateTime;
import java.util.List;

public interface ServicoRepository extends JpaRepository<Servico, Long> {

    @Query("SELECT s FROM Servico s WHERE s.carro.prefixo = :prefixo")
    List<Servico> findByCarroPrefixo(@Param("prefixo") String prefixo);

    List<Servico> findByDataSaidaBetween(LocalDateTime inicio, LocalDateTime fim);

    List<Servico> findByCarroPrefixoAndDataFinalizacaoIsNull(String prefixo);
}
>>>>>>> 085d90d (feat: refatoração da persistência e implementação de DTOs para o Dashboard):Código/SIVA - Sistema Integrado de Viaturas e Atendimentos/src/main/java/com/ipem/api/modules/servico/repository/ServicoRepository.java
