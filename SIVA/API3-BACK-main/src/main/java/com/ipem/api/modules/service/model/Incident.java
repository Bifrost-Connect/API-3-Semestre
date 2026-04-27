package com.ipem.api.modules.service.model;

import com.ipem.api.infrastructure.models.BaseEntity;
import com.ipem.api.modules.service.model.enums.IncidentType;
import jakarta.persistence.*;
import lombok.*;

@Entity
@Table(name = "incidents")
@Getter @Setter @NoArgsConstructor @AllArgsConstructor @Builder
public class Incident extends BaseEntity {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @ManyToOne
    @JoinColumn(name = "service_id", nullable = false)
    private Service service;

    @Enumerated(EnumType.STRING)
    private IncidentType incidentType;

    private String location;
    private Boolean requestSupport;

    @Column(columnDefinition = "TEXT")
    private String description;
}