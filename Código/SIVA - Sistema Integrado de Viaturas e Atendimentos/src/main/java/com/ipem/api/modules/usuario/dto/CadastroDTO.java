package com.ipem.api.modules.usuario.dto;

import com.ipem.api.modules.usuario.model.enums.Permissao;
import jakarta.validation.constraints.Email;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;

public record CadastroDTO(
        @NotBlank(message = "A matrícula é obrigatória")
        String matricula,

        @NotBlank(message = "O nome é obrigatório")
        String nome,

        @Email(message = "O e-mail deve ser válido")
        @NotBlank(message = "O e-mail é obrigatório")
        String email,

        @NotBlank(message = "A senha é obrigatória")
        String senha,

        @NotNull(message = "A permissão é obrigatória")
        Permissao permissao
) {
}