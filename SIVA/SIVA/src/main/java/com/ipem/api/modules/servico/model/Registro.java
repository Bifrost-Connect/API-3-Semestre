<<<<<<< HEAD:SIVA/SIVA/src/main/java/com/ipem/api/modules/servico/model/Registro.java
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
=======
package com.ipem.api.modules.servico.model;

import com.ipem.api.core.models.BaseEntity;
import com.ipem.api.modules.servico.model.enums.TipoRegistro;
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
>>>>>>> 085d90d (feat: refatoração da persistência e implementação de DTOs para o Dashboard):Código/SIVA - Sistema Integrado de Viaturas e Atendimentos/src/main/java/com/ipem/api/modules/servico/model/Registro.java
}