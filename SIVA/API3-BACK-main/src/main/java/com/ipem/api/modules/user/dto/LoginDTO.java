package com.ipem.api.modules.user.dto;

import jakarta.validation.constraints.NotBlank;

public record LoginDTO(
        @NotBlank(message = "Por favor insira uma matricula")
        String registration,

        @NotBlank(message = "Por favor insira uma senha")
        String password
) {
}