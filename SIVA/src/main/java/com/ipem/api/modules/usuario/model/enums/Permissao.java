package com.ipem.api.modules.usuario.model.enums;

import com.fasterxml.jackson.annotation.JsonCreator;
import java.util.stream.Stream;

public enum Permissao {
    ADMINISTRADOR,
    TECNICO;

    @JsonCreator
    public static Permissao fromValue(String value) {
        if (value == null) return null;
        return Stream.of(Permissao.values())
                .filter(p -> p.name().equalsIgnoreCase(value))
                .findFirst()
                .orElseThrow(() -> new IllegalArgumentException("Permissão desconhecida: " + value));
    }
}