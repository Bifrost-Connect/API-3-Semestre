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
    @Column(precision = 10, scale = 3)
    private BigDecimal precoLitro;
    @Column(precision = 10, scale = 2)
    private BigDecimal valorTotal;
    private String notaFiscal;
}