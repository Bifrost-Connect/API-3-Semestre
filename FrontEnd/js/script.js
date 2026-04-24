// ============================================================
// 1. NAVEGAÇÃO E AUTENTICAÇÃO (LOGIN / LOGOUT)
// ============================================================

/**
 * Realiza o login integrando com o Backend e redireciona conforme a permissão.
 * Se não houver campos de login (ex: em outras telas), redireciona para a tela inicial.
 */
window.btnindex = async function() {
    const emailField = document.getElementById("email");
    const senhaField = document.getElementById("senha");

    // Se não estiver na tela de login, apenas volta para a home
    if (!emailField || !senhaField) {
        window.location.href = "telainicial.html";
        return;
    }

    const email = emailField.value.trim();
    const senha = senhaField.value.trim();

    if (!email || !senha) return abrirModalMensagem("Preencha e-mail e senha.");

    try {
        const response = await fetch("http://localhost:8080/usuario/login", {
            method: "POST", 
            headers: { "Content-Type": "application/json" },
            body: JSON.stringify({ email, senha })
        });

        if (response.ok) {
            const data = await response.json();
            // Salva dados do usuário para personalização da interface
            localStorage.setItem("usuarioNome", data.nome);
            localStorage.setItem("usuarioPermissao", data.permissao);
            
            // Redirecionamento condicional baseado no cargo
            window.location.href = data.permissao === "ADMINISTRADOR" ? "telainicial-gestor.html" : "telainicial.html";
        } else { 
            abrirModalMensagem("Login inválido. Verifique suas credenciais."); 
        }
    } catch (e) { 
        abrirModalMensagem("Erro de conexão com o servidor."); 
    }
};

/**
 * Limpa todos os dados de sessão e desconecta o usuário.
 */
window.btnlogout = () => {
    localStorage.clear();
    window.location.href = "index.html";
};

// ============================================================
// 2. CONTROLE DA SIDEBAR (MENU LATERAL) E INTERFACE
// ============================================================

document.addEventListener('DOMContentLoaded', () => {
    // Inicializa dados da tela assim que o DOM carrega
    carregarDadosTelaInicial();

    const btnMenu = document.getElementById("btnmenu");
    const sidebar = document.getElementById("sidebar");
    const closeBtn = document.getElementById("btnx");
    const overlay = document.getElementById("overlayBlurSidebar");

    // Abre o menu lateral
    if (btnMenu && sidebar) {
        btnMenu.onclick = () => { 
            sidebar.classList.add("open"); 
            overlay?.classList.add("active"); 
        };
    }

    // Fecha o menu lateral (no X ou no clique fora/overlay)
    const fecharSidebar = () => {
        sidebar?.classList.remove("open");
        overlay?.classList.remove("active");
    };

    if (closeBtn) closeBtn.onclick = fecharSidebar;
    if (overlay) overlay.onclick = fecharSidebar;
});

// ============================================================
// 3. GERENCIAMENTO DE MODAIS
// ============================================================

let modalConfirmacao, modalDetalhesVeiculo, modalMensagem, modalMensagemOnClose = null;

function garantirEstilosModalMensagem() {
    if (document.getElementById("modalMensagemGlobalStyles")) return;

    const style = document.createElement("style");
    style.id = "modalMensagemGlobalStyles";
    style.textContent = `
        #modalMensagem {
            display: none;
            position: fixed;
            inset: 0;
            align-items: center;
            justify-content: center;
            padding: 20px;
            background: rgba(0, 0, 0, 0.5);
            backdrop-filter: blur(2px);
            z-index: 2000;
        }

        #modalMensagem .popup-card {
            width: min(420px, 100%);
            background: #ffffff;
            border-radius: 22px;
            padding: 24px;
            box-shadow: 0 18px 48px rgba(1, 19, 70, 0.18);
            text-align: center;
        }

        #modalMensagem .popup-titulo {
            margin-bottom: 12px;
            color: #002080;
            font-size: 24px;
        }

        #modalMensagem .popup-conteudo {
            margin-bottom: 18px;
            color: #41516f;
            line-height: 1.5;
        }

        #modalMensagem .popup-conteudo p {
            margin: 0;
        }

        #modalMensagem .btn-aceitar {
            border: 0;
            border-radius: 14px;
            padding: 12px 22px;
            background-color: #002080;
            color: #ffffff;
            font-size: 15px;
            font-weight: 700;
            cursor: pointer;
        }
    `;

    document.head.appendChild(style);
}

function garantirModalMensagem() {
    garantirEstilosModalMensagem();

    modalMensagem = document.getElementById("modalMensagem");
    if (!modalMensagem) {
        const modal = document.createElement("div");
        modal.id = "modalMensagem";
        modal.className = "sobreposicao";
        modal.innerHTML = `
            <div class="popup-card popup-mensagem">
                <h2 class="popup-titulo">Aviso</h2>
                <div class="popup-conteudo">
                    <p id="textoModalMensagem"></p>
                </div>
                <button type="button" class="btn-aceitar">Fechar</button>
            </div>
        `;
        document.body.appendChild(modal);
        modalMensagem = modal;
    }

    if (!modalMensagem.dataset.inicializado) {
        modalMensagem.addEventListener("click", (e) => {
            if (e.target === modalMensagem) window.fecharModalMensagem();
        });

        const botaoFechar = modalMensagem.querySelector(".btn-aceitar");
        if (botaoFechar) {
            botaoFechar.addEventListener("click", () => window.fecharModalMensagem());
        }

        modalMensagem.dataset.inicializado = "true";
    }

    return {
        modal: modalMensagem,
        texto: modalMensagem.querySelector("#textoModalMensagem") || modalMensagem.querySelector(".popup-conteudo p")
    };
}

/**
 * Abre o modal de listagem/confirmação inicial.
 */
window.abrirModalConfirmacao = () => {
    modalConfirmacao = document.getElementById("modalConfirmacao");
    if (modalConfirmacao) modalConfirmacao.style.display = "flex";
};

/**
 * Exibe uma mensagem genérica de feedback ao usuário.
 */
window.abrirModalMensagem = (mensagem, onClose) => {
    const { modal, texto } = garantirModalMensagem();
    modalMensagemOnClose = typeof onClose === "function" ? onClose : null;
    if (texto) texto.textContent = mensagem;
    modal.style.display = "flex";
};

window.fecharModalMensagem = () => {
    const { modal } = garantirModalMensagem();
    modal.style.display = "none";

    const onClose = modalMensagemOnClose;
    modalMensagemOnClose = null;
    if (onClose) onClose();
};

/**
 * Fecha todos os modais de seleção de uma vez.
 */
window.fecharTodosModais = () => {
    if (modalConfirmacao) modalConfirmacao.style.display = "none";
    if (modalDetalhesVeiculo) modalDetalhesVeiculo.style.display = "none";
};

window.voltarParaVeiculos = () => {
    document.getElementById("modalDetalhesVeiculo").style.display = "none";
    document.getElementById("modalConfirmacao").style.display = "flex";
};

// ============================================================
// 4. SELEÇÃO E CONFIRMAÇÃO DE VEÍCULO (CHAMADOS)
// ============================================================

let veiculoSelecionado = {};

/**
 * Função inteligente que lida com diferentes formatos de entrada de dados do veículo.
 */
