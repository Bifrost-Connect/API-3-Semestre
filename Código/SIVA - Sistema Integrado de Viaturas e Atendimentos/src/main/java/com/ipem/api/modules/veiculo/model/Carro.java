package com.ipem.api.modules.veiculo.model;

import com.ipem.api.core.models.BaseEntity;
import jakarta.persistence.*;
import lombok.*;

@Entity
@Table(name = "carros")
@Getter @Setter @NoArgsConstructor @AllArgsConstructor @Builder
public class Carro extends BaseEntity {
    @Id
    private String prefixo;
    private String placa;

    @ManyToOne
    @JoinColumn(name = "tip_id")
    private TipoCarro tipo;

    private String combustivel;
    private Float kmAtual;
    private Float proximaTrocaOleoKm;
    private Boolean disponivel;

    @Column(columnDefinition = "TEXT")
    private String observacoes;
}