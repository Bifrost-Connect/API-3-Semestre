package com.ipem.api.modules.service.dto;

public record IncidentRequestDTO(
        String incidentType,
        String location,
        Boolean requestSupport,
        String description
) {
}