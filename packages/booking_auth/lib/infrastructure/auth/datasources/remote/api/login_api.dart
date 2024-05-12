import 'package:booking_auth/domain/core/utils/auth_constant.dart';
import 'package:booking_auth/infrastructure/auth/dto/auth/login_dto.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'login_api.g.dart';

@RestApi(baseUrl: loginBaseUrlAuth)
abstract class LoginApi {
  factory LoginApi(Dio dio, {String baseUrl}) = _LoginApi;

  @POST("/Login")
  Future<LoginDto> login(@Body() Map<String, dynamic> body);
}
