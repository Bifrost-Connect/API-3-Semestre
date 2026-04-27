## SIVA Back-end - Sistema Integrado de Viaturas e Atendimentos ##


Este é o back-end do **SIVA**, responsável por toda a lógica de negócio, segurança e integração com as bases de dados do IPEM. A API fornece os recursos necessários para o controle de frota, gestão de condutores e monitoramento de manutenção preventiva.

---

## Arquitetura e Tecnologias

A API foi construída com foco em performance e integridade dos dados, utilizando:

- **Linguagem:** Java
- **Framework:** Spring Boot (ou o framework Java de sua preferência)
- **Bancos de Dados:** - **MySQLWorkbench:** Base principal para dados institucionais e legados.
  - **MySQL:** Gestão de logs rápidos e dados transacionais de movimentação.
- **Segurança:** Autenticação e controle de níveis de acesso (Admin/Operador).
- **Padronização:** RESTful API com retornos em JSON.

## Estrutura do Projeto

- **`/src/main/java/com/siva/controller`**: Endpoints da API (Rotas de acesso).
- **`/src/main/java/com/siva/service`**: Regras de negócio (Cálculos de manutenção, validações).
- **`/src/main/java/com/siva/repository`**: Camada de persistência (Queries Oracle/MySQL).
- **`/src/main/java/com/siva/model`**: Entidades do banco de dados (Viatura, Motorista, Viagem).
- **`/src/main/resources`**: Configurações de ambiente e conexões com o DB.

## Funcionalidades do Back-end

- **API de Frota**: CRUD completo de veículos com validação de placa e Renavam.
- **Motor de Manutenção**: Lógica que calcula a próxima revisão com base no hodômetro atualizado.
- **Gestão de Viagens**: Processamento de check-out e check-in, garantindo que uma viatura não saia sem o retorno da viagem anterior.
- **Integração de Bases**: Sincronização entre tabelas do Oracle e MySQL conforme a necessidade do módulo.
- **Relatórios Gerenciais**: Agregação de dados para geração de indicadores de consumo e quilometragem.

## Requisitos de Instalação

### Pré-requisitos
- JDK 17 ou superior
- Maven ou Gradle
- Acesso aos bancos de dados Oracle e MySQL configurados

### Configuração
1. Clone o repositório:
   ```bash
   git clone [https://github.com/wizard-beard/siva-backend.git](https://github.com/wizard-beard/siva-backend.git)
| **Padronização** | Husky + Commitlint | Organização de mensagens de commit |

📊 Painel de Controle (Dashboard)
Estatísticas de Uso: Gráficos de consumo de combustível e eficiência da frota.

Histórico de Condutores: Rastreabilidade total de multas e ocorrências por motorista.
