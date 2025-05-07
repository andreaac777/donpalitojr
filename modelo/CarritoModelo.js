const dbService = require('./bd/Conexion');

class CarritoModelo {
    static async agregarItem(idUsuario, idProducto, cantidad) {
        // Verificar si el producto ya está en el carrito
        const verificarQuery = 'SELECT * FROM carrito WHERE idUsuario = ? AND idProducto = ?';
        const insertQuery = 'INSERT INTO carrito (idUsuario, idProducto, cantidad) VALUES (?, ?, ?)';
        const updateQuery = 'UPDATE carrito SET cantidad = cantidad + ? WHERE idCarrito = ?';
        
        try {
            const itemsCarrito = await dbService.query(verificarQuery, [idUsuario, idProducto]);
            
            if (itemsCarrito.length > 0) {
                // Producto ya existe en el carrito, actualizar cantidad
                await dbService.query(updateQuery, [cantidad, itemsCarrito[0].idCarrito]);
            } else {
                // Producto no existe en el carrito, agregar nuevo
                await dbService.query(insertQuery, [idUsuario, idProducto, cantidad]);
            }
            
            return { success: true };
        } catch (err) {
            throw new Error(`Error al agregar al carrito: ${err.message}`);
        }
    }

    static async modificarItem(idCarrito, nuevaCantidad) {
        const query = 'UPDATE carrito SET cantidad = ? WHERE idCarrito = ?';
        try {
            await dbService.query(query, [nuevaCantidad, idCarrito]);
            return { success: true };
        } catch (err) {
            throw new Error(`Error al modificar el carrito: ${err.message}`);
        }
    }

    static async eliminarItem(idCarrito) {
        const query = 'DELETE FROM carrito WHERE idCarrito = ?';
        try {
            await dbService.query(query, [idCarrito]);
            return { success: true };
        } catch (err) {
            throw new Error(`Error al eliminar del carrito: ${err.message}`);
        }
    }

    static async obtenerCarrito(idUsuario) {
        const query = `
            SELECT c.idCarrito, c.idProducto, p.nombreProducto, p.descripcionProducto, 
                   p.precioProducto, c.cantidad, (p.precioProducto * c.cantidad) as subtotal
            FROM carrito c
            JOIN productos p ON c.idProducto = p.idProducto
            WHERE c.idUsuario = ?`;
        try {
            return await dbService.query(query, [idUsuario]);
        } catch (err) {
            throw new Error(`Error al obtener el carrito: ${err.message}`);
        }
    }
}

module.exports = CarritoModelo;


