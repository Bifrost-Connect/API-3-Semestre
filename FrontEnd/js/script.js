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

let veiculoSelecionado = {};
let modalConfirmacao;
let modalDetalhesVeiculo;
let modalMensagem;

function abrirModalConfirmacao() {
    modalConfirmacao.style.display = "flex";
}

function abrirModalMensagem(mensagem) {
    const textoModalMensagem = document.getElementById("textoModalMensagem");
    if (textoModalMensagem) {
        textoModalMensagem.textContent = mensagem;
    }

    if (modalMensagem) {
        modalMensagem.style.display = "flex";
    }
}

function fecharModalMensagem() {
    if (modalMensagem) {
        modalMensagem.style.display = "none";
    }
}

function fecharTodosModais() {
    modalConfirmacao.style.display = "none";
    modalDetalhesVeiculo.style.display = "none";
}

function fecharPopupPorOverlay(overlay) {
    if (!overlay) return;

    if (overlay.id === "modalMensagem") {
        fecharModalMensagem();
        return;
    }

    overlay.style.display = "none";
}

function selecionarVeiculo(titulo, arg2, arg3, arg4, arg5, arg6, arg7, arg8) {
    let modelo = "";
    let marca = "";
    let tipo;
    let prefixo;
    let placa;
    let info;
    let ultimoServico;
    let nivelCombustivel;
    let quilometragem;

    if (arguments.length === 6) {
        modelo = arg2;
        marca = arg3;
        tipo = arg4;
        prefixo = arg5;
        placa = arg6;
        info = "";
        ultimoServico = "";
        nivelCombustivel = "";
        quilometragem = localStorage.getItem("quilometragemInicial") || "";
    } else if (arguments.length === 5) {
        modelo = arg2;
        marca = arg3;
        tipo = arg4;
        prefixo = "";
        placa = arg5;
        info = "";
        ultimoServico = "";
        nivelCombustivel = "";
        quilometragem = localStorage.getItem("quilometragemInicial") || "";
    } else {
        modelo = titulo;
        marca = "";
        tipo = arg2;
        prefixo = arg3;
        placa = arg4;
        info = arg5;
        ultimoServico = arg6;
        nivelCombustivel = arg7;
        quilometragem = localStorage.getItem("quilometragemInicial") || arg8 || "";
    }

    veiculoSelecionado = {
        titulo: titulo,
        modelo: modelo,
        marca: marca,
        tipo: tipo,
        prefixo: prefixo,
        placa: placa,
        info: info,
        ultimoServico: ultimoServico,
        nivelCombustivel: nivelCombustivel,
        quilometragem: quilometragem
    };

    const tituloVeiculo = document.getElementById("tituloVeiculo");
    const modeloVeiculo = document.getElementById("modeloVeiculo");
    const marcaVeiculo = document.getElementById("marcaVeiculo");
    const tipoVeiculo = document.getElementById("tipoVeiculo");
    const prefixoVeiculo = document.getElementById("prefixoVeiculo");
    const placaVeiculo = document.getElementById("placaVeiculo");
    const ultimoServicoEl = document.getElementById("ultimoServico");
    const nivelCombustivelEl = document.getElementById("nivelCombustivel");
    const quilometragemEl = document.getElementById("quilometragem");

    if (tituloVeiculo) tituloVeiculo.textContent = titulo;
    if (modeloVeiculo) modeloVeiculo.textContent = modelo || "";
    if (marcaVeiculo) marcaVeiculo.textContent = marca || "";
    if (tipoVeiculo) tipoVeiculo.textContent = tipo || "";
    if (prefixoVeiculo) prefixoVeiculo.textContent = prefixo || "";
    if (placaVeiculo) placaVeiculo.textContent = placa || "";
    if (ultimoServicoEl) ultimoServicoEl.textContent = ultimoServico || "";
    if (nivelCombustivelEl) nivelCombustivelEl.textContent = nivelCombustivel || "";
    if (quilometragemEl) quilometragemEl.textContent = quilometragem || "";

    modalConfirmacao.style.display = "none";
    modalDetalhesVeiculo.style.display = "flex";
}

function voltarParaVeiculos() {
    modalDetalhesVeiculo.style.display = "none";
    modalConfirmacao.style.display = "flex";
}

function confirmarVeiculo() {
    localStorage.setItem("veiculoSelecionado", JSON.stringify(veiculoSelecionado));
    const chamadoAtual = {
        id: "",
        tipoServico: "",
        cliente: "",
        endereco: ""
    };
    localStorage.setItem("chamadoAtual", JSON.stringify(chamadoAtual));
    fecharTodosModais();
    localStorage.setItem("mensagemPendente", "O chamado foi aceito");
    window.location.href = "telainicial.html";
}

