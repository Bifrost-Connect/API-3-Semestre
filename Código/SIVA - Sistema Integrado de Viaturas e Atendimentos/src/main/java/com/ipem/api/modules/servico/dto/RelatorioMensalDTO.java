package com.ipem.api.modules.servico.dto;

public record RelatorioMensalDTO(
        String prefixoCarro,
        Float totalLitros,
        Double totalGasto,
        Integer totalChamados,
        String status
) {
}
