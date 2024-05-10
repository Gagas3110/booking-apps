part of 'flash_sale_bloc.dart';

@freezed
class FlashSaleState with _$FlashSaleState {
  const factory FlashSaleState({
    @Default(false) bool isLoading,
    @Default(<ProductMdl>[]) List<ProductMdl> flashSaleProductList,
  }) = _FlashSaleLoaded;
}
