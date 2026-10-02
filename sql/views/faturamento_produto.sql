create view vendas_por_produto as
select 
pr.nome as nome_produto, 
pr.categoria, 
sum(ip.quantidade) as quantidade_vendida,
count(distinct p.id_pedido) as num_pedidos,
sum(ip.quantidade * ip.preco_unitario) as faturamento_produto
from produtos pr 
join itens_pedido ip 
on pr.id_produto = ip.id_produto
join pedidos p
on p.id_pedido = ip.id_pedido
group by pr.nome, pr.categoria