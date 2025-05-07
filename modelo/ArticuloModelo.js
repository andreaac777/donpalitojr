const dbService = require('./bd/Conexion');

class ArticuloModelo {
    // Obtener todos los articulos con paginación
    
    static async todoProducto(pagina = 1) {
        const limite = 50;  // Número máximo de productos por página
        const offset = (pagina - 1) * limite;  // Calculamos el offset para la paginación
        const query = `SELECT * FROM productos ORDER BY idProducto ASC LIMIT ${limite} OFFSET ${offset}`;
        try {
            return await dbService.query(query);
        } catch (err) {
            throw new Error(`Error al obtener los productos: ${err.message}`);
        }
    }                         

    // Buscar articulo por nombre (autocompletado)
    static async buscarPorNombre(nombre) {
        const query = 'SELECT * FROM productos WHERE nombreProducto LIKE ?';
        try {
            return await dbService.query(query, [`%${nombre}%`]);
        } catch (err) {
            throw new Error(`Error al buscar el producto por nombre: ${err.message}`);
        }
    }
}

module.exports = ArticuloModelo;