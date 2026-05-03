# 🧪 Relatório de Testes - Sprint 2 (Bifrost Connect)

Este documento registra as validações das funcionalidades de inteligência de dados, filtros de busca e gestão de custos desenvolvidas durante a segunda Sprint do projeto.

---

### 🧩 Funcionalidades Testadas (Sprint 2)

| ID | Funcionalidade | Tipo de Teste | Objetivo | Resultado |
| :--- | :--- | :--- | :--- | :---: |
| **T09** | Filtro de Lista de Viaturas | Funcional | Validar a busca dinâmica por placa ou modelo na tela de gestão. | ✅ Aprovado |
| **T10** | Trava de KM Retroativo | Regra de Negócio | Impedir o Check-out caso o KM final seja menor que o inicial no banco. | ✅ Aprovado |
| **T11** | Painel de Disponibilidade | Funcional | Verificar se o status muda para "Em Uso" ou "Disponível" em tempo real. | ✅ Aprovado |
| **T12** | Relatório de Chamados (US-06) | Gestão | Validar a geração do compilado de informações de cada viatura. | ✅ Aprovado |
| **T13** | Retorno de Gastos (Abastecimento) | Gestão | Garantir que o Gestor visualize a soma de valores gastos por período. | ✅ Aprovado |
| **T14** | Cancelar Check-in (US-07) | Funcional | Excluir registro indevido antes de iniciar o trajeto. | ✅ Aprovado |
| **T15** | Precisão Decimal | Integração | Garantir que valores de abastecimento e KM aceitem casas decimais no MySQL. | ✅ Aprovado |

---

### 🧾 Evidências da Sprint 2

As principais validações desta etapa focaram na automação, usabilidade e controle financeiro para o IPEM:

*   ✅ **Otimização de Busca:** O filtro de lista permite que o gestor encontre veículos específicos instantaneamente, ignorando a necessidade de rolagem manual.
*   ✅ **Controle de Custos:** O sistema consolida os valores de abastecimento inseridos, permitindo uma visão clara dos gastos da frota.
*   ✅ **Integridade da Frota:** O bloqueio de KM retroativo impede que o técnico insira dados inconsistentes com o histórico armazenado no MySQL.
*   ✅ **Visibilidade do Gestor:** Painel administrativo atualizado mostra instantaneamente quais veículos estão na rua e quais estão no pátio.

---
<br>

### 🎬 Demonstração em Vídeo - Sprint 2

Confira a execução das funcionalidades acima rodando na aplicação:

[![YouTube Badge](https://img.shields.io/badge/YouTube-FF0000?style=for-the-badge&logo=youtube&logoColor=white)](https://www.youtube.com/watch?v=aItwSnatptE  )
