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

// 5. MODAIS GERAIS E FILTRO (FUNÇÕES DE FECHAMENTO GARANTIDAS)
window.abrirModalConfirmacao = () => {
    const modal = document.getElementById("modalConfirmacao");
    if (modal) modal.style.display = "flex";
};

window.abrirModalFiltro = () => {
    const modal = document.getElementById("modalFiltroAvancado");
    if (modal) modal.style.display = "flex";
};

window.fecharModalFiltro = () => {
    const modal = document.getElementById("modalFiltroAvancado");
    if (modal) modal.style.display = "none";
};

window.fecharModalMensagem = () => {
    const modal = document.getElementById("modalMensagem");
    if (modal) modal.style.display = "none";
};

window.fecharTodosModais = () => {
    ["modalConfirmacao", "modalDetalhesVeiculo", "popupAbastecimento", "modalAvisoCheckout", "modalFiltroAvancado", "modalMensagem"].forEach(id => {
        const el = document.getElementById(id);
        if (el) el.style.display = "none";
    });
};

window.voltarParaVeiculos = () => {
    if (document.getElementById("modalDetalhesVeiculo")) document.getElementById("modalDetalhesVeiculo").style.display = "none";
    if (document.getElementById("modalConfirmacao")) document.getElementById("modalConfirmacao").style.display = "flex";
};

// 6. LÓGICA DE FILTRAGEM (TEXTO E AVANÇADA)
window.filtrarVeiculos = () => {
    const input = document.getElementById("inputPesquisa").value.toLowerCase();
    const botoes = document.querySelectorAll(".btn-veiculo");

    botoes.forEach(btn => {
        const texto = btn.textContent.toLowerCase();
        btn.style.display = texto.includes(input) ? "" : "none";
    });
};

window.aplicarFiltros = () => {
    const tipoFiltro = document.getElementById("filtroTipo").value;
    const marcaFiltro = document.getElementById("filtroMarca").value;
    const botoes = document.querySelectorAll(".btn-veiculo");

    botoes.forEach(btn => {
        const btnTipo = btn.getAttribute("data-tipo");
        const btnMarca = btn.getAttribute("data-marca");

        const bateTipo = (tipoFiltro === "TODOS" || btnTipo === tipoFiltro);
        const bateMarca = (marcaFiltro === "TODOS" || btnMarca === marcaFiltro);

        btn.style.display = (bateTipo && bateMarca) ? "" : "none";
    });
    fecharModalFiltro();
};

// 7. SELEÇÃO DE VEÍCULO
let veiculoTemp = {};
window.selecionarVeiculo = (titulo, modelo, marca, tipo, prefixo, placa) => {
    veiculoTemp = { titulo, modelo, marca, tipo, prefixo, placa };
    if (document.getElementById("modeloVeiculo")) document.getElementById("modeloVeiculo").textContent = modelo;
    if (document.getElementById("marcaVeiculo")) document.getElementById("marcaVeiculo").textContent = marca;
    if (document.getElementById("placaVeiculo")) document.getElementById("placaVeiculo").textContent = placa;
    if (document.getElementById("prefixoVeiculo")) document.getElementById("prefixoVeiculo").textContent = prefixo;
    if (document.getElementById("tipoVeiculo")) document.getElementById("tipoVeiculo").textContent = tipo;
    if (document.getElementById("modalConfirmacao")) document.getElementById("modalConfirmacao").style.display = "none";
    if (document.getElementById("modalDetalhesVeiculo")) document.getElementById("modalDetalhesVeiculo").style.display = "flex";
};

