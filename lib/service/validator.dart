import 'package:turp/constants.dart';

class EmailValidator {
  static String? validate(String? value) {
    printInfo(value);
    if (value!.isEmpty) {
      return 'Please enter an email address';
    }
    bool emailValid =
        // from https://regex101.com/r/lHs2R3/1
        RegExp(r"^[\w\-\.]+@([\w-]+\.)+[\w-]{2,}$").hasMatch(value);
    // from https://emailregex.com/
    // "(^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$)"
    if (!emailValid) {
      return 'Please enter a valid email address';
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

class NameValidator {
  static String? validate(String? value) {
    if (value!.isEmpty) {
      return 'Please enter a name';
    }
    if (value.length < 2) {
      return 'The name must be at least 2 characters long';
    }
    return null;
  }
}

class DateValidator {
  static String? validate(String? value) {
    if (value!.isEmpty) {
      return 'Please enter your date of birth';
    }
    bool dateValid =
        // from https://stackoverflow.com/questions/15491894/regex-to-validate-date-formats-dd-mm-yyyy-dd-mm-yyyy-dd-mm-yyyy-dd-mmm-yyyy
        RegExp(r"^(?:(?:31(\/|-|\.)(?:0?[13578]|1[02]))\1|(?:(?:29|30)(\/|-|\.)(?:0?[13-9]|1[0-2])\2))(?:(?:1[6-9]|[2-9]\d)?\d{2})$|^(?:29(\/|-|\.)0?2\3(?:(?:(?:1[6-9]|[2-9]\d)?(?:0[48]|[2468][048]|[13579][26])|(?:(?:16|[2468][048]|[3579][26])00))))$|^(?:0?[1-9]|1\d|2[0-8])(\/|-|\.)(?:(?:0?[1-9])|(?:1[0-2]))\4(?:(?:1[6-9]|[2-9]\d)?\d{2})$")
            .hasMatch(value);
    if (!dateValid) {
      return 'Please enter a valid date';
    }
    return null;
  }
}

class GenderValidator {
  static String? validate(String? value) {
    if (value == null) {
      return 'Please select a gender';
    }
    return null;
  }
}

class CountryValidator {
  static String? validate(String? value) {
    if (value!.isEmpty) {
      return 'Please select a country';
    }
    return null;
  }
}
