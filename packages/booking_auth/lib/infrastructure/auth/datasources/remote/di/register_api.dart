import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../api/login_api.dart';

@module
abstract class RegisterApi {
  @lazySingleton
  LoginApi getloginApi(Dio dio) => LoginApi(dio);
}
