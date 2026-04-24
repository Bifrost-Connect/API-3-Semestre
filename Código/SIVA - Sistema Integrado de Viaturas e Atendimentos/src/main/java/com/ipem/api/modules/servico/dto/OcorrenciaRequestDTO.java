package com.ipem.api.modules.servico.dto;

public record OcorrenciaRequestDTO(
        String tipoOcorrencia,
        String localizacao,
        Boolean solicitarSuporte,
        String descricao
) {
}
