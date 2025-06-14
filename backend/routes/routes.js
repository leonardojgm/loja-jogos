module.exports = server => {
    const connection = require('../database/connection');
    
    server.get('/', (require, response) => {
        response.json({message: 'Bem vindo a nossa loja de jogos'})
    })

    server.get('/pedidos', (require, response) => {
        const sql = 'select pedidos.id_pedido, clientes.nome_cliente, pedidos.quantidade_pedido, games.nome_game, games.preco_game, categorias.nome_categoria from pedidos join clientes on pedidos.fk_idcliente = clientes.id_cliente join games on pedidos.fk_idgame = games.id_game join categorias on games.fk_idcategoria = categorias.id_categoria';
        
        connection.query(sql, (error, res) => {
            if (error){
                return error;
            } console.log("games: ", res);
            response.json(res)
        })
    })
};
