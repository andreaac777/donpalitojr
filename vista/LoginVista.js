const express = require('express');
const ruta = require('../controlador/LoginControlador');
const router = express.Router();

router.post('/login', ruta.validarCredencial);

module.exports = router; 