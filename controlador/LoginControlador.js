const modelo = require('../modelo/LoginModelo');

class LoginControlador {
  static async validarCredencial(req, res) {
    const { t1: correo, t2: contrasena } = req.body; // Cambiar nombres más descriptivos

    if (!correo || !contrasena) {
      return res.status(400).json({ error: 'Correo y contraseña son obligatorios' });
    }

    try {
      const usuario = await modelo.validarCredenciales(correo, contrasena);
      
      if (!usuario) {
        return res.status(401).json({ error: 'Correo o contraseña incorrectos' });
      }

      // Eliminar contraseña del objeto usuario antes de enviarlo
      const { contrasena: _, ...usuarioSinPassword } = usuario;
      
      res.json({ 
        mensaje: 'Inicio de sesión exitoso', 
        usuario: usuarioSinPassword 
      });
    } catch (err) {
      res.status(500).json({ 
        error: `Hubo un error al validar las credenciales: ${err.message}` 
      });
    }
  }
}

module.exports = LoginControlador;