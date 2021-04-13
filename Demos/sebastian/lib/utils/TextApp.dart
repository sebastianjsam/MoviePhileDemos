class TextApp {
//Texto
  static final String NAME_TEXT = "Nombre\*";
  static final String LASTNAME_TEXT = "Apellido\*";
  static final String NICK_TEXT = "Nick\*";
  static final String EMAIL_TEXT = "Email\*";
  static final String PASSWORD_TEXT = "Contraseña\*";

  //invalid datos
  static final String INVALID_Name = "Nombre no válido";
  static final String INVALID_LAST_NAME = "Apellido no válido";
  static final String INVALID_NICK = "Nick no válido";
  static String INVALID_EMAIL = "Correo no válido ";
  static String INVALID_PASSWORD =
      "Contraseña no válido\n tiene que tener mas de 3";

  static String CONNECTION_API_URL = 'http://10.0.2.2:53865/api/Auth/Register';
}
