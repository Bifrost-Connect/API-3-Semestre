package com.ipem.api.modules.veiculo.dto;

// Atualização de status (Auditoria)
public record CarroStatusUpdateDTO(
        String statusVeiculo,
        String observacoes
) {
}
