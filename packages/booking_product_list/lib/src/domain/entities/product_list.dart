import 'package:booking_home/booking_home.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'product_list.freezed.dart';

@freezed
class ProductList with _$ProductList {
  const factory ProductList({
    @Default([]) List<Product> productList,
    @Default(0) int total,
    @Default(0) int skip,
    @Default(0) int limit,
  }) = _ProductList;
}
