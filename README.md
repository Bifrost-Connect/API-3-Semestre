<h1># API_3-_semestre</h1>

![alt text](docs/logo.png)

---
<div align="center">
<a href='#topo'
<a href="#desafio"> 🎯 Desafio </a> |
<a href="#proposta"> ✅ Proposta de Solução </a> |
<a href="#product-backlog"> 📖 Backlog do Produto </a> | 
<a href="#sprints"> 📌 Cronograma de Sprints </a> |
<a href="#tecnologias"> 💻 Tecnologias </a> |
<a href="#Manual de Instalação"> 📘 Manual de Instalação </a> |
<a href="#membros"> 👥 Membros </a> |
</div>

<br>

> **Status do Projeto:** Em andamento    
> **Relatório de Testes:** [MD]() 📊  
> **Pasta de Documentação:** [Docs]() 📄   


<br>

<BR>
<h2>## 📌 Desafio Proposto</h2>
<p>Atualizar o processo de informações sobre o uso das viaturas próprias da empresa IPEM, e no envio destes dados ao SGI mensalmente. Atualmente é um trabalho manual feito pelos funcionários em pranchetas contidas em cada viatura. O desafio é modernizar esse problema, para que os Técnicos que utilizem as viaturas possam ter esse controle tecnológico dos registros e para o Gestor que ira subir aos dados ao final do mês tenha uma facilidade maior em manejar estes dados.</p>

<br>

<h2>## 🎯 Objetivo</h2>
<p>A Bifrost Connect Permitirá que os técnicos tenham acesso á uma interface interativa, onde irão poder de maneira digital, fornecer informações sobre o serviço que irão realizar e as estatísticas do veículo ao decorrer do mesmo, para que consigam enviar este relatório completo ao Gestor, onde ele poderá separar as informações de forma mais precisa e ágil para o envio ao SGI.</p>

<br>

<h1 id='product-backlog'> 📖 Backlog do Produto </h1>


| Rank | Prioridade | User Story | Estimativa | Sprint |
|------|-------------|-------------|-------------|---------|
| 1 | Alta | Como Usuário (Técnico ou Gestor), quero **realizar login com minha funcional/senha** para que meus registros sejam vinculados automaticamente ao meu perfil. | 8 | 1 |
| 2 | Alta |Como Técnico do IPEM, quero **registrar o KM inicial, data e horário** ao retirar o veículo. | 8 | 1 |
| 3 | Alta | Como técnico do IPEM, quero **registrar o KM final** ao devolver a viatura. | 8 | 1 |
| 4 | Alta | Como Técnico da IPEM, quero **ter o controle do abastecimento da viatura**, para saber o último abastecimento, e poder registrar quando for abastecer novamente. | 8 | 1 |
| 5 | Alta | Como Gestor da IPEM, quero **registrar novos funcionários e viaturas** no sistema.| 8 | 1 |
| 6 | Alta | Como Gestor da IPEM , quero **ter o controle das viaturas que estão disponíveis e as que estão em uso** pelo meu sistema. | 8 | 2 |
| 7 | Alta | Como Gestor da IPEM, quero **ter acesso aos documentos com o compilado de informações** de cada viatura e chamados. | 5 | 2 |
| 8 | Média | Como técnico da IPEM, quero que **o sistema calcule automaticamente a distância percorrida** com a viatura. | 3 | 2 |
| 9 | Média | Como Técnico da IPEM, quero poder **fazer comentários sobre o estado viatura** no final do relatório. | 3 | 2 |
| 10 | Baixa | Como Técnico da IPEM, quero **cancelar um Check-in caso tenha selecionado a viatura errada por engano**, antes de iniciar o trajeto.| 3 | 2 |
| 11 | Alta | Como Gestor da IPEM, quero **enviar o arquivo com os registros da sede no ao final do mês**, para envio ao SGI. | 8 | 3 |
| 12 | Alta | Como Técnico do IPEM, quero **contactar o suporte de mecânica** caso aja algum problema com a viatura. | 5 | 3 |
| 13 | Média | Como Gestor, quero um **log de atividades (auditoria) para saber quem alterou dados de KM ou de funcionários** e quando isso ocorreu. | 5 | 3 |
| 14 | Baixa | Como técnico da IPEM, quero **acessar o GPS do aplicativo para ter noção do trajeto** a ser percorrido no chamado.  | 8 | 3 |
| 15 | Baixa | Como Gestor da IPEM, quero **fazer alterações nos perfis** dos técnicos e de viaturas.  | 3 | 3 |

