<<<<<<< HEAD:SIVA/SIVA/src/main/java/com/ipem/api/modules/usuario/repository/UsuarioRepository.java
package com.ipem.api.modules.usuario.repository;

import com.ipem.api.modules.usuario.model.Usuario;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import java.util.Optional;

@Repository
public interface UsuarioRepository extends JpaRepository<Usuario, Integer> {

    // O JpaRepository já gerencia o findById(Integer id) automaticamente.
    // Como o num_registro é o @Id no seu Usuario.java, ele buscará por lá.

    // Mantemos o findByEmail para evitar erros em outras partes do sistema.
    Optional<Usuario> findByEmail(String email);

    // Adicionamos findByMatricula caso você precise buscar pela coluna String 'matricula'.
    Optional<Usuario> findByMatricula(String matricula);
=======
package com.ipem.api.modules.usuario.repository;

import com.ipem.api.modules.usuario.model.Usuario;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import java.util.List;
import java.util.Optional;

@Repository
public interface UsuarioRepository extends JpaRepository<Usuario, String> { // Alterado para String conforme sua PK

    Optional<Usuario> findByMatricula(String matricula);

    Optional<Usuario> findByEmail(String email);

    boolean existsByMatricula(String matricula);
    boolean existsByEmail(String email);

    List<Usuario> findByStatusFuncionario(String status);

    List<Usuario> findByNomeContainingIgnoreCase(String nome);
>>>>>>> 085d90d (feat: refatoração da persistência e implementação de DTOs para o Dashboard):Código/SIVA - Sistema Integrado de Viaturas e Atendimentos/src/main/java/com/ipem/api/modules/usuario/repository/UsuarioRepository.java
}