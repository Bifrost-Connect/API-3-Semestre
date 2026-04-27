package com.ipem.api.modules.service.model;

import com.ipem.api.infrastructure.models.BaseEntity;
import jakarta.persistence.*;
import lombok.*;

@Entity
@Table(name = "refuelings")
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class Refueling extends BaseEntity {

    @Id
    @Column(name = "record_id")
    private Long recordId;

    @OneToOne
    @MapsId
    @JoinColumn(name = "record_id")
    private Record record;

    private Float liters;

    @Column(name = "price_per_liter")
    private Double pricePerLiter;

    @Column(name = "total_amount")
    private Double totalAmount;

    @Column(name = "invoice")
    private String invoice;
}