// 8. CONFIRMAR CHECK-IN
window.confirmarVeiculo = () => {
    localStorage.setItem("veiculoSelecionado", JSON.stringify(veiculoTemp));
    fecharTodosModais();

    const infoVeiculo = document.getElementById("info-veiculo");
    if (infoVeiculo) {
        infoVeiculo.innerHTML = `
            <p><strong>Modelo:</strong> ${veiculoTemp.modelo}</p>
            <p><strong>Placa:</strong> ${veiculoTemp.placa}</p>
            <p><strong>Prefixo:</strong> ${veiculoTemp.prefixo}</p>
        `;
    }

    const btnInicial = document.getElementById("btn-selecionar-inicial");
    const btnSelecionar = document.getElementById("check-in-veiculo");
    const btnSalvarCheckin = document.getElementById("btn-salvar-veiculo");
    const btnAbastecimento = document.getElementById("btn-abs-veiculo");
    const btnCancelar = document.getElementById("btn-checkout");

    if (btnInicial) btnInicial.style.display = "none";
    if (btnSelecionar) btnSelecionar.style.display = "none";
    if (btnSalvarCheckin) btnSalvarCheckin.style.display = "inline-block";
    if (btnAbastecimento) btnAbastecimento.style.display = "inline-block";
    if (btnCancelar) btnCancelar.style.display = "inline-block";

    // 🔥 MOSTRA CAMPOS
    const campos = document.getElementById("campos-veiculo");
    if (campos) campos.style.display = "block";
};

// 9. ABASTECIMENTO
window.abrirPopupAbastecimento = () => {
    if (document.getElementById("popupAbastecimento")) document.getElementById("popupAbastecimento").style.display = "flex";
};
window.fecharAbastecimento = () => {
    if (document.getElementById("popupAbastecimento")) document.getElementById("popupAbastecimento").style.display = "none";
};

// --- 10. CHECK-OUT E CANCELAR ---

window.checkoutChamado = () => {
    // 1. Alterna os campos de quilometragem no formulário
    const campoInicial = document.getElementById("quilometragem-inicial");
    const campoFinal = document.querySelector('input[placeholder="Digite a quilometragem final"]');
    const labelInicial = document.querySelector('label[for="quilometragem-inicial"]');
    const labelFinal = document.querySelectorAll('label[for="quilometragem-inicial"]')[1];

    if (campoInicial && campoFinal) {
        // Esconde os campos de entrada (Check-in)
        campoInicial.style.display = "none";
        labelInicial.style.display = "none";

        // Mostra os campos de saída (Check-out)
        campoFinal.style.display = "block";
        labelFinal.style.display = "block";

        // Atualiza o botão de ação principal
        const btnSalvar = document.getElementById("btn-salvar-veiculo");
        if (btnSalvar) {
            btnSalvar.textContent = "Finalizar Check-out";
            btnSalvar.onclick = window.executarFinalizacaoCheckout;
        }
    }
};

// Função para cancelar tudo e voltar ao estado zero
window.cancelarOperacao = () => {
    localStorage.removeItem("veiculoSelecionado");
    // Em vez de alert, usamos o seu modal de mensagem para confirmar a ação se necessário,
    // ou apenas recarregamos a página para resetar a UI para o estado inicial.
    window.location.reload();
};

// Executa a gravação final do Check-out no Docker
window.executarFinalizacaoCheckout = async () => {
    const campoFinal = document.querySelector('input[placeholder="Digite a quilometragem final"]');
    const vData = JSON.parse(localStorage.getItem('veiculoSelecionado'));

    if (!campoFinal || !campoFinal.value) {
        window.abrirModalMensagem("Atenção", "Digite a quilometragem final para encerrar.");
        return;
    }

    try {
        const res = await fetch(`http://localhost:8080/veiculo/${vData.prefixo}/checkout`, {
            method: 'POST',
            headers: { 'Content-Type': 'application/json' },
            body: JSON.stringify({ quilometragemFinal: campoFinal.value })
        });

        if (res.ok) {
            window.abrirModalMensagem("Sucesso", "Check-out realizado. Viatura liberada.");
            setTimeout(() => window.location.reload(), 2000);
        }
    } catch (err) {
        window.abrirModalMensagem("Erro", "Falha ao conectar com o servidor.");
    }
};

