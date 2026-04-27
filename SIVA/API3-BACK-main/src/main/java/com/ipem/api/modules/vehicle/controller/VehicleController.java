package com.ipem.api.modules.vehicle.controller;

import com.ipem.api.modules.vehicle.model.Car;
import com.ipem.api.modules.vehicle.service.VehicleService;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.Map;

@RestController
@RequestMapping("/vehicle")
@CrossOrigin(origins = "*")
public class VehicleController {

    private final VehicleService vehicleService;

    public VehicleController(VehicleService vehicleService) {
        this.vehicleService = vehicleService;
    }

    @PatchMapping("/{prefix}/update-data")
    public ResponseEntity<?> updateData(
            @PathVariable String prefix,
            @RequestBody Map<String, Object> data) {

        try {
            System.out.println(">>> Tentando atualizar veículo: " + prefix);

            Object mileageObj = data.get("mileage");
            if (mileageObj == null) {
                return ResponseEntity.badRequest()
                        .body(Map.of("error", "Mileage field is required."));
            }

            Float mileage;
            try {
                mileage = Float.parseFloat(mileageObj.toString());
            } catch (NumberFormatException e) {
                return ResponseEntity.badRequest()
                        .body(Map.of("error", "Mileage must be a number."));
            }

            String observations = data.get("observations") != null
                    ? data.get("observations").toString()
                    : "";

            vehicleService.updateKmAndObs(prefix.trim(), mileage, observations);

            return ResponseEntity.ok()
                    .body(Map.of("message", "Data saved successfully!"));

        } catch (Exception e) {
            e.printStackTrace();
            return ResponseEntity.status(500)
                    .body(Map.of("error", "Server error: " + e.getMessage()));
        }
    }

    @PostMapping("/register")
    public ResponseEntity<?> registerCar(@RequestBody Car car) {
        try {
            vehicleService.register(car);

            return ResponseEntity.ok()
                    .body(Map.of("message", "Vehicle registered successfully!"));

        } catch (Exception e) {
            e.printStackTrace();

            return ResponseEntity.badRequest()
                    .body(Map.of("error", "Registration error: " + e.getMessage()));
        }
    }


    @PostMapping("/{id}/fuel")
    public ResponseEntity<?> registerFuel(
            @PathVariable Integer id,
            @RequestBody Map<String, Object> data) {

        try {
            System.out.println(">>> Abastecimento veículo ID: " + id);

            Object valueObj = data.get("value");
            Object dateObj = data.get("date");

            if (valueObj == null || dateObj == null) {
                return ResponseEntity.badRequest()
                        .body(Map.of("error", "value and date are required."));
            }

            Double value = Double.parseDouble(valueObj.toString());
            String date = dateObj.toString();

            vehicleService.registerFuel(id, value, date);

            return ResponseEntity.ok()
                    .body(Map.of("message", "Fuel registered successfully!"));

        } catch (Exception e) {
            e.printStackTrace();
            return ResponseEntity.status(500)
                    .body(Map.of("error", e.getMessage()));
        }
    }


    @GetMapping("/service/current")
    public ResponseEntity<?> getCurrentService() {

        try {
            System.out.println(">>> Buscando chamado atual");

            return ResponseEntity.ok(vehicleService.getCurrentService());

        } catch (Exception e) {
            e.printStackTrace();
            return ResponseEntity.status(500)
                    .body(Map.of("error", e.getMessage()));
        }
    }

    @GetMapping("/available")
    public ResponseEntity<?> getAvailableVehicles() {
        try {
            System.out.println(">>> Buscando veículos disponíveis...");
            return ResponseEntity.ok(vehicleService.getAvailableVehicles());
        } catch (Exception e) {
            e.printStackTrace();
            return ResponseEntity.status(500).body(Map.of("error", e.getMessage()));
        }
    }
}