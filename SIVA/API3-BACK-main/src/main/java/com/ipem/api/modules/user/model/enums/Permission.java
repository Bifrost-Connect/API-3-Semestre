package com.ipem.api.modules.user.model.enums;

import com.fasterxml.jackson.annotation.JsonCreator;

public enum Permission {
    ADMINISTRATOR,
    TECHNICIAN;

    @JsonCreator
    public static Permission fromValue(String value) {
        if (value == null) return null;
        return Permission.valueOf(value.toUpperCase());
    }
}