window.finalizarCheckout = () => {
    window.location.reload();
};

// 11. CARREGAR DADOS INICIAIS
function carregarDadosTelaInicial() {
    const nome = localStorage.getItem('usuarioNome');
    const elTecnico = document.getElementById('boas-vindas-titulo');
    if (nome && elTecnico) elTecnico.textContent = `Bem vindo, ${nome}!`;

    const veiculo = JSON.parse(localStorage.getItem("veiculoSelecionado"));
    if (veiculo) {
        veiculoTemp = veiculo;
        confirmarVeiculo();
    }
}

// 12. CADASTRAR USUÁRIO
window.cadastrarUsuario = async function() {
    const nome = document.getElementById("cadNome")?.value;
    const email = document.getElementById("cadEmail")?.value;
    const matricula = document.getElementById("cadMatricula")?.value;
    const senha = document.getElementById("cadSenha")?.value;

    if (!nome || !email || !matricula || !senha) {
        alert("Preencha todos os campos!");
        return;
    }

    const payload = { id: parseInt(matricula), nome, matricula, email, senha, permissao: "TECNICO" };

    try {
        const response = await fetch("http://localhost:8080/usuario/cadastrar", {
            method: "POST",
            headers: { "Content-Type": "application/json" },
            body: JSON.stringify(payload)
        });
        if (response.ok) alert("Cadastrado com sucesso!");
    } catch (e) { console.error(e); }
};

