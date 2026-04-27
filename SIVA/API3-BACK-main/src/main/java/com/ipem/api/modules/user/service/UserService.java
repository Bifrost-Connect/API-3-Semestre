package com.ipem.api.modules.user.service;

import com.ipem.api.modules.user.dto.RegisterDTO;
import com.ipem.api.modules.user.model.User;
import com.ipem.api.modules.user.repository.UserRepository;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class UserService {

    private final UserRepository repository;

    public UserService(UserRepository repository) {
        this.repository = repository;
    }

    @Transactional
    public User registerUser(RegisterDTO data) {
        if (repository.existsById(data.registration())) {
            throw new RuntimeException("Registration already exists!");
        }

        User newUser = User.builder()
                .registration(data.registration())
                .name(data.name())
                .email(data.email())
                .password(data.password())
                .permission(data.permission())
                .build();

        return repository.save(newUser);
    }
}