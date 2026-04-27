package com.ipem.api.modules.servico.model;

import com.ipem.api.core.models.BaseEntity;
import com.ipem.api.modules.servico.model.enums.TipoOcorrencia;
import jakarta.persistence.*;
import lombok.*;

@Entity
@Table(name = "ocorrencias")
@Getter @Setter @NoArgsConstructor @AllArgsConstructor @Builder
public class Ocorrencia extends BaseEntity {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @ManyToOne
    @JoinColumn(name = "servico_id", nullable = false)
    private Servico servico;

    @Enumerated(EnumType.STRING)
    private TipoOcorrencia tipoOcorrencia;

    private String localizacao;
    private Boolean solicitarSuporte;

    @Column(columnDefinition = "TEXT")
    private String descricao;
}