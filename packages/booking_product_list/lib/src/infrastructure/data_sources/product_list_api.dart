import 'package:booking_product_list/src/core/product_list_consts.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../models/product_list_response.dart';

part 'product_list_api.g.dart';

@RestApi(baseUrl: ProductListConsts.baseApiUrl)
abstract class ProductListApi {
  factory ProductListApi(Dio dio, {String baseUrl}) = _ProductListApi;

  @GET('?limit={limit}&skip={skip}')
  Future<ProductListResponse> getAllProducts({
    @Path() int? limit,
    @Path() required int skip,
  });

  @GET('/category/{category}?limit={limit}')
  Future<ProductListResponse> getProductsByCategory({
    @Path() required String category,
    @Path() int? limit,
  });
}
