

package com.ipem.api.modules.service.model;

import com.ipem.api.infrastructure.models.BaseEntity;
import com.ipem.api.modules.service.model.enums.RecordType;
import jakarta.persistence.*;
        import lombok.*;
        import java.time.LocalDateTime;

@Entity
@Table(name = "records")
@Getter @Setter @NoArgsConstructor @AllArgsConstructor
@Inheritance(strategy = InheritanceType.JOINED)
public class Record extends BaseEntity {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @ManyToOne
    @JoinColumn(name = "service_id")
    private Service service;

    @Enumerated(EnumType.STRING)
    @Column(name = "record_type", columnDefinition = "ENUM('CHECK_IN', 'CHECK_OUT', 'REFUELING', 'INCIDENT')")
    private RecordType recordType;

    private LocalDateTime recordDate;

    private Float recordKm;
    private String note;
}