--Qual é o total de vendas, receita total e ticket médio? (Exemplo 5)
SELECT 
    COUNT(*) AS quantidade_total_vendas,
    ROUND(SUM(quantidade * preco_unitario)::NUMERIC, 2) AS receita_total,
    ROUND(AVG(quantidade * preco_unitario)::NUMERIC, 2) AS ticket_medio
FROM 
    vendas;


--Qual é a maior e menor venda? (Exemplo 5)
SELECT 
    ROUND(MAX(quantidade * preco_unitario)::NUMERIC, 2) AS maior_venda,
    ROUND(MIN(quantidade * preco_unitario)::NUMERIC, 2) AS menor_venda
FROM 
    vendas;


--Quantos produtos diferentes foram vendidos? (Exemplo 5)
SELECT 
    COUNT(DISTINCT(id_produto)) AS produtos_diferentes_vendidos
FROM 
    vendas;


--Como ver o nome do produto junto com a venda? (Exemplo 6)
SELECT 
    p.nome_produto AS produto,
    ROUND(SUM(v.quantidade * v.preco_unitario)::NUMERIC, 2) AS valor_da_venda
FROM 
    vendas v
JOIN 
    produtos p ON v.id_produto = p.id_produto
GROUP BY 
    p.nome_produto;


--Quais vendas foram feitas de produtos não cadastrados? (Exemplo 14)
SELECT 
    v.id_venda,
    v.id_produto,
    ROUND((v.quantidade * v.preco_unitario)::NUMERIC, 2) AS valor_venda
FROM 
    vendas v
LEFT JOIN 
    produtos p ON v.id_produto = p.id_produto
WHERE 
    p.id_produto IS NULL;


--Quantas vendas e qual a receita total por categoria? (Exemplo 8) 
SELECT 
    p.categoria,
    COUNT(*) AS qtd_vendas,
    ROUND(SUM(v.quantidade * v.preco_unitario)::NUMERIC, 2) AS valor_venda
FROM 
    vendas v
JOIN 
    produtos p ON v.id_produto = p.id_produto
GROUP BY 
    p.categoria;
    

--Quais categorias geram mais de R$ 50.000 em receita? (Exemplo 9)
SELECT 
    p.categoria,
    ROUND(SUM(v.quantidade * v.preco_unitario)::NUMERIC, 2) AS receita_total
FROM 
    produtos p
JOIN 
    vendas v ON p.id_produto = v.id_produto
GROUP BY 
    p.categoria
HAVING 
    ROUND(SUM(v.quantidade * v.preco_unitario)::NUMERIC, 2) > 50000;