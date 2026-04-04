package com.ipem.api.modules.servico.controller;

import com.ipem.api.modules.servico.model.Servico;
import com.ipem.api.modules.servico.service.ServicoService;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.Map;

@RestController
@RequestMapping("/servico")
@RequiredArgsConstructor
@CrossOrigin(origins = "*")
public class ServicoController {

    private final ServicoService servicoService;

    @PostMapping("/finalizar")
    public ResponseEntity<?> finalizarServico(@RequestBody Servico servico) {
        try {
            if (servico.getCarro() == null || servico.getCarro().getPrefixo() == null) {
                return ResponseEntity.badRequest().body(Map.of("erro", "O prefixo do veículo é obrigatório."));
            }

            Servico servicoSalvo = servicoService.salvar(servico);

            return ResponseEntity.ok(Map.of(
                    "mensagem", "Serviço finalizado com sucesso!",
                    "id", servicoSalvo.getId()
            ));
        } catch (Exception e) {
            return ResponseEntity.badRequest().body(Map.of(
                    "erro", "Erro ao processar checkout: " + e.getMessage()
            ));
        }
    }
}