const dbService = require('./bd/Conexion');
const bcrypt = require('bcrypt');

class LoginModelo {
  
  // Buscar usuario por correo
  static async buscaCorreo(email) {
    const query = 'SELECT * FROM usuarios WHERE correo = ?';
    try {
      const result = await dbService.query(query, [email]);
      return result.length ? result[0] : null;
    } catch (err) {
      throw new Error(`Error al buscar el usuario por correo: ${err.message}`);
    }
  }

  // Validar correo y contraseña
  static async validarCredenciales(email, contra) {
    if (!email || !contra) {
      throw new Error('Correo y contraseña son obligatorios');
    }

    try {
      const usuario = await this.buscaCorreo(email); // Se cambia loginModelo a this
      if (!usuario) {
        return null; // Usuario no encontrado
      }

      // Comparar la contraseña encriptada
      const match = await bcrypt.compare(contra, usuario.contrasena); // Cambiado a "contrasena"
      if (!match) {
        return null; // Contraseña incorrecta
      }
      return usuario; // Credenciales correctas
    } catch (err) {
      throw new Error(`Error al validar credenciales: ${err.message}`);
    }
  }
}

module.exports = LoginModelo;