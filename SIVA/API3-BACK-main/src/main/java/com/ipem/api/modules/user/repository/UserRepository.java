package com.ipem.api.modules.user.repository;

import com.ipem.api.modules.user.model.User;
import com.ipem.api.modules.user.model.enums.EmployeeStatus;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import java.util.List;
import java.util.Optional;

@Repository
public interface UserRepository extends JpaRepository<User, String> {

    Optional<User> findByRegistration(String registration);

    Optional<User> findByEmail(String email);

    boolean existsByRegistration(String registration);
    boolean existsByEmail(String email);

    List<User> findByEmployeeStatus(EmployeeStatus status);

    List<User> findByNameContainingIgnoreCase(String name);
}