import 'package:booking_home/booking_home.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'product_list_response.freezed.dart';
part 'product_list_response.g.dart';

@freezed
class ProductListResponse with _$ProductListResponse {
  const factory ProductListResponse({
    @Default([]) List<ProductMdl> products,
    @Default(0) int? total,
    @Default(0) int? skip,
    @Default(0) int? limit,
  }) = _ProductListResponse;

  factory ProductListResponse.fromJson(Map<String, dynamic> json) =>
      _$ProductListResponseFromJson(json);
}
