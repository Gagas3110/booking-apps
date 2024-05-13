import 'package:freezed_annotation/freezed_annotation.dart';

part 'product.freezed.dart';

@freezed
class Product with _$Product {
  const factory Product({
    required int id,
    @Default('') String? title,
    @Default('') String? brand,
    @Default('') String imageUrl,
    @Default(0) int? price,
    @Default(0) double? discount,
  }) = _Product;
}