function carregarDadosTelaInicial() {
    const veiculo = JSON.parse(localStorage.getItem("veiculoSelecionado"));
    const infoVeiculo = document.getElementById("info-veiculo");
    const quilometragemInicialInput = document.getElementById("quilometragem-inicial");
    const dataInicialInput = document.getElementById("data-inicial");
    const horarioInicialInput = document.getElementById("horario-inicial");
    const observacoesInput = document.getElementById("observacoes");

    if (veiculo) {
        if (infoVeiculo) {
            infoVeiculo.innerHTML = `
                <p><strong>Modelo:</strong> ${veiculo.modelo || veiculo.tipo}</p>
                <p><strong>Marca:</strong> ${veiculo.marca || veiculo.titulo}</p>
                <p><strong>Placa:</strong> ${veiculo.placa}</p>
                <p><strong>Prefixo da Viatura:</strong> ${veiculo.prefixo}</p>
            `;
        }

        const quilometragemInicial = localStorage.getItem("quilometragemInicial") || "";
        const dataInicial = localStorage.getItem("dataInicial") || "";
        const horarioInicial = localStorage.getItem("horarioInicial") || "";
        const observacoes = localStorage.getItem("observacoes") || "";
        if (quilometragemInicialInput) quilometragemInicialInput.value = quilometragemInicial;
        if (dataInicialInput) dataInicialInput.value = dataInicial;
        if (horarioInicialInput) horarioInicialInput.value = horarioInicial;
        if (observacoesInput) observacoesInput.value = observacoes;
    }

    const chamado = JSON.parse(localStorage.getItem("chamadoAtual"));
    const infoChamado = document.getElementById("info-chamado");
    if (chamado) {
        if (infoChamado) {
            infoChamado.innerHTML = `
                <p><strong>ID:</strong> ${chamado.id}</p>
                <p><strong>Tipo de Serviço:</strong> ${chamado.tipoServico}</p>
                <p><strong>Cliente:</strong> ${chamado.cliente}</p>
                <p><strong>Endereço:</strong> ${chamado.endereco}</p>
            `;
        }
    }
}

function salvarVeiculoInfo() {
    const quilometragemInicial = document.getElementById("quilometragem-inicial").value;
    const dataInicial = document.getElementById("data-inicial").value;
    const horarioInicial = document.getElementById("horario-inicial").value;
    const observacoes = document.getElementById("observacoes").value;
    localStorage.setItem("quilometragemInicial", quilometragemInicial);
    localStorage.setItem("dataInicial", dataInicial);
    localStorage.setItem("horarioInicial", horarioInicial);
    localStorage.setItem("observacoes", observacoes);
    abrirModalMensagem("Informações salvas!");
}

function checkoutChamado() {
    const quilometragemInicial = document.getElementById("quilometragem-inicial").value.trim();
    const dataInicial = document.getElementById("data-inicial").value.trim();
    const horarioInicial = document.getElementById("horario-inicial").value.trim();

    if (!quilometragemInicial || !dataInicial || !horarioInicial) {
        abrirModalMensagem("É necessário preencher as informações antes de fazer chackout");
        return;
    }

    localStorage.removeItem("chamadoAtual");
    localStorage.removeItem("veiculoSelecionado");
    localStorage.removeItem("quilometragemInicial");
    localStorage.removeItem("dataInicial");
    localStorage.removeItem("horarioInicial");
    localStorage.removeItem("observacoes");
    document.getElementById("info-veiculo").innerHTML = "<p>Nenhum veículo selecionado.</p>";
    document.getElementById("info-chamado").innerHTML = "<p>Nenhum chamado ativo.</p>";
    document.getElementById("quilometragem-inicial").value = "";
    document.getElementById("data-inicial").value = "";
    document.getElementById("horario-inicial").value = "";
    document.getElementById("observacoes").value = "";
    abrirModalMensagem("Checkout realizado com sucesso!");
}


document.addEventListener("DOMContentLoaded", function () {
    modalConfirmacao = document.getElementById("modalConfirmacao");
    modalDetalhesVeiculo = document.getElementById("modalDetalhesVeiculo");
    modalMensagem = document.getElementById("modalMensagem");

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
        popup.addEventListener("click", (event) => {
            if (event.target === popup) {
                popup.style.display = "none";
            }
        });
    }

    const btnSalvarVeiculo = document.getElementById("btn-salvar-veiculo");
    const btnCheckout = document.getElementById("btn-checkout");
    if (btnSalvarVeiculo) btnSalvarVeiculo.addEventListener("click", salvarVeiculoInfo);
    if (btnCheckout) btnCheckout.addEventListener("click", checkoutChamado);

    carregarDadosTelaInicial();

    const mensagemPendente = localStorage.getItem("mensagemPendente");
    if (mensagemPendente) {
        abrirModalMensagem(mensagemPendente);
        localStorage.removeItem("mensagemPendente");
    }

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

    if (modalMensagem) {
        modalMensagem.addEventListener("click", (event) => {
            if (event.target === modalMensagem) {
                fecharModalMensagem();
            }
        });
    }

    document.querySelectorAll(".sobreposicao, .popup").forEach((overlay) => {
        overlay.addEventListener("click", (event) => {
            if (event.target === overlay) {
                fecharPopupPorOverlay(overlay);
            }
        });
    });
});
