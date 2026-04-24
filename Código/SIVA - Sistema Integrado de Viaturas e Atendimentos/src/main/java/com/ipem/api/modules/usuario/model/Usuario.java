package com.ipem.api.modules.usuario.model;

import com.ipem.api.core.models.BaseEntity;
import com.ipem.api.modules.usuario.model.enums.Permissao;
import jakarta.persistence.*;
import lombok.*;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

import java.time.LocalDateTime;
import java.util.Collection;
import java.util.List;

@Entity
@Table(name = "usuarios")
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class Usuario extends BaseEntity implements UserDetails {

    @Id
    private String matricula;

    private String nome;
    private String email;
    private String senha;

    @Convert(converter = PermissaoConverter.class)
    private Permissao permissao;

    @Builder
    public Usuario(String matricula, String nome, String email, String senha,
                   Permissao permissao, LocalDateTime dataCriacao, LocalDateTime dataAtualizacao) {
        this.matricula = matricula;
        this.nome = nome;
        this.email = email;
        this.senha = senha;
        this.permissao = permissao;
        this.setDataCriacao(dataCriacao);
        this.setDataAtualizacao(dataAtualizacao);
    }

    @Override
    public Collection<? extends GrantedAuthority> getAuthorities() {
        return List.of(new SimpleGrantedAuthority("ROLE_" + permissao.name()));
    }

    @Override
    public String getPassword() { return senha; }

    @Override
    public String getUsername() { return email; }

    @Override
    public boolean isAccountNonExpired() { return true; }

    @Override
    public boolean isAccountNonLocked() { return true; }

    @Override
    public boolean isCredentialsNonExpired() { return true; }

    @Override
    public boolean isEnabled() { return true; }
}


@Converter
class PermissaoConverter implements AttributeConverter<Permissao, String> {
    @Override
    public String convertToDatabaseColumn(Permissao attribute) {
        return attribute == null ? null : attribute.name();
    }

    @Override
    public Permissao convertToEntityAttribute(String dbData) {
        if (dbData == null) return null;
        try {
            return Permissao.valueOf(dbData);
        } catch (IllegalArgumentException e) {
            return null;
        }
    }
}