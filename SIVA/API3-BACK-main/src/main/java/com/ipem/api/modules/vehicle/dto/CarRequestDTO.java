package com.ipem.api.modules.vehicle.dto;

public record CarRequestDTO(
        String prefix,
        String licensePlate,
        Integer typeId,
        String fuel,
        Float currentKm,
        Float nextOilChangeKm,
        String color,
        String requiredLicense
) {}