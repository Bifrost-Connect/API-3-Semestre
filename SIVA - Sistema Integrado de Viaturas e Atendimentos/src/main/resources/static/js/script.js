// --- 1. NAVEGAÇÃO E LOGOUT ---
async function btnindex() {
    //  Capturar os valores digitados no HTML
    const emailInput = document.getElementById("email").value.trim();
    const senhaInput = document.getElementById("senha").value.trim();
    //  Validação básica
    if (!emailInput || !senhaInput) {
        alert("Por favor, preencha o e-mail e a senha.");
        return;
    }
    try {
        // Fazer a requisição para o nosso Back-End
        const response = await fetch("http://localhost:8080/usuario/login", {
            method: "POST",
            headers: {
                "Content-Type": "application/json"
            },
            body: JSON.stringify({
                email: emailInput,
                senha: senhaInput
            })
        });
        // Lidar com a resposta do Java
        if (response.ok) {
            const data = await response.json();

            // Salva os dados do usuário no navegador para usar depois
            localStorage.setItem("token", data.token);
            localStorage.setItem("usuarioNome", data.nome);
            localStorage.setItem("usuarioPermissao", data.permissao); // Salva a permissão (ADMINISTRADOR ou TECNICO)

            // Redireciona para a tela certa dependendo da permissão retornada pelo Java
            if (data.permissao === "ADMINISTRADOR") {
                window.location.href = "telainicial-gestor.html";
            } else {
                window.location.href = "telainicial.html";
            }

        } else {
            // Tratamento de erro 401/403 vindo do Java
            try {
                const errorData = await response.json();
                alert(errorData.erro || "E-mail ou senha incorretos.");
            } catch (e) {
                alert("Acesso negado ou erro nas credenciais.");
            }
        }
    } catch (error) {
        console.error("Erro na requisição:", error);
        alert("Erro ao tentar conectar com o servidor. Verifique se o back-end está rodando.");
    }
}

function btnlogout() {
    localStorage.clear();
    window.location.href = "index.html";
}

// --- 2. AUTENTICAÇÃO (LOGIN) ---
async function efetuarLogin() {
    const emailInput = document.getElementById('email');
    const senhaInput = document.getElementById('senha');

    if (!emailInput || !senhaInput) return;

    const dadosLogin = {
        email: emailInput.value.trim(),
        senha: senhaInput.value.trim()
    };

    try {
        const response = await fetch('http://localhost:8080/usuario/login', {
            method: 'POST',
            headers: { 'Content-Type': 'application/json' },
            body: JSON.stringify(dadosLogin)
        });

        if (response.ok) {
            const data = await response.json();
            // Limpa dados temporários de veículos
            localStorage.removeItem('veiculoSelecionado');
            localStorage.removeItem('quilometragemAtual');
            localStorage.removeItem('observacoes');

            localStorage.setItem('token', data.token);
            localStorage.setItem('usuarioNome', data.nome);
            localStorage.setItem('usuarioPermissao', data.permissao);

            alert("Login realizado com sucesso!");

            // Redirecionamento consistente
            if (data.permissao === "ADMINISTRADOR") {
                window.location.href = "telainicial-gestor.html";
            } else {
                window.location.href = "telainicial.html";
            }
        } else {
            alert("Erro: Usuário ou senha incorretos");
        }
    } catch (error) {
        console.error("Erro na conexão:", error);
    }
}

// --- 3. CONTROLE DA SIDEBAR (MENU) ---
const btnmenu = document.getElementById("btnmenu");
const sidebar = document.getElementById("sidebar");
const closeBtn = document.getElementById("btnx");
const overlayBlurSidebar = document.getElementById("overlayBlurSidebar");

if (btnmenu) {
    btnmenu.addEventListener("click", () => {
        sidebar.classList.add("open");
        overlayBlurSidebar.classList.add("active");
    });
}

if (closeBtn) {
    closeBtn.addEventListener("click", () => {
        sidebar.classList.remove("open");
        overlayBlurSidebar.classList.remove("active");
    });
}

if (overlayBlurSidebar) {
    overlayBlurSidebar.addEventListener("click", () => {
        sidebar.classList.remove("open");
        overlayBlurSidebar.classList.remove("active");
    });
}

// --- 4. MODAIS E SELEÇÃO DE VEÍCULO (CHAMADOS.HTML) ---
const modalConfirmacao = document.getElementById("modalConfirmacao");
const modalDetalhesVeiculo = document.getElementById("modalDetalhesVeiculo");
let veiculoSelecionado = {};

function abrirModalConfirmacao() {
    if (modalConfirmacao) modalConfirmacao.style.display = "flex";
}

function fecharTodosModais() {
    if (modalConfirmacao) modalConfirmacao.style.display = "none";
    if (modalDetalhesVeiculo) modalDetalhesVeiculo.style.display = "none";
}

function selecionarVeiculo(titulo, tipo, prefixo, placa, info, ultimoServico, nivelCombustivel, quilometragem) {
    veiculoSelecionado = {
        titulo, tipo, prefixo, placa, ultimoServico, nivelCombustivel, quilometragem
    };

    document.getElementById("tituloVeiculo").textContent = titulo;
    document.getElementById("tipoVeiculo").textContent = tipo;
    document.getElementById("prefixoVeiculo").textContent = prefixo;
    document.getElementById("placaVeiculo").textContent = placa;
    document.getElementById("ultimoServico").textContent = ultimoServico;
    document.getElementById("nivelCombustivel").textContent = nivelCombustivel;
    document.getElementById("quilometragem").textContent = quilometragem;

    if (modalConfirmacao) modalConfirmacao.style.display = "none";
    if (modalDetalhesVeiculo) modalDetalhesVeiculo.style.display = "flex";
}

