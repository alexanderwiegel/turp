import 'package:turp/constants.dart';

class EmailValidator {
  static String? validate(String? value) {
    printInfo(value);
    bool emailValid =
        // from https://regex101.com/r/lHs2R3/1
        RegExp(r"^[\w\-\.]+@([\w-]+\.)+[\w-]{2,}$").hasMatch(value!);
    // from https://emailregex.com/
    // RegExp(r"(^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$)").hasMatch(value!);
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
      return 'Your passwords don\'t match';
    }
    return null;
  }
}
