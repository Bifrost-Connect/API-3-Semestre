package com.ipem.api.modules.vehicle.dto;

public record CarResponseDTO(
        String prefix,
        String licensePlate,
        String model,
        String vehicleStatus,
        Float currentKm,
        String observations
) {
}