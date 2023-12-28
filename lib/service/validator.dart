class EmailValidator {
  static String? validate(String? value) {
    bool emailValid =
        RegExp(r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]"
                r"{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]"
                r"{0,253}[a-zA-Z0-9])?)*$")
            .hasMatch(value!);
    if (value.isEmpty) {
      return 'Please enter an email address';
    } else if (!emailValid) {
      if (value.contains(' ')) {
        return null;
      } else {
        return 'Please enter a valid email address';
      }
    }
    return null;
  }
}

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
