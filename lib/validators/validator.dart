mixin ValidationMixin {
  bool isValidPassword(String? value) => value != null && value.length == 6;
  bool isValidEmail(String? value) {
    if (value != null && value.length >= 5 && value.contains("@") && value.contains(".com") && value == "usuario@conecturban.com.br" ) {
      return true;
    }
    return false;
    }
}