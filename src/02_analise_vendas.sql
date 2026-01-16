--Qual é o total de vendas, receita total e ticket médio? (Exemplo 5)
SELECT 
    count(*) as quantidade_total_vendas,
    round(sum(quantidade * preco_unitario)::numeric, 2) as receita_total,
    round(avg(quantidade * preco_unitario)::numeric, 2) as ticket_medio
FROM 
    vendas;


--Qual é a maior e menor venda? (Exemplo 5)
SELECT 
    round(max(quantidade * preco_unitario)::numeric, 2) as maior_venda,
    round(min(quantidade * preco_unitario)::numeric, 2) as menor_venda
FROM 
    vendas;


--Quantos produtos diferentes foram vendidos? (Exemplo 5)
SELECT 
    count(distinct(id_produto)) as produtos_diferentes_vendidos
FROM 
    vendas;


--Como ver o nome do produto junto com a venda? (Exemplo 6)
SELECT 
    p.nome_produto AS produto,
    ROUND(SUM(v.quantidade * v.preco_unitario)::numeric, 2) AS valor_da_venda
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
    round((v.quantidade * v.preco_unitario)::numeric, 2) AS valor_venda
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
    round(SUM(v.quantidade * v.preco_unitario)::numeric, 2) AS valor_venda
FROM 
    vendas v
JOIN 
    produtos p ON v.id_produto = p.id_produto
GROUP BY 
    p.categoria;
    

--Quais categorias geram mais de R$ 50.000 em receita? (Exemplo 9)
SELECT 
    p.categoria,
    ROUND(SUM(v.quantidade * v.preco_unitario)::numeric, 2) AS receita_total
FROM 
    produtos p
JOIN 
    vendas v ON p.id_produto = v.id_produto
GROUP BY 
    p.categoria
HAVING 
    round(SUM(v.quantidade * v.preco_unitario)::numeric, 2) > 50000;