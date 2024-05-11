part of 'login_bloc.dart';

@freezed
abstract class LoginState with _$LoginState {
  const factory LoginState.isAuthState() = IsLoginState;
  const factory LoginState.notLoginState() = NotLoginState;
  const factory LoginState.initState() = InitState;
  const factory LoginState.loginInProgress() = LoginProgress;
  const factory LoginState.loginSuccess(LoginResponse response) = LoginSuccess;
  const factory LoginState.obsecureText(bool obs) = GetObsecureBool;
  const factory LoginState.loginFailed(Failure? failure) = LoginFailed;
}