<br>

## 🏃 Definition of Ready (DoR) 

| Critério | Descrição | Status |
|-----------|------------|---------|
|  Título e Descrição claros | A User Story possui um título e uma descrição seguindo o formato: “Como [usuário], quero [funcionalidade] para [benefício]”. | [ ] |
|  Critérios de Aceitação definidos | Todos os critérios de aceitação foram definidos e validados pelo Product Owner. | [ ] |
| Sem dependências bloqueadoras | Não há dependências técnicas, funcionais ou externas que impeçam o desenvolvimento da User Story. | [ ] |
| Compreensão validada pelo time | Todos os membros da equipe compreendem a história e concordam com o esforço estimado. | [ ] |
| Estimativa de esforço realizada | A história possui uma estimativa de Story Points definida com base em Planning Poker. | [ ] |
| Artefatos correlatos disponíveis| Foram anexados wireframes, fluxogramas, modelo de dados ou outros artefatos que auxiliem o desenvolvimento. | [ ] |
|  Estratégia de teste definida | Foram planejados cenários de teste ou estratégias de validação da funcionalidade. | [ ] |

---

<br>

## 🏆 Definition of Done (DoD)

| Critério | Descrição | Status |
|-----------|------------|---------|
| Código desenvolvido e funcional | A funcionalidade foi implementada conforme os critérios de aceitação e está operando corretamente. | [ ] |
| Código versionado no Git | O código foi commitado seguindo o padrão de mensagens definido (`feat(#id): descrição`). | [ ] |
| Branch específica criada | A história foi desenvolvida em uma branch própria (`feature/<nome-da-funcionalidade>`). | [ ] |
| Code Review realizado | O código passou por revisão de pelo menos um membro da equipe via Pull Request. | [ ] |
| Código limpo e comentado | Não há trechos comentados desnecessariamente e o código segue boas práticas de legibilidade. | [ ] |
| Testes executados com sucesso | Todos os testes unitários e funcionais previstos foram executados e aprovados. | [ ] |
| Documentação atualizada | A documentação técnica e/ou de usuário foi atualizada no repositório (`/docs`). | [ ] |
| Incremento apresentado | A funcionalidade foi demonstrada ao cliente/professor em review de Sprint com vídeo ou demonstração ao vivo. | [ ] |

---

<br>

<h2 id='membros'> 👥 Membros </h2>

| Foto | Nome | Função | Github |
| :---------: | :---------: | :---------------------: | :-----------------: |
| <img src="https://avatars.githubusercontent.com/u/73396751?s=400&u=e44a85b1956ab445b8ac2751ae194d29d74b9632&v=4" width=50px> | Daniel Natan | Product Owner | <a href="https://github.com/danieldanka"><img src="https://img.shields.io/badge/GitHub-100000?style=for-the-badge&logo=github&logoColor=white"></a>|
| <img src="" width=50px> | Samir | Scrum Master | <a href="https://share.google/yripwQuvg7AHkaXP0"><img src="https://img.shields.io/badge/GitHub-100000?style=for-the-badge&logo=github&logoColor=white"></a> |
| <img src="https://media.licdn.com/dms/image/v2/D4D03AQEvcTc_ydKXOQ/profile-displayphoto-scale_400_400/B4DZjt2eeqG8Ao-/0/1756337140235?e=1773878400&v=beta&t=FEJwlOv1Amuv234X7KEPpYaKI7XjmxkY5iR9oDKgQIs" width=50px> | Guilherme Gomes | Desenvolvedor | <a href="https://github.com/guilhermegcris"><img src="https://img.shields.io/badge/GitHub-100000?style=for-the-badge&logo=github&logoColor=white"></a>  |
| <img src="" width=50px> | João Gabriel | Desenvolvedor | <a href="https://github.com/jjoaoGabriel"><img src="https://img.shields.io/badge/GitHub-100000?style=for-the-badge&logo=github&logoColor=white"></a> |
| <img src="https://avatars.githubusercontent.com/u/184759398?v=4" width=50px> | Leonardo Graciano | Desenvolvedor | <a href="https://github.com/LeonardoGracianoOliveira"><img src="https://img.shields.io/badge/GitHub-100000?style=for-the-badge&logo=github&logoColor=white"></a> |
| <img src="https://avatars.githubusercontent.com/u/179888153?v=4" width=50px> | Luan | Desenvolvedor | <a href="https://github.com/SantoszLuan"><img src="https://img.shields.io/badge/GitHub-100000?style=for-the-badge&logo=github&logoColor=white"></a> |
| <img src="https://avatars.githubusercontent.com/u/162627331?v=4" width=50px> | Niuan Souza | Desenvolvedor | <a href="https://github.com/NiuanSouza"><img src="https://img.shields.io/badge/GitHub-100000?style=for-the-badge&logo=github&logoColor=white"></a> |
| <img src="https://avatars.githubusercontent.com/u/206007960?v=4" width=50px> | Vitor Samuel | Desenvolvedor | <a href="https://github.com/VitorRibeiro09"><img src="https://img.shields.io/badge/GitHub-100000?style=for-the-badge&logo=github&logoColor=white"></a> |

