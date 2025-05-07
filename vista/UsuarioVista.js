const express = require('express');
const ruta = require('../controlador/UsuarioControlador');
const router = express.Router();

router.post('/registro', ruta.crearUsuario);

module.exports = router; 