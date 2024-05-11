import 'package:booking_auth/injection.config.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

final getIt = GetIt.instance;

@InjectableInit(
    initializerName: 'init', preferRelativeImports: true, asExtension: true)
void configureBookingAuthDepedencies() => getIt.init();
