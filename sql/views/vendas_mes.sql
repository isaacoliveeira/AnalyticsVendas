create view vendas_mes as 
select 
extract(month from p.data_pedido) as periodo,
count(distinct p.id_pedido) as quantidade_pedido,
sum(ip.quantidade * ip.preco_unitario) as faturamento,
sum(ip.quantidade * ip.preco_unitario) / count(distinct p.id_pedido) as ticket_medio
from pedidos p 
join itens_pedido ip 
on p.id_pedido = ip.id_pedido
group by extract(month from p.data_pedido)
