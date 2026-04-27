<h1 style="text-align: center;">📌 Sprint 02</h1>
<div align="center">
  <img src="docs/logo.png">
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

 **Status da Sprint:** Em andamento
 </br>
 
<h2><a name="backlog1"></a>Backlog da Sprint 1</h2>

| Rank | Prioridade | User Story | Estimativa | Sprint |
|------|-------------|-------------|-------------|---------|
| 1 | Alta | Como Gestor da IPEM , **quero ter o controle das viaturas que estão disponíveis e as que estão em uso** ,para que eu possa gerenciar a alocação da frota em tempo real. | 8 | 2 |
| 2 | Alta | Como Gestor da IPEM, **quero ter acesso aos documentos com o compilado de informações** de cada viatura e chamados,para que eu possa auditar o histórico de uso de forma organizada. | 5 | 2 |
| 3 | Média | Como Técnico da IPEM, **quero cancelar um Check-in caso tenha selecionado a viatura errada por engano**, antes de iniciar o trajeto,para que o histórico de registros não contenha dados incorretos por falha operacional.| 3 | 2 |

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
      <td><a href="#">🖼️ <strong>Wireframes das telas</strong></a></td>
      <td>Protótipos das interfaces de Login, Menu do Técnico (Check-in/Out), Registro de Abastecimento e Painel Administrativo do Gestor, contendo gastos e viaturas em uso.</td>
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
      <td>Todos os diagramas de fluxo, scripts SQL de criação do banco e arquivos de design organizados na pasta <code>/docs/Sprint2</code>.</td>
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
