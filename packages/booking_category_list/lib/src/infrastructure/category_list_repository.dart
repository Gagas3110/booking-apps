import 'package:booking_category_list/src/core/exceptions.dart';
import 'package:booking_category_list/src/core/failures.dart';
import 'package:booking_category_list/src/domain/i_category_list_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import 'data_sources/category_list_api.dart';

class CategoryListRepository implements ICategoryListRepository {
  final CategoryListApi categoryListApi;

  CategoryListRepository({required this.categoryListApi});

  @override
  Future<Either<Failure, List<String>>> getCategories() async {
    try {
      final result = await categoryListApi.getCategories();
      return Right(result);
    } on DioException catch (e) {
      return Left(Failure.onDio(message: e.message));
    } on ServerException {
      return const Left(Failure.onServer());
    }
  }
}