---
<br>



<h2 id='sprints'> 📌 Cronograma de Sprints </h2>

| Sprint | Período | Entregas | Documentação |
|--------|---------|----------|--------|
| 1 | 16/03 a 50/4 | Entrega dos designs iniciais, juntamente com o sistema de autenticação, módulos administrativos e funções técnicas. | <a href = ""> sprint-1 |
| 2 | 13/04 a 03/05 |  | <a href = ""> sprint-2 </a>    |
| 3 | 11/05 a 31/05 |  | <a href = ""> sprint-3 </a>    |

---
<br>

<h2 id='tecnologias'> 💻 Tecnologias </h2>

[![Java](https://img.shields.io/badge/Java-007396?style=for-the-badge&logo=openjdk&logoColor=white)](https://www.java.com/)
[![Maven](https://img.shields.io/badge/Maven-C71A36?style=for-the-badge&logo=apachemaven&logoColor=white)](https://maven.apache.org/)
[![Git](https://img.shields.io/badge/git-%23F05033.svg?style=for-the-badge&logo=git&logoColor=white)](https://git-scm.com/)
[![MySQL](https://img.shields.io/badge/MySQL-4479A1?style=for-the-badge&logo=mysql&logoColor=white)](https://www.mysql.com/)
[![Discord](https://img.shields.io/badge/Discord-5865F2?style=for-the-badge&logo=discord&logoColor=white)](https://discord.com/)
[![GitHub](https://img.shields.io/badge/GitHub-181717?style=for-the-badge&logo=github&logoColor=white)](https://github.com/)
[![Slack](https://img.shields.io/badge/Slack-4A154B?style=for-the-badge&logo=slack&logoColor=white)](ttps://slack.com/intl/pt-br/)
[![Notion](https://img.shields.io/badge/Notion-%23000000.svg?style=for-the-badge&logo=notion&logoColor=white)](https://www.notion.com/)

---

<h2>## 🌳 Estratégia de Versionamento</h2>

- main → versão estável
- develop → integração
- feature/* → funcionalidades
- bugfix/* → correções

---

<h2>## 📦 Estrutura do Projeto</h2>
<code>
src/
 ├── controller
 ├── service
 ├── repository
 └── model
 </code>

---

<h2> # 📝 Padrão de Commits </h2>
<p>Os commits devem seguir o padrão **"Padrão de Commits – por Renato Adorno"** para manter a consistência e a clareza no repositório.</p>

---

<h3> ## 📌 Formato do Commit</h3>

```
<tipo>: descrição em tom de ação direta
<informações adicionais> (opcional)
```

---

<h3>## 🔖 Tipos de Commit</h3>

- **fix** – Soluciona um problema (bug fix). Relacionado ao PATCH no versionamento semântico.  
- **feat** – Inclui um novo recurso. Relacionado ao MINOR no versionamento semântico.  
- **docs** – Mudanças na documentação (como README). Não inclui alterações em código.  
- **style** – Alterações de formatação do código (espaços, indentação, ponto e vírgula, etc.). Não inclui alterações em código.  
- **refactor** – Refatorações que não alteram funcionalidades, mas melhoram performance ou legibilidade.  
- **build** – Modificações em arquivos de build e dependências.  
- **test** – Alterações em testes (criação, modificação ou remoção de testes unitários).  
- **chore** – Atualizações de tarefas administrativas ou configuração (ex.: ajustes no `.gitignore`).  

---

<h3>## 💡 Exemplos</h3>

- `feat: Adiciona botão de login na tela inicial`  
- `fix: Corrige bug no redirecionamento após login`  
- `refactor: Refatora lógica de autenticação para usar hooks`  
- `docs: Documenta processo de deploy no README`  
- `style: Remove espaços em branco desnecessários`  
