// 1. LOGIN COM REDIRECIONAMENTO POR PERFIL (ADMINISTRADOR VS TECNICO)
window.btnindex = async function() {
    const matricula = document.getElementById("matricula")?.value;
    const senha = document.getElementById("senha")?.value;

    if (!matricula || !senha) return;

    try {
        const r = await fetch("http://localhost:8080/usuario/login", {
            method: "POST",
            headers: { "Content-Type": "application/json" },
            body: JSON.stringify({
                matricula: String(matricula),
                senha: senha
            })
        });

        if (r.ok) {
            const usuario = await r.json();
            const permissao = usuario.permissao ? usuario.permissao.toLowerCase() : "";

            localStorage.setItem("usuarioNome", usuario.nome);
            localStorage.setItem("usuarioPermissao", permissao);

            if (permissao === "administrador") {
                window.location.href = "telainicial-gestor.html";
            } else if (permissao === "tecnico") {
                window.location.href = "telainicial.html";
            } else {
                alert("Perfil de acesso não reconhecido: " + usuario.permissao);
            }
        } else {
            alert("Matrícula ou senha incorretos.");
        }
    } catch (e) {
        console.error("Erro no login:", e);
        alert("Erro ao conectar com o servidor.");
    }
};

// 2. LOGOUT
window.btnlogout = () => {
    localStorage.clear();
    window.location.href = "index.html";
};

// 3. ESCUTA GLOBAL DA TECLA ENTER
document.addEventListener('keydown', (event) => {
    if (event.key === 'Enter') {
        const focado = document.activeElement;
        if (focado.id === 'matricula' || focado.id === 'senha') {
            event.preventDefault();
            btnindex();
        }
        if (focado.id === 'quilometragem-inicial' || focado.id === 'observacoes') {
            event.preventDefault();
            salvarVeiculoInfo();
        }
    }
});

// 4. CARREGAMENTO INICIAL, SIDEBAR E TRAVA DE SEGURANÇA POR PERFIL
document.addEventListener('DOMContentLoaded', () => {
    const permissao = localStorage.getItem("usuarioPermissao");
    const paginaAtual = window.location.pathname;

    if (permissao) {
        if (paginaAtual.includes("telainicial-gestor.html") && permissao !== "administrador") {
            window.location.href = "telainicial.html";
            return;
        }
        if (paginaAtual.includes("telainicial.html") && !paginaAtual.includes("-gestor") && permissao !== "tecnico") {
            window.location.href = "telainicial-gestor.html";
            return;
        }
    }

    carregarDadosTelaInicial();

    const btnMenu = document.getElementById("btnmenu");
    const sidebar = document.getElementById("sidebar");
    if (btnMenu) btnMenu.onclick = () => sidebar.style.width = "250px";
    if (document.getElementById("btnx")) document.getElementById("btnx").onclick = () => sidebar.style.width = "0";
});

// 5. MODAIS GERAIS
window.abrirModalConfirmacao = () => {
    const modal = document.getElementById("modalConfirmacao");
    if (modal) modal.style.display = "flex";
};
window.fecharTodosModais = () => {
    ["modalConfirmacao", "modalDetalhesVeiculo", "popupAbastecimento", "modalAvisoCheckout"].forEach(id => {
        const el = document.getElementById(id);
        if (el) el.style.display = "none";
    });
};
window.voltarParaVeiculos = () => {
    if (document.getElementById("modalDetalhesVeiculo")) document.getElementById("modalDetalhesVeiculo").style.display = "none";
    if (document.getElementById("modalConfirmacao")) document.getElementById("modalConfirmacao").style.display = "flex";
};

// 6. SELEÇÃO DE VEÍCULO
let veiculoTemp = {};
window.selecionarVeiculo = (titulo, modelo, marca, tipo, prefixo, placa) => {
    veiculoTemp = { titulo, modelo, marca, tipo, prefixo, placa };
    if (document.getElementById("fotoVeiculo")) document.getElementById("fotoVeiculo").src = "img/carro 1.jpg";
    if (document.getElementById("modeloVeiculo")) document.getElementById("modeloVeiculo").textContent = modelo;
    if (document.getElementById("marcaVeiculo")) document.getElementById("marcaVeiculo").textContent = marca;
    if (document.getElementById("placaVeiculo")) document.getElementById("placaVeiculo").textContent = placa;
    if (document.getElementById("prefixoVeiculo")) document.getElementById("prefixoVeiculo").textContent = prefixo;
    if (document.getElementById("modalConfirmacao")) document.getElementById("modalConfirmacao").style.display = "none";
    if (document.getElementById("modalDetalhesVeiculo")) document.getElementById("modalDetalhesVeiculo").style.display = "flex";
};

// 7. CONFIRMAR CHECK-IN
window.confirmarVeiculo = () => {
    localStorage.setItem("veiculoSelecionado", JSON.stringify(veiculoTemp));
    fecharTodosModais();
    if (window.location.pathname.includes("chamados.html")) {
        window.location.href = "telainicial.html";
    } else {
        carregarDadosTelaInicial();
    }
};

