import 'package:booking_home/src/core/home_consts.dart';
import 'package:booking_home/src/infrastructure/models/flash_sale_response.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'home_api.g.dart';

@RestApi(baseUrl: HomeConsts.baseApiUrl)
abstract class HomeApi {
  factory HomeApi(Dio dio, {String baseUrl}) = _HomeApi;

  @GET('')
  Future<FlashSaleResponse> getFlashSaleProduct();

  @GET('/categories')
  Future<List<String>> getCategories();

  // might want to change endpoint for get banner
  @GET('/category/womens-watches?limit=5')
  Future<FlashSaleResponse> getBanners();
}
