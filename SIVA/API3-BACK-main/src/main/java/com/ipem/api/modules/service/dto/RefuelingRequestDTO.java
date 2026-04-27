package com.ipem.api.modules.service.dto;

public record RefuelingRequestDTO(
        Float liters,
        Double pricePerLiter,
        String invoice,
        Boolean hadOilChange
) {
}