package com.ipem.api.core.exception;

import java.time.LocalDateTime;

public record ErrorMessage(
    int status,
    LocalDateTime timestamp,
    String message,
    String description

){}
