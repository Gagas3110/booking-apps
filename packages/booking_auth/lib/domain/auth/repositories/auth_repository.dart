import 'package:booking_auth/domain/auth/entities/login_request.dart';
import 'package:booking_auth/domain/auth/entities/login_response.dart';
import 'package:booking_auth/domain/core/errors/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../firebase_auth_request.dart';

abstract class AuthRepository {
  ///interfaces which holds contracts pf what the "login" do
  ///
  ///
  ///
  ///
  ///
  ///

  Future<Either<Failure, LoginResponse>> getLoginResponse(LoginRequest req);
  Future<LoginResponse> getLoginResponseFromLocal();
  Future<String?> getUserTokenAuthFirebase();
  Future<Either<Failure, String>> sigInWithEmail(FirebaseAuthRequest req);
  User currentUser();
  Stream<User?> authStateChanges();
  Future<Either<Failure, void>> createUserFirebase(FirebaseAuthRequest req);
}