window.selecionarVeiculo = function(titulo, arg2, arg3, arg4, arg5, arg6, arg7, arg8) {
    let dados = {
        titulo: titulo,
        modelo: "", marca: "", tipo: "", prefixo: "", placa: "",
        ultimoServico: "", nivelCombustivel: "", 
        quilometragem: localStorage.getItem("quilometragemInicial") || ""
    };

    // Lógica adaptativa conforme a quantidade de argumentos passados (do Tipo 1)
    if (arguments.length === 6) {
        dados.modelo = arg2; dados.marca = arg3; dados.tipo = arg4; dados.prefixo = arg5; dados.placa = arg6;
    } else if (arguments.length === 5) {
        dados.modelo = arg2; dados.marca = arg3; dados.tipo = arg4; dados.placa = arg5;
    } else {
        dados.modelo = titulo; dados.tipo = arg2; dados.prefixo = arg3; dados.placa = arg4;
        dados.ultimoServico = arg6; dados.nivelCombustivel = arg7;
    }

    veiculoSelecionado = dados;

    // Atualiza os elementos visuais do modal de detalhes
    const campos = ["titulo", "modelo", "marca", "tipo", "prefixo", "placa", "ultimoServico", "nivelCombustivel"];
    campos.forEach(campo => {
        const el = document.getElementById(`${campo}Veiculo`) || document.getElementById(campo);
        if (el) el.textContent = dados[campo] || "";
    });

    document.getElementById("modalConfirmacao").style.display = "none";
    document.getElementById("modalDetalhesVeiculo").style.display = "flex";
};

/**
 * Finaliza a escolha do veículo, salva localmente e prepara o chamado.
 */
window.confirmarVeiculo = () => {
    if (!veiculoSelecionado.placa) return abrirModalMensagem("Erro: Selecione o veículo novamente.");
    
    localStorage.setItem("veiculoSelecionado", JSON.stringify(veiculoSelecionado));
    
    // Inicializa estrutura de chamado vazio para ser preenchida
    const chamadoAtual = { id: "CH" + Date.now(), tipoServico: "Padrão", cliente: "Interno", endereco: "Base" };
    localStorage.setItem("chamadoAtual", JSON.stringify(chamadoAtual));
    
    localStorage.setItem("mensagemPendente", "O chamado foi aceito e o veículo vinculado!");
    window.location.href = "telainicial.html";
};

// ============================================================
// 5. SINCRONIZAÇÃO DE DADOS E CHECKOUT (API)
// ============================================================

/**
 * Salva as informações de quilometragem e observações no LocalStorage e no Backend.
 */
window.salvarVeiculoInfo = async function() {
    const km = document.getElementById("quilometragem-inicial")?.value || document.getElementById("quilometragem-atual")?.value;
    const dataIni = document.getElementById("data-inicial")?.value;
    const horaIni = document.getElementById("horario-inicial")?.value;
    const obs = document.getElementById("observacoes")?.value;

    // Persistência Local
    localStorage.setItem("quilometragemInicial", km);
    localStorage.setItem("dataInicial", dataIni);
    localStorage.setItem("horarioInicial", horaIni);
    localStorage.setItem("observacoes", obs);

    const v = JSON.parse(localStorage.getItem('veiculoSelecionado'));
    if (!v) return abrirModalMensagem("Nenhum veículo em atendimento para salvar no servidor.");

    try {
        const r = await fetch(`http://localhost:8080/veiculo/${v.prefixo}/atualizar-dados`, {
            method: 'PATCH',
            headers: { 'Content-Type': 'application/json' },
            body: JSON.stringify({ quilometragem: parseFloat(km) || 0, observacoes: obs || "" })
        });
        if (r.ok) abrirModalMensagem("Informações sincronizadas com sucesso!");
        else abrirModalMensagem("Salvo localmente, mas houve erro ao sincronizar com o servidor.");
    } catch (e) { 
        abrirModalMensagem("Informações salvas localmente (Modo Offline)."); 
    }
};

/**
 * Limpa todos os dados de serviço ativo.
 */
window.checkoutChamado = function() {
    if (!localStorage.getItem('veiculoSelecionado')) return abrirModalMensagem("Não há chamado ativo.");

    if (confirm("Deseja finalizar o serviço e realizar o Checkout?")) {
        const chavesParaRemover = ["chamadoAtual", "veiculoSelecionado", "quilometragemInicial", "dataInicial", "horarioInicial", "observacoes"];
        chavesParaRemover.forEach(k => localStorage.removeItem(k));
        
        abrirModalMensagem("Checkout realizado com sucesso!", () => {
            window.location.reload();
        });
    }
};

