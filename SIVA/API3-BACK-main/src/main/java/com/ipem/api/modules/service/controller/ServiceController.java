package com.ipem.api.modules.service.controller;

import com.ipem.api.modules.service.dto.CheckInOutRequestDTO;
import com.ipem.api.modules.service.service.ServiceService;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.Map;

@RestController
@RequestMapping("/service")
@CrossOrigin(origins = "*")
public class ServiceController {

    private final ServiceService serviceService;

    public ServiceController(ServiceService serviceService) {
        this.serviceService = serviceService;
    }

    @PostMapping("/start")
    public ResponseEntity<?> startService(@RequestBody CheckInOutRequestDTO dto) {
        try {
            var servico = serviceService.startService(dto);

            return ResponseEntity.ok(
                    Map.of(
                            "message", "Check-in realizado!",
                            "serviceId", servico.getId()
                    )
            );

        } catch (Exception e) {
            return ResponseEntity.badRequest().body(
                    Map.of("error", e.getMessage())
            );
        }
    }

    @PostMapping("/finalize/{id}")
    public ResponseEntity<?> finalizeService(
            @PathVariable Long id,
            @RequestBody CheckInOutRequestDTO dto
    ) {
        try {

            serviceService.finishService(id, dto.recordKm());

            return ResponseEntity.ok(
                    Map.of("message", "Check-out concluído!")
            );

        } catch (Exception e) {

            return ResponseEntity.badRequest().body(
                    Map.of("error", "Erro no checkout: " + e.getMessage())
            );
        }
    }
}