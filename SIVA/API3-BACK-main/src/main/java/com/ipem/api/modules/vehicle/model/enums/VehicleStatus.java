package com.ipem.api.modules.vehicle.model.enums;

import com.fasterxml.jackson.annotation.JsonCreator;

public enum VehicleStatus {
    AVAILABLE,
    IN_USE,
    MAINTENANCE,
    UNAVAILABLE;

    @JsonCreator
    public static VehicleStatus fromValue(String value) {
        if (value == null) return null;
        return VehicleStatus.valueOf(value.toUpperCase());
    }
}