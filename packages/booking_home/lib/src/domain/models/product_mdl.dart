import 'package:freezed_annotation/freezed_annotation.dart';

part 'product_mdl.freezed.dart';
part 'product_mdl.g.dart';

@freezed
class ProductMdl with _$ProductMdl {
  const factory ProductMdl({
    @Default('') String name,
    @Default('') String company,
    @Default(0) int price,
  }) = _ProductMdl;

  factory ProductMdl.fromJson(Map<String, Object?> json) =>
      _$ProductMdlFromJson(json);
}
