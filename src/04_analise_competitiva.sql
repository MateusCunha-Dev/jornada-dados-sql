--Quais produtos estão mais baratos no concorrente do que na nossa tabela? (Exemplo 16)
SELECT 
    pc.id_produto,
    pc.nome_concorrente,
    pc.preco_concorrente,
    p.preco_atual
FROM 
    preco_competidores pc
JOIN 
    produtos p ON pc.id_produto = p.id_produto
WHERE 
    pc.preco_concorrente < p.preco_atual
ORDER BY 
    pc.preco_concorrente;


--Qual é a diferença percentual entre nossos preços e dos concorrentes? (Exemplo 16)
SELECT 
    p.nome_produto,
    pc.nome_concorrente,
    p.preco_atual AS nosso_preco,
    pc.preco_concorrente AS preco_deles,
    ROUND(((p.preco_atual - pc.preco_concorrente)/p.preco_atual * 100)::NUMERIC, 2) AS diferenca_percentual,
    CASE 
        WHEN p.preco_atual > pc.preco_concorrente THEN 'Mais caro'
        WHEN p.preco_atual = pc.preco_concorrente THEN 'Igual'
        ELSE 'Mais barato'
    END AS classe_preco
FROM 
    preco_competidores pc
JOIN 
    produtos p ON pc.id_produto = p.id_produto
ORDER BY 
    diferenca_percentual DESC;


--Quais produtos estão mais caros que a média dos concorrentes? (Exemplo 13)
WITH media_concorrentes AS (
    SELECT 
        id_produto,
        ROUND(AVG(preco_concorrente)::NUMERIC, 2) AS media_preco
    FROM 
        preco_competidores
    GROUP 
        BY id_produto
)

SELECT 
    p.nome_produto, 
    p.preco_atual,
    mc.media_preco AS media_mercado
FROM 
    produtos p 
JOIN 
    media_concorrentes mc ON p.id_produto = mc.id_produto
WHERE 
    p.preco_atual > mc.media_preco
ORDER BY 
    preco_atual DESC;


--Quais produtos top sellers estão mais caros que todos os concorrentes? (Exemplo 18)
WITH top_sellers AS (
    SELECT 
        id_produto,
        SUM(quantidade) AS qtd
    FROM 
        vendas
    GROUP BY 
        id_produto
    ORDER BY 
        qtd DESC
    LIMIT 10
),
teto_mercado AS(
    SELECT 
        id_produto,
        MAX(preco_concorrente) AS preco_maximo
    FROM 
        preco_competidores  
    GROUP BY 
        id_produto
)
SELECT
    p.id_produto,
    p.nome_produto,
    ts.qtd AS unidades_vendidas,
    p.preco_atual AS nosso_preco,
    tm.preco_maximo AS preco_teto_concorrente
FROM produtos p
    JOIN 
        top_sellers ts ON p.id_produto = ts.id_produto
    JOIN 
        teto_mercado tm ON p.id_produto = tm.id_produto
WHERE 
    p.preco_atual > tm.preco_maximo;