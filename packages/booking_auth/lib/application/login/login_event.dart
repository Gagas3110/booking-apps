part of 'login_bloc.dart';

@freezed
abstract class LoginEvent with _$LoginEvent {
  const factory LoginEvent.loginSubmitted(LoginRequest model) = LoginSubmiited;
  const factory LoginEvent.checkLogin() = ChackLogin;
  const factory LoginEvent.checkObsecure(bool obs) = CheckObs;
}
