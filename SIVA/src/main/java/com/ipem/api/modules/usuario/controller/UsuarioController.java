package com.ipem.api.modules.usuario.controller;

import com.ipem.api.modules.usuario.model.Usuario;
import com.ipem.api.modules.usuario.repository.UsuarioRepository;
import com.ipem.api.modules.usuario.model.enums.Permissao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import java.util.Map;
import java.util.Optional;

@RestController
@RequestMapping("/usuario")
@CrossOrigin(origins = "*")
public class UsuarioController {

    @Autowired
    private UsuarioRepository repository;

    @PostMapping("/login")
    public ResponseEntity<?> login(@RequestBody Map<String, String> dados) {
        String email = dados.get("email").trim();
        String senha = dados.get("senha").trim();
        Optional<Usuario> usuarioOpt = repository.findByEmail(email);
        if (usuarioOpt.isPresent() && usuarioOpt.get().getSenha().trim().equals(senha)) {
            return ResponseEntity.ok().body(Map.of(
                    "mensagem", "Sucesso",
                    "nome", usuarioOpt.get().getNome(),
                    "permissao", usuarioOpt.get().getPermissao().toString()
            ));
        }
        return ResponseEntity.status(401).body(Map.of("erro", "Credenciais inválidas"));
    }

    @PostMapping("/cadastrar")
    public ResponseEntity<?> cadastrar(@RequestBody Map<String, String> dados) {
        try {
            if (repository.findByEmail(dados.get("email")).isPresent()) {
                return ResponseEntity.status(400).body(Map.of("erro", "E-mail já cadastrado"));
            }
            Usuario novo = Usuario.builder()
                    .nome(dados.get("nome"))
                    .matricula(dados.get("matricula"))
                    .email(dados.get("email"))
                    .senha(dados.get("senha"))
                    .permissao(Permissao.TECNICO)
                    .build();
            repository.save(novo);
            return ResponseEntity.ok().body(Map.of("mensagem", "Sucesso"));
        } catch (Exception e) {
            return ResponseEntity.status(500).body(Map.of("erro", e.getMessage()));
        }
    }
}