<<<<<<< HEAD:SIVA/SIVA/src/main/java/com/ipem/api/modules/veiculo/repository/TipoCarroRepository.java
package com.ipem.api.modules.veiculo.repository;

import com.ipem.api.modules.veiculo.model.TipoCarro;
import org.springframework.data.jpa.repository.JpaRepository;

public interface TipoCarroRepository extends JpaRepository<TipoCarro, Integer> {
}
=======
package com.ipem.api.modules.veiculo.repository;

import com.ipem.api.modules.veiculo.model.TipoCarro;
import org.springframework.data.jpa.repository.JpaRepository;
import java.util.List;

public interface TipoCarroRepository extends JpaRepository<TipoCarro, Integer> {

    List<TipoCarro> findByCategoria(String categoria);

    List<TipoCarro> findByModeloContainingIgnoreCase(String modelo);
}
>>>>>>> 085d90d (feat: refatoração da persistência e implementação de DTOs para o Dashboard):Código/SIVA - Sistema Integrado de Viaturas e Atendimentos/src/main/java/com/ipem/api/modules/veiculo/repository/TipoCarroRepository.java
