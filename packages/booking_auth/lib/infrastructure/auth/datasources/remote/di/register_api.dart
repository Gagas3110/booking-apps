import 'package:booking_home/booking_home.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../api/login_api.dart';

@module
abstract class RegisterApi {
  final dio = di<Dio>();
  @lazySingleton
  LoginApi getloginApi() => LoginApi(dio);
}
