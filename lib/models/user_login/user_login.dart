import 'dart:convert';

class UserLogin {
  final String? localId;
  final String? email;
  final String? displayName;
  final String? idToken;
  final String? refreshToken;
  UserLogin({
    this.localId,
    this.email,
    this.displayName,
    this.idToken,
    this.refreshToken,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'localId': localId,
      'email': email,
      'displayName': displayName,
      'idToken': idToken,
      'refreshToken': refreshToken,
    };
  }

  factory UserLogin.fromMap(Map<String, dynamic> map) {
    return UserLogin(
      localId: map['localId'] != null ? map['localId'] as String : null,
      email: map['email'] != null ? map['email'] as String : null,
      displayName:
          map['displayName'] != null ? map['displayName'] as String : null,
      idToken: map['idToken'] != null ? map['idToken'] as String : null,
      refreshToken:
          map['refreshToken'] != null ? map['refreshToken'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserLogin.fromJson(String source) =>
      UserLogin.fromMap(json.decode(source) as Map<String, dynamic>);
}
