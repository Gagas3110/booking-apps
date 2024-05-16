import 'package:booking_product_list/src/core/failures.dart';
import 'package:dartz/dartz.dart';

import 'entities/product_list.dart';

abstract class IProductListRepository {
  Future<Either<Failure, ProductList>> getAllProducts({
    required int skip,
    int? limit,
  });
  Future<Either<Failure, ProductList>> getProductsByCategory({
    required String category,
    int? limit,
  });
}
