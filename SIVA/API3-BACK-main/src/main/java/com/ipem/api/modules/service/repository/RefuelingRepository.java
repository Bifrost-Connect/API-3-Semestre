package com.ipem.api.modules.service.repository;

import com.ipem.api.modules.service.model.Refueling;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import java.util.List;

public interface RefuelingRepository extends JpaRepository<Refueling, Long> {

    @Query("SELECT a FROM Refueling a JOIN a.record r WHERE r.service.car.prefix = :prefix ORDER BY r.recordDate DESC")
    List<Refueling> findLatestRefuelingsByCar(String prefix);
}