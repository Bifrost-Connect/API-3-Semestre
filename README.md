<a name="topo"></a>
<h1 align="center">API 3º Semestre - Sistema de Gestão de Frotas</h1>

<div align="center">
  <img src="docs/logo.png" alt="Logo do Projeto" width="100%">
</div>

---

<div align="center">

<a href="#desafio">🎯 Desafio</a> | 
<a href="#objetivo">✅ Objetivo</a> | 
<a href="#product-backlog">📖 Backlog do Produto</a> | 
<a href="#detalhamento-stories">🏃 Detalhamento das User Stories (DoR)</a> | 
<a href="#evidencias-dod">🟢 Evidências de Conclusão (DoD)</a> | 
<a href="#tecnologias">💻 Tecnologias</a> | 
<a href="#sprints">📌 Cronograma de Sprints</a> | 
<a href="#manual-instalacao">📘 Manual de Instalação</a> | 
<a href="#mvp">MVP</a> |
<a href="#membros">👥 Membros</a>

</div>

<br>

<table>
  <tr>
    <td><strong>Status do Projeto:</strong></td>
    <td>🟡 Em andamento</td>
  </tr>
</table>

<br>

<BR>
<h2><a name="desafio"></a>## 📌 Desafio Proposto</h2>
<p>Atualizar o processo de informações sobre o uso das viaturas próprias da empresa IPEM, e no envio destes dados ao SGI mensalmente. Atualmente é um trabalho manual feito pelos funcionários em pranchetas contidas em cada viatura. O desafio é modernizar esse problema, para que os Técnicos que utilizem as viaturas possam ter esse controle tecnológico dos registros e para o Gestor que ira subir aos dados ao final do mês tenha uma facilidade maior em manejar estes dados.</p>

<br>

<h2><a name="objetivo"></a>## 🎯 Objetivo</h2>
<p>A Bifrost Connect Permitirá que os técnicos tenham acesso á uma interface interativa, onde irão poder de maneira digital, fornecer informações sobre o serviço que irão realizar e as estatísticas do veículo ao decorrer do mesmo, para que consigam enviar este relatório completo ao Gestor, onde ele poderá separar as informações de forma mais precisa e ágil para o envio ao SGI.</p>

<br>

<h2><a name="product-backlog"></a> 📖 Backlog do Produto </h2>

| Rank | Prioridade | User Story | Estimativa | Sprint |
|------|-------------|-------------|-------------|---------|
| 1| Alta |Como Técnico do IPEM, **quero ter o KM inicial, data e horário ao retirar registrados ao retirar o veículo**, para que a jornada de uso da viatura seja iniciada com dados precisos.. | 8 | 1 |
| 2 | Alta | Como técnico do IPEM, **quero registrar o KM final ao devolver a viatura**, para que o sistema encerre o ciclo de uso e atualize a quilometragem total do veículo. | 8 | 1 |
| 3 | Alta | Como Técnico da IPEM, **quero ter o controle e o registro do abastecimento da viatura**, para que o histórico de consumo seja mantido e os custos de combustível sejam monitorados. | 8 | 1 |
| 4 | Alta | Como Gestor da IPEM, **quero registrar novos funcionários e viaturas no sistema**, para que a base de usuários e a frota estejam sempre atualizadas para a operação.| 8 | 1 |
| 5 | Alta | Como Gestor da IPEM , **quero ter o controle das viaturas que estão disponíveis e as que estão em uso** ,para que eu possa gerenciar a alocação da frota em tempo real. | 8 | 2 |
| 6 | Alta | Como Gestor da IPEM, **quero ter acesso aos documentos com o compilado de informações** de cada viatura e chamados,para que eu possa auditar o histórico de uso de forma organizada. | 5 | 2 |
| 7 | Média | Como Técnico da IPEM, **quero cancelar um Check-in caso tenha selecionado a viatura errada por engano**, antes de iniciar o trajeto,para que o histórico de registros não contenha dados incorretos por falha operacional.| 3 | 2 |
| 8 | Alta | Como Gestor da IPEM, **quero enviar o arquivo com os registros da sede no ao final do mês**,para que o envio dos dados ao SGI seja realizado de forma automatizada e sem erros manuais.| 8 | 3 |
| 9 | Alta | Como Técnico do IPEM, **quero contactar o suporte de mecânica** caso aja algum problema com a viatura,para que problemas emergenciais com a viatura sejam resolvidos com agilidade durante o chamado. | 5 | 3 |
| 10 | Média | Como Gestor, quero um **log de atividades (auditoria) para saber quem alterou dados de KM ou de funcionários**,para que eu possa identificar quem alterou dados críticos e garantir a integridade das informações do sistema.. | 5 | 3 |
| 11 | Baixa | Como técnico da IPEM, **quero acessar o GPS do aplicativo para ter noção do trajeto**,para que eu tenha auxílio na navegação e otimização do trajeto a ser percorrido.  | 8 | 3 |
| 12 | Baixa | Como Gestor da IPEM, **quero poder editar os perfis de técnicos e viaturas**, para que informações desatualizadas ou incorretas sejam corrigidas rapidamente.  | 3 | 3 |