// ============================================================
// 6. CARREGAMENTO DE DADOS (TELA INICIAL)
// ============================================================

function carregarDadosTelaInicial() {
    // 6.1 Identificação do Usuário
    const nome = localStorage.getItem('usuarioNome');
    const spanBoasVindas = document.getElementById('boas-vindas');
    const tituloBarra = document.querySelector('.top-bar .titulo');
    if (nome) {
        if (spanBoasVindas) spanBoasVindas.textContent = nome;
        if (tituloBarra) tituloBarra.innerHTML = `Bem vindo, ${nome}!`;
    }

    // 6.2 Preenchimento do Veículo Ativo
    const veiculo = JSON.parse(localStorage.getItem("veiculoSelecionado"));
    const infoVeiculoDiv = document.getElementById("info-veiculo");
    if (veiculo && infoVeiculoDiv) {
        infoVeiculoDiv.innerHTML = `
            <p><strong>Modelo/Tipo:</strong> ${veiculo.modelo || veiculo.tipo}</p>
            <p><strong>Marca:</strong> ${veiculo.marca || 'N/A'}</p>
            <p><strong>Placa:</strong> ${veiculo.placa} | <strong>Prefixo:</strong> ${veiculo.prefixo}</p>
        `;
    }

    // 6.3 Preenchimento de Inputs de Formulário
    const inputs = {
        "quilometragem-inicial": "quilometragemInicial",
        "data-inicial": "dataInicial",
        "horario-inicial": "horarioInicial",
        "observacoes": "observacoes"
    };
    for (let id in inputs) {
        const el = document.getElementById(id);
        if (el) el.value = localStorage.getItem(inputs[id]) || "";
    }

    // 6.4 Mensagens Pendentes (Toast)
    const msg = localStorage.getItem("mensagemPendente");
    if (msg) {
        abrirModalMensagem(msg);
        localStorage.removeItem("mensagemPendente");
    }
}

// ============================================================
// 7. GESTÃO (ADMINISTRATIVO) - CADASTROS
// ============================================================

window.cadastrarUsuario = async function() {
    const inputs = document.querySelectorAll('input');
    const payload = {
        nome: inputs[0]?.value,
        matricula: inputs[1]?.value,
        email: inputs[2]?.value,
        senha: inputs[3]?.value,
        permissao: "TECNICO"
    };
    try {
        const r = await fetch("http://localhost:8080/usuario/cadastrar", {
            method: "POST", headers: { "Content-Type": "application/json" },
            body: JSON.stringify(payload)
        });
        if (r.ok) {
            abrirModalMensagem("Usuário cadastrado!", () => {
                window.location.href = "telainicial-gestor.html";
            });
        }
    } catch (e) {
        abrirModalMensagem("Erro ao conectar ao servidor.");
    }
};

window.cadastrarVeiculo = async function() {
    const inputs = document.querySelectorAll('input');
    const payload = {
        prefixo: inputs[1]?.value,
        placa: inputs[2]?.value,
        combustivel: inputs[3]?.value,
        kmAtual: 0, disponivel: true
    };
    try {
        const r = await fetch("http://localhost:8080/veiculo/cadastrar", {
            method: "POST", headers: { "Content-Type": "application/json" },
            body: JSON.stringify(payload)
        });
        if (r.ok) {
            abrirModalMensagem("Veículo cadastrado!", () => {
                window.location.href = "telainicial-gestor.html";
            });
        }
    } catch (e) {
        abrirModalMensagem("Erro de rede.");
    }
};

// ============================================================
// 8. UTILITÁRIOS E EVENTOS GLOBAIS
// ============================================================

/**
 * Alterna visibilidade de senhas em inputs.
 */
window.togglePassword = () => {
    document.querySelectorAll('input[type="password"], .senha-input').forEach(i => {
        i.type = i.type === "password" ? "text" : "password";
    });
};

/**
 * Atalho para login com a tecla Enter.
 */
document.addEventListener('keydown', (e) => {
    if (e.key === 'Enter' && document.getElementById('email')) window.btnindex();
});

/**
 * Fecha modais ao clicar na área escura (overlay).
 */
document.addEventListener("click", (e) => {
    if (e.target.classList.contains('sobreposicao') || e.target.classList.contains('popup')) {
        e.target.style.display = "none";
    }
});

/**
 * pesquisa veículos.
 */

function filtrarVeiculos() {
    const input = document.getElementById('inputPesquisa');
    const filtro = input.value.toLowerCase();
    const lista = document.getElementById('listaVeiculos');
    const botoes = lista.getElementsByTagName('button');

    for (let i = 0; i < botoes.length; i++) {
        let texto = botoes[i].textContent || botoes[i].innerText;
        if (texto.toLowerCase().indexOf(filtro) > -1) {
            botoes[i].style.display = "";
        } else {
            botoes[i].style.display = "none";
        }
    }
}

function filtrarVeiculos() {
    // Pega os valores dos filtros
    const termoPesquisa = document.getElementById('inputPesquisa').value.toUpperCase();
    const categoriaSelecionada = document.getElementById('filtroCategoria').value.toUpperCase();
    
    // Pega todos os botões de veículos
    const listaVeiculos = document.getElementById('listaVeiculos');
    const botoes = listaVeiculos.getElementsByClassName('btn-veiculo');

    for (let i = 0; i < botoes.length; i++) {
        const btn = botoes[i];
        const nomeVeiculo = btn.textContent || btn.innerText;
        const tipoVeiculo = btn.getAttribute('data-tipo').toUpperCase();

        // Lógica: Se o nome contém a pesquisa E (a categoria é 'TODOS' ou igual ao tipo do veículo)
        const correspondeNome = nomeVeiculo.toUpperCase().indexOf(termoPesquisa) > -1;
        const correspondeCategoria = (categoriaSelecionada === "TODOS" || tipoVeiculo === categoriaSelecionada);

        if (correspondeNome && correspondeCategoria) {
            btn.style.display = ""; // Mostra
        } else {
            btn.style.display = "none"; // Esconde
        }
    }
}

// / Funções para abrir/fechar o modal de filtro
function abrirModalFiltro() {
    document.getElementById('modalFiltroAvancado').style.display = 'flex';
}

function fecharModalFiltro() {
    document.getElementById('modalFiltroAvancado').style.display = 'none';
}

function aplicarFiltros() {
    const pesquisa = document.getElementById('inputPesquisa').value.toUpperCase();
    const tipo = document.getElementById('filtroTipo').value.toUpperCase();
    const marca = document.getElementById('filtroMarca').value.toUpperCase();
    
    const botoes = document.querySelectorAll('.btn-veiculo');

    botoes.forEach(btn => {
        const txtBotao = btn.textContent.toUpperCase();
        const vTipo = btn.getAttribute('data-tipo').toUpperCase();
        const vMarca = btn.getAttribute('data-marca').toUpperCase();

        // Checa todas as condições simultaneamente
        const batePesquisa = txtBotao.includes(pesquisa);
        const bateTipo = (tipo === "TODOS" || vTipo === tipo);
        const bateMarca = (marca === "TODOS" || vMarca === marca);

        if (batePesquisa && bateTipo && bateMarca) {
            btn.style.display = "block";
        } else {
            btn.style.display = "none";
        }
    });

    fecharModalFiltro(); // Fecha após aplicar
}

// Vincula a pesquisa por texto para rodar a mesma lógica
function filtrarVeiculos() {
    aplicarFiltros(); 
}
