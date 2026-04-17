#  SPRINT-1
![alt text](../../logo.png)


| [Desafio](#-desafio) | [User Stories](#-user-stories) | [DoR](#-definition-of-ready) | [DoD](#-definition-of-done) | [Burndown](#-sprint-burndown) | [Equipe](#-equipe) |



 **Status da Sprint:** Concluída 


# 🥇 Desafio  

Implementar funcionalidades que aprimorem a coleta de informações sobre os **técnicos e viaturas** no processo de chamados realizados **viaturas de passeio e utilitárias**, juntamente com uma opção de **abastecimento do combustível** integrado à tela inicial do técnico após o check-in da viatura, e o envio de dados da viatura durante **Resoluções de Chamado** feitas pelo técnico da IPEM, e o **cadastro de técnicos e viaturas** na plataforma, feitas pelo gestor da IPEM. 

<br>

# 🎯 User Stories  

| Rank | Prioridade | User Story | Story Points | Sprint | Status |
|------|-------------|-------------|--------------|---------|---------|
| 1 | Alta | Como Usuário (Técnico ou Gestor), quero **realizar login com minha funcional/senha** para que meus registros sejam vinculados automaticamente ao meu perfil. | 8 | 1 | [✅] |
| 2 | Alta |Como Técnico do IPEM, quero **registrar o KM inicial, data e horário** ao retirar o veículo. | 8 | 1 | [✅] |
| 3 | Alta | Como técnico do IPEM, quero **registrar o KM final** ao devolver a viatura. | 8 | 1 | [✅] |
| 4 | Alta | Como Técnico da IPEM, quero **ter o controle do abastecimento da viatura**, para saber o último abastecimento, e poder registrar quando for abastecer novamente. | 8 | 1 | [✅] |
| 5 | Alta | Como Gestor da IPEM, quero **registrar novos funcionários e viaturas** no sistema.| 8 | 1 | [✅] |

<br>

## 🏃 Definition of Ready  

| Critério | Descrição |
|-----------|------------|
|User Story clara e completa | Cada história está escrita no formato “Como [usuário], quero [funcionalidade], para [benefício]”. |
|Critérios de aceitação definidos | Todos os critérios de aceitação foram definidos e validados pelo Product Owner. |
|Sem bloqueios | Nenhuma dependência técnica impede o desenvolvimento da história. |
|História compreendida pela equipe | A equipe compreende o escopo e concorda com a estimativa atribuída. |
|Estimativa realizada | As histórias foram estimadas com base em Planning Poker. |
|Artefatos disponíveis | Foram anexados wireframes das telas de chat, solicitação, histórico e cadastro de professores. |
|Estratégia de testes definida | Foram planejados os testes de envio/recebimento de mensagens, criação de solicitações e cadastro de técnicos. |

<h2 id='artefatos'> 🧾 Artefatos Correlatos </h2>

Abaixo estão listados os documentos e representações técnicas que dão suporte à primeira entrega do projeto:

* 🖼️ **Wireframes das telas:** Protótipos das interfaces de Login, Menu do Técnico (Check-in/Out), Registro de Abastecimento e Painel Administrativo do Gestor.
* 🗄️ **Modelo de dados atualizado:** Estrutura de entidades no MySQL contendo as tabelas de Usuários (Funcionários), Viaturas e Logs de utilização.
* 🧪 **Estratégia de testes definida:** Definição dos cenários de validação para autenticação segura, persistência de dados no banco e regras de negócio para quilometragem.
* 📂 **Documentação e design disponíveis:** Todos os diagramas de fluxo, scripts SQL de criação do banco e arquivos de design organizados na pasta `/docs/Sprint1`.

---
<br>

## 🏆 Definition of Done (DoD)

| Critério | Descrição | Status |
|-----------|------------|---------|
| Código desenvolvido e funcional | A funcionalidade foi implementada conforme os critérios de aceitação e está operando corretamente. | [✅] |
| Código versionado no Git | O código foi commitado seguindo o padrão de mensagens definido (`feat(#id): descrição`). | [✅] |
| Branch específica criada | A história foi desenvolvida em uma branch própria (`feature/<nome-da-funcionalidade>`). | [✅] |
| Code Review realizado | O código passou por revisão de pelo menos um membro da equipe via Pull Request. | [✅] |
| Código limpo e comentado | Não há trechos comentados desnecessariamente e o código segue boas práticas de legibilidade. | [✅] |
| Testes executados com sucesso | Todos os testes unitários e funcionais previstos foram executados e aprovados. | [✅] |
| Documentação atualizada | A documentação técnica e/ou de usuário foi atualizada no repositório (`/docs`). | [✅] |
| Incremento apresentado | A funcionalidade foi demonstrada ao cliente em review de Sprint com vídeo ou demonstração ao vivo. | [✅] |


<br>


<h2 id='membros'> 👥 Membros </h2>

| Foto | Nome | Função | Github |
| :---------: | :---------: | :---------------------: | :-----------------: |
| <img src="https://avatars.githubusercontent.com/u/73396751?s=400&u=e44a85b1956ab445b8ac2751ae194d29d74b9632&v=4" width=50px> | Daniel Natan | Product Owner | <a href="https://github.com/danieldanka"><img src="https://img.shields.io/badge/GitHub-100000?style=for-the-badge&logo=github&logoColor=white"></a>|
| <img src="https://avatars.githubusercontent.com/u/264030764?v=4" width=50px> | Samir | Scrum Master | <a href="https://share.google/yripwQuvg7AHkaXP0"><img src="https://img.shields.io/badge/GitHub-100000?style=for-the-badge&logo=github&logoColor=white"></a> |
| <img src="https://avatars.githubusercontent.com/u/180232646?v=4" width = 50> | Guilherme Gomes | Desenvolvedor | <a href="https://github.com/guilhermegcris"><img src="https://img.shields.io/badge/GitHub-100000?style=for-the-badge&logo=github&logoColor=white"></a>  |
| <img src="https://avatars.githubusercontent.com/u/180231525?v=4" width=50px> | João Gabriel | Desenvolvedor | <a href="https://github.com/jjoaoGabriel"><img src="https://img.shields.io/badge/GitHub-100000?style=for-the-badge&logo=github&logoColor=white"></a> |
| <img src="https://avatars.githubusercontent.com/u/184759398?v=4" width=50px> | Leonardo Graciano | Desenvolvedor | <a href="https://github.com/LeonardoGracianoOliveira"><img src="https://img.shields.io/badge/GitHub-100000?style=for-the-badge&logo=github&logoColor=white"></a> |
| <img src="https://avatars.githubusercontent.com/u/179888153?v=4" width=50px> | Luan | Desenvolvedor | <a href="https://github.com/SantoszLuan"><img src="https://img.shields.io/badge/GitHub-100000?style=for-the-badge&logo=github&logoColor=white"></a> |
| <img src="https://avatars.githubusercontent.com/u/162627331?v=4" width=50px> | Niuan Souza | Desenvolvedor | <a href="https://github.com/NiuanSouza"><img src="https://img.shields.io/badge/GitHub-100000?style=for-the-badge&logo=github&logoColor=white"></a> |
| <img src="https://avatars.githubusercontent.com/u/206007960?v=4" width=50px> | Vitor Samuel | Desenvolvedor | <a href="https://github.com/VitorRibeiro09"><img src="https://img.shields.io/badge/GitHub-100000?style=for-the-badge&logo=github&logoColor=white"></a> |