<br>

<h2><a name="detalhamento-stories"></a>🏃 Detalhamento das User Stories (DoR)</h2>
<table>
  <thead>
    <tr>
      <th>Conteúdo Disponível</th>
      <th>Link de Acesso</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>Regras de Negócio, Tipos de Dados, Validações e Mensagens detalhadas de cada funcionalidade.</td>
      <td><a href="./docs/processo/DoR/DoR%20Backlog%20do%20Produto">🔍 Acessar Detalhamento</a></td>
    </tr>
  </tbody>
</table>

<br>

<h2><a name="evidencias-dod"></a>🟢 Evidências de Conclusão (DoD)</h2>
<table>
  <thead>
    <tr>
      <th>Garantia de Qualidade</th>
      <th>Relatório Completo</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>Registro de testes unitários, funcionais, revisões de código e evidências de incremento.</td>
      <td><a href="https://github.com/Bifrost-Connect/API-3-Semestre/blob/main/docs/processo/DoD/Definition%20of%20Done.md">📊 Visualizar Evidências</a></td>
    </tr>
  </tbody>
</table>
<br>

<h2><a names="tecnologias"></a> 💻 Tecnologias </h2>
<img src="https://github.com/Bifrost-Connect/API-3-Semestre/blob/main/docs/processo/technologies.png">


<h2><a names="sprints"></a> 📌 Cronograma de Sprints </h2>

| Sprint | Período | Entregas | Documentação |
|--------|---------|----------|:--------------:|
| 1 | 16/03 a 05/04 | Login, Módulos Administrativos e Funções Técnicas (Check-in/Out). | [Sprint 1](./docs/processo/sprints/Sprint%1) |
| 2 | 13/04 a 03/05 | Controle de Disponibilidade, Cálculo de KM e Comentários. | [Sprint 2](./docs/processo/sprints/Sprint%2) |
| 3 | 11/05 a 31/05 | Exportação SGI, Suporte Mecânico e Auditoria. | [Sprint 3](./docs/processo/sprints/Sprint%3) |

---

<br>
<h2><a names="manual-instalacao"></a> 📘 Manual de Instalação </h2>

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

<h2><a name="mvp"></a>MVP </h2>
<a href="https://youtu.be/EologluBPWg">
  <img src="https://img.youtube.com/vi/ID_DO_VIDEO/0.jpg" alt="Assista ao vídeo" width="600">
</a>

<br>

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

<h2> # 📝 Padrão de Commits </h2>
<img src="https://github.com/Bifrost-Connect/API-3-Semestre/blob/main/docs/processo/commit_structure.png">
