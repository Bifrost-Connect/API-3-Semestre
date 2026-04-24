package com.ipem.api.modules.usuario.service;

import com.ipem.api.modules.usuario.dto.CadastroDTO;
import com.ipem.api.modules.usuario.model.Usuario;
import com.ipem.api.modules.usuario.repository.UsuarioRepository;
import jakarta.transaction.Transactional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class UsuarioService {

    @Autowired
    private UsuarioRepository repository;

    @Transactional
    public Usuario cadastrarUsuario(CadastroDTO dados) {
        if (repository.existsById(Integer.valueOf(dados.matricula()))) {
            throw new RuntimeException("Matrícula já cadastrada!");
        }

        Usuario novoUsuario = Usuario.builder()
                .matricula(dados.matricula())
                .nome(dados.nome())
                .email(dados.email())
                .senha(dados.senha())
                .permissao(dados.permissao())
                .build();

        return repository.save(novoUsuario);
    }
}