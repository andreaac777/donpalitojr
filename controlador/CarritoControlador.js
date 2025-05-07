const CarritoModelo = require('../modelo/CarritoModelo');

class CarritoControlador {
    static async agregarAlCarrito(req, res) {
        const { t1:idUsuario, t2:idProducto, t3:cantidad } = req.body;
        
        if (!idUsuario || !idProducto || !cantidad) {
            return res.status(400).json({ error: 'Faltan campos obligatorios' });
        }
        
        try {
            const resultado = await CarritoModelo.agregarItem(idUsuario, idProducto, cantidad);
            res.json(resultado);
        } catch (err) {
            res.status(500).json({ error: 'Hubo un error al agregar al carrito' });
        }
    }

    static async modificarCarrito(req, res) {
        const { id } = req.params;
        const { nuevaCantidad } = req.body;
        
        if (!nuevaCantidad || nuevaCantidad < 1) {
            return res.status(400).json({ error: 'La cantidad debe ser al menos 1' });
        }
        
        try {
            const resultado = await CarritoModelo.modificarItem(id, nuevaCantidad);
            res.json(resultado);
        } catch (err) {
            res.status(500).json({ error: 'Hubo un error al modificar el carrito' });
        }
    }

    static async eliminarDelCarrito(req, res) {
        const { id } = req.params;
        try {
            const resultado = await CarritoModelo.eliminarItem(id);
            res.json(resultado);
        } catch (err) {
            res.status(500).json({ error: 'Hubo un error al eliminar del carrito' });
        }
    }

    static async obtenerCarrito(req, res) {
        const { idUsuario } = req.params;
        try {
            const carrito = await CarritoModelo.obtenerCarrito(idUsuario);
            res.json(carrito);
        } catch (err) {
            res.status(500).json({ error: 'Hubo un error al obtener el carrito' });
        }
    }
}

module.exports = CarritoControlador;