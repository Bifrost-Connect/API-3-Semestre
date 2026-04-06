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
| 1| Alta |Como Técnico do IPEM, quero **registrar o KM inicial, data e horário** ao retirar o veículo. | 8 | 1 |
| 2 | Alta | Como técnico do IPEM, quero **registrar o KM final** ao devolver a viatura. | 8 | 1 |
| 3 | Alta | Como Técnico da IPEM, quero **ter o controle do abastecimento da viatura**, para saber o último abastecimento, e poder registrar quando for abastecer novamente. | 8 | 1 |
| 4 | Alta | Como Gestor da IPEM, quero **registrar novos funcionários e viaturas** no sistema.| 8 | 1 |
| 5 | Alta | Como Gestor da IPEM , quero **ter o controle das viaturas que estão disponíveis e as que estão em uso** pelo meu sistema. | 8 | 2 |
| 6 | Alta | Como Gestor da IPEM, quero **ter acesso aos documentos com o compilado de informações** de cada viatura e chamados. | 5 | 2 |
| 7 | Média | Como Técnico da IPEM, quero poder **fazer comentários sobre o estado viatura** no final do relatório. | 3 | 2 |
| 8 | Baixa | Como Técnico da IPEM, quero **cancelar um Check-in caso tenha selecionado a viatura errada por engano**, antes de iniciar o trajeto.| 3 | 2 |
| 9 | Alta | Como Gestor da IPEM, quero **enviar o arquivo com os registros da sede no ao final do mês**, para envio ao SGI. | 8 | 3 |
| 10 | Alta | Como Técnico do IPEM, quero **contactar o suporte de mecânica** caso aja algum problema com a viatura. | 5 | 3 |
| 11 | Média | Como Gestor, quero um **log de atividades (auditoria) para saber quem alterou dados de KM ou de funcionários** e quando isso ocorreu. | 5 | 3 |
| 12| Baixa | Como técnico da IPEM, quero **acessar o GPS do aplicativo para ter noção do trajeto** a ser percorrido no chamado.  | 8 | 3 |
| 13 | Baixa | Como Gestor da IPEM, quero **fazer alterações nos perfis** dos técnicos e de viaturas.  | 3 | 3 |

<br>


## 🏃 Detalhamento das User Stories (Definition of Ready Completo)

Para acessar as Regras de Negócio detalhadas, Tipos de Dados, Validações e Mensagens de cada funcionalidade, clique no link abaixo:

👉 **[🔍 Acesse aqui o Detalhamento das User Stories](./docs/processo/DoR/DoR%20Backlog%20do%20Produto)**

<br>

## 🟢 Evidências de Conclusão (DoD)

Para garantir que cada User Story entregue cumpre todos os requisitos de qualidade (testes, revisão de código e documentação), mantemos um registro detalhado de cada incremento:

👉 **[📊 Visualizar Relatório de Testes e Evidências](./docs/processo/DoD/README.md)**

<br>


<h2 id='sprints'> 📌 Cronograma de Sprints </h2>

| Sprint | Período | Entregas | Documentação |
|--------|---------|----------|:--------------:|
| 1 | 16/03 a 05/04 | Login, Módulos Administrativos e Funções Técnicas (Check-in/Out). | [Sprint 1](./docs/processo/sprints/README.md) |
| 2 | 13/04 a 03/05 | Controle de Disponibilidade, Cálculo de KM e Comentários. | [Sprint 2](./docs/sprint2.md) |
| 3 | 11/05 a 31/05 | Exportação SGI, Suporte Mecânico e Auditoria. | [Sprint 3](./docs/sprint3.md) |

---

<br>
<h2 id='manual-instalacao'> 📘 Manual de Instalação </h2>

Este guia fornece as instruções detalhadas para configurar o ambiente de desenvolvimento e executar o projeto **Bifrost Connect** em sua máquina local.


## 🛠️ 1. Pré-requisitos

Antes de iniciar, certifique-se de ter os seguintes programas instalados:

* **Git:** Sistema de controle de versão distribuído, usado para gerenciar o código.
    * 📥 **Instalação:** Acesse [Download Git](https://git-scm.com/downloads), escolha a versão para seu SO e siga as instruções.
    * ✅ **Verificação:** Abra o terminal e digite: <br>`git --version`
* **Java JDK (24 ou superior):** Necessário para rodar o backend e ferramentas como o Maven.
    * 📥 **Instalação:** Acesse [Download Java JDK](https://www.oracle.com/java/technologies/downloads/), baixe o instalador e configure a variável de ambiente `JAVA_HOME`.
    * ✅ **Verificação:** Abra o terminal e digite:<br> `java -version`
* **Maven:** Ferramenta de automação e gerenciamento de dependências para projetos Java.
    * 📥 **Instalação:** Baixe em [Download Maven](https://maven.apache.org/download.cgi), extraia em uma pasta (ex: `C:\apache-maven`) e adicione a pasta `bin` ao seu `PATH`.
    * ✅ **Verificação:** Abra o terminal e digite:<br> `mvn -version`
* **Visual Studio Code (VS Code):** Editor de código recomendado.
    * 📥 **Instalação:** Baixe em [Download VS Code](https://code.visualstudio.com/).
    * 🔌 **Extensões Recomendadas:** Instale o *Java Extension Pack*, *Maven for Java* e a extensão *MySQL*.
* **MySQL Workbench:** Interface gráfica para gerenciar o banco de dados MySQL.
    * 📥 **Instalação:** Baixe em [Download MySQL Workbench](https://dev.mysql.com/downloads/workbench/) e configure uma conexão local.
    * ✅ **Verificação:** Teste a conexão e execute: <br>`SELECT VERSION();`

---

### 🚀 2. Configuração e Execução do Projeto

Siga os passos abaixo para colocar a aplicação em funcionamento:

1.  **Clonar o Repositório:**
    Abra o terminal na pasta desejada e execute:
    ```bash
    git clone [https://github.com/SEU_USUARIO/API_3-_semestre.git](https://github.com/SEU_USUARIO/API_3-_semestre.git)
    cd API_3-_semestre
    ```

2.  **Configurar o Banco de Dados:**
    * Abra o **MySQL Workbench** e conecte-se ao seu servidor local.
    * Crie o schema: `CREATE DATABASE ipem_db;`
    * Localize o script SQL em `/docs/database/` e execute-o para criar as tabelas de usuários e viaturas.
    * **Atenção:** No seu código Java (classe de conexão JDBC), certifique-se de que a URL, o usuário e a senha coincidem com as suas configurações locais.

3.  **Abrir no VS Code:**
    * Abra a pasta raiz do projeto no VS Code.
    * Aguarde o Maven baixar as dependências automaticamente (verifique o ícone de progresso no canto inferior).

4.  **Rodar a Aplicação:**
    * Você pode clicar com o botão direito na classe principal (`App.java` ou `Main.java`) e selecionar **Run**.
    * Ou utilizar o terminal do VS Code:
    ```bash
    mvn clean compile javafx:run
    ```

---

### 🛠️ 3. Solução de Problemas (FAQ)

* **Erro de Driver MySQL:** Verifique se a dependência do `mysql-connector-j` está correta no arquivo `pom.xml`.
* **Variáveis de Ambiente:** Se os comandos `java` ou `mvn` não funcionarem, revise se os caminhos foram adicionados corretamente ao `PATH` do sistema.
* **Conexão Recusada:** Verifique se o serviço do MySQL está rodando (no Windows, procure por "Serviços" e veja se o MySQL está "Em Execução").

---

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
