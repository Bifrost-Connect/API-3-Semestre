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
<a href="#membros">👥 Membros</a>

</div>

<br>

<table>
  <tr>
    <td><strong>Status do Projeto:</strong></td>
    <td>🟡 Em andamento</td>
  </tr>
  <tr>
    <td><strong>MVP</strong></td>
    <td> <a href="https://youtu.be/EologluBPWg">
  <img src="https://img.youtube.com/vi/ID_DO_VIDEO/0.jpg" alt="Assista ao vídeo" width="600">
</a></td>
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

<a name="tecnologias"></a>
<h2> 💻 Tecnologias </h2>

<div align="center">
  <img src="https://github.com/Bifrost-Connect/API-3-Semestre/blob/main/docs/processo/technologies.png" alt="Tecnologias Utilizadas" width="800">
</div>

<br>

<h2><a names="sprints"></a> 📌 Cronograma de Sprints </h2>
<a name="sprints"></a>

<table>
  <thead>
    <tr>
      <th>Sprint</th>
      <th>Período</th>
      <th>Entregas Principais</th>
      <th>Documentação</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td><strong>1</strong></td>
      <td>16/03 a 05/04</td>
      <td>Login, Módulos Administrativos e Funções Técnicas (Check-in/Out).</td>
      <td><a href="./docs/processo/sprints/Sprint%201">📂 Ver Sprint 1</a></td>
    </tr>
    <tr>
      <td><strong>2</strong></td>
      <td>13/04 a 03/05</td>
      <td>Controle de Disponibilidade, Cálculo de KM e Comentários.</td>
      <td><a href="./docs/processo/sprints/Sprint%202">📂 Ver Sprint 2</a></td>
    </tr>
    <tr>
      <td><strong>3</strong></td>
      <td>11/05 a 31/05</td>
      <td>Exportação SGI, Suporte Mecânico e Auditoria.</td>
      <td><a href="./docs/processo/sprints/Sprint%203">📂 Ver Sprint 3</a></td>
    </tr>
  </tbody>
</table>

<br>

<a name="manual-instalacao"></a>
<h2> 📘 Manual de Instalação </h2>

<p>Este guia fornece as instruções detalhadas para configurar o ambiente de desenvolvimento e executar o projeto <strong>Bifrost Connect</strong> em sua máquina local.</p>

<table>
  <thead>
    <tr>
      <th>Ferramenta</th>
      <th>Ação / Instalação</th>
      <th>Verificação</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td><strong>Git</strong></td>
      <td><a href="https://git-scm.com/downloads">📥 Download Git</a></td>
      <td><code>git --version</code></td>
    </tr>
    <tr>
      <td><strong>Java JDK (24+)</strong></td>
      <td><a href="https://www.oracle.com/java/technologies/downloads/">📥 Download JDK</a></td>
      <td><code>java -version</code></td>
    </tr>
    <tr>
      <td><strong>Maven</strong></td>
      <td><a href="https://maven.apache.org/download.cgi">📥 Download Maven</a></td>
      <td><code>mvn -version</code></td>
    </tr>
    <tr>
      <td><strong>VS Code</strong></td>
      <td><a href="https://code.visualstudio.com/">📥 Download VS Code</a></td>
      <td>--</td>
    </tr>
    <tr>
      <td><strong>MySQL Workbench</strong></td>
      <td><a href="https://dev.mysql.com/downloads/workbench/">📥 Download Workbench</a></td>
      <td><code>SELECT VERSION();</code></td>
    </tr>
  </tbody>
</table>

<br>

<a name="versionamento"></a>
<h2> 🌳 Estratégia de Versionamento </h2>

<table>
  <tr>
    <td><strong>main</strong></td>
    <td>Versão estável e produtiva</td>
  </tr>
  <tr>
    <td><strong>develop</strong></td>
    <td>Integração de novas funcionalidades</td>
  </tr>
  <tr>
    <td><strong>feature/*</strong></td>
    <td>Desenvolvimento de novas funcionalidades</td>
  </tr>
  <tr>
    <td><strong>bugfix/*</strong></td>
    <td>Correções de erros</td>
  </tr>
</table>

<br>

<h2> 📦 Estrutura do Projeto </h2>

<table>
  <tr>
    <td>
      <pre>
src/
 ├── controller  # Lógica de controle e fluxo
 ├── service     # Regras de negócio
 ├── repository  # Persistência de dados
 └── model       # Entidades e classes de dados
      </pre>
    </td>
  </tr>
</table>

<br>

<a name="execucao"></a>
<h2>🚀 2. Configuração e Execução do Projeto</h2>

<p>Siga os passos abaixo para colocar a aplicação em funcionamento:</p>

<table>
  <thead>
    <tr>
      <th>Passo</th>
      <th>Ação</th>
      <th>Comando / Instrução</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td><strong>1. Clonar</strong></td>
      <td>Clone o repositório e acesse a pasta do projeto.</td>
      <td><code>git clone https://github.com/SEU_USUARIO/API_3-_semestre.git</code><br><code>cd API_3-_semestre</code></td>
    </tr>
    <tr>
      <td><strong>2. Banco de Dados</strong></td>
      <td>Configure o MySQL Workbench e execute o script SQL.</td>
      <td>Crie o schema: <code>CREATE DATABASE ipem_db;</code><br>Localize o script em: <code>/docs/database/</code></td>
    </tr>
    <tr>
      <td><strong>3. Ambiente</strong></td>
      <td>Abra no VS Code e aguarde as dependências.</td>
      <td>O <strong>Maven</strong> baixará as bibliotecas automaticamente ao abrir a pasta raiz.</td>
    </tr>
    <tr>
      <td><strong>4. Execução</strong></td>
      <td>Inicie a aplicação via interface ou terminal.</td>
      <td><code>mvn clean compile javafx:run</code><br>Ou botão direito em <code>App.java</code> > <strong>Run</strong></td>
    </tr>
  </tbody>
</table>

<br>

<blockquote>
  <strong>⚠️ Atenção:</strong> No seu código Java (classe de conexão JDBC), certifique-se de que a URL, o usuário e a senha coincidem com as suas configurações locais do MySQL.
</blockquote>

<br>

### 🛠️ 3. Solução de Problemas (FAQ)

* **Erro de Driver MySQL:** Verifique se a dependência do `mysql-connector-j` está correta no arquivo `pom.xml`.
* **Variáveis de Ambiente:** Se os comandos `java` ou `mvn` não funcionarem, revise se os caminhos foram adicionados corretamente ao `PATH` do sistema.
* **Conexão Recusada:** Verifique se o serviço do MySQL está rodando (no Windows, procure por "Serviços" e veja se o MySQL está "Em Execução").

---

<h2> # 📝 Padrão de Commits </h2>
<img src="https://github.com/Bifrost-Connect/API-3-Semestre/blob/main/docs/processo/commit_structure.png">

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
