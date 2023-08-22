import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class UserAuth {
  final String? idToken;
  final String? email;
  final String? refreshToken;
  final String? expiresIn;
  final String? localId;
  UserAuth({
    this.idToken,
    this.email,
    this.refreshToken,
    this.expiresIn,
    this.localId,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'idToken': idToken,
      'email': email,
      'refreshToken': refreshToken,
      'expiresIn': expiresIn,
      'localId': localId,
    };
  }

  factory UserAuth.fromMap(Map<String, dynamic> map) {
    return UserAuth(
      idToken: map['idToken'] != null ? map['idToken'] as String : null,
      email: map['email'] != null ? map['email'] as String : null,
      refreshToken:
          map['refreshToken'] != null ? map['refreshToken'] as String : null,
      expiresIn: map['expiresIn'] != null ? map['expiresIn'] as String : null,
      localId: map['localId'] != null ? map['localId'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserAuth.fromJson(String source) =>
      UserAuth.fromMap(json.decode(source) as Map<String, dynamic>);
}
