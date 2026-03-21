package com.ipem.api.modules.servico.model;

import jakarta.persistence.*;
import lombok.*;

@Entity
@Table(name = "abastecimentos")
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@PrimaryKeyJoinColumn(name = "registro_id")
public class Abastecimento extends Registro {
    private Float litros;
    private Double precoLitro;
    private Double valorTotal;
    private String notaFiscal;
}