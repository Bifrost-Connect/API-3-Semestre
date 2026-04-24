package com.ipem.api.modules.veiculo.model;

import com.ipem.api.core.models.BaseEntity;
import jakarta.persistence.*;
import lombok.*;

@Entity
@Table(name = "tipo_carro")
@Getter @Setter @NoArgsConstructor @AllArgsConstructor
public class TipoCarro extends BaseEntity {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;
    private String marca;
    private String modelo;
    private Integer ano;

    @Column(name = "categoria", columnDefinition = "ENUM('passeio', 'utilidades')")
    private String categoria;
}