create view vendas_cliente as 
select c.nome as nome_cliente, c.cidade, ip.quantidade, ip.preco_unitario, (ip.quantidade * ip.preco_unitario) as valor_total
from clientes as c
join pedidos as p
on c.id_cliente = p.id_cliente
join itens_pedido as ip
on p.id_pedido = ip.id_pedido