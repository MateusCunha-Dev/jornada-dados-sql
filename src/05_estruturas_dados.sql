--Como criar uma visão para produtos com vendas? (Exemplo 19)
CREATE OR REPLACE VIEW v_resumo_vendas_produtos AS
SELECT 
    p.nome_produto,
    ROUND(SUM(v.quantidade * v.preco_unitario)::numeric, 2) AS receita_total
FROM 
    vendas v
JOIN 
    produtos p ON v.id_produto = p.id_produto
GROUP BY 
    p.nome_produto
ORDER BY 
    receita_total DESC;

SELECT * FROM v_resumo_vendas_produtos;


--Como criar uma tabela para armazenar resumo de vendas por categoria? (Exemplo 20)
CREATE TABLE t_resumo_categorias AS
SELECT
    p.categoria,
    COUNT(*) AS qtd_vendas,
    ROUND(SUM(v.quantidade * v.preco_unitario)::numeric, 2) AS valor_venda
FROM 
    vendas v
JOIN 
    produtos p ON v.id_produto = p.id_produto
GROUP BY 
    p.categoria
ORDER BY 
    valor_venda DESC;


--Como criar uma visão temporária para análise rápida para listar apenas produtos acima de 1000.00 reais (Exemplo 21)
CREATE TEMP VIEW v_produtos_caros AS
SELECT 
    nome_produto,
    preco_atual
FROM 
    produtos
WHERE 
    preco_atual > 1000
ORDER BY
    preco_atual DESC;

SELECT * FROM v_produtos_caros;


--Qual é a distribuição percentual de receita por canal? (Exemplo 17)
WITH receita_por_categoria AS (
    SELECT 
        p.categoria,
        ROUND(SUM(v.quantidade * v.preco_unitario)::numeric, 2) AS receita_cat
    FROM 
        vendas v
    JOIN 
        produtos p ON v.id_produto = p.id_produto
    GROUP BY 
        p.categoria
)
SELECT 
    categoria,
    receita_cat AS faturamento_categoria,
    SUM(receita_cat) OVER() AS faturamento_total_empresa,
    ROUND((receita_cat / SUM(receita_cat) OVER()) * 100, 2) AS porcentagem_representativa
FROM 
    receita_por_categoria
ORDER BY 
    porcentagem_representativa DESC;