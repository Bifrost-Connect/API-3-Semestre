package com.ipem.api.modules.servico.dto;

public record AbastecimentoRequestDTO(
        Float litros,
        Double precoLitro,
        String notaFiscal,
        Boolean teveTrocaOleo
) {
}
