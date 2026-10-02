create view vendas_por_categoria as
select 
pr.categoria, 
sum(ip.quantidade) as quantidade_vendida,
sum(ip.quantidade * ip.preco_unitario) as faturamento_categoria,
round (
	sum(ip.quantidade * ip.preco_unitario) / (select sum(quantidade * preco_unitario) 
	from itens_pedido
)* 100, 1) as porcent_faturamento
from produtos pr
join itens_pedido ip
on pr.id_produto = ip.id_produto
group by pr.categoria