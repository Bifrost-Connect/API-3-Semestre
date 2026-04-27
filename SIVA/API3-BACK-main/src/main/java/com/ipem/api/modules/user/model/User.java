package com.ipem.api.modules.user.model;

import com.ipem.api.infrastructure.models.BaseEntity;
import com.ipem.api.modules.user.model.enums.Permission;
import com.ipem.api.modules.user.model.enums.EmployeeStatus;
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
@Table(name = "users")
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class User extends BaseEntity implements UserDetails {

    @Id
    private String registration;

    private String name;
    private String email;
    private String password;

    @Enumerated(EnumType.STRING)
    private Permission permission;

    private String phone;
    private String gender;
    private LocalDate birthDate;
    private String driverLicense;

    @Enumerated(EnumType.STRING)
    @Column(name = "employee_status")
    private EmployeeStatus employeeStatus;

    public User(String registration, String name, String email, String password,
                Permission permission, String phone, String gender,
                LocalDate birthDate, String driverLicense, EmployeeStatus employeeStatus,
                LocalDateTime createdAt, LocalDateTime updatedAt) {
        this.registration = registration;
        this.name = name;
        this.email = email;
        this.password = password;
        this.permission = permission;
        this.phone = phone;
        this.gender = gender;
        this.birthDate = birthDate;
        this.driverLicense = driverLicense;
        this.employeeStatus = employeeStatus;
        this.setCreatedAt(createdAt);
        this.setUpdatedAt(updatedAt);
    }

    @Override
    public Collection<? extends GrantedAuthority> getAuthorities() {
        return List.of(new SimpleGrantedAuthority("ROLE_" + permission.name().toUpperCase()));
    }

    @Override
    public String getPassword() { return password; }

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