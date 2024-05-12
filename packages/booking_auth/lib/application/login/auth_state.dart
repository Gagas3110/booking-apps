part of 'auth_bloc.dart';

@freezed
abstract class AuthState with _$AuthState {
  const factory AuthState.isAuthState() = IsLoginState;
  const factory AuthState.notLoginState() = NotLoginState;
  const factory AuthState.initState() = InitState;
  const factory AuthState.loginInProgress() = LoginProgress;
  const factory AuthState.loginSuccess(LoginResponse response) = LoginSuccess;
  const factory AuthState.loginSuccessF(String userToken) = LoginSuccessF;
  const factory AuthState.obsecureText(bool obs) = GetObsecureBool;
  const factory AuthState.loginFailed(Failure? failure) = LoginFailed;
  const factory AuthState.createUserSuccess() = CreateUserSuccess;
  const factory AuthState.createUserLoading() = CreateUserLoading;
  const factory AuthState.createUserFailed(String message) = CreateUserError;
}
