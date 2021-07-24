class Validator {
  static RegExp emailRegEx = RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");

  static RegExp nameRegEx = RegExp(r"^[A-Za-z\s]{1,}[\.]{0,1}[A-Za-z\s]{0,}$");

  static bool validateEmail(String val) {
    if (val.isEmpty) return false;
    if (!emailRegEx.hasMatch(val)) return false;
    return true;
  }

  static bool validatePassword(String val) {
    if (val.length < 6) return false;
    return true;
  }

  static bool validateFullName(String val) {
    if (val.isEmpty) return false;
    if (!nameRegEx.hasMatch(val)) return false;
    return true;
  }
}
