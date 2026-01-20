# 📊 Análise de Dados e Engenharia de Analytics com SQL

Este repositório contém a resolução prática de desafios de negócio simulando o dia a dia de um **Analista de Dados** e **Engenheiro de Analytics**. O projeto evoluiu de consultas básicas para arquiteturas complexas de dados, utilizando **PostgreSQL** no **Supabase**.

## 🎯 Objetivos do Projeto
O foco foi responder perguntas estratégicas de negócio e otimizar a performance do banco de dados:
- **KPIs de Vendas:** Análise de receita, ticket médio e performance por categoria.
- **Auditoria de Dados:** Identificação de inconsistências (vendas sem produto, produtos órfãos) usando `LEFT JOIN`.
- **Inteligência de Mercado (Pricing):** Comparação de preços com concorrentes, identificação de oportunidades e riscos de churn (produtos caros demais).
- **Engenharia de Dados:** Criação de Views, Tabelas Físicas (Snapshots) e Views Temporárias para otimização de consultas.
- **Análises Avançadas:** Cálculo de distribuição de receita (%) utilizando **Window Functions**.

## 🛠️ Stack Tecnológico
- **SQL Avançado:** Joins, Subqueries Correlacionadas, CTEs (Common Table Expressions) e Window Functions (`OVER`).
- **PostgreSQL:** Banco de dados relacional.
- **Supabase:** Plataforma de backend e banco de dados na nuvem.
- **Git/GitHub:** Controle de versão e documentação.
- **VS Code:** Ambiente de desenvolvimento.

## 📂 Estrutura do Projeto
O código foi organizado em módulos lógicos para facilitar a manutenção:

| Arquivo | Descrição | Conceitos Chave |
| :--- | :--- | :--- |
| `src/01_analise_produtos.sql` | Análise de catálogo e segmentação. | `CASE WHEN`, Filtros simples |
| `src/02_analise_vendas.sql` | Indicadores de receita e auditoria. | `INNER/LEFT JOIN`, `GROUP BY`, `HAVING` |
| `src/03_analise_clientes.sql` | Perfil e geolocalização de clientes. | Segmentação geográfica |
| `src/04_analise_competitiva.sql` | Inteligência de mercado e pricing. | **CTEs**, Subqueries Correlacionadas |
| `src/05_estruturas_dados.sql` | Objetos de banco e otimização. | **Views**, **CTAS**, **Temp Views**, **Window Functions** |

## 🧠 Destaques de Aprendizado

### 1. Consultas Complexas (CTEs)
Utilização de `WITH` para quebrar problemas grandes em partes menores, como calcular o "Teto do Mercado" antes de cruzar com as vendas internas.

### 2. Window Functions
Uso do `OVER()` para calcular a representatividade percentual de cada categoria sobre o faturamento total da empresa, sem perder a granularidade dos dados.

### 3. Otimização e Estruturas
- **Views:** Para encapsular lógicas de JOIN frequentes.
- **Create Table As (CTAS):** Para criar snapshots estáticos de alta performance.
- **Temp Views:** Para análises exploratórias que não poluem o banco de dados.

## 🚀 Como reproduzir
1. Clone o repositório.
2. Importe os arquivos da pasta `datasets/` para o seu banco de dados PostgreSQL.
3. Execute os scripts da pasta `src/` na ordem numérica para recriar as análises e estruturas.

---
*Desenvolvido durante a Jornada de Dados.*