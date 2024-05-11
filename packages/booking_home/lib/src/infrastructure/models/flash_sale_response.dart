import 'package:freezed_annotation/freezed_annotation.dart';

import 'product_mdl.dart';

part 'flash_sale_response.freezed.dart';
part 'flash_sale_response.g.dart';

@freezed
class FlashSaleResponse with _$FlashSaleResponse {
  const factory FlashSaleResponse({
    @Default([]) List<ProductMdl> products,
  }) = _FlashSaleResponse;

  factory FlashSaleResponse.fromJson(Map<String, dynamic> json) =>
      _$FlashSaleResponseFromJson(json);
}
