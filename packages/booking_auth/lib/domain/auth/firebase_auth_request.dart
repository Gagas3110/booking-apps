import 'dart:convert';

import 'package:flutter/widgets.dart';

class FirebaseAuthRequest {
  final String? name;
  final String? email;
  final String? password;

  const FirebaseAuthRequest({
    this.email,
    this.password,
    this.name,
  }) : assert(email != null, password != null);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is FirebaseAuthRequest &&
        other.email == email &&
        other.name == name &&
        other.password == password;
  }

  @override
  int get hashCode => email.hashCode ^ password.hashCode ^ name.hashCode;

  FirebaseAuthRequest copyWith({
    ValueGetter<String?>? email,
    ValueGetter<String?>? password,
    ValueGetter<String?>? name,
  }) {
    return FirebaseAuthRequest(
      email: email != null ? email() : this.email,
      password: password != null ? password() : this.password,
      name: name != null ? name() : this.name,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'email': email,
      'password': password,
      'name': name,
    };
  }

  factory FirebaseAuthRequest.fromMap(Map<String, dynamic> map) {
    return FirebaseAuthRequest(
      email: map['email'],
      password: map['password'],
      name: map['name'],
    );
  }

  String toJson() => json.encode(toMap());

  factory FirebaseAuthRequest.fromJson(String source) =>
      FirebaseAuthRequest.fromMap(json.decode(source));

  @override
  String toString() =>
      'FirebaseAuthRequest(email: $email, password: $password, name : $name)';
}
