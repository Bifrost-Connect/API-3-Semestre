package com.ipem.api.modules.vehicle.model;

import com.ipem.api.infrastructure.models.BaseEntity;
import jakarta.persistence.*;
import lombok.*;

@Entity
@Table(name = "car_type")
@Getter @Setter @NoArgsConstructor @AllArgsConstructor
public class CarType extends BaseEntity {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;
    private String brand;
    private String model;
    private Integer year;

    @Column(name = "category", columnDefinition = "ENUM('passenger', 'utility')")
    private String category;
}