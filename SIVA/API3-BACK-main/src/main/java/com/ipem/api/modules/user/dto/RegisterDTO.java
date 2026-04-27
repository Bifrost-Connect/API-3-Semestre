package com.ipem.api.modules.user.dto;

import com.ipem.api.modules.user.model.enums.Permission;
import jakarta.validation.constraints.Email;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;

public record RegisterDTO(
        @NotBlank(message = "Registration is mandatory")
        String registration,

        @NotBlank(message = "Name is mandatory")
        String name,

        @Email(message = "Email must be valid")
        @NotBlank(message = "Email is mandatory")
        String email,

        @NotBlank(message = "Password is mandatory")
        String password,

        @NotNull(message = "Permission is mandatory")
        Permission permission
) {
}