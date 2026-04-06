package com.ipem.api.modules.servico.model;

import com.ipem.api.core.models.BaseEntity;
import jakarta.persistence.*;
import lombok.*;
import java.math.BigDecimal;

@Entity
@Table(name = "abastecimentos")
@Getter @Setter @NoArgsConstructor @AllArgsConstructor @Builder
public class Abastecimento extends BaseEntity {
    @Id
    private Long registroId;

    @OneToOne
    @MapsId
    @JoinColumn(name = "registro_id")
    private Registro registro;

    private Float litros;
    private Double preco_litro;
    private Double valor_total;

    @Column(name = "nota_fiscal")
    private String notaFiscal;
}