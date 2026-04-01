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

            Float quilometragem = Float.parseFloat(dados.get("quilometragem").toString());
            String observacoes = (String) dados.get("observacoes");

            veiculoService.atualizarKmEObs(prefixo, quilometragem, observacoes);

            return ResponseEntity.ok().body("{\"message\": \"Dados salvos com sucesso!\"}");
        } catch (Exception e) {
            return ResponseEntity.badRequest().body("{\"error\": \"" + e.getMessage() + "\"}");
        }
    }
    // metodo para cadastar um carro novo
    @PostMapping("/cadastrar")
    public ResponseEntity<?> cadastrarCarro(@RequestBody Carro carro) {
        try {
            // Define valores padrão para um carro recém-cadastrado
            carro.setDisponivel(true);
            carro.setKmAtual(0.0f);

            veiculoService.salvar(carro);

            return ResponseEntity.ok().body("{\"message\": \"Veículo cadastrado com sucesso!\"}");
        } catch (Exception e) {
            return ResponseEntity.badRequest().body("{\"error\": \"Erro ao cadastrar: " + e.getMessage() + "\"}");
        }
    }
}
