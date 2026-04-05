package com.ipem.api.modules.usuario.dto;

import jakarta.validation.constraints.NotBlank;

public record LoginDTO(
        @NotBlank String matricula,
        @NotBlank String senha
) {
}