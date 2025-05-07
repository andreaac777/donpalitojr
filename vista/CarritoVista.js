const express = require('express');
const ruta = require('../controlador/CarritoControlador');
const router = express.Router();

// Rutas para el carrito de compras
router.post('/carrito/agregar', ruta.agregarAlCarrito);
router.put('/carrito/modificar/:id', ruta.modificarCarrito);
router.delete('/carrito/eliminar/:id', ruta.eliminarDelCarrito);
router.get('/carrito/:idUsuario', ruta.obtenerCarrito);

module.exports = router;
