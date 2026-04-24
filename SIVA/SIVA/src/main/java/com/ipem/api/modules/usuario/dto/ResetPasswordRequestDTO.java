package com.ipem.api.modules.usuario.dto;

import jakarta.validation.constraints.NotBlank;

public record ResetPasswordRequestDTO(
        String email,
        String novaSenha,
        String confirmacaoSenha
) {
}