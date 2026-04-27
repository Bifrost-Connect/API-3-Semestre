package com.ipem.api.infrastructure.security;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.http.HttpMethod;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.config.Customizer;
import org.springframework.security.config.annotation.authentication.configuration.AuthenticationConfiguration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configurers.AbstractHttpConfigurer;
import org.springframework.security.config.http.SessionCreationPolicy;
import org.springframework.security.crypto.password.NoOpPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.SecurityFilterChain;
import org.springframework.security.web.util.matcher.AntPathRequestMatcher;

@Configuration
@EnableWebSecurity
public class SecurityConfig {

    @Bean
    public SecurityFilterChain securityFilterChain(HttpSecurity http) throws Exception {
        return http
                .cors(Customizer.withDefaults())
                .csrf(AbstractHttpConfigurer::disable)
                // Alterado para IF_REQUIRED para suportar navegação via browser/recursos estáticos
                .sessionManagement(sm -> sm.sessionCreationPolicy(SessionCreationPolicy.IF_REQUIRED))
                .authorizeHttpRequests(req -> {
                    // 1. Liberar recursos estáticos (CSS, JS, Imagens)
                    req.requestMatchers("/css/**", "/js/**", "/img/**", "/images/**", "/static/**").permitAll();

                    // 2. Liberar login e rotas públicas
                    req.requestMatchers(HttpMethod.POST, "/user/login").permitAll();

                    // 3. Se você quer que a Home e outras páginas HTML sejam públicas:
                    req.requestMatchers("/", "/index.html", "/cadusuarios").permitAll();

                    // 4. Qualquer outra requisição precisa de autenticação
                    req.anyRequest().authenticated();
                })
                .headers(headers -> headers.frameOptions(frame -> frame.disable()))
                .build();
    }

    @Bean
    public AuthenticationManager authenticationManager(AuthenticationConfiguration configuration) throws Exception {
        return configuration.getAuthenticationManager();
    }

    @Bean
    public PasswordEncoder passwordEncoder() {
        // Nota: NoOpPasswordEncoder é apenas para testes. Use BCrypt em produção.
        return NoOpPasswordEncoder.getInstance();
    }
}