package com.ipem.api.modules.usuario.repository;

import com.ipem.api.modules.usuario.model.Usuario;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import java.util.Optional;

@Repository
public interface UsuarioRepository extends JpaRepository<Usuario, Integer> {

    Optional<Usuario> findByMatricula(String matricula);

    boolean existsByMatricula(String matricula);
}