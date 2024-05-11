import 'package:booking_auth/domain/auth/entities/login_request.dart';
import 'package:booking_auth/domain/auth/entities/login_response.dart';
import 'package:booking_auth/domain/core/errors/failures.dart';
import 'package:dartz/dartz.dart';

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
}