// 8. ABASTECIMENTO
window.abrirPopupAbastecimento = () => {
    if (document.getElementById("popupAbastecimento")) document.getElementById("popupAbastecimento").style.display = "flex";
};
window.fecharAbastecimento = () => {
    if (document.getElementById("popupAbastecimento")) document.getElementById("popupAbastecimento").style.display = "none";
};

// 9. SALVAR INFORMAÇÕES DO VEÍCULO (API)
window.salvarVeiculoInfo = async function() {
    const km = document.getElementById("quilometragem-inicial")?.value;
    const obs = document.getElementById("observacoes")?.value;
    localStorage.setItem("km", km);
    localStorage.setItem("obs", obs);
    const v = JSON.parse(localStorage.getItem('veiculoSelecionado'));
    if (v && v.prefixo) {
        try {
            await fetch(`http://localhost:8080/veiculo/${v.prefixo}/atualizar-dados`, {
                method: 'PATCH',
                headers: { 'Content-Type': 'application/json' },
                body: JSON.stringify({ quilometragem: km, observacoes: obs })
            });
            alert("Dados salvos!");
        } catch (e) { alert("Salvo localmente."); }
    }
};

// 10. FAZER CHECK-OUT
window.checkoutChamado = () => {
    localStorage.removeItem("veiculoSelecionado");
    localStorage.removeItem("km");
    localStorage.removeItem("obs");
    if (document.getElementById("modalAvisoCheckout")) document.getElementById("modalAvisoCheckout").style.display = "flex";
};
window.finalizarCheckout = () => { window.location.reload(); };

// 11. CARREGAR DADOS TELA INICIAL (NOME E VEICULO)
function carregarDadosTelaInicial() {
    const nome = localStorage.getItem('usuarioNome');
    const elTecnico = document.getElementById('boas-vindas-titulo');
    const elGestor = document.getElementById('nome-usuario-logado');

    if (nome) {
        if (elTecnico) elTecnico.textContent = `Bem vindo, ${nome}!`;
        if (elGestor) elGestor.textContent = nome;
    }

    const veiculo = JSON.parse(localStorage.getItem("veiculoSelecionado"));
    const secaoForm = document.getElementById("secao-pos-checkin");
    if (veiculo && secaoForm) {
        if (document.getElementById("container-checkin-botao")) document.getElementById("container-checkin-botao").style.display = "none";
        if (document.getElementById("info-veiculo-dados")) document.getElementById("info-veiculo-dados").style.display = "block";
        secaoForm.style.display = "block";
        document.getElementById("display-modelo").textContent = veiculo.modelo;
        document.getElementById("display-placa").textContent = veiculo.placa;
        document.getElementById("display-prefixo").textContent = veiculo.prefixo;
        document.getElementById("quilometragem-inicial").value = localStorage.getItem("km") || "";
        document.getElementById("observacoes").value = localStorage.getItem("obs") || "";
    }
}

// 12. VISUALIZAR SENHA (OLHINHO)
window.togglePassword = function() {
    const s = document.getElementById("senha");
    const l = document.getElementById("eyeLine");
    if (s.type === "password") {
        s.type = "text";
        if(l) l.style.display = "block";
    } else {
        s.type = "password";
        if(l) l.style.display = "none";
    }
};

// 13. CADASTRAR USUÁRIO
window.cadastrarUsuario = async function() {
    const nome = document.getElementById("cadNome")?.value;
    const email = document.getElementById("cadEmail")?.value;
    const matricula = document.getElementById("cadMatricula")?.value;
    const senha = document.getElementById("cadSenha")?.value;

    if (!nome || !email || !matricula || !senha) {
        alert("Preencha todos os campos!");
        return;
    }

    // O objeto deve seguir EXATAMENTE os nomes dos atributos da classe Usuario.java
    const payload = {
        id: parseInt(matricula), // Mapeia para o @Id private Integer id
        nome: nome,
        matricula: matricula,    // Mapeia para private String matricula
        email: email,
        senha: senha,
        permissao: "TECNICO"     // Deve ser string que o Enum.valueOf consiga ler
    };

    try {
        const response = await fetch("http://localhost:8080/usuario/cadastrar", {
            method: "POST",
            headers: { "Content-Type": "application/json" },
            body: JSON.stringify(payload)
        });

        if (response.ok) {
            abrirModalConfirmacao();
            // Limpa os campos após sucesso
            ["cadNome", "cadEmail", "cadMatricula", "cadSenha"].forEach(id => {
                document.getElementById(id).value = "";
            });
        } else {
            const erroMsg = await response.text();
            alert("Erro ao cadastrar: " + erroMsg);
        }
    } catch (e) {
        console.error("Erro na conexão:", e);
        alert("Erro de conexão com o servidor.");
    }
};