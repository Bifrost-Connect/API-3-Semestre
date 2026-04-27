<<<<<<< HEAD:SIVA/SIVA/src/main/java/com/ipem/api/modules/veiculo/repository/CarroRepository.java
package com.ipem.api.modules.veiculo.repository;

import com.ipem.api.modules.veiculo.model.Carro;
import org.springframework.data.jpa.repository.JpaRepository;

public interface CarroRepository extends JpaRepository<Carro, String> {
}
=======
package com.ipem.api.modules.veiculo.repository;

import com.ipem.api.modules.veiculo.model.Carro;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import java.util.List;

public interface CarroRepository extends JpaRepository<Carro, String> {

    List<Carro> findByStatusVeiculo(String status);

    @Query("SELECT c FROM Carro c WHERE c.kmAtual >= (c.proximaTrocaOleoKm - 500)")
    List<Carro> findCarrosPrecisandoManutencao();

    @Query("SELECT COUNT(c) FROM Carro c WHERE c.statusVeiculo = :status")
    Long countByStatus(@Param("status") String status);

    Carro findByPlaca(String placa);
}
>>>>>>> 085d90d (feat: refatoração da persistência e implementação de DTOs para o Dashboard):Código/SIVA - Sistema Integrado de Viaturas e Atendimentos/src/main/java/com/ipem/api/modules/veiculo/repository/CarroRepository.java
