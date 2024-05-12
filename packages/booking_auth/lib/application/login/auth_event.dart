part of 'auth_bloc.dart';

@freezed
abstract class AuthEvent with _$AuthEvent {
  const factory AuthEvent.loginSubmitted(LoginRequest model) = LoginSubmitted;
  const factory AuthEvent.loginSubmittedF(FirebaseAuthRequest model) =
      LoginSubmittedF;
  const factory AuthEvent.checkLogin() = CheckLogin;
  const factory AuthEvent.checkLoginF() = CheckLoginF;
  const factory AuthEvent.checkObsecure(bool obs) = CheckObs;
  const factory AuthEvent.createAccountFirebase(FirebaseAuthRequest req) =
      CreateAccountFirebase;   
}
