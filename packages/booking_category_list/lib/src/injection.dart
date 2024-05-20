import 'package:get_it/get_it.dart';

import 'application/category_list/category_list_bloc.dart';
import 'domain/i_category_list_repository.dart';
import 'infrastructure/category_list_repository.dart';
import 'infrastructure/data_sources/category_list_api.dart';

final di = GetIt.instance;

void configureBookingCategoryListDepedencies() {
  di.registerFactory(() => CategoryListBloc(repository: di()));

  di.registerLazySingleton<CategoryListApi>(
    () => CategoryListApi(di()),
  );

  di.registerLazySingleton<ICategoryListRepository>(
    () => CategoryListRepository(categoryListApi: di()),
  );
}
