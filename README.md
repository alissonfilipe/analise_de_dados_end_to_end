# 📊 Análise de Comportamento de Compra de Clientes

## 📌 Visão Geral
Este projeto tem como objetivo analisar o comportamento de compra de clientes a partir de dados transacionais, com foco em gerar insights estratégicos para o negócio.

A análise abrange todo o ciclo de dados — desde a limpeza e transformação até a geração de insights e visualização em dashboard.

---

## 🎯 Objetivos
- Identificar padrões de compra dos clientes  
- Analisar o impacto de descontos na receita  
- Comparar comportamento entre assinantes e não assinantes  
- Segmentar clientes com base no histórico de compras  
- Gerar insights para apoiar a tomada de decisão  

---

## 📂 Dataset
- **Total de registros:** 3.900  
- **Total de variáveis:** 18  

### Principais variáveis:
- Dados demográficos (idade, gênero, localização, status de assinatura)  
- Detalhes da compra (produto, categoria, valor, estação, tamanho, cor)  
- Comportamento (desconto, frequência, compras anteriores, avaliação, tipo de envio)  

### Problemas encontrados:
- Valores ausentes na coluna *Review Rating* (tratados com mediana por categoria)

---

## ⚙️ Processamento de Dados (Python)
- Carregamento de dados com **pandas**  
- Análise exploratória (`.info()`, `.describe()`)  
- Tratamento de valores ausentes (mediana por categoria)  
- Padronização de colunas (snake_case)  
- Engenharia de atributos:
  - Faixa etária  
  - Frequência de compra  
- Verificação de consistência dos dados  
- Integração com banco de dados PostgreSQL  

---

## 🧠 Análise de Dados (SQL)

Principais perguntas respondidas:

- Receita por gênero  
- Clientes de alto valor que utilizam desconto  
- Produtos mais bem avaliados  
- Comparação por tipo de envio  
- Assinantes vs não assinantes  
- Dependência de desconto por produto  
- Segmentação de clientes:
  - Novos  
  - Recorrentes  
  - Fiéis  
- Produtos mais vendidos por categoria  
- Relação entre recompra e assinatura  
- Receita por faixa etária  

---

## 📊 Dashboard (Power BI)

Foi desenvolvido um dashboard interativo com o objetivo de:

- Visualizar métricas principais  
- Permitir análise dinâmica  
- Apoiar decisões estratégicas  

---

## 💡 Principais Insights

- Clientes que utilizam desconto ainda podem gerar alta receita  
- Assinantes apresentam maior consistência e valor ao longo do tempo  
- O comportamento de compra varia entre faixas etárias  
- Produtos mais bem avaliados nem sempre são os mais vendidos  

---

## 🚀 Recomendações de Negócio

- Implementar programas de fidelidade  
- Otimizar estratégias de desconto  
- Focar em clientes de maior valor  
- Destacar produtos estratégicos em campanhas  

---

## 🛠️ Ferramentas e Tecnologias
- Python (Pandas, Análise de Dados)  
- SQL (MySQL)  
- Power BI (Visualização de Dados)  

---

