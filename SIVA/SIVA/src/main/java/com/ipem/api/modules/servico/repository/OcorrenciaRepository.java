package com.ipem.api.modules.servico.repository;

import com.ipem.api.modules.servico.model.Ocorrencia;
import org.springframework.data.jpa.repository.JpaRepository;
import java.util.List;

public interface OcorrenciaRepository extends JpaRepository<Ocorrencia, Long> {
    List<Ocorrencia> findByTipoOcorrencia(String tipo);

    List<Ocorrencia> findBySolicitarSuporteTrue();
}