Create view faturamento_por_cidade as
select
c.cidade,
COUNT(DISTINCT c.id_cliente) AS numero_clientes,
COUNT(DISTINCT p.id_pedido) AS numero_pedidos,
SUM(ip.quantidade * ip.preco_unitario) AS faturamento_total,
SUM(ip.quantidade * ip.preco_unitario) / COUNT(DISTINCT p.id_pedido) AS ticket_medio
from clientes c
join pedidos p
on c.id_cliente = p.id_cliente
join itens_pedido ip
on p.id_pedido = ip.id_pedido
group by c.cidade;