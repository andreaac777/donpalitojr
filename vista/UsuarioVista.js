const express = require('express');
const ruta = require('../controlador/UsuarioControlador');
const router = express.Router();

router.post('/registro', ruta.crearCliente);

module.exports = router; 