class PasswordValidator {
  static String? validate(String? password) {
    if (password!.isEmpty) {
      return 'Password cannot be empty';
    } else if (password.length < 6) {
      return 'Your password must be at least 6 characters long';
    }
    return null;
  }
}

class RepeatedPasswordValidator {
  static String? validate(String? password, String? repeatedPassword) {
    if (password!.isEmpty) {
      return 'Password cannot be empty';
    } else if (password.length < 6) {
      return 'Your password must be at least 6 characters long';
    } else if (password != repeatedPassword) {
      return 'Your password doesn\'t match';
    }
    return null;
  }
}
