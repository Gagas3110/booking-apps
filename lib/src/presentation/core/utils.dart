import 'package:get_it/get_it.dart';
import 'package:booking_home/src/application/profile/profile_bloc.dart';

final getIt = GetIt.instance;

void setupLocator() {
  // register depedencies
  getIt.registerLazySingleton(() => ProfileBloc());
}
