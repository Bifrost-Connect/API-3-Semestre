// --- CHECK-IN (Ao clicar em Salvar na tela inicial após escolher o carro) ---
window.salvarVeiculoInfo = async function() {
    const kmInput = document.getElementById("quilometragem-inicial")?.value;
    const obsInput = document.getElementById("observacoes")?.value;
    const matricula = localStorage.getItem("userRegistration");
    const vehicle = JSON.parse(localStorage.getItem('selectedVehicle'));

    if (!vehicle || !matricula) {
        alert("Erro: Matrícula do usuário ou veículo não encontrados.");
        return;
    }

    try {
        const response = await fetch("http://localhost:8080/service/start", {
            method: "POST",
            headers: { "Content-Type": "application/json" },
            body: JSON.stringify({
                carPrefix: vehicle.prefix,
                userRegistration: matricula,
                recordKm: parseFloat(kmInput),
                note: obsInput
            })
        });

        if (response.ok) {
            const data = await response.json();
            // Salva o ID do serviço rodando para podermos fazer o check-out depois
            localStorage.setItem("activeServiceId", data.serviceId);
            localStorage.setItem("km", kmInput);
            localStorage.setItem("obs", obsInput);
            alert("Check-in confirmado no sistema!");
        } else {
            alert("Erro ao realizar check-in no banco.");
        }
    } catch (error) {
        console.error("Erro na API:", error);
    }
};


// --- CHECK-OUT ---
window.checkoutChamado = async () => {
    const serviceId = localStorage.getItem("activeServiceId");

    // Pega o valor atual do input de KM para ser o KM de chegada
    const kmFinal = document.getElementById("quilometragem-inicial")?.value;

    if (!serviceId) {
        alert("Nenhum serviço ativo encontrado para fazer check-out.");
        return;
    }

    try {
        const response = await fetch(`http://localhost:8080/service/finalize/${serviceId}`, {
            method: "POST",
            headers: { "Content-Type": "application/json" },
            body: JSON.stringify({recordKm: parseFloat(kmFinal) })
        });

        if (response.ok) {
            // Limpa o navegador
            localStorage.removeItem("selectedVehicle");
            localStorage.removeItem("km");
            localStorage.removeItem("obs");
            localStorage.removeItem("activeServiceId");

            // Abre o modal de sucesso do HTML
            const modal = document.getElementById("modalAvisoCheckout");
            if (modal) modal.style.display = "flex";
        } else {
            alert("Erro ao fazer o check-out no servidor.");
        }
    } catch (error) {
        console.error("Erro na API de Checkout:", error);
    }
};

window.finalizarCheckout = () => {
    window.location.reload();
};