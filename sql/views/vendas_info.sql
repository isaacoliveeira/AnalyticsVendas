create view vendas_info as
select c.nome as nome_cliente, c.cidade, p.data_pedido, ip.quantidade, ip.preco_unitario, pr.nome as nome_produto, pr.categoria, p.id_pedido
from clientes c
join pedidos as p
on c.id_cliente = p.id_cliente
join itens_pedido ip 
on ip.id_pedido = p.id_pedido
join produtos pr
on pr.id_produto = ip.id_produto