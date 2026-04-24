package com.ipem.api.modules.usuario.model.enums;

import com.fasterxml.jackson.annotation.JsonCreator;
import java.util.stream.Stream;

public enum Permissao {
    administrador,
    tecnico;

    @JsonCreator
    public static Permissao fromValue(String value) {
        if (value == null) return null;
        return Stream.of(Permissao.values())
                .filter(p -> p.name().equals(value.toLowerCase()))
                .findFirst()
                .orElseThrow(() -> new IllegalArgumentException("Permissão desconhecida: " + value));
    }
}