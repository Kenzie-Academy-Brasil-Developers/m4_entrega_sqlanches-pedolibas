-- 1)

SELECT
  pedidos.id,
  pedidos.status,
  pedidos.cliente_id,
  produtos.id,
  produtos.nome,
  produtos.tipo,
  produtos.preco,
  produtos.pts_de_lealdade
FROM
  produtos_pedidos
  INNER JOIN pedidos
  ON produtos_pedidos.pedido_id = pedidos.id
  INNER JOIN produtos
  ON produtos_pedidos.produto_id = produtos.id;

-- 2)

SELECT
  pedidos.id
FROM
  produtos_pedidos
  INNER JOIN pedidos
  ON produtos_pedidos.pedido_id = pedidos.id
  INNER JOIN produtos
  ON produtos_pedidos.produto_id = produtos.id WHERE nome LIKE 'Fritas';

-- 3)

SELECT
  clientes.nome as gostam_de_fritas
FROM
  clientes
  INNER JOIN pedidos 
  ON clientes.id = pedidos.cliente_id
  INNER JOIN produtos_pedidos 
  ON pedidos.id = produtos_pedidos.pedido_id
  INNER JOIN produtos 
  ON produtos_pedidos.produto_id = produtos.id WHERE produtos.nome = 'Fritas';

-- 4)

SELECT
  SUM(produtos.preco)
FROM
  produtos
  INNER JOIN produtos_pedidos 
  ON produtos.id = produtos_pedidos.produto_id
  INNER JOIN pedidos 
  ON produtos_pedidos.pedido_id = pedidos.id
  INNER JOIN clientes 
  ON pedidos.cliente_id = clientes.id WHERE clientes.nome = 'Laura';

-- 5)

SELECT
  produtos.nome,
  COUNT(produtos_pedidos.produto_id)
FROM
 produtos
 INNER JOIN produtos_pedidos ON produtos_pedidos.produto_id = produtos.id
 GROUP BY produtos.nome;