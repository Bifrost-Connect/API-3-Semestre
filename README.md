<h1># API_3-_semestre<\h1>

<h2># Nome do Projeto<\h2>

---

<h2>## 📌 Desafio Proposto<\h2>
<p>Descrever aqui o problema que será resolvido pelo sistema.</p>

---

<h2>## 🎯 Objetivo<\h2>
<p>Explicar qual é o objetivo principal do projeto.</p>

---

<h2 id='membros'> 👥 Membros </h2>

| Foto | Nome | Função | Github |
| :---------: | :---------: | :---------------------: | :-----------------: |
| <img src="" width=50px> | Daniel Natan | Product Owner | <a href="https://github.com/danieldanka"><img src="https://img.shields.io/badge/GitHub-100000?style=for-the-badge&logo=github&logoColor=white"></a>|
| <img src="" width=50px> | Samir | Scrum Master | <a href="https://share.google/yripwQuvg7AHkaXP0"><img src="https://img.shields.io/badge/GitHub-100000?style=for-the-badge&logo=github&logoColor=white"></a> |
| <img src="https://media.licdn.com/dms/image/v2/D4D03AQEvcTc_ydKXOQ/profile-displayphoto-scale_400_400/B4DZjt2eeqG8Ao-/0/1756337140235?e=1773878400&v=beta&t=FEJwlOv1Amuv234X7KEPpYaKI7XjmxkY5iR9oDKgQIs" width=50px> | Guilherme Gomes | Desenvolvedor | <a href="https://github.com/guilhermegcris"><img src="https://img.shields.io/badge/GitHub-100000?style=for-the-badge&logo=github&logoColor=white"></a>  |
| <img src="" width=50px> | João Gabriel | Desenvolvedor | <a href="https://github.com/jjoaoGabriel"><img src="https://img.shields.io/badge/GitHub-100000?style=for-the-badge&logo=github&logoColor=white"></a> |
| <img src="" width=50px> | Leonardo Graciano | Desenvolvedor | <a href="https://github.com/LeonardoGracianoOliveira"><img src="https://img.shields.io/badge/GitHub-100000?style=for-the-badge&logo=github&logoColor=white"></a> |
| <img src="" width=50px> | Luan | Desenvolvedor | <a href="https://github.com/SantoszLuan"><img src="https://img.shields.io/badge/GitHub-100000?style=for-the-badge&logo=github&logoColor=white"></a> |

---

<h2 id='sprints'> 📌 Cronograma de Sprints </h2>

| Sprint | Período | Entregas | Documentação |
|--------|---------|----------|--------|
| 1 | 08/09 - 28/09 | Planejamento inicial, Protótipos Visuais | <a href = ""> sprint-1 |
| 2 | 06/10 - 26/10 | Enviar/Receber Pedido de Orientação, Chat entre Orientador e Orientando, Histórico de Mensagens e TG, Adicionar Orientador  | <a href = ""> sprint-2 </a>    |
| 3 | 03/11 - 23/11 | Cadastro/Login, Armazenamento de Documentos, Alteração de Dados de Cadastro, Notificação de Resposta ao Pedido de Orientação | <a href = ""> sprint-3 </a>    |

---

<h2 id='tecnologias'> 💻 Tecnologias </h2>

[![Java](https://img.shields.io/badge/Java-007396?style=for-the-badge&logo=openjdk&logoColor=white)](https://www.java.com/)
[![Maven](https://img.shields.io/badge/Maven-C71A36?style=for-the-badge&logo=apachemaven&logoColor=white)](https://maven.apache.org/)
[![Jira](https://img.shields.io/badge/Jira-0052CC?style=for-the-badge&logo=jira&logoColor=white)](https://www.atlassian.com/software/jira)
[![MySQL](https://img.shields.io/badge/MySQL-4479A1?style=for-the-badge&logo=mysql&logoColor=white)](https://www.mysql.com/)
[![Discord](https://img.shields.io/badge/Discord-5865F2?style=for-the-badge&logo=discord&logoColor=white)](https://discord.com/)
[![GitHub](https://img.shields.io/badge/GitHub-181717?style=for-the-badge&logo=github&logoColor=white)](https://github.com/)

---

<h2>## 🌳 Estratégia de Versionamento<\h2>

- main → versão estável
- develop → integração
- feature/* → funcionalidades
- bugfix/* → correções

---

<h2>## 📦 Estrutura do Projeto<\h2>
<code>
src/
 ├── controller
 ├── service
 ├── repository
 └── model
 </code>

---

<h2> # 📝 Padrão de Commits <\h2>
<p>Os commits devem seguir o padrão **"Padrão de Commits – por Renato Adorno"** para manter a consistência e a clareza no repositório.<\p>

---

<h3> ## 📌 Formato do Commit<\h3>

```
<tipo>: descrição em tom de ação direta
<informações adicionais> (opcional)
```

---

<h3>## 🔖 Tipos de Commit<\h3>

- **fix** – Soluciona um problema (bug fix). Relacionado ao PATCH no versionamento semântico.  
- **feat** – Inclui um novo recurso. Relacionado ao MINOR no versionamento semântico.  
- **docs** – Mudanças na documentação (como README). Não inclui alterações em código.  
- **style** – Alterações de formatação do código (espaços, indentação, ponto e vírgula, etc.). Não inclui alterações em código.  
- **refactor** – Refatorações que não alteram funcionalidades, mas melhoram performance ou legibilidade.  
- **build** – Modificações em arquivos de build e dependências.  
- **test** – Alterações em testes (criação, modificação ou remoção de testes unitários).  
- **chore** – Atualizações de tarefas administrativas ou configuração (ex.: ajustes no `.gitignore`).  

---

<h3>## 💡 Exemplos<\h3>

- `feat: Adiciona botão de login na tela inicial`  
- `fix: Corrige bug no redirecionamento após login`  
- `refactor: Refatora lógica de autenticação para usar hooks`  
- `docs: Documenta processo de deploy no README`  
- `style: Remove espaços em branco desnecessários`  
