package com.ipem.api.modules.vehicle.model;

import com.ipem.api.infrastructure.models.BaseEntity;
import com.ipem.api.modules.vehicle.model.enums.VehicleStatus;
import jakarta.persistence.*;
import lombok.*;

@Entity
@Table(name = "cars")
@Getter @Setter @NoArgsConstructor @AllArgsConstructor @Builder
public class Car extends BaseEntity {
    @Id
    private String prefix;
    private String licensePlate;

    @ManyToOne
    @JoinColumn(name = "type_id")
    private CarType type;

    private String fuel;
    private Float currentKm;
    private Float nextOilChangeKm;

    private Boolean available;

    @Column(columnDefinition = "TEXT")
    private String observations;

    private String color;
    private String requiredLicense;

    @Enumerated(EnumType.STRING)
    @Column(name = "vehicle_status")
    private VehicleStatus vehicleStatus;
}