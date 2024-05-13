import 'dart:async';

import 'package:booking_auth/domain/auth/entities/login_request.dart';

import 'package:booking_auth/domain/auth/entities/login_response.dart';
import 'package:booking_auth/domain/auth/firebase_auth_request.dart';
import 'package:booking_auth/domain/core/errors/exceptions.dart';

import 'package:booking_auth/domain/core/errors/failures.dart';
import 'package:booking_auth/domain/core/utils/auth_constant.dart';
import 'package:booking_auth/infrastructure/auth/datasources/local/auth/login_local_datasources.dart';

import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';

import '../../../domain/auth/repositories/auth_repository.dart';
import '../../../domain/core/network/network_info.dart';
import '../datasources/remote/api/login_api.dart';
import '../datasources/remote/i_auth_remote_datasources.dart';

@LazySingleton(as: AuthRepository)
class IAuthRepository implements AuthRepository {
  final LoginApi _loginApi;
  final NetworkInfo _networkInfo;
  final LoginLocalDataSource _loginLocalDataSource;
  final IAuthRemoteDataSources _authRemoteDataSource;
  const IAuthRepository(this._loginApi, this._networkInfo,
      this._loginLocalDataSource, this._authRemoteDataSource);

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

        ////Note : Why we decide to didnt use toDomain() method ?
        ///because DTO extends from entity and then will be parsed automatically
        ///but, i'll be place the code commented below how to convert it manually (if u want do it manually)

        ///final albumsConverted = albumsData.map((e) => e.toDomain()).toList();
        ///return Right(albumsConverted);
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

  @override
  Future<LoginResponse> getLoginResponseFromLocal() async {
    try {
      final loginData = await _loginLocalDataSource.getDataLoginFromLocal();
      return loginData;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<Either<Failure, String>> sigInWithEmail(
      FirebaseAuthRequest req) async {
    if (await _networkInfo.isConnected) {
      try {
        final data = await _authRemoteDataSource.getDataFromLoginFirebase(req);
        await _loginLocalDataSource.cacheLoginFirebaseInLocalStorage(data);
        return Right(data.user!.uid);
      } on FirebaseException catch (e) {
        return Left(Failure.serverFailure(e.message ?? "Firebase error"));
      } catch (e) {
        rethrow;
      }
    } else {
      try {
        final data =
            await _loginLocalDataSource.getDataLoginFirebaseFromLocal();
        return Right(data);
      } on CacheException catch (_) {
        return const Left(Failure.cacheFailure("Cache error"));
      } catch (e) {
        rethrow;
      }
    }
  }

  @override
  User currentUser() {
    try {
      final user = _authRemoteDataSource.currentUser;
      return user!;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Stream<User?> authStateChanges() {
    try {
      final authStateChanged = _authRemoteDataSource.authStateChanges;
      return authStateChanged;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<String?> getUserTokenAuthFirebase() async {
    try {
      final userToken =
          await _loginLocalDataSource.getDataLoginFirebaseFromLocal();
      return userToken;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<Either<Failure, void>> createUserFirebase(
      FirebaseAuthRequest req) async {
    try {
      await _authRemoteDataSource.createUserFirebase(req);
      return const Right(null);
    } on FirebaseAuthException catch (e) {
      return Left(
        Failure.serverFailure(
          "FirebaseAuthException: ${e.message}",
        ),
      );
    } catch (e) {
      return Left(
        Failure.serverFailure(
          "General Exception: ${e.toString()}",
        ),
      );
    }
  }
}
