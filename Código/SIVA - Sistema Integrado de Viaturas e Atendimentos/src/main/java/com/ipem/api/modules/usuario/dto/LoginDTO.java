package com.ipem.api.modules.usuario.dto;

import jakarta.validation.constraints.NotBlank;

public record LoginDTO(
        @NotBlank(message = "Por favor insira uma matricula")
        String matricula,

        @NotBlank(message = "Por favor insira uma senha")
        String senha
) {
}