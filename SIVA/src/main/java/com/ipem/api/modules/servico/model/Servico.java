package com.ipem.api.modules.servico.model;

import com.ipem.api.modules.veiculo.model.Carro;
import jakarta.persistence.*;
import lombok.*;
import java.time.LocalDateTime;

@Entity
@Table(name = "servicos")
@Getter @Setter @NoArgsConstructor @AllArgsConstructor @Builder
public class Servico {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    @ManyToOne
    @JoinColumn(name = "car_prefixo")
    private Carro carro;

    @Column(name = "quilometragem_chegada")
    private Float quilometragemChegada;

    @Column(name = "descricao", columnDefinition = "TEXT")
    private String descricao;

    @Column(name = "data_finalizacao")
    private LocalDateTime dataFinalizacao;
}