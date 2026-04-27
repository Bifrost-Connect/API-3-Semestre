// SELEÇÃO DE VEÍCULO
let tempVehicle = {};

window.selecionarVeiculo = (title, model, brand, type, prefix, licensePlate) => {
    tempVehicle = { title, model, brand, type, prefix, licensePlate };

    if (document.getElementById("fotoVeiculo")) document.getElementById("fotoVeiculo").src = "img/carro 1.jpg";
    if (document.getElementById("modeloVeiculo")) document.getElementById("modeloVeiculo").textContent = model;
    if (document.getElementById("marcaVeiculo")) document.getElementById("marcaVeiculo").textContent = brand;
    if (document.getElementById("placaVeiculo")) document.getElementById("placaVeiculo").textContent = licensePlate;
    if (document.getElementById("prefixoVeiculo")) document.getElementById("prefixoVeiculo").textContent = prefix;

    if (document.getElementById("modalConfirmacao")) document.getElementById("modalConfirmacao").style.display = "none";
    if (document.getElementById("modalDetalhesVeiculo")) document.getElementById("modalDetalhesVeiculo").style.display = "flex";
};

window.voltarParaVeiculos = () => {
    if (document.getElementById("modalDetalhesVeiculo")) document.getElementById("modalDetalhesVeiculo").style.display = "none";
    if (document.getElementById("modalConfirmacao")) document.getElementById("modalConfirmacao").style.display = "flex";
};

// CONFIRMAR CHECK-IN
window.confirmarVeiculo = () => {
    localStorage.setItem("selectedVehicle", JSON.stringify(tempVehicle));
    fecharTodosModais();

    if (window.location.pathname.includes("chamados.html")) {
        window.location.href = "telainicial.html";
    } else {
        if (typeof carregarDadosTelaInicial === "function") carregarDadosTelaInicial();
    }
};

// --- CARREGAR VEÍCULOS DISPONÍVEIS
window.carregarVeiculosDisponiveis = async function() {
    try {
        const response = await fetch("http://localhost:8080/vehicle/available");

        if (response.ok) {
            const veiculos = await response.json();
            const lista = document.getElementById("listaVeiculos");


            lista.innerHTML = "";

            if (veiculos.length === 0) {
                lista.innerHTML = "<p style='text-align: center; width: 100%;'>Nenhum veículo disponível no momento.</p>";
                return;
            }

            // Para cada carro do banco, cria um botão HTML
            veiculos.forEach(v => {
                const btn = document.createElement("button");
                btn.className = "btn-veiculo";

                // Tratando os dados vindos do banco
                const modelo = v.type ? v.type.model : "Desconhecido";
                const marca = v.type ? v.type.brand : "Desconhecida";
                const categoria = v.type ? v.type.category : "Desconhecida";

                btn.textContent = `Viatura ${v.prefix} - ${modelo}`;

                btn.onclick = () => selecionarVeiculo(`Viatura ${v.prefix}`, modelo, marca, categoria, v.prefix, v.licensePlate);

                lista.appendChild(btn);
            });
        }
    } catch (error) {
        console.error("Erro ao buscar veículos disponíveis:", error);
        document.getElementById("listaVeiculos").innerHTML = "<p style='color: red; text-align: center; width: 100%;'>Erro ao conectar com o servidor.</p>";
    }
};

document.addEventListener("DOMContentLoaded", () => {
    if (window.location.pathname.includes("telainicial.html") && !window.location.pathname.includes("gestor")) {
        carregarVeiculosDisponiveis();
    }
});





// CADASTRAR VEÍCULO
window.cadastrarVeiculo = async function() {
    const payload = {
        prefix: document.getElementById("cad-prefixo")?.value,
        licensePlate: document.getElementById("cad-placa")?.value,

        // FIX PRINCIPAL: agora compatível com backend
        typeId: document.getElementById("cad-tipo")?.value,

        color: document.getElementById("cad-cor")?.value,
        fuel: document.getElementById("cad-combustivel")?.value,

        // opcional mas aceito pelo DTO/backend
        currentKm: 0,
        nextOilChangeKm: 0
    };

    try {
        const response = await fetch("http://localhost:8080/vehicle/register", {
            method: "POST",
            headers: { "Content-Type": "application/json" },
            body: JSON.stringify(payload)
        });

        if (response.ok) {
            alert("Veículo cadastrado com sucesso!");
        } else {
            alert("Erro ao cadastrar veículo.");
        }

    } catch (error) {
        console.error("API error:", error);
        alert("Erro de conexão.");
    }
};