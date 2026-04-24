package com.ipem.api.modules.veiculo.dto;

public record CarroResponseDTO(
        String prefixo,
        String placa,
        String modelo,
        String statusVeiculo,
        Float kmAtual,
        String observacoes
) {
}
