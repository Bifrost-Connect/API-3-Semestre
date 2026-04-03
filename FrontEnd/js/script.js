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


let modalConfirmacao;
let modalDetalhesVeiculo;

// Adicionar event listeners se os elementos existirem
document.addEventListener('DOMContentLoaded', function () {
    modalConfirmacao = document.getElementById("modalConfirmacao");
    modalDetalhesVeiculo = document.getElementById("modalDetalhesVeiculo");
    // Sidebar
    const btnmenu = document.getElementById("btnmenu");
    const sidebar = document.getElementById("sidebar");
    const closeBtn = document.getElementById("btnx");
    const overlayBlurSidebar = document.getElementById("overlayBlurSidebar");

    if (btnmenu && sidebar && closeBtn && overlayBlurSidebar) {
        btnmenu.addEventListener("click", () => {
            sidebar.classList.add("open");
            overlayBlurSidebar.classList.add("active");
        });
        closeBtn.addEventListener("click", () => {
            sidebar.classList.remove("open");
            overlayBlurSidebar.classList.remove("active");
        });
        overlayBlurSidebar.addEventListener("click", () => {
            sidebar.classList.remove("open");
            overlayBlurSidebar.classList.remove("active");
        });
    }

    // Pop-up abastecimento
    const btnAbs = document.getElementById("btn-abs-veiculo");
    const popup = document.getElementById("popupAbastecimento");
    const btnVoltar = document.getElementById("btn-voltar");
    const btnSalvar = document.getElementById("btn-salvar-abastecimento");

    if (btnAbs && popup && btnVoltar && btnSalvar) {
        btnAbs.addEventListener("click", () => popup.style.display = "flex");
        btnVoltar.addEventListener("click", () => popup.style.display = "none");
        btnSalvar.addEventListener("click", () => {
            const valor = document.getElementById("valor-abastecimento").value;
            const data = document.getElementById("data-abastecimento").value;
            const hora = document.getElementById("hora-abastecimento").value;
            console.log("Abastecimento salvo:", { valor, data, hora });
            popup.style.display = "none";
        });
    }

    // Botões da tela inicial
    const btnSalvarVeiculo = document.getElementById('btn-salvar-veiculo');
    const btnCheckout = document.getElementById('btn-checkout');
    if (btnSalvarVeiculo) btnSalvarVeiculo.addEventListener('click', salvarVeiculoInfo);
    if (btnCheckout) btnCheckout.addEventListener('click', checkoutChamado);

    carregarDadosTelaInicial();
});

if (modalConfirmacao) {
    modalConfirmacao.addEventListener("click", (event) => {
        if (event.target === modalConfirmacao) {
            fecharTodosModais();
        }
    });
}

if (modalDetalhesVeiculo) {
    modalDetalhesVeiculo.addEventListener("click", (event) => {
        if (event.target === modalDetalhesVeiculo) {
            fecharTodosModais();
        }
    });
}