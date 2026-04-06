# 🧪 Relatório de Testes - Sprint 1 (Bifrost Connect)

Este documento registra as validações das funcionalidades de base (Autenticação e Cadastros) desenvolvidas durante a primeira Sprint do projeto.

---

### 🧩 Funcionalidades Testadas (Sprint 1)

| ID | Funcionalidade | Tipo de Teste | Objetivo | Resultado |
|:---|:---|:---|:---|:---:|
| T01 | Login do Sistema (US-01) | Funcional | Validar acesso de Técnico e Gestor com funcional/senha. | ✅ Aprovado |
| T02 | Bloqueio de Acesso | Segurança | Tentar logar com credenciais inválidas ou campos vazios. | ✅ Aprovado |
| T03 | Check-in de Viatura (US-02) | Funcional | Registrar KM inicial, data e hora ao retirar o veículo. | ✅ Aprovado |
| T04 | Check-out de Viatura (US-03) | Funcional | Registrar KM final e devolver o veículo à frota. | ✅ Aprovado |
| T05 | Registro de Abastecimento (US-04) | Funcional | Inserir litros e valor do combustível durante o uso. | ✅ Aprovado |
| T06 | Cadastro de Funcionários (US-05) | Gestão | Gestor cadastrando novos técnicos no sistema. | ✅ Aprovado |
| T07 | Cadastro de Viaturas (US-05) | Gestão | Gestor adicionando novas placas e modelos à frota. | ✅ Aprovado |
| T08 | Persistência de Dados | Integração | Garantir que o CSV/Banco salvou os dados após o Logout. | ✅ Aprovado |

---

### 🧾 Evidências da Sprint 1

As principais validações da entrega inicial foram registradas:

- ✅ **Login:** Identificação automática do cargo (Técnico ou Gestor).
- ✅ **Fluxo de Uso:** Retirada e devolução de veículo funcionando sem erros.
- ✅ **Gestão de Frota:** Novos veículos aparecendo na lista após cadastro pelo Gestor.
- ✅ **Segurança:** Sistema impede Check-in sem preenchimento do KM.

<br>

### 🎬 Demonstração em Vídeo - Sprint 1

Confira a execução das funcionalidades acima rodando na aplicação:

[![YouTube Badge](https://img.shields.io/badge/YouTube-FF0000?style=for-the-badge&logo=youtube&logoColor=white)](  )

