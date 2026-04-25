<h1 style="text-align: center;">📌 Sprint 01</h1>
<div align="center">
  <img src="../../logo.png" alt="Logo do Projeto">
</div>

<br />

<table>
  <thead>
    <tr>
      <th><a href="#backlog1">Backlog da Sprint 1</a></th>
      <th><a href="#dor">🏃 DoR</a></th>
      <th><a href="#dod">🏆 DoD</a></th>
      <th><a href="#artefatos">🧾 Artefatos Correlatos</a></th>
      <th><a href="#modelodados">Modelo de Dados</a></th>
      <th><a href="#mvp">MVP</a></th>
    </tr>
  </thead>
</table>

 **Status da Sprint:** Concluída 

<table>
  <tbody>
    <tr>
      <td><strong>Capacidade estimada da equipe</strong></td>
      <td>40 Story Points</td>
    </tr>
    <tr>
      <td><strong>Meta da Sprint</strong></td>
      <td>Entregar a base funcional do sistema para o usuário técnico: Fazer Check-In e Check-Out.</td>
    </tr>
    <tr>
      <td><strong>Período</strong></td>
      <td>16/03/2026 – 05/04/2026</td>
    </tr>
  </tbody>
</table>

<br>

<h2><a name="backlog1"></a>Backlog da Sprint 1</h2>
<table>
  <tbody>
    <tr>
      <td>1</td>
      <td>Alta</td>
      <td>Como Usuário (Técnico ou Gestor), quero <strong>realizar login com minha funcional/senha</strong> para que meus registros sejam vinculados automaticamente ao meu perfil.</td>
      <td>8</td>
      <td>1</td>
      <td>✅</td>
    </tr>
    <tr>
      <td>2</td>
      <td>Alta</td>
      <td>Como Técnico do IPEM, quero <strong>registrar o KM inicial, data e horário</strong> ao retirar o veículo.</td>
      <td>8</td>
      <td>1</td>
      <td>✅</td>
    </tr>
    <tr>
      <td>3</td>
      <td>Alta</td>
      <td>Como técnico do IPEM, quero <strong>registrar o KM final</strong> ao devolver a viatura.</td>
      <td>8</td>
      <td>1</td>
      <td>✅</td>
    </tr>
    <tr>
      <td>4</td>
      <td>Alta</td>
      <td>Como Técnico da IPEM, quero <strong>ter o controle do abastecimento da viatura</strong>, para saber o último abastecimento, e poder registrar quando for abastecer novamente.</td>
      <td>8</td>
      <td>1</td>
      <td>✅</td>
    </tr>
    <tr>
      <td>5</td>
      <td>Alta</td>
      <td>Como Gestor da IPEM, quero <strong>registrar novos funcionários e viaturas</strong> no sistema.</td>
      <td>8</td>
      <td>1</td>
      <td>✅</td>
    </tr>
  </tbody>
</table>

<br>

<h2><a name="dor"></a>🏃 Definition of Ready</h2>

<table>
  <thead>
    <tr>
      <th>Critério</th>
      <th>Descrição</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td><strong>User Story clara e completa</strong></td>
      <td>Cada história está escrita no formato “Como [usuário], quero [funcionalidade], para [benefício]”.</td>
    </tr>
    <tr>
      <td><strong>Critérios de aceitação definidos</strong></td>
      <td>Todos os critérios de aceitação foram definidos e validados pelo Product Owner.</td>
    </tr>
    <tr>
      <td><strong>Sem bloqueios</strong></td>
      <td>Nenhuma dependência técnica impede o desenvolvimento da história.</td>
    </tr>
    <tr>
      <td><strong>História compreendida pela equipe</strong></td>
      <td>A equipe compreende o escopo e concorda com a estimativa atribuída.</td>
    </tr>
    <tr>
      <td><strong>Estimativa realizada</strong></td>
      <td>As histórias foram estimadas com base em Planning Poker.</td>
    </tr>
    <tr>
      <td><strong>Artefatos disponíveis</strong></td>
      <td>Foram anexados wireframes das telas de chat, solicitação, histórico e cadastro de professores.</td>
    </tr>
    <tr>
      <td><strong>Estratégia de testes definida</strong></td>
      <td>Foram planejados os testes de envio/recebimento de mensagens, criação de solicitações e cadastro de técnicos.</td>
    </tr>
  </tbody>
</table>

<br>

<h2><a name="artefatos"></a> 🧾 Artefatos Correlatos </h2>

<table>
  <thead>
    <tr>
      <th>Recurso</th>
      <th>Descrição</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td><a href="#">🖼️ <strong>Wireframes das telas</strong></a></td>
      <td>Protótipos das interfaces de Login, Menu do Técnico (Check-in/Out), Registro de Abastecimento e Painel Administrativo do Gestor.</td>
    </tr>
    <tr>
      <td><a href="#">🗄️ <strong>Modelo de dados atualizado</strong></a></td>
      <td>Estrutura de entidades no MySQL contendo as tabelas de Usuários (Funcionários), Viaturas e Logs de utilização.</td>
    </tr>
    <tr>
      <td><a href="#">🧪 <strong>Estratégia de testes definida</strong></a></td>
      <td>Definição dos cenários de validação para autenticação segura, persistência de dados no banco e regras de negócio para quilometragem.</td>
    </tr>
    <tr>
      <td><a href="#">📂 <strong>Documentação e design disponíveis</strong></a></td>
      <td>Todos os diagramas de fluxo, scripts SQL de criação do banco e arquivos de design organizados na pasta <code>/docs/Sprint1</code>.</td>
    </tr>
  </tbody>
</table>

<br>

<h2><a name="dod"></a>🏆 Definition of Done (DoD)</h2>

<table>
  <thead>
    <tr>
      <th>Critério</th>
      <th>Descrição</th>
      <th>Status</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td><strong>Código desenvolvido e funcional</strong></td>
      <td>A funcionalidade foi implementada conforme os critérios de aceitação e está operando corretamente.</td>
      <td>✅</td>
    </tr>
    <tr>
      <td><strong>Código versionado no Git</strong></td>
      <td>O código foi commitado seguindo o padrão de mensagens definido (<code>feat(#id): descrição</code>).</td>
      <td>✅</td>
    </tr>
    <tr>
      <td><strong>Branch específica criada</strong></td>
      <td>A história foi desenvolvida em uma branch própria (<code>feature/&lt;nome-da-funcionalidade&gt;</code>).</td>
      <td>✅</td>
    </tr>
    <tr>
      <td><strong>Code Review realizado</strong></td>
      <td>O código passou por revisão de pelo menos um membro da equipe via Pull Request.</td>
      <td>✅</td>
    </tr>
    <tr>
      <td><strong>Código limpo e comentado</strong></td>
      <td>Não há trechos comentados desnecessariamente e o código segue boas práticas de legibilidade.</td>
      <td>✅</td>
    </tr>
    <tr>
      <td><strong>Testes executados com sucesso</strong></td>
      <td>Todos os testes unitários e funcionais previstos foram executados e aprovados.</td>
      <td>✅</td>
    </tr>
    <tr>
      <td><strong>Documentação atualizada</strong></td>
      <td>A documentação técnica e/ou de usuário foi atualizada no repositório (<code>/docs</code>).</td>
      <td>✅</td>
    </tr>
    <tr>
      <td><strong>Incremento apresentado</strong></td>
      <td>A funcionalidade foi demonstrada ao cliente em review de Sprint com vídeo ou demonstração ao vivo.</td>
      <td>✅</td>
    </tr>
  </tbody>
</table>

<br>

<h2 <a name="modelodados"></a>Modelo de Dados </h2>
<img src="" 
alt="Modelo de Dados">

<h2><a name="mvp"></a>MVP </h2>
<img src="[https:[//github.com/Sync-FATEC/API-2026-6SEM/assets/cf2ae83f-9e76-4ac0-8cf0-48ea02134a28](https://youtu.be/EologluBPWg?si=HjurGpJpuXEruf9C)](https://www.youtube.com/watch?v=EologluBPWg)" 
alt="MVP">