// 13. GERENCIADOR DE INTERFACE INTEGRADO
document.addEventListener('click', async function (event) {
    const el = event.target.closest('button'); // 🔥 CORREÇÃO PRINCIPAL

    if (!el) return;

    // --- 1. AÇÃO: SELECIONAR VEÍCULO (ABRIR LISTA) ---
    if (el.id === 'check-in-veiculo' || el.textContent.trim() === 'Selecionar Veículo') {
        window.abrirModalConfirmacao();
        return;
    }

    // --- 2. AÇÃO: CANCELAR ---
    if (el.textContent.trim() === 'Cancelar') {
        localStorage.removeItem("veiculoSelecionado");
        window.location.reload();
        return;
    }

    // --- 3. AÇÃO: SALVAR CHECK-IN (ENTRADA) ---
    if (el.id === 'btn-salvar-veiculo' && el.textContent.includes('Check-In')) {
        const kmInput = document.getElementById("quilometragem-inicial");
        const vData = localStorage.getItem('veiculoSelecionado');

        if (!kmInput || !kmInput.value) {
            window.abrirModalMensagem("Atenção", "Digite a quilometragem de entrada!");
            return;
        }

        const v = JSON.parse(vData);
        try {
            const res = await fetch(`http://localhost:8080/veiculo/${v.prefixo}/checkin`, {
                method: 'PATCH',
                headers: { 'Content-Type': 'application/json' },
                body: JSON.stringify({
                    quilometragemInicial: kmInput.value,
                    observacoes: document.getElementById("observacoes")?.value
                })
            });

            if (res.ok) {
                // 🔥 CHECK-IN → CHECK-OUT
                el.textContent = "Fazer Check-Out";
                el.className = "btn-aceitar";

                const campoFinal = document.querySelectorAll('input[placeholder*="quilometragem"]')[1];
                const labels = document.querySelectorAll('label[for="quilometragem-inicial"]');

                if (kmInput) {
                    kmInput.style.display = "none";
                    if (labels[0]) labels[0].style.display = "none";
                }

                if (campoFinal) {
                    campoFinal.style.display = "block";
                    if (labels[1]) labels[1].style.display = "block";
                }

                window.abrirModalMensagem("Sucesso", "Check-in realizado!");
            } else {
                window.abrirModalMensagem("Erro", "Falha ao salvar no servidor.");
            }
        } catch (err) {
            window.abrirModalMensagem("Erro", "Sem conexão com o Docker.");
        }
        return;
    }

    // --- 4. AÇÃO: CLIQUE NO "FAZER CHECK-OUT" ---
    if (el.id === 'btn-salvar-veiculo' && el.textContent.trim() === "Fazer Check-Out") {
        const campoInicial = document.getElementById("quilometragem-inicial");
        const todosInputsKM = document.querySelectorAll('input[placeholder*="quilometragem"]');
        const campoFinal = todosInputsKM[1];
        const labels = document.querySelectorAll('label[for="quilometragem-inicial"]');

        if (campoFinal) {
            if (campoInicial) campoInicial.style.display = "none";
            if (labels[0]) labels[0].style.display = "none";

            campoFinal.style.display = "block";
            if (labels[1]) labels[1].style.display = "block";

            el.textContent = "Confirmar Checkout";
            el.className = "btn-aceitar";
        }
        return;
    }

    // --- 5. AÇÃO: CONFIRMAR CHECKOUT ---
    if (el.id === 'btn-salvar-veiculo' && el.textContent.trim() === "Confirmar Checkout") {
        const todosInputsKM = document.querySelectorAll('input[placeholder*="quilometragem"]');
        const kmFinal = todosInputsKM[1]?.value;

        if (!kmFinal) {
            window.abrirModalMensagem("Atenção", "Informe a quilometragem final!");
            return;
        }

        window.abrirModalMensagem("Sucesso", "Checkout feito!");

        setTimeout(() => {
            localStorage.removeItem("veiculoSelecionado");
            window.location.reload();
        }, 2000);
        return;
    }

    // --- 6. ABASTECIMENTO ---
    if (el.id === 'btn-abs-veiculo' || el.textContent.includes('Abastecimento')) {
        const popupAbs = document.getElementById("popupAbastecimento");
        if (popupAbs) popupAbs.style.display = "flex";
        return;
    }

    // --- 7. BOTÕES DE FECHAR / VOLTAR ---
    if (el.classList.contains('btn-voltar') || el.textContent.trim() === 'Fechar' || el.textContent.trim() === 'Voltar') {
        window.fecharTodosModais();
        return;
    }

   // --- 8. SALVAR ABASTECIMENTO ---
   if (el.id === 'btn-salvar-abastecimento') {

       const valor = document.getElementById("valor-abastecimento")?.value;
       const data = document.getElementById("data-abastecimento")?.value;
       const hora = document.getElementById("hora-abastecimento")?.value;

       const vData = JSON.parse(localStorage.getItem('veiculoSelecionado'));

       if (!valor || !data || !hora) {
           window.abrirModalMensagem("Atenção", "Preencha todos os campos do abastecimento!");
           return;
       }

       if (!vData) {
           window.abrirModalMensagem("Erro", "Nenhum veículo selecionado!");
           return;
       }

       try {
           const res = await fetch(`http://localhost:8080/veiculo/${vData.prefixo}/abastecimento`, {
               method: 'POST',
               headers: { 'Content-Type': 'application/json' },
               body: JSON.stringify({
                   valor: valor,
                   data: data,
                   hora: hora
               })
           });

           if (res.ok) {
               window.abrirModalMensagem("Sucesso", "Abastecimento salvo com sucesso!");

               const popup = document.getElementById("popupAbastecimento");
               if (popup) popup.style.display = "none";

           } else {
               window.abrirModalMensagem("Erro", "Erro ao salvar abastecimento.");
           }

       } catch (err) {
           window.abrirModalMensagem("Erro", "Sem conexão com o servidor.");
       }

       return;
   }
});
// 14 - Modal
window.abrirModalMensagem = (titulo, texto) => {
    const m = document.getElementById("modalMensagem");
    if (m) {
        const t = m.querySelector(".popup-titulo") || m.querySelector("h2");
        const p = document.getElementById("textoModalMensagem") || m.querySelector("p");
        if (t) t.textContent = titulo;
        if (p) p.textContent = texto;
        m.style.display = "flex";
    }
};