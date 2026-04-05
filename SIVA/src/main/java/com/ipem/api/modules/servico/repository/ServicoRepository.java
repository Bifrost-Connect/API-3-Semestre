package com.ipem.api.modules.servico.repository;

import com.ipem.api.modules.servico.model.Servico;
import org.springframework.data.jpa.repository.JpaRepository;

public interface ServicoRepository extends JpaRepository<Servico, Long> {
}
