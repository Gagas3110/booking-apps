import 'package:booking_home/booking_home.dart';
import 'package:booking_product_list/src/core/exceptions.dart';
import 'package:booking_product_list/src/core/failures.dart';
import 'package:booking_product_list/src/domain/entities/product_list.dart';
import 'package:booking_product_list/src/domain/i_product_list_repository.dart';
import 'package:booking_product_list/src/infrastructure/data_sources/product_list_api.dart';
import 'package:booking_product_list/src/infrastructure/extensions/product_ext.dart';
import 'package:dio/dio.dart';

class ProductListRepository implements IProductListRepository {
  final ProductListApi productListApi;

  ProductListRepository({required this.productListApi});

  @override
  Future<Either<Failure, ProductList>> getAllProducts({
    required int skip,
    int? limit = 20,
  }) async {
    try {
      final result = await productListApi.getAllProducts(
        limit: limit,
        skip: skip,
      );

      return Right(result.toDomain());
    } on DioException catch (e) {
      return Left(Failure.onDio(message: e.message));
    } on ServerException {
      return const Left(Failure.onServer());
    }
  }

  @override
  Future<Either<Failure, ProductList>> getProductsByCategory({
    required String category,
    int? limit = 20,
  }) async {
    try {
      final result = await productListApi.getProductsByCategory(
        category: category,
        limit: limit,
      );

      return Right(result.toDomain());
    } on DioException catch (e) {
      return Left(Failure.onDio(message: e.message));
    } on ServerException {
      return const Left(Failure.onServer());
    }
  }
}
