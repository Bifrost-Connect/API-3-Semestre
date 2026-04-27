<<<<<<< HEAD:SIVA/SIVA/src/main/java/com/ipem/api/modules/servico/repository/AbastecimentoRepository.java
package com.ipem.api.modules.servico.repository;

import com.ipem.api.modules.servico.model.Abastecimento;
import org.springframework.data.jpa.repository.JpaRepository;

public interface AbastecimentoRepository extends JpaRepository<Abastecimento, Long> {
}
=======
package com.ipem.api.modules.servico.repository;

import com.ipem.api.modules.servico.model.Abastecimento;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import java.util.List;

public interface AbastecimentoRepository extends JpaRepository<Abastecimento, Long> {

    @Query("SELECT a FROM Abastecimento a JOIN a.registro r WHERE r.servico.carro.prefixo = :prefixo ORDER BY r.dataRegistro DESC")
    List<Abastecimento> findUltimosAbastecimentosPorViatura(String prefixo);
}
>>>>>>> 085d90d (feat: refatoração da persistência e implementação de DTOs para o Dashboard):Código/SIVA - Sistema Integrado de Viaturas e Atendimentos/src/main/java/com/ipem/api/modules/servico/repository/AbastecimentoRepository.java
