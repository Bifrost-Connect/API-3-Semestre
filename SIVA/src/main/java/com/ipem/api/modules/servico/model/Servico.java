package com.ipem.api.modules.servico.model;

import com.ipem.api.core.models.BaseEntity;
import com.ipem.api.modules.usuario.model.Usuario;
import com.ipem.api.modules.veiculo.model.Carro;
import jakarta.persistence.*;
import lombok.*;
import java.time.LocalDateTime;

@Entity
@Table(name = "servicos")
@Getter @Setter @NoArgsConstructor @AllArgsConstructor @Builder
public class Servico extends BaseEntity {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @ManyToOne
    @JoinColumn(name = "car_prefixo")
    private Carro carro;

    @ManyToOne
    @JoinColumn(name = "usuario_registro")
    private Usuario usuario;

    private LocalDateTime dataSaida;
    private LocalDateTime dataChegada;
    private LocalDateTime dataFinalizacao;

    private Float quilometragemSaida;
    private Float quilometragemChegada;
    private String destinoRequisitante;

    @Column(columnDefinition = "TEXT")
    private String descricao;
}