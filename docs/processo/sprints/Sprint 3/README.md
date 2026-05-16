<h1 style="text-align: center;">📌 Sprint 03</h1>
<div align="center">
  <img src="https://github.com/Bifrost-Connect/API-3-Semestre/blob/main/docs/logo.png?raw=true">
</div>

<br />

<table>
  <thead>
    <tr>
      <th><a href="#backlog1">Backlog da Sprint 3</a></th>
      <th><a href="#dor">🏃 DoR</a></th>
      <th><a href="#dod">🏆 DoD</a></th>
      <th><a href="#artefatos">🧾 Artefatos Correlatos</a></th>
      <th><a href="#modelodados">Modelo de Dados</a></th>
      <th><a href="#mvp">MVP</a></th>
    </tr>
  </thead>
</table>

 **Status da Sprint:** Em andamento

 <table>
  <tbody>
    <tr>
      <td><strong>Capacidade estimada da equipe</strong></td>
      <td>29 Story Points</td>
    </tr>
    <tr>
      <td><strong>Meta da Sprint</strong></td>
      <td>Consolidar a segurança, a conformidade institucional e o encerramento do ciclo do sistema. </td>
    </tr>
    <tr>
      <td><strong>Período</strong></td>
      <td>11/05/2026 – 31/05/2026</td>
    </tr>
  </tbody>
</table>
 </br>
 
<h2><a name="backlog1"></a>Backlog da Sprint 3</h2>

| Rank | Prioridade | User Story | Estimativa | Sprint |
|------|-------------|-------------|-------------|---------|
| 1 | Alta | Como Gestor da IPEM, **quero enviar o arquivo com os registros da sede no ao final do mês**,para que o envio dos dados ao SGI seja realizado de forma automatizada e sem erros manuais.| 8 | 3 |
| 2 | Alta | Como Técnico do IPEM, **quero contactar o suporte de mecânica** caso aja algum problema com a viatura,para que problemas emergenciais com a viatura sejam resolvidos com agilidade durante o chamado. | 5 | 3 |
| 3 | Média | Como Gestor, quero um **log de atividades (auditoria) para saber quem alterou dados de KM ou de funcionários**,para que eu possa identificar quem alterou dados críticos e garantir a integridade das informações do sistema.. | 5 | 3 |
| 4 | Baixa | Como técnico da IPEM, **quero acessar o GPS do aplicativo para ter noção do trajeto**,para que eu tenha auxílio na navegação e otimização do trajeto a ser percorrido.  | 8 | 3 |
| 5 | Baixa | Como Gestor da IPEM, **quero poder editar os perfis de técnicos e viaturas**, para que informações desatualizadas ou incorretas sejam corrigidas rapidamente.  | 3 | 3 |

</br>

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
      <td>Foram anexados wireframes das telas de Técnico e Gestor, solicitação de viatura, histórico e histórico de abastecimento.</td>
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
      <td><a href="../../../Prot%C3%B3tipo%20da%20Aplica%C3%A7%C3%A3o">🖼️ <strong>Wireframes das telas</strong></a></td>
      <td>Protótipos das interfaces finais, incluindo as telas de importação de relatórios para o SGI, painel de logs/auditoria do Gestor e interface de acionamento do suporte mecânico.</td>
    </tr>
    <tr>
      <td><a href="Diagrama Lógico.png">🗄️ <strong>Modelo de dados atualizado</strong></a></td>
      <td>Estrutura de entidades estável no MySQL, contendo as novas tabelas de Logs de Auditoria (histórico de alterações) e registros consolidados mensais.</td>
    </tr>
    <tr>
      <td><a href="https://github.com/Bifrost-Connect/API-3-Semestre/blob/main/docs/processo/sprints/Sprint%203/README.md">🧪 <strong>Estratégia de testes definida</strong></a></td>
      <td>Cenários de validação final focados na geração e exportação correta de arquivos para o SGI, segurança de dados em alterações de perfis e precisão das trilhas de auditoria.</td>
    </tr>
    <tr>
      <td><a href="../../bds/ipem_db.sql">📂 <strong>Documentação e design disponíveis</strong></a></td>
      <td>Diagramas de fluxo atualizados, scripts SQL de produção e documentação de encerramento do projeto organizados na pasta <code>/docs/Sprint3</code>.</td>
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
      <td> </td>
    </tr>
    <tr>
      <td><strong>Código versionado no Git</strong></td>
      <td>O código foi commitado seguindo o padrão de mensagens definido (<code>feat(#id): descrição</code>).</td>
      <td> </td>
    </tr>
    <tr>
      <td><strong>Branch específica criada</strong></td>
      <td>A história foi desenvolvida em uma branch própria (<code>feature/&lt;nome-da-funcionalidade&gt;</code>).</td>
      <td> </td>
    </tr>
    <tr>
      <td><strong>Code Review realizado</strong></td>
      <td>O código passou por revisão de pelo menos um membro da equipe via Pull Request.</td>
      <td> </td>
    </tr>
    <tr>
      <td><strong>Código limpo e comentado</strong></td>
      <td>Não há trechos comentados desnecessariamente e o código segue boas práticas de legibilidade.</td>
      <td> </td>
    </tr>
    <tr>
      <td><strong>Testes executados com sucesso</strong></td>
      <td>Todos os testes unitários e funcionais previstos foram executados e aprovados.</td>
      <td> </td>
    </tr>
    <tr>
      <td><strong>Documentação atualizada</strong></td>
      <td>A documentação técnica e/ou de usuário foi atualizada no repositório (<code>/docs</code>).</td>
      <td> </td>
    </tr>
    <tr>
      <td><strong>Incremento apresentado</strong></td>
      <td>A funcionalidade foi demonstrada ao cliente em review de Sprint com vídeo ou demonstração ao vivo.</td>
      <td> </td>
    </tr>
  </tbody>
</table>

<br>

<h2><a name="modelodados"></a>Modelo de Dados </h2>
<img src="Diagrama Lógico.png" alt="Modelo de Dados">

<br>

### 🎬 Demonstração em Vídeo - Sprint 3

Confira a execução das funcionalidades acima rodando na aplicação: 

[![YouTube Badge](https://img.shields.io/badge/YouTube-FF0000?style=for-the-badge&logo=youtube&logoColor=white)]( https://www.youtube.com/watch?v=aItwSnatptE )

