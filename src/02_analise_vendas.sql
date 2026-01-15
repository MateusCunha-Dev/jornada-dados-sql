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