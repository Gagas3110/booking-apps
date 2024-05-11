import 'dart:async';
import 'package:booking_auth/domain/auth/entities/login_response.dart';
import 'package:booking_auth/domain/core/errors/failures.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import '../../domain/auth/entities/login_request.dart';
import '../../domain/auth/repositories/auth_repository.dart';

part 'login_bloc.freezed.dart';
part 'login_event.dart';
part 'login_state.dart';

@injectable
class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final AuthRepository _authRepo;
  LoginBloc(this._authRepo) : super(const LoginState.initState()) {
    on<ChackLogin>(_checkLogin);
    on<LoginSubmiited>(_submitLogin);
    on<CheckObs>(_checkObs);
  }

  Future<bool> _checkObs(LoginEvent event, Emitter<LoginState> emit) async {
    try {
      if (event is CheckObs) {
        final obsecure = !event.obs;
        emit(GetObsecureBool(obsecure));
        return obsecure;
      } else {
        emit(const GetObsecureBool(false));
        return false;
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<void> _checkLogin(LoginEvent event, Emitter<LoginState> emit) async {
    try {
      if (event is ChackLogin) {
        final response = await _authRepo.getLoginResponseFromLocal();
        if (response.token.isEmpty) {
          emit(const NotLoginState());
        } else {
          emit(const IsLoginState());
        }
      }
    } catch (e) {
      emit(const NotLoginState());
    }
  }

  Future<void> _submitLogin(LoginEvent event, Emitter<LoginState> emit) async {
    try {
      emit(const LoginProgress());
      if (event is LoginSubmiited) {
        final result = await _authRepo.getLoginResponse(event.model);
        result.fold(
          (l) async => emit(
            LoginFailed(l),
          ),
          (r) async => emit(
            LoginSuccess(r),
          ),
        );
      }
    } catch (e) {
      rethrow;
    }
  }
}
