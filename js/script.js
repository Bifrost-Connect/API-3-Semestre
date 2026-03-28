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

const modalConfirmacao = document.getElementById("modalConfirmacao");
const modalDetalhesVeiculo = document.getElementById("modalDetalhesVeiculo");

// Variável para armazenar o veículo selecionado
let veiculoSelecionado = {};

function abrirModalConfirmacao() {
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
    alert("Veículo confirmado!");
    // Salvar veículo no localStorage (dados virão do backend)
    localStorage.setItem('veiculoSelecionado', JSON.stringify(veiculoSelecionado));
    // Salvar chamado atual (dados virão do backend)
    const chamadoAtual = {
        id: '', // Dados do backend
        tipoServico: '', // Dados do backend
        cliente: '', // Dados do backend
        endereco: '' // Dados do backend
    };
    localStorage.setItem('chamadoAtual', JSON.stringify(chamadoAtual));
    fecharTodosModais();
    // Navegar para a tela inicial
    window.location.href = "telainicial.html";
}

// Fechar modal ao clicar fora do card

modalConfirmacao.addEventListener("click", (event) => {
    if (event.target === modalConfirmacao) {
        fecharTodosModais();
    }
});

modalDetalhesVeiculo.addEventListener("click", (event) => {
    if (event.target === modalDetalhesVeiculo) {
        fecharTodosModais();
    }
});

// Funções para a tela inicial
function carregarDadosTelaInicial() {
    // Carregar veículo
    const veiculo = JSON.parse(localStorage.getItem('veiculoSelecionado'));
    if (veiculo) {
        document.getElementById('info-veiculo').innerHTML = `
            <p><strong>Título:</strong> ${veiculo.titulo}</p>
            <p><strong>Tipo:</strong> ${veiculo.tipo}</p>
            <p><strong>Prefixo:</strong> ${veiculo.prefixo}</p>
            <p><strong>Placa:</strong> ${veiculo.placa}</p>
            <p><strong>Último Serviço:</strong> ${veiculo.ultimoServico}</p>
            <p><strong>Nível Combustível:</strong> ${veiculo.nivelCombustivel}</p>
            <p><strong>Quilometragem:</strong> ${veiculo.quilometragem}</p>
        `;
        // Carregar quilometragem e observações salvas
        const quilometragem = localStorage.getItem('quilometragemAtual') || '';
        const observacoes = localStorage.getItem('observacoes') || '';
        document.getElementById('quilometragem-atual').value = quilometragem;
        document.getElementById('observacoes').value = observacoes;
    }

    // Carregar chamado
    const chamado = JSON.parse(localStorage.getItem('chamadoAtual'));
    if (chamado) {
        document.getElementById('info-chamado').innerHTML = `
            <p><strong>ID:</strong> ${chamado.id}</p>
            <p><strong>Tipo de Serviço:</strong> ${chamado.tipoServico}</p>
            <p><strong>Cliente:</strong> ${chamado.cliente}</p>
            <p><strong>Endereço:</strong> ${chamado.endereco}</p>
        `;
    }
}

function salvarVeiculoInfo() {
    const quilometragem = document.getElementById('quilometragem-atual').value;
    const observacoes = document.getElementById('observacoes').value;
    localStorage.setItem('quilometragemAtual', quilometragem);
    localStorage.setItem('observacoes', observacoes);
    alert('Informações salvas!');
}

function checkoutChamado() {
    localStorage.removeItem('chamadoAtual');
    localStorage.removeItem('veiculoSelecionado');
    localStorage.removeItem('quilometragemAtual');
    localStorage.removeItem('observacoes');
    document.getElementById('info-veiculo').innerHTML = '<p>Nenhum veículo selecionado.</p>';
    document.getElementById('info-chamado').innerHTML = '<p>Nenhum chamado ativo.</p>';
    document.getElementById('quilometragem-atual').value = '';
    document.getElementById('observacoes').value = '';
    alert('Chamado encerrado!');
}

// Adicionar event listeners se os elementos existirem
document.addEventListener('DOMContentLoaded', function() {
    if (document.getElementById('btn-salvar-veiculo')) {
        document.getElementById('btn-salvar-veiculo').addEventListener('click', salvarVeiculoInfo);
    }
    if (document.getElementById('btn-checkout')) {
        document.getElementById('btn-checkout').addEventListener('click', checkoutChamado);
    }
    carregarDadosTelaInicial();
});