package com.ipem.api.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configurers.AbstractHttpConfigurer;
import org.springframework.security.web.SecurityFilterChain;

@Configuration
@EnableWebSecurity
public class SecurityConfig {

    @Bean
    public SecurityFilterChain securityFilterChain(HttpSecurity http) throws Exception {
        http
                // 1. Desativa o CSRF para permitir o POST do Front-end
                .csrf(AbstractHttpConfigurer::disable)

                // 2. Libera ABSOLUTAMENTE TUDO (necessário para fase de desenvolvimento)
                .authorizeHttpRequests(auth -> auth
                        .anyRequest().permitAll()
                )

                // 3. Desativa as telas automáticas do Spring Security
                .formLogin(AbstractHttpConfigurer::disable)
                .httpBasic(AbstractHttpConfigurer::disable)

                // 4. Permite o H2 e evita bloqueios de Headers
                .headers(headers -> headers.frameOptions(frame -> frame.disable()));

        return http.build();
    }
}