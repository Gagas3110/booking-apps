part of 'flash_sale_bloc.dart';

@freezed
class FlashSaleState with _$FlashSaleState {
  const factory FlashSaleState({
    @Default(false) bool isLoading,
    @Default(false) bool isError,
    @Default(<Product>[]) List<Product> flashSaleProductList,
    @Default('') String errorMessage,
  }) = _FlashSaleLoaded;
}
