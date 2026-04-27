<<<<<<< HEAD:SIVA/SIVA/src/main/java/com/ipem/api/modules/veiculo/model/Carro.java
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
=======
package com.ipem.api.modules.veiculo.model;

import com.ipem.api.core.models.BaseEntity;
import com.ipem.api.modules.veiculo.model.enums.StatusVeiculo;
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

    private String cor;
    private String cnhNecessaria;

    @Enumerated(EnumType.STRING)
    @Column(name = "status_veiculo")
    private StatusVeiculo statusVeiculo;
>>>>>>> 085d90d (feat: refatoração da persistência e implementação de DTOs para o Dashboard):Código/SIVA - Sistema Integrado de Viaturas e Atendimentos/src/main/java/com/ipem/api/modules/veiculo/model/Carro.java
}