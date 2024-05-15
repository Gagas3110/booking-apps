import 'package:booking_profile/src/application/profile/profile_bloc.dart';
import 'package:booking_profile/src/domain/usecases/get_current_user.dart';
import 'package:booking_profile/src/domain/usecases/message_service.dart';
import 'package:booking_profile/src/domain/usecases/wa_service.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void configureBookingProfileDepedencies() {
  // Bloc
  getIt.registerFactory(() => ProfileBloc(getCurrentLoginUser: getIt()));

  // Repositories
  getIt.registerLazySingleton<GetCurrentLoginUser>(() => GetCurrentLoginUser(getIt()));

  //WA service
  getIt.registerSingleton<WhatsAppService>(WhatsAppService());

  //SMS service
  getIt.registerSingleton<MessageService>(MessageService());
}
