import 'package:booking_auth/infrastructure/auth/dto/auth/login_dto.dart';

abstract class LoginLocalDataSource {
  ////Get cached data from local memory
  ///it throw [CacheException] if nothing founfd anything response on local storage
  ///

  Future<LoginDto> getDataLoginFromLocal();

  ///it cached the received data from outside in the device cache
  ///
  Future<void> cacheLoginInLocalStorage(LoginDto loginDto);
}
