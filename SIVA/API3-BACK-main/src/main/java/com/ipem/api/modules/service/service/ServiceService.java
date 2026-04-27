package com.ipem.api.modules.service.service;

import com.ipem.api.modules.service.dto.CheckInOutRequestDTO;
import com.ipem.api.modules.service.model.Service;
import com.ipem.api.modules.service.repository.ServiceRepository;
import com.ipem.api.modules.user.repository.UserRepository;
import com.ipem.api.modules.vehicle.repository.CarRepository;

import java.time.LocalDateTime;

@org.springframework.stereotype.Service
public class ServiceService {

    private final ServiceRepository serviceRepository;
    private final CarRepository carRepository;
    private final UserRepository userRepository;

    public ServiceService(ServiceRepository serviceRepository, CarRepository carRepository, UserRepository userRepository) {
        this.serviceRepository = serviceRepository;
        this.carRepository = carRepository;
        this.userRepository = userRepository;
    }

    // CHECK-IN
    public Service startService(CheckInOutRequestDTO dto) {
        var car = carRepository.findById(dto.carPrefix())
                .orElseThrow(() -> new RuntimeException("Carro não encontrado"));
        var user = userRepository.findById(dto.userRegistration())
                .orElseThrow(() -> new RuntimeException("Usuário não encontrado"));

        Service newService = Service.builder()
                .car(car)
                .user(user)
                .departureTime(LocalDateTime.now())
                .departureKm(dto.recordKm())
                .description(dto.note())
                .build();

        // utilizando o trigger no banco "trg_start_service_status" para mudar o
        // status do carro como "in_use"
        return serviceRepository.save(newService);
    }
    public Service finishService(Long serviceId, Float kmFinal) {
        Service service = serviceRepository.findById(serviceId)
                .orElseThrow(() -> new RuntimeException("Serviço não encontrado"));

        service.setArrivalTime(LocalDateTime.now());
        service.setCompletionTime(LocalDateTime.now());
        service.setArrivalKm(kmFinal);

        var car = service.getCar();
        car.setCurrentKm(kmFinal);
        car.setVehicleStatus(com.ipem.api.modules.vehicle.model.enums.VehicleStatus.AVAILABLE);
        carRepository.save(car);

        return serviceRepository.save(service);
    }
}