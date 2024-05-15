part of 'product_list_bloc.dart';

@freezed
class ProductListState with _$ProductListState {
  const factory ProductListState({
    @Default(false) bool isLoading,
    @Default(false) bool isError,
    @Default([]) List<Product> productList,
    @Default(0) int total,
    @Default(0) int counter,
    @Default('') String errorMessage,
  }) = _ProductListLoaded;
}
