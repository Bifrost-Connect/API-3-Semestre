package com.ipem.api.modules.servico.dto;

public record CheckInOutRequestDTO(
        String carPrefixo,
        Float kmRegistro,
        String anotacao
) {}

