<<<<<<< HEAD:SIVA/SIVA/src/main/java/com/ipem/api/modules/servico/repository/RegistroRepository.java
package com.ipem.api.modules.servico.repository;

import com.ipem.api.modules.servico.model.Registro;
import org.springframework.data.jpa.repository.JpaRepository;

public interface RegistroRepository extends JpaRepository<Registro, Long> {
}
=======
package com.ipem.api.modules.servico.repository;

import com.ipem.api.modules.servico.model.Registro;
import org.springframework.data.jpa.repository.JpaRepository;
import java.util.List;

public interface RegistroRepository extends JpaRepository<Registro, Long> {
    List<Registro> findByServicoIdOrderByDataRegistroAsc(Long servicoId);

    List<Registro> findByServicoIdAndTipoRegistro(Long servicoId, String tipo);
}
>>>>>>> 085d90d (feat: refatoração da persistência e implementação de DTOs para o Dashboard):Código/SIVA - Sistema Integrado de Viaturas e Atendimentos/src/main/java/com/ipem/api/modules/servico/repository/RegistroRepository.java
