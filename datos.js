const express = require('express');
const cors = require('cors');
const registro = require('./vista/UsuarioVista');
const productos = require('./vista/ArticuloVista');
const login = require('./vista/LoginVista');
const carrito = require('./vista/CarritoVista');
//const path = require('path');
const app = express();
const PORT = process.env.PORT || 4545;

// Middleware
app.use(cors({
  origin: '*', // Cambiar ['http://tu.com', 'http://yo.com'],
  methods: ['GET', 'POST', 'PUT', 'DELETE'], // Métodos permitidos
  allowedHeaders: ['Content-Type', 'Authorization'], // Encabezados permitidos
  credentials: true // Habilita el envío de credenciales si es necesario
}));

// Middleware para parseo de solicitudes
app.use(express.json());
app.use(express.urlencoded({ extended: true }));
//app.use(express.static(path.join(__dirname, 'public')));

// Rutas 
app.use('/', registro);
app.use('/', productos);
app.use('/', login);
app.use('/', carrito);

// Iniciar el servidor
app.listen(PORT, () => {
  console.log(`Servidor corriendo en http://localhost:${PORT}`);
});