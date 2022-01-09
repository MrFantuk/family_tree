class Validations {
  static String? validateName(String? value) {
    if (value!.isEmpty) return 'Обязательное поле.';
    final RegExp nameExp = RegExp(r'^[A-za-zğüşöçİĞÜŞÖÇ]+$');
    if (!nameExp.hasMatch(value)) {
      return 'Используйте только буквы.';
    }
    return null;
  }

  static String? validateEmail(String? value) {
    if (value!.isEmpty) return 'Обязательное поле.';
    final RegExp nameExp = RegExp(
        r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$");
    if (!nameExp.hasMatch(value)) return 'Введите действующий E-mail';
    return null;
  }

  static String? validatePassword(String? value) {
    if (value!.isEmpty || value.length < 6) {
      return 'Слабый пароль.';
    }
    return null;
  }

  static String validateTitle(String? value) {
    if (value!.isEmpty) {
      return 'Поле не может быть пустым.';
    }
    return value;
  }


}