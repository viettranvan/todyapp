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
