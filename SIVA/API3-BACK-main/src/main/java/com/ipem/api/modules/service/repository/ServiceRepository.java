package com.ipem.api.modules.service.repository;

import com.ipem.api.modules.service.model.Service;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.time.LocalDateTime;
import java.util.List;

public interface ServiceRepository extends JpaRepository<Service, Long> {

    @Query("SELECT s FROM Service s WHERE s.car.prefix = :prefix")
    List<Service> findByCarPrefix(@Param("prefix") String prefix);

    List<Service> findByDepartureTimeBetween(LocalDateTime start, LocalDateTime end);

    List<Service> findByCarPrefixAndCompletionTimeIsNull(String prefix);
}