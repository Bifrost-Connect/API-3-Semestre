package com.ipem.api.modules.service.dto;

public record CheckInOutRequestDTO(
        String carPrefix,
        String userRegistration,
        Float recordKm,
        String note
) {}