// LOGIN COM REDIRECIONAMENTO POR PERFIL (ADMINISTRADOR VS TECNICO)
window.btnindex = async function() {
    const registrationInput = document.getElementById("matricula")?.value;
    const passwordInput = document.getElementById("senha")?.value;

    if (!registrationInput || !passwordInput) {
        alert("Por favor, preencha todos os campos.");
        return;
    }

    try {
        const response = await fetch("http://localhost:8080/user/login", {
            method: "POST",
            headers: { "Content-Type": "application/json" },
            body: JSON.stringify({
                registration: String(registrationInput),
                password: passwordInput
            })
        });

        if (response.ok) {
            const user = await response.json();
            const permission = user.permission ? user.permission.toUpperCase() : "";

            localStorage.setItem("userName", user.name);
            localStorage.setItem("userPermission", permission);

            if (permission === "ADMINISTRATOR") {
                window.location.href = "telainicial-gestor.html";
            } else if (permission === "TECHNICIAN") {
                window.location.href = "telainicial.html";
            } else {
                alert("Perfil de acesso não reconhecido: " + user.permission);
            }
        } else {
            alert("Matrícula ou senha incorretos.");
        }
    } catch (error) {
        console.error("Login error:", error);
        alert("Erro ao conectar com o servidor.");
    }
};

// LOGOUT
window.btnlogout = () => {
    localStorage.clear();
    window.location.href = "index.html";
};

// VIZUALIZAR SENHA
window.togglePassword = function() {
    const passwordField = document.getElementById("senha");
    const eyeLine = document.getElementById("eyeLine");
    if (passwordField.type === "password") {
        passwordField.type = "text";
        if(eyeLine) eyeLine.style.display = "block";
    } else {
        passwordField.type = "password";
        if(eyeLine) eyeLine.style.display = "none";
    }
};
