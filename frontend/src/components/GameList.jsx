import { useEffect, useState } from 'react';

const GameList = () => {
    const [pedidos, setPedidos] = useState([])
    
    useEffect(async () => {
        const url = "http://localhost:5000/pedidos";
        const res = await fetch(url);

        setPedidos(await res.json());
    }, [])
    
    return (
        <table className="striped">
            <thead>
            <tr>
                <th>Nome do Cliente</th>
                <th>Produto</th>
                <th>Categoria</th>
                <th>Quantidade</th>
                <th>Preço</th>
            </tr>
            </thead>
            <tbody>
            {pedidos.map(pedido => {
                let precoTotal = (pedido.preco_game * pedido.quantidade_pedido).toFixed(2);
                return(
                    <tr key={pedido.id_pedido}>
                        <td>{pedido.nome_cliente}</td>
                        <td>{pedido.nome_game}</td>
                        <td>{pedido.nome_categoria}</td>
                        <td>{pedido.quantidade_pedido}</td>
                        <td>R$ {precoTotal}</td>
                    </tr>
                )
            })}
            </tbody>
        </table>
    )
}

export default GameList;
