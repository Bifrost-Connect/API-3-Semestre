package com.ipem.api.modules.vehicle.repository;

import com.ipem.api.modules.vehicle.model.CarType;
import org.springframework.data.jpa.repository.JpaRepository;
import java.util.List;

public interface CarTypeRepository extends JpaRepository<CarType, Integer> {

    List<CarType> findByCategory(String category);

    List<CarType> findByModelContainingIgnoreCase(String model);
}