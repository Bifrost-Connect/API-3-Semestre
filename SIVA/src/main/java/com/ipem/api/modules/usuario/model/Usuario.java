package com.ipem.api.modules.usuario.model;

import com.ipem.api.modules.usuario.model.enums.Permissao;
import jakarta.persistence.*;
import lombok.*;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

import java.util.Collection;
import java.util.List;

@Entity
@Table(name = "usuarios")
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class Usuario implements UserDetails {

    @Id
    @Column(name = "num_registro")
    private Integer id;

    @Column(name = "nome", nullable = false)
    private String nome;

    @Column(name = "matricula")
    private String matricula;

    @Column(name = "email", nullable = false, unique = true)
    private String email;

    @Column(name = "senha", nullable = false)
    private String senha;

    @Column(name = "permissao", nullable = false)
    @Convert(converter = PermissaoConverter.class)
    private Permissao permissao;

    // Métodos do UserDetails (Spring Security)
    @Override
    public Collection<? extends GrantedAuthority> getAuthorities() {
        // Retorna a permissão com o prefixo ROLE_ exigido pelo Spring Security
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