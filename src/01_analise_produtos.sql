-- Quais produtos temos no catálogo? (Exemplo 1)
SELECT 
    id_produto, nome_produto, categoria, marca, preco_atual, data_criacao
FROM 
    produtos;


--Quais são os produtos mais caros? (Exemplo 2)
SELECT
    id_produto, nome_produto, preco_atual
FROM  
    produtos
ORDER BY preco_atual DESC;


--Quais são os 10 primeiros produtos mais caros? (Exemplo 3)
SELECT  
    id_produto, nome_produto, preco_atual
FROM 
    produtos
ORDER BY preco_atual DESC   
LIMIT 10;


-- Quais produtos custam mais de R$ 500? (Exemplo 4)
SELECT 
    id_produto, nome_produto, preco_atual
FROM 
    produtos
WHERE 
    preco_atual > 500;


-- Quais produtos nunca foram vendidos? (Exemplo 15)
SELECT 
    p.nome_produto
FROM 
    produtos p
LEFT JOIN   
    vendas v ON p.id_produto = v.id_produto
WHERE 
    v.id_produto IS NULL
ORDER BY 
    p.nome_produto;


--Classifique os produtos por faixa de preço (Exemplo 7)
SELECT 
   nome_produto,
   categoria,
   preco_atual,
CASE 
    WHEN preco_atual > 1000 THEN 'CARÍSSIMO'
    WHEN preco_atual > 500 THEN 'CARO'
    WHEN preco_atual > 250 THEN 'MEDIO'
    ELSE 'BARATO'
    END AS classe_preco
FROM 
    produtos;


-- Análise de Preço vs Média Global (Exemplo 12)
SELECT 
    nome_produto,
    preco_atual
FROM 
    produtos
WHERE preco_atual > (SELECT ROUND(AVG(preco_atual)::numeric, 2) FROM produtos);