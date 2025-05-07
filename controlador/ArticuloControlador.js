const modelo = require('../modelo/ArticuloModelo');

class ArticuloControlador {
    // Obtener todos los articulos
    static async todoProducto(req, res) {
        try {
            const productos = await modelo.todoProducto();
            res.json(productos);
        } catch (err) {
            res.status(500).json({ error: 'Hubo un error al obtener los Productos' });
        }
    }

    
    // Buscar producto por nombre
    static async buscarPorNombre(req, res) {
        let { nombre } = req.params;
        console.log(nombre);
        //nombre = nombre.trim(); // Elimina espacios y saltos de línea
        try {
            if (!nombre) {
                return res.status(400).json({ error: "Debe proporcionar el nombre de un producto" });
            }
            const productos = await modelo.buscarPorNombre(nombre);
            if (productos.length === 0) {
                return res.status(404).json({ error: "Producto no encontrado" });
            }
            res.json(productos);
        } catch (error) {
          res.status(500).json({ error: "Error al obtener los productos" });
        }
    }
}

module.exports = ArticuloControlador;