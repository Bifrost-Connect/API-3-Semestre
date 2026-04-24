package com.ipem.api.modules.servico.repository;

import com.ipem.api.modules.servico.model.Registro;
import org.springframework.data.jpa.repository.JpaRepository;

public interface RegistroRepository extends JpaRepository<Registro, Long> {
}
