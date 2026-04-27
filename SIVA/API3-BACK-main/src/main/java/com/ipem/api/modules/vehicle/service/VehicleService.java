package com.ipem.api.modules.vehicle.service;

import com.ipem.api.modules.vehicle.model.Car;
import com.ipem.api.modules.vehicle.model.CarType;
import com.ipem.api.modules.vehicle.repository.CarRepository;
import com.ipem.api.modules.vehicle.repository.CarTypeRepository;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class VehicleService {

    private final CarRepository carRepository;
    private final CarTypeRepository carTypeRepository;

    public VehicleService(CarRepository carRepository, CarTypeRepository carTypeRepository) {
        this.carRepository = carRepository;
        this.carTypeRepository = carTypeRepository;
    }

    @Transactional
    public void updateKmAndObs(String prefix, Float km, String obs) {
        Car car = carRepository.findById(prefix)
                .orElseThrow(() -> new RuntimeException("Vehicle not found with prefix: " + prefix));

        car.setCurrentKm(km);
        car.setObservations(obs);

        carRepository.save(car);
    }

    @Transactional
    public Car register(Car car) {

        if (car.getType() != null) {
            if (car.getType().getId() == null) {
                carTypeRepository.save(car.getType());
            } else {
                CarType existingType = carTypeRepository.findById(car.getType().getId())
                        .orElseThrow(() -> new RuntimeException("Car type not found"));
                car.setType(existingType);
            }
        }

        car.setAvailable(true);
        car.setCurrentKm(0.0f);
        return carRepository.save(car);
    }

    public Car save(Car car) {
        return carRepository.save(car);
    }


    public void registerFuel(Integer vehicleId, Double value, String date) {
        System.out.println("Salvando abastecimento veículo: " + vehicleId);


    }

    public Map<String, Object> getCurrentService() {

        Map<String, Object> chamado = new HashMap<>();

        chamado.put("id", 1);
        chamado.put("description", "Chamado ativo do técnico");
        chamado.put("status", "ATIVO");

        return chamado;
    }
    public List<Car> getAvailableVehicles() {
        // Busca todos os carros com status seja "AVAILABLE"
        return carRepository.findByVehicleStatus("AVAILABLE");
    }

}