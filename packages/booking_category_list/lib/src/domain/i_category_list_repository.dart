import 'package:booking_category_list/src/core/failures.dart';
import 'package:dartz/dartz.dart';

abstract class ICategoryListRepository {
  Future<Either<Failure, List<String>>> getCategories();
}
