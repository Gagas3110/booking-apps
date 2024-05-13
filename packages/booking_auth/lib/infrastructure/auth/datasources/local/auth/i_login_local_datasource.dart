import 'dart:convert';

import 'package:booking_auth/infrastructure/auth/dto/auth/login_dto.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../../domain/core/errors/exceptions.dart';
import '../../../../../domain/core/utils/auth_constant.dart';
import 'login_local_datasources.dart';

@LazySingleton(as: LoginLocalDataSource)
class ILoginLocalDataSource implements LoginLocalDataSource {
  final SharedPreferences _sharedPreferences;
  const ILoginLocalDataSource(this._sharedPreferences);
  @override
  Future<void> cacheLoginInLocalStorage(LoginDto loginDto) async {
    final resp = loginDto.toJson();
    String encodedData = json.encode(resp);

    await _sharedPreferences.setString(cachedLogin, encodedData);
  }

  @override
  Future<LoginDto> getDataLoginFromLocal() {
    String? cachedData = _sharedPreferences.getString(cachedLogin);
    if (cachedData == null) {
      throw CacheException();
    }
    final decodeDataFromCached = json.decode(cachedData);
    final loginDto = LoginDto.fromJson(decodeDataFromCached);
    return Future.value(loginDto);
  }

  @override
  Future<void> cacheLoginFirebaseInLocalStorage(UserCredential userCred) async {
    final resp = userCred;
    await _sharedPreferences.setString(userToken, resp.user!.uid);
  }

  @override
  Future<String> getDataLoginFirebaseFromLocal() {
    String? cachedData = _sharedPreferences.getString(userToken);
    if (cachedData == null) {
      throw CacheException();
    }
    final userCred = cachedData;
    return Future.value(userCred);
  }
}
