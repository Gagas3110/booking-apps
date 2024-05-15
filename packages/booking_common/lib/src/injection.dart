import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final globalDi = GetIt.instance;

void configureBookingCommonDepedencies() {
  globalDi.registerLazySingleton<Dio>(() => Dio());
}
