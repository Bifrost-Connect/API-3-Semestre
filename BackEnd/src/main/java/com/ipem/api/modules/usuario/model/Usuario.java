package com.ipem.api.modules.usuario.model;

import com.ipem.api.modules.usuario.model.enums.Permissao;
import jakarta.persistence.*;
import lombok.*;

@Entity
@Table(name = "usuarios")
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class Usuario {

    @Id
    @Column(name = "num_registro")
    private Integer id;

    @Column(name = "nome", nullable = false)
    private String nome;

    @Column(name = "email", nullable = false, unique = true)
    private String email;

    @Column(name = "senha", nullable = false)
    private String senha;

    @Column(name = "permissao", nullable = false)
    @Convert(converter = PermissaoConverter.class)
    private Permissao permissao;
}

// Classe auxiliar para traduzir "administrador" (banco) -> ADMINISTRADOR (Java)
@Converter
class PermissaoConverter implements AttributeConverter<Permissao, String> {
    @Override
    public String convertToDatabaseColumn(Permissao attribute) {
        return attribute == null ? null : attribute.name().toLowerCase();
    }

    @Override
    public Permissao convertToEntityAttribute(String dbData) {
        if (dbData == null) return null;
        try {
            return Permissao.valueOf(dbData.toUpperCase());
        } catch (IllegalArgumentException e) {
            return null;
        }
    }
}