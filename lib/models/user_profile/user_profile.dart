import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class UserProfile {
  final String? id;
  final String? email;
  final String? displayName;
  final String? photoUrl;
  final String? phoneNumber;
  final String? gender;
  final String? dateOfBirth;
  UserProfile({
    this.id,
    this.email,
    this.displayName,
    this.photoUrl,
    this.phoneNumber,
    this.gender,
    this.dateOfBirth,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'email': email,
      'displayName': displayName,
      'photoUrl': photoUrl,
      'phoneNumber': phoneNumber,
      'gender': gender,
      'dateOfBirth': dateOfBirth,
    };
  }

  factory UserProfile.fromMap(Map<String, dynamic> map) {
    return UserProfile(
      id: map['id'] != null
          ? (map['id'] as Map<String, dynamic>).toStringValue
          : null,
      email: map['email'] != null
          ? (map['email'] as Map<String, dynamic>).toStringValue
          : null,
      displayName: map['displayName'] != null
          ? (map['displayName'] as Map<String, dynamic>).toStringValue
          : null,
      photoUrl: map['photoUrl'] != null
          ? (map['photoUrl'] as Map<String, dynamic>).toStringValue
          : null,
      phoneNumber: map['phoneNumber'] != null
          ? (map['phoneNumber'] as Map<String, dynamic>).toStringValue
          : null,
      gender: map['gender'] != null
          ? (map['gender'] as Map<String, dynamic>).toStringValue
          : null,
      dateOfBirth: map['dateOfBirth'] != null
          ? (map['dateOfBirth'] as Map<String, dynamic>).toStringValue
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserProfile.fromJson(String source) =>
      UserProfile.fromMap(json.decode(source) as Map<String, dynamic>);
}

extension ToValue on Map<String, dynamic> {
  String get toStringValue => this['stringValue'];
}
