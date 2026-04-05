-- V3__setup_security.sql
-- Atualiza as senhas de 'senha123' para o Hash BCrypt correspondente (senha: senha123)
UPDATE usuarios 
SET senha = '$2a$10$Y50UaMFOxteibQEYfDj6vO.B78m7ZlxSAnS3xQf.pUqL.0/N0/G6O'
WHERE num_registro IN (10001, 10002, 10003, 10004, 10005, 10006, 10007, 10008, 10009, 10010);