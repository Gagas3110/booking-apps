import 'dart:convert';

import 'package:booking_auth/infrastructure/auth/dto/auth/login_dto.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../../domain/core/errors/exceptions.dart';
import '../../../../../domain/core/utils/constant.dart';
import 'login_local_datasources.dart';

@LazySingleton(as: LoginLocalDataSource)
class ILoginLocalDataSource implements LoginLocalDataSource {
  final SharedPreferences _sharedPreferences;
  const ILoginLocalDataSource(this._sharedPreferences);
  @override
  Future<void> cacheLoginInLocalStorage(LoginDto loginDto) async {
    try {
      final resp = loginDto.toJson();
      String encodedData = json.encode(resp);

      await _sharedPreferences.setString(cachedLogin, encodedData);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<LoginDto> getDataLoginFromLocal() {
    try {
      String? cachedData = _sharedPreferences.getString(cachedLogin);
      if (cachedData == null) {
        throw CacheException();
      }
      final decodeDataFromCached = json.decode(cachedData);
      final loginDto = LoginDto.fromJson(decodeDataFromCached);
      return Future.value(loginDto);
    } catch (e) {
      rethrow;
    }
  }
}
