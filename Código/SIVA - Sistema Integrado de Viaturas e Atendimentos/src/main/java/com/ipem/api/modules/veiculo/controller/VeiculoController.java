package com.ipem.api.modules.veiculo.controller;

import com.ipem.api.modules.veiculo.model.Carro;
import com.ipem.api.modules.veiculo.service.VeiculoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.Map;

@RestController
@RequestMapping("/veiculo")
@CrossOrigin(origins = "*")
public class VeiculoController {

    @Autowired
    private VeiculoService veiculoService;

    @PatchMapping("/{prefixo}/atualizar-dados")
    public ResponseEntity<?> atualizarDados(@PathVariable String prefixo, @RequestBody Map<String, Object> dados) {
        try {
            // Logs de depuração para o seu console do IntelliJ
            System.out.println(">>> Tentando atualizar veículo: " + prefixo);

            if (dados.get("quilometragem") == null) {
                return ResponseEntity.badRequest().body("{\"error\": \"Campo quilometragem é obrigatório.\"}");
            }

            // Converte os dados do Map com segurança
            Float quilometragem = Float.parseFloat(dados.get("quilometragem").toString());
            String observacoes = dados.get("observacoes") != null ? dados.get("observacoes").toString() : "";

            // Chama o service (Certifique-se que o service usa o prefixo para dar o UPDATE)
            veiculoService.atualizarKmEObs(prefixo.trim(), quilometragem, observacoes);

            return ResponseEntity.ok().body("{\"message\": \"Dados salvos com sucesso!\"}");
        } catch (Exception e) {
            e.printStackTrace(); // Mostra o erro detalhado no console do Java
            return ResponseEntity.status(500).body("{\"error\": \"Erro no servidor: " + e.getMessage() + "\"}");
        }
    }

    @PostMapping("/cadastrar")
    public ResponseEntity<?> cadastrarCarro(@RequestBody Carro carro) {
        try {
            carro.setDisponivel(true);
            carro.setKmAtual(0.0f);
            veiculoService.salvar(carro);
            return ResponseEntity.ok().body("{\"message\": \"Veículo cadastrado com sucesso!\"}");
        } catch (Exception e) {
            return ResponseEntity.badRequest().body("{\"error\": \"Erro ao cadastrar: " + e.getMessage() + "\"}");
        }
    }
}