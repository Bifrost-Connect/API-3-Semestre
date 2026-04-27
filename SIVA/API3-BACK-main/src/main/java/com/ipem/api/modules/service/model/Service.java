package com.ipem.api.modules.service.model;

import com.ipem.api.infrastructure.models.BaseEntity;
import com.ipem.api.modules.user.model.User;
import com.ipem.api.modules.vehicle.model.Car;
import jakarta.persistence.*;
import lombok.*;
import java.time.LocalDateTime;

@Entity
@Table(name = "services")
@Getter @Setter @NoArgsConstructor @AllArgsConstructor @Builder
public class Service extends BaseEntity {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @ManyToOne
    @JoinColumn(name = "car_prefix")
    private Car car;

    @ManyToOne
    @JoinColumn(name = "user_registration")
    private User user;

    private LocalDateTime departureTime;
    private LocalDateTime arrivalTime;
    private LocalDateTime completionTime;

    private Float departureKm;
    private Float arrivalKm;
    private String destinationRequester;

    @Column(columnDefinition = "TEXT")
    private String description;
}