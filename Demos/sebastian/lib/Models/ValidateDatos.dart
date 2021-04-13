import 'package:moviephile/utils/TextApp.dart';

class ValidateDatos {
  //

  static bool isNameInvalid = false;
  static bool isLastNameInvalid = false;
  static bool isEmailInvalid = false;
  static bool isNickInvalid = false;
  static bool ispassWordInvalid = false;

  static bool validateName(String valueName) {
    if (valueName.isEmpty) {
      return true;
    }

    return false;
  }

  static bool validatemail(String valuemail) {
    if (!(valuemail.contains('@')) || valuemail.isEmpty) {
      return true;
    }
    return false;
  }

  static bool validateLastName(String valueLastName) {
    if (valueLastName.isEmpty) {
      return true;
    }
    return false;
  }

  static bool validateNick(String valueNixk) {
    if (valueNixk.isEmpty) {
      return true;
    }
    return false;
  }

  static bool validatepass(String valuepass) {
    if (valuepass.isEmpty) {
      return true;
    }
    return false;
  }

/*
retorna si todos los datos son validos 
*/
  static bool Datevalided() {
    if (isNameInvalid ||
        isLastNameInvalid ||
        isEmailInvalid ||
        isNickInvalid ||
        ispassWordInvalid) {
      return false;
    }
    return true;
  }
}
