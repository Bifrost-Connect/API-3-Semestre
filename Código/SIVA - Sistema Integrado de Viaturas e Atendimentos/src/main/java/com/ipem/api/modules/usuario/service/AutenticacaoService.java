package com.ipem.api.modules.usuario.service;

import com.ipem.api.modules.usuario.model.enums.Permissao;
import com.ipem.api.modules.usuario.repository.UsuarioRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

@Service
public class AutenticacaoService implements UserDetailsService  {

    @Autowired
    private UsuarioRepository repository;

    @Override
    public UserDetails loadUserByUsername(String matricula) throws UsernameNotFoundException {
        return (UserDetails) repository.findByMatricula(matricula)
                .orElseThrow(() -> new UsernameNotFoundException("Matrícula não encontrada: " + matricula));
    }

    public boolean autenticar(String matricula, String senha) {
        return repository.findByMatricula(matricula)
                .map(user -> user.getSenha().equals(senha))
                .orElse(false);
    }
}