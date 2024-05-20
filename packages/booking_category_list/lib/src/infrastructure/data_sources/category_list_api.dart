import 'package:booking_category_list/src/core/category_list_consts.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'category_list_api.g.dart';

@RestApi(baseUrl: CategoryListConsts.baseApiUrl)
abstract class CategoryListApi {
  factory CategoryListApi(Dio dio, {String baseUrl}) = _CategoryListApi;

  @GET('/categories')
  Future<List<String>> getCategories();
}
