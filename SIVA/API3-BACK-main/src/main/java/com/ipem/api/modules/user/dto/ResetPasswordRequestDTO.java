package com.ipem.api.modules.user.dto;

public record ResetPasswordRequestDTO(
        String email,
        String newPassword,
        String confirmPassword
) {
}