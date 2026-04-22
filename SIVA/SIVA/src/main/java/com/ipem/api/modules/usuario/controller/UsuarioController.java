package com.ipem.api.modules.usuario.controller;

import com.ipem.api.modules.usuario.dto.LoginDTO;
import com.ipem.api.modules.usuario.model.Usuario;
import com.ipem.api.modules.usuario.model.enums.Permissao; // Import do seu Enum
import com.ipem.api.modules.usuario.repository.UsuarioRepository;
import jakarta.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/usuario")
@CrossOrigin(origins = "*")
public class UsuarioController {

    @Autowired
    private UsuarioRepository repository;

    @PostMapping("/login")
    public ResponseEntity<?> login(@RequestBody @Valid LoginDTO dados) {
        try {
            // O seu Repository usa Integer como ID (num_registro)
            Integer registroId = Integer.parseInt(dados.matricula());
            var usuarioOpt = repository.findById(registroId);

            if (usuarioOpt.isPresent() && usuarioOpt.get().getSenha().equals(dados.senha())) {
                return ResponseEntity.ok(usuarioOpt.get());
            }
        } catch (NumberFormatException e) {
            return ResponseEntity.status(HttpStatus.BAD_REQUEST).body("Matrícula inválida");
        }
        return ResponseEntity.status(HttpStatus.UNAUTHORIZED).body("Matrícula ou senha incorretos.");
    }

    @PostMapping("/cadastrar")
    public ResponseEntity<?> cadastrar(@RequestBody Usuario usuario) {
        try {
            // Verifica se o ID (num_registro) já existe
            if (usuario.getId() != null && repository.existsById(usuario.getId())) {
                return ResponseEntity.status(HttpStatus.CONFLICT).body("Número de registro já existe.");
            }

            // Garante que a permissão seja salva como o Enum técnico por padrão se vier nulo
            if (usuario.getPermissao() == null) {
                usuario.setPermissao(Permissao.TECNICO);
            }

            var novoUsuario = repository.save(usuario);
            return ResponseEntity.status(HttpStatus.CREATED).body(novoUsuario);
        } catch (Exception e) {
            return ResponseEntity.status(HttpStatus.BAD_REQUEST).body("Erro: " + e.getMessage());
        }
    }
}