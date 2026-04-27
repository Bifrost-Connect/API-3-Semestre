package com.ipem.api.modules.veiculo.dto;

public record CarroRequestDTO(
        String prefixo,
        String placa,
        Integer tipoId,
        String combustivel,
        Float kmAtual,
        Float proximaTrocaOleoKm,
        String cor,
        String cnhNecessaria
) {}

