create database games;

use games;

drop table categorias;
create table categorias (
	id_categoria int AUTO_INCREMENT, 
    nome_categoria varchar(30), 
    PRIMARY KEY (id_categoria)
);
insert into categorias(nome_categoria) values('Ação');
insert into categorias(nome_categoria) values('Aventura');
insert into categorias(nome_categoria) values('Esportes');
select * from categorias;

drop table games;
create table games (
	id_game int AUTO_INCREMENT, 
    nome_game varchar(30), 
    preco_game float, 
    fk_idcategoria int, 
    PRIMARY KEY (id_game), 
    CONSTRAINT fk_idcategoria FOREIGN KEY (fk_idcategoria) REFERENCES categorias(id_categoria)
);
insert into games(nome_game, preco_game, fk_idcategoria) values('COD', 300, 1);
insert into games(nome_game, preco_game, fk_idcategoria) values('NBA 2k', 200, 3);
insert into games(nome_game, preco_game, fk_idcategoria) values('Among US', 100, 2);
select * from games;

select games.nome_game, games.preco_game, categorias.nome_categoria 
from games 
join categorias on games.fk_idcategoria = categorias.id_categoria;

drop table clientes;
create table clientes (
	id_cliente int AUTO_INCREMENT, 
    nome_cliente varchar(30), 
    PRIMARY KEY (id_cliente)
);
insert into clientes(nome_cliente) values('João');
insert into clientes(nome_cliente) values('Maria');
insert into clientes(nome_cliente) values('Bruno');
select * from clientes;

drop table pedidos;
create table pedidos (
	id_pedido int AUTO_INCREMENT, 
    quantidade_pedido int, 
    fk_idcliente int, 
    fk_idgame int, 
    PRIMARY KEY (id_pedido), 
    CONSTRAINT fk_idcliente FOREIGN KEY (fk_idcliente) REFERENCES clientes(id_cliente), 
    CONSTRAINT fk_idgame FOREIGN KEY (fk_idgame) REFERENCES games(id_game)
);
insert into pedidos(quantidade_pedido, fk_idcliente, fk_idgame) values(2,1,3);
insert into pedidos(quantidade_pedido, fk_idcliente, fk_idgame) values(3,2,1);
insert into pedidos(quantidade_pedido, fk_idcliente, fk_idgame) values(1,1,2);
select * from pedidos;

select clientes.nome_cliente, pedidos.quantidade_pedido, games.nome_game, games.preco_game, categorias.nome_categoria 
from pedidos 
join clientes on pedidos.fk_idcliente = clientes.id_cliente 
join games on pedidos.fk_idgame = games.id_game 
join categorias on games.fk_idcategoria = categorias.id_categoria;