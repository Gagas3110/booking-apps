import 'package:booking_product_list/src/application/product_list/product_list_bloc.dart';
import 'package:get_it/get_it.dart';

import 'domain/i_product_list_repository.dart';
import 'infrastructure/data_sources/product_list_api.dart';
import 'infrastructure/product_list_repository.dart';

final di = GetIt.instance;

void configureBookingProductListDepedencies() {
  di.registerFactory(() => ProductListBloc(repository: di()));

  // di.registerLazySingleton<Dio>(
  //   () => Dio(),
  // );
  di.registerLazySingleton<ProductListApi>(
    () => ProductListApi(di()),
  );

  di.registerLazySingleton<IProductListRepository>(
    () => ProductListRepository(productListApi: di()),
  );
}
