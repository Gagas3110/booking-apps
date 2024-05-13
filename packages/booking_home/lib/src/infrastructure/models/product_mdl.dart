import 'package:freezed_annotation/freezed_annotation.dart';

part 'product_mdl.freezed.dart';
part 'product_mdl.g.dart';

@freezed
class ProductMdl with _$ProductMdl {
  const factory ProductMdl({
    required int id,
    required String title,
    required String description,
    required int price,
    @Default(0) double? discountPercentage,
    required double rating,
    @Default(0) int? stock,
    required String brand,
    required String category,
    required String thumbnail,
    @Default([]) List<String>? images,
  }) = _ProductMdl;

  factory ProductMdl.fromJson(Map<String, dynamic> json) =>
      _$ProductMdlFromJson(json);
}
