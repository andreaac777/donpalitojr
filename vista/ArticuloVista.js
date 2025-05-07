const express = require('express');
const ruta = require('../controlador/ArticuloControlador');
const router = express.Router();

router.get('/productos', ruta.todoProducto);
router.get('/productos/:nombre', ruta.buscarPorNombre);

module.exports = router; 