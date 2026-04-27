package com.ipem.api.modules.vehicle.dto;

public record CarStatusUpdateDTO(
        String vehicleStatus,
        String observations
) {
}