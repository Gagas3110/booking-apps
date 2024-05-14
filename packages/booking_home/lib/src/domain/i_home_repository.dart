import 'package:booking_home/src/core/failures.dart';
import 'package:booking_home/src/domain/entities/product.dart';
import 'package:dartz/dartz.dart';

abstract class IHomeRepository {
  Future<Either<Failure, List<Product>>> getBanners();
  Future<Either<Failure, List<String>>> getCategories();
  Future<Either<Failure, List<Product>>> getFlashSale();
}
