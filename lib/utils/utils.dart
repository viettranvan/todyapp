//**** EMAIL RegExp ****/
final regexValidEmail = RegExp(
    r'^([_a-z0-9]+[\._a-z0-9]*)(\+[a-z0-9]+)?@(([a-z0-9-]+\.)*[a-z]{2,4})$$');

//************ PASSWORD ******************/
/// regex valid password:
/// > 8 characters
/// Have at least one uppercase letter, one lowercase letter
/// Have at least one number and one special character:
final regexValidPassword = RegExp(
    r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$');

String? emailValidator(String? value) {
  if (value == null || value.isEmpty) {
    return 'Email should not be empty';
  } else if (!regexValidEmail.hasMatch(value)) {
    return 'Please enter a valid email';
  }
  return null;
}

String? passwordValidator(String? value) {
  if (value == null || value.isEmpty) {
    return 'Please enter some text';
  } else if (!regexValidPassword.hasMatch(value)) {
    return 'Please enter a valid password';
  }

  return null;
}
