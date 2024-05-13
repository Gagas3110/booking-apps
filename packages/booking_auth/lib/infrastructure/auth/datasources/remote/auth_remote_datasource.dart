//use for get data from firebase

import 'package:firebase_auth/firebase_auth.dart';

import '../../../../domain/auth/firebase_auth_request.dart';

abstract class AuthRemoteDataSources {
  Future<UserCredential> getDataFromLoginFirebase(FirebaseAuthRequest req);
  Future<void> createUserFirebase(FirebaseAuthRequest req);
  User? get currentUser;
  Stream<User?> get authStateChanges;
}
