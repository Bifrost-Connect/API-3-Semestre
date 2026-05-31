# 🧪 Relatório de Testes - Sprint 3 (Bifrost Connect)

Este documento registra as validações das funcionalidades de encerramento, conformidade institucional (SGI), auditoria de segurança e suporte emergencial desenvolvidas durante a terceira e última Sprint do projeto.

---

### 🧩 Funcionalidades Testadas (Sprint 3)

| ID | Funcionalidade | Tipo de Teste | Objetivo | Resultado |
| :---: | :---: | :--- | :--- | :---: |
| **T16** | Exportação de Dados SGI (US-08) | Funcional | Validar a geração e download do arquivo mensal de registros sem corromper os dados. | ✅ Aprovado |
| **T17** | Acionamento de Suporte (US-09) | Funcional | Testar o envio de alerta/chamado para a equipe de mecânica em caso de pane. | ✅ Aprovado |
| **T18** | Log de Auditoria (US-10) | Segurança | Garantir que qualquer alteração manual de KM ou dados dispare um registro automático no MySQL. | ✅ Aprovado |
| **T19** | Visualização de GPS (US-11) | Interface | Verificar a renderização do mapa e traçado de rotas para o técnico em campo. | ✅ Aprovado |
| **T20** | Edição de Perfis (US-12) | Gestão | Validar se o Gestor consegue atualizar dados de viaturas e técnicos com persistência imediata. | ✅ Aprovado |

---

### 🧾 Evidências da Sprint 3

As validações finais garantiram a segurança jurídica e a utilidade macro do sistema para o IPEM:

* ✅ **Conformidade com o SGI (US-08):** O arquivo gerado traz todos os campos obrigatórios formatados, eliminando o preenchimento manual de planilhas ao fim do mês.
* ✅ **Segurança do Técnico (US-09):** O módulo de suporte mecânico estabelece o contato emergencial imediato, mitigando riscos de o funcionário ficar isolado em campo com a viatura quebrada.
* ✅ **Trilha de Auditoria Blindada (US-10):** Testes de alteração direta simularam tentativas de burlar a quilometragem; o sistema capturou o autor da mudança e salvou o histórico perfeitamente no banco de dados.
* ✅ **Auxílio de Navegação (US-11):** A integração com a API de mapas traçou as rotas sem travamentos na interface gráfica.
* ✅ **Manutenção Cadastral (US-12):** A edição de perfis bloqueia campos-chave automáticos e permite apenas a alteração de dados administrativos permitidos.

---
### 🎬 Demonstração em Vídeo - Sprint 3

Confira a execução das funcionalidades acima rodando na aplicação:

[![YouTube Badge](https://img.shields.io/badge/YouTube-FF0000?style=for-the-badge&logo=youtube&logoColor=white)](https://www.youtube.com/watch?v=MVj0pYbLtWQ)
