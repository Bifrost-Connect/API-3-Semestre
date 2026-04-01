package com.ipem.api.modules.usuario.controller;

import com.ipem.api.modules.usuario.model.Usuario;
import com.ipem.api.modules.usuario.repository.UsuarioRepository;
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

        if (usuarioOpt.isPresent()) {
            Usuario u = usuarioOpt.get();
            if (u.getSenha().trim().equals(senha)) {
                return ResponseEntity.ok().body(Map.of(
                        "mensagem", "Sucesso",
                        "nome", u.getNome(),
                        "permissao", u.getPermissao().toString()
                ));
            }
        }
        return ResponseEntity.status(401).body(Map.of("erro", "Senha ou usuário incorreto"));
    }
}