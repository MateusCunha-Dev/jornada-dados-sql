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

