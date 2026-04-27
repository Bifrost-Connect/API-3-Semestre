package com.ipem.api.modules.vehicle.repository;

import com.ipem.api.modules.vehicle.model.Car;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import java.util.List;

public interface CarRepository extends JpaRepository<Car, String> {

    List<Car> findByVehicleStatus(String status);

    @Query("SELECT c FROM Car c WHERE c.currentKm >= (c.nextOilChangeKm - 500)")
    List<Car> findCarsNeedingMaintenance();

    @Query("SELECT COUNT(c) FROM Car c WHERE c.vehicleStatus = :status")
    Long countByStatus(@Param("status") String status);

    Car findByLicensePlate(String licensePlate);
}