function voltarParaVeiculos() {
    if (modalDetalhesVeiculo) modalDetalhesVeiculo.style.display = "none";
    if (modalConfirmacao) modalConfirmacao.style.display = "flex";
}

function confirmarVeiculo() {
    localStorage.removeItem('quilometragemAtual');
    localStorage.removeItem('observacoes');
    localStorage.setItem('veiculoSelecionado', JSON.stringify(veiculoSelecionado));
    fecharTodosModais();
    window.location.href = "telainicial.html";
}

// --- 5. PERSISTÊNCIA: SALVAR NO MYSQL E NO NAVEGADOR ---

async function salvarVeiculoInfo() {
    const kmInput = document.getElementById('quilometragem-atual');
    const obsInput = document.getElementById('observacoes');
    const veiculo = JSON.parse(localStorage.getItem('veiculoSelecionado'));
    const token = localStorage.getItem('token');

    if (!veiculo || !veiculo.prefixo) {
        alert("Erro: Selecione um veículo primeiro na tela de chamados.");
        return;
    }

    const dadosParaEnviar = {
        quilometragem: parseFloat(kmInput.value) || 0,
        observacoes: obsInput.value
    };

    localStorage.setItem('quilometragemAtual', kmInput.value);
    localStorage.setItem('observacoes', obsInput.value);

    try {
        const response = await fetch(`http://localhost:8080/veiculo/${veiculo.prefixo}/atualizar-dados`, {
            method: 'PATCH',
            headers: {
                'Content-Type': 'application/json',
                'Authorization': `Bearer ${token}`
            },
            body: JSON.stringify(dadosParaEnviar)
        });

        if (response.ok) {
            alert('Sucesso! Informações gravadas no MySQL e no navegador.');
        } else {
            alert('Erro ao gravar no servidor MySQL.');
        }
    } catch (error) {
        alert('Salvo apenas no navegador local (Servidor offline ou erro de rede).');
    }
}

function carregarDadosTelaInicial() {
    const veiculo = JSON.parse(localStorage.getItem('veiculoSelecionado'));
    const infoVeiculoDiv = document.getElementById('info-veiculo');

    if (veiculo && infoVeiculoDiv) {
        infoVeiculoDiv.innerHTML = `
            <p><strong>Prefixo:</strong> ${veiculo.prefixo}</p>
            <p><strong>Placa:</strong> ${veiculo.placa}</p>
            <p><strong>Tipo:</strong> ${veiculo.tipo}</p>
        `;
    } else if (infoVeiculoDiv) {
        infoVeiculoDiv.innerHTML = `<p>Nenhum veículo selecionado.</p>`;
    }

    if (document.getElementById('quilometragem-atual')) {
        document.getElementById('quilometragem-atual').value = localStorage.getItem('quilometragemAtual') || "";
    }
    if (document.getElementById('observacoes')) {
        document.getElementById('observacoes').value = localStorage.getItem('observacoes') || "";
    }
}

async function checkoutChamado() {
    if (confirm("Deseja encerrar o serviço?")) {
        localStorage.removeItem('veiculoSelecionado');
        localStorage.removeItem('quilometragemAtual');
        localStorage.removeItem('observacoes');
        window.location.reload();
    }
}

// --- 6. INICIALIZAÇÃO ---
document.addEventListener('DOMContentLoaded', () => {
    const nome = localStorage.getItem('usuarioNome');
    const boasVindasSpan = document.getElementById('boas-vindas');

    if (nome && boasVindasSpan) {
        boasVindasSpan.textContent = `Bem vindo, ${nome}!`;
    }

    if (document.getElementById('info-veiculo')) {
        carregarDadosTelaInicial();

        const nomeUsuario = localStorage.getItem("usuarioNome");
        const tituloElement = document.querySelector(".titulo");
        if (nomeUsuario && tituloElement){
            tituloElement.textContent = `Bem vindo, ${nomeUsuario}!`;
        }
    }

    window.onclick = function(event) {
        if (event.target == modalConfirmacao || event.target == modalDetalhesVeiculo) {
            fecharTodosModais();
        }
    }
});

// --- 7. CADASTRO DE NOVOS VEÍCULOS ---
async function cadastrarVeiculo() {
    const modelo = document.getElementById("modeloVeiculo").value.trim();
    const placa = document.getElementById("placaVeiculo").value.trim();
    const prefixo = document.getElementById("prefixoVeiculo").value.trim();
    const combustivel = document.getElementById("combustivelVeiculo").value.trim();
    const token = localStorage.getItem('token');

    if (!placa || !prefixo) {
        alert("Atenção: A placa e o prefixo são obrigatórios!");
        return;
    }

    const dadosCarro = {
        prefixo: prefixo,
        placa: placa,
        combustivel: combustivel
    };

    try {
        const response = await fetch("http://localhost:8080/veiculo/cadastrar", {
            method: "POST",
            headers: {
                "Content-Type": "application/json",
                "Authorization": `Bearer ${token}`
            },
            body: JSON.stringify(dadosCarro)
        });

        if (response.ok) {
            alert("Veículo cadastrado com sucesso!");
            // Limpa os campos
            document.getElementById("modeloVeiculo").value = "";
            document.getElementById("placaVeiculo").value = "";
            document.getElementById("prefixoVeiculo").value = "";
            document.getElementById("combustivelVeiculo").value = "";
        } else {
            const dataErro = await response.json();
            alert("Erro no cadastro: " + (dataErro.error || "Verifique os dados."));
        }
    } catch (error) {
        console.error("Erro no cadastro:", error);
        alert("Erro de conexão com o servidor.");
    }
}