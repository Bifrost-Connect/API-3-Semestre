package com.ipem.api.modules.servico.model;

import com.ipem.api.core.models.BaseEntity;
import com.ipem.api.modules.servico.model.Enum.TipoRegistro;
import jakarta.persistence.*;
import lombok.*;
import java.time.LocalDateTime;

@Entity
@Table(name = "registros")
@Getter @Setter @NoArgsConstructor @AllArgsConstructor
@Inheritance(strategy = InheritanceType.JOINED)
public class Registro extends BaseEntity {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @ManyToOne
    @JoinColumn(name = "servico_id")
    private Servico servico;

    @Enumerated(EnumType.STRING)
    @Column(name = "tipo_registro", columnDefinition = "ENUM('CHECK_IN', 'CHECK_OUT', 'ABASTECIMENTO', 'OCORRENCIA')")
    private TipoRegistro tipoRegistro;

    private LocalDateTime dataRegistro;

    private Float kmRegistro;
    private String anotacao;
}