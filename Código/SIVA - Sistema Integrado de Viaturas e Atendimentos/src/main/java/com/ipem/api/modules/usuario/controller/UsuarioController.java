package com.ipem.api.modules.usuario.controller;

import com.ipem.api.modules.usuario.dto.*;
import com.ipem.api.modules.usuario.model.Usuario;
import com.ipem.api.modules.usuario.repository.UsuarioRepository;
import com.ipem.api.modules.usuario.service.UsuarioService;
import jakarta.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.MethodArgumentNotValidException;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/usuario")
@CrossOrigin(origins = "*")
public class UsuarioController {

    @Autowired
    private UsuarioRepository repository;

    @Autowired
    private UsuarioService service;

    @PostMapping("/login")
    public ResponseEntity<?> login(@RequestBody @Valid LoginDTO dados) {
        var usuarioOpt = repository.findByMatricula(dados.matricula());

        if (usuarioOpt.isPresent() && usuarioOpt.get().getSenha().equals(dados.senha())) {
            return ResponseEntity.ok(usuarioOpt.get());
        }

        return ResponseEntity.status(HttpStatus.UNAUTHORIZED).body("Matrícula ou senha incorretos.");
    }

    @PostMapping("/cadastrar")
    public ResponseEntity<?> cadastrar(@RequestBody @Valid CadastroDTO dados) {
        try {
            Usuario novoUsuario = service.cadastrarUsuario(dados);
            return ResponseEntity.status(HttpStatus.CREATED).body(novoUsuario);
        } catch (Exception e) {
            return ResponseEntity.status(HttpStatus.BAD_REQUEST).body(e.getMessage());
        }
    }

    @ResponseStatus(HttpStatus.BAD_REQUEST)
    @ExceptionHandler(MethodArgumentNotValidException.class)
    public String handleValidationExceptions(MethodArgumentNotValidException ex) {
        return ex.getBindingResult().getAllErrors().get(0).getDefaultMessage();
    }
}