import 'dart:convert';

class AuthModel {
  final String? localId;
  final String? email;
  final String? passwordHash;
  final String? idToken;
  final String? refreshToken;
  final String? expiresIn;

  const AuthModel({
    this.localId,
    this.email,
    this.passwordHash,
    this.idToken,
    this.refreshToken,
    this.expiresIn,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'localId': localId,
      'email': email,
      'passwordHash': passwordHash,
      'idToken': idToken,
      'refreshToken': refreshToken,
      'expiresIn': expiresIn,
    };
  }

  factory AuthModel.fromMap(Map<String, dynamic> map) {
    return AuthModel(
      localId: map['localId'] != null ? map['localId'] as String : null,
      email: map['email'] != null ? map['email'] as String : null,
      passwordHash:
          map['passwordHash'] != null ? map['passwordHash'] as String : null,
      idToken: map['idToken'] != null ? map['idToken'] as String : null,
      refreshToken:
          map['refreshToken'] != null ? map['refreshToken'] as String : null,
      expiresIn: map['expiresIn'] != null ? map['expiresIn'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory AuthModel.fromJson(String source) =>
      AuthModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
