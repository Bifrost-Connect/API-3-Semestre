// ============================================================
// 1. NAVEGAÇÃO E LOGOUT
// ============================================================
window.btnindex = async function() {
    const email = document.getElementById("email")?.value.trim();
    const senha = document.getElementById("senha")?.value.trim();
    if (!email || !senha) return alert("Preencha e-mail e senha.");
    try {
        const r = await fetch("http://localhost:8080/usuario/login", {
            method: "POST", headers: { "Content-Type": "application/json" },
            body: JSON.stringify({ email, senha })
        });
        if (r.ok) {
            const d = await r.json();
            localStorage.setItem("usuarioNome", d.nome);
            localStorage.setItem("usuarioPermissao", d.permissao);
            window.location.href = d.permissao === "ADMINISTRADOR" ? "telainicial-gestor.html" : "telainicial.html";
        } else { alert("Login inválido."); }
    } catch (e) { alert("Erro de conexão."); }
};

window.btnlogout = () => {
    localStorage.clear();
    window.location.href = "index.html";
};

// ============================================================
// 2. CONTROLE DA SIDEBAR (MENU)
// ============================================================
document.addEventListener('DOMContentLoaded', () => {
    carregarDadosIniciais();
    const b = document.getElementById("btnmenu"), s = document.getElementById("sidebar"), x = document.getElementById("btnx");
    const overlay = document.getElementById("overlayBlurSidebar");

    if (b && s) b.onclick = () => { s.classList.add("open"); overlay?.classList.add("active"); };
    if (x && s) x.onclick = () => { s.classList.remove("open"); overlay?.classList.remove("active"); };
});

// ============================================================
// 3. MODAIS
// ============================================================
window.abrirModalConfirmacao = () => {
    const m = document.getElementById("modalConfirmacao");
    if (m) m.style.display = "flex";
};

window.voltarParaVeiculos = () => {
    document.getElementById("modalDetalhesVeiculo").style.display = "none";
    document.getElementById("modalConfirmacao").style.display = "flex";
};

// ============================================================
// 4. SELEÇÃO DE VEÍCULO (TELA DE CHAMADOS)
// ============================================================
let vTemp = null;
window.selecionarVeiculo = function(titulo, tipo, prefixo, placa, placaExtra, servico, combustivel, km) {
    vTemp = { prefixo, placa };

    if(document.getElementById("tituloVeiculo")) document.getElementById("tituloVeiculo").textContent = titulo;
    if(document.getElementById("prefixoVeiculo")) document.getElementById("prefixoVeiculo").textContent = prefixo;
    if(document.getElementById("placaVeiculo")) document.getElementById("placaVeiculo").textContent = placa;

    document.getElementById("modalConfirmacao").style.display = "none";
    document.getElementById("modalDetalhesVeiculo").style.display = "flex";
};

window.confirmarVeiculo = () => {
    if (!vTemp) return alert("Erro: Selecione o veículo novamente.");
    localStorage.setItem('veiculoSelecionado', JSON.stringify(vTemp));
    alert("Chamado aceito com sucesso!");
    window.location.href = "telainicial.html";
};

// ============================================================
// 5. ATUALIZAR DADOS E CHECKOUT
// ============================================================
window.salvarVeiculoInfo = async function() {
    const kmInput = document.getElementById('quilometragem-atual');
    const obsInput = document.getElementById('observacoes');
    const v = JSON.parse(localStorage.getItem('veiculoSelecionado'));

    if (!v) return alert("Erro: Nenhum veículo em atendimento.");

    try {
        const r = await fetch(`http://localhost:8080/veiculo/${v.prefixo}/atualizar-dados`, {
            method: 'PATCH',
            headers: { 'Content-Type': 'application/json' },
            body: JSON.stringify({
                quilometragem: parseFloat(kmInput.value) || 0,
                observacoes: obsInput.value || ""
            })
        });
        if (r.ok) alert('Dados salvos com sucesso!');
        else alert('Erro ao salvar no servidor. Verifique se o prefixo existe no banco.');
    } catch (e) { alert('Erro de conexão.'); }
};

window.checkoutChamado = function() {
    const v = localStorage.getItem('veiculoSelecionado');
    if (!v) return alert("Não há chamado ativo.");

    if (confirm("Finalizar serviço e realizar Checkout?")) {
        localStorage.removeItem('veiculoSelecionado');
        alert("Serviço finalizado!");
        window.location.reload();
    }
};

// ============================================================
// 6. INICIALIZAÇÃO (NOME E LAYOUT DO VEÍCULO)
// ============================================================
function carregarDadosIniciais() {
    const nome = localStorage.getItem('usuarioNome');

    // 6.1 Troca o nome do usuário (Garante que saia o "fulano")
    const spanBoasVindas = document.getElementById('boas-vindas');
    const tituloBarra = document.querySelector('.top-bar .titulo');

    if (nome) {
        if (spanBoasVindas) spanBoasVindas.textContent = nome;
        if (tituloBarra) tituloBarra.innerHTML = `Bem vindo, ${nome}!`;
    }

    // 6.2 Exibe o veículo em blocos (um embaixo do outro)
    const v = JSON.parse(localStorage.getItem('veiculoSelecionado'));
    const infoDiv = document.getElementById('info-veiculo');

    if (v && infoDiv) {
        infoDiv.innerHTML = `
            <p><strong>Veículo em Atendimento:</strong></p>
            <p>Prefixo: ${v.prefixo} | Placa: ${v.placa}</p>
        `;
    }
}

// ============================================================
// 7. CADASTRO DE USUÁRIO
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
        if (r.ok) { alert("Cadastrado!"); window.location.href = "telainicial-gestor.html"; }
        else { alert("Erro ao cadastrar."); }
    } catch (e) { alert("Erro de rede."); }
};

// ============================================================
// 8. CADASTRO DE VEÍCULOS
// ============================================================
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
        if (r.ok) { alert("Veículo cadastrado!"); window.location.href = "telainicial-gestor.html"; }
    } catch (e) { alert("Erro."); }
};

// ============================================================
// 9. UTILITÁRIOS
// ============================================================
window.togglePassword = () => {
    document.querySelectorAll('input[type="password"]').forEach(i => i.type = i.type === "password" ? "text" : "password");
};

document.addEventListener('keydown', (e) => {
    if (e.key === 'Enter' && document.getElementById('email')) btnindex();
});