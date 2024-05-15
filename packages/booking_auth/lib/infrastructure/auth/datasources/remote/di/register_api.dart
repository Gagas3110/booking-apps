import 'package:booking_common/booking_common.dart';
import 'package:injectable/injectable.dart';

import '../api/login_api.dart';

@module
abstract class RegisterApi {
  @lazySingleton
  LoginApi getloginApi() => LoginApi(globalDi());
}
