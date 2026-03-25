function btnindex() {
    window.location.href = "telainicial.html";
}

function btnlogout() {
    window.location.href = "index.html";
}

const btnmenu = document.getElementById("btnmenu");
const sidebar = document.getElementById("sidebar");
const closeBtn = document.getElementById("btnx");
const overlayBlurSidebar = document.getElementById("overlayBlurSidebar");

btnmenu.addEventListener("click", () => {
    sidebar.classList.add("open");
    overlayBlurSidebar.classList.add("active");
});

closeBtn.addEventListener("click", () => {
    sidebar.classList.remove("open");
    overlayBlurSidebar.classList.remove("active");
});

// Fechar sidebar ao clicar no overlay
overlayBlurSidebar.addEventListener("click", () => {
    sidebar.classList.remove("open");
    overlayBlurSidebar.classList.remove("active");
});

const modalSobreposicao = document.getElementById("modalSobreposicao");
const modalConfirmacao = document.getElementById("modalConfirmacao");
const modalDetalhesVeiculo = document.getElementById("modalDetalhesVeiculo");

// Variável para armazenar o veículo selecionado
let veiculoSelecionado = {};

function abrirModal() {
    modalSobreposicao.style.display = "flex";
}

function fecharModal() {
    modalSobreposicao.style.display = "none";
}

function abrirModalConfirmacao() {
    modalSobreposicao.style.display = "none";
    modalConfirmacao.style.display = "flex";
}

function fecharTodosModais() {
    modalConfirmacao.style.display = "none";
    modalDetalhesVeiculo.style.display = "none";
}

// Função para selecionar um veículo e exibir detalhes
function selecionarVeiculo(titulo, tipo, prefixo, placa, info, ultimoServico, nivelCombustivel, quilometragem) {
    veiculoSelecionado = {
        titulo: titulo,
        tipo: tipo,
        prefixo: prefixo,
        placa: placa,
        info: info,
        ultimoServico: ultimoServico,
        nivelCombustivel: nivelCombustivel,
        quilometragem: quilometragem
    };
    
    // Preencher os dados no modal de detalhes
    document.getElementById("tituloVeiculo").textContent = titulo;
    document.getElementById("tipoVeiculo").textContent = tipo;
    document.getElementById("prefixoVeiculo").textContent = prefixo;
    document.getElementById("placaVeiculo").textContent = placa;
    document.getElementById("ultimoServico").textContent = ultimoServico;
    document.getElementById("nivelCombustivel").textContent = nivelCombustivel;
    document.getElementById("quilometragem").textContent = quilometragem;
    
    // Esconder lista de veículos e mostrar detalhes
    modalConfirmacao.style.display = "none";
    modalDetalhesVeiculo.style.display = "flex";
}

// Função para voltar à lista de veículos
function voltarParaVeiculos() {
    modalDetalhesVeiculo.style.display = "none";
    modalConfirmacao.style.display = "flex";
}

// Função para confirmar a seleção do veículo
function confirmarVeiculo() {
    alert("Veículo " + veiculoSelecionado.modelo + " (Placa: " + veiculoSelecionado.placa + ") confirmado!");
    fecharTodosModais();
}

// Fechar modal ao clicar fora do card
modalSobreposicao.addEventListener("click", (event) => {
    if (event.target === modalSobreposicao) {
        fecharModal();
    }
});

modalConfirmacao.addEventListener("click", (event) => {
    if (event.target === modalConfirmacao) {
        fecharTodosModais();
    }
});

modalDetalhesVeiculo.addEventListener("click", (event) => {
    if (event.target === modalDetalhesVeiculo) {
        voltarParaVeiculos();
    }
});