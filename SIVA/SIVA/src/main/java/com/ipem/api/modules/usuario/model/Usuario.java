<<<<<<< HEAD:SIVA/SIVA/src/main/java/com/ipem/api/modules/usuario/model/Usuario.java
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
=======
package com.ipem.api.modules.usuario.model;

import com.ipem.api.core.models.BaseEntity;
import com.ipem.api.modules.usuario.model.enums.Permissao;
import com.ipem.api.modules.usuario.model.enums.StatusFuncionario; // Você precisará criar este Enum
import jakarta.persistence.*;
import lombok.*;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.Collection;
import java.util.List;

@Entity
@Table(name = "usuarios")
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class Usuario extends BaseEntity implements UserDetails {

    @Id
    private String matricula;

    private String nome;
    private String email;
    private String senha;

    @Convert(converter = PermissaoConverter.class)
    private Permissao permissao;

    private String telefone;
    private String sexo;
    private LocalDate dataNascimento;
    private String cnh;

    @Enumerated(EnumType.STRING)
    @Column(name = "status_funcionario")
    private StatusFuncionario statusFuncionario;

    public Usuario(String matricula, String nome, String email, String senha,
                   Permissao permissao, String telefone, String sexo,
                   LocalDate dataNascimento, String cnh, StatusFuncionario statusFuncionario,
                   LocalDateTime dataCriacao, LocalDateTime dataAtualizacao) {
        this.matricula = matricula;
        this.nome = nome;
        this.email = email;
        this.senha = senha;
        this.permissao = permissao;
        this.telefone = telefone;
        this.sexo = sexo;
        this.dataNascimento = dataNascimento;
        this.cnh = cnh;
        this.statusFuncionario = statusFuncionario;
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
        return Permissao.valueOf(dbData);
    }
>>>>>>> 085d90d (feat: refatoração da persistência e implementação de DTOs para o Dashboard):Código/SIVA - Sistema Integrado de Viaturas e Atendimentos/src/main/java/com/ipem/api/modules/usuario/model/Usuario.java
}