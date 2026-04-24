package com.ipem.api.modules.servico.model;

import com.ipem.api.core.models.BaseEntity;
import jakarta.persistence.*;
import lombok.*;
import java.math.BigDecimal;

@Entity
@Table(name = "abastecimentos")
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class Abastecimento extends BaseEntity {

    @Id
    @Column(name = "registro_id")
    private Long registroId;

    @OneToOne
    @MapsId
    @JoinColumn(name = "registro_id")
    private Registro registro;

    private Float litros;

    @Column(name = "preco_litro")
    private Double precoLitro;

    @Column(name = "valor_total")
    private Double valorTotal;

    @Column(name = "nota_fiscal")
    private String notaFiscal;
}