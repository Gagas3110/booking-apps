import 'package:booking_auth/domain/auth/entities/login_request.dart';

import 'package:booking_auth/domain/auth/entities/login_response.dart';
import 'package:booking_auth/domain/core/errors/exceptions.dart';

import 'package:booking_auth/domain/core/errors/failures.dart';
import 'package:booking_auth/domain/core/utils/constant.dart';
import 'package:booking_auth/infrastructure/auth/datasources/local/auth/login_local_datasources.dart';

import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../domain/auth/repositories/auth_repository.dart';
import '../../../domain/core/network/network_info.dart';
import '../datasources/remote/api/login_api.dart';

@LazySingleton(as: AuthRepository)
class IAuthRepository implements AuthRepository {
  final LoginApi _loginApi;
  final NetworkInfo _networkInfo;
  final LoginLocalDataSource _loginLocalDataSource;
  const IAuthRepository(
      this._loginApi, this._networkInfo, this._loginLocalDataSource);

  @override
  Future<Either<Failure, LoginResponse>> getLoginResponse(
      LoginRequest req) async {
    ///Irepository is center or brain of insfrastructure layer
    ///because we decide whether we return fresh data or cached data
    ///based on internet connection
    ///

    if (await _networkInfo.isConnected) {
      try {
        final loginData = await _loginApi.login(req.toJson());
        await _loginLocalDataSource.cacheLoginInLocalStorage(loginData);
        return Right(loginData);
      } on ServerException {
        return const Left(Failure.serverFailure(serverFailureMessages));
      }
    } else {
      //no internet connection, get data from cache
      //and if no data
      try {
        final loginData = await _loginLocalDataSource.getDataLoginFromLocal();
        return Right(loginData);
      } on CacheException {
        return const Left(Failure.cacheFailure(cacheFailureMessages));
      }
    }
  }
}
