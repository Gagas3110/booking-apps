import 'package:booking_common/booking_common.dart';
import 'package:booking_home/src/domain/i_home_repository.dart';
import 'package:booking_home/src/infrastructure/data_sources/home_api.dart';
import 'package:get_it/get_it.dart';

import 'application/banner/banner_bloc.dart';
import 'application/category/category_bloc.dart';
import 'application/flash_sale/flash_sale_bloc.dart';
import 'infrastructure/home_repository.dart';

final di = GetIt.instance;

void configureBookingHomeDepedencies() {
  di.registerFactory(() => BannerBloc(repository: di()));
  di.registerFactory(() => CategoryBloc(repository: di()));
  di.registerFactory(() => FlashSaleBloc(repository: di()));

  di.registerLazySingleton<HomeApi>(
    () => HomeApi(globalDi()),
  );

  di.registerLazySingleton<IHomeRepository>(
    () => HomeRepository(homeApi: di()),
  );
}
