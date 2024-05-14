import 'package:booking_auth/domain/auth/repositories/auth_repository.dart';

import 'package:firebase_auth/firebase_auth.dart';

class GetCurrentLoginUser {
  final AuthRepository repository;

  GetCurrentLoginUser(this.repository);

  User call() {
    return repository.currentUser();
  }
}
