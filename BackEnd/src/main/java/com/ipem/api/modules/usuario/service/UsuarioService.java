package com.ipem.api.modules.usuario.service;

import com.ipem.api.modules.usuario.repository.UsuarioRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
public class UsuarioService {
    private final UsuarioRepository repository;

    public boolean autenticar(String email, String senha) {
        return repository.findByEmail(email)
                .map(user -> user.getSenha().equals(senha))
                .orElse(false);
    }
}