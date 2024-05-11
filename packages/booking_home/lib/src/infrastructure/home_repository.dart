import 'package:booking_home/src/core/exceptions.dart';
import 'package:booking_home/src/core/failures.dart';
import 'package:booking_home/src/domain/entities/product.dart';
import 'package:booking_home/src/domain/i_home_repository.dart';
import 'package:booking_home/src/infrastructure/data_sources/home_api.dart';
import 'package:booking_home/src/infrastructure/extensions/product_ext.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class HomeRepository implements IHomeRepository {
  final HomeApi homeApi;

  HomeRepository({required this.homeApi});

  @override
  Future<Either<Failure, List<String>>> getCategories() async {
    try {
      final result = await homeApi.getCategories();
      return Right(result);
    } on DioException catch (e) {
      return Left(Failure.onDio(message: e.message));
    } on ServerException {
      return const Left(Failure.onServer());
    }
  }

  @override
  Future<Either<Failure, List<Product>>> getFlashSale() async {
    try {
      final result = await homeApi.getProducts();
      final products = List<Product>.from(
        result.products.map((x) => x.toDomain()),
      );

      return Right(products);
    } on DioException catch (e) {
      return Left(Failure.onDio(message: e.message));
    } on ServerException {
      return const Left(Failure.onServer());
    }
  }
}
