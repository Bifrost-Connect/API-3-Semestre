package com.ipem.api.modules.service.dto;

public record MonthlyReportDTO(
        String carPrefix,
        Float totalLiters,
        Double totalSpent,
        Integer totalCalls,
        String status
) {
}