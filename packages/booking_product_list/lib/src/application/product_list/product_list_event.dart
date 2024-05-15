part of 'product_list_bloc.dart';

@freezed
class ProductListEvent with _$ProductListEvent {
  const factory ProductListEvent.onLoadAllProducts() = _OnLoadAllProducts;
  const factory ProductListEvent.onLoadProductsByCategory({
    required String category,
  }) = _OnLoadProductsByCategory;
  const factory ProductListEvent.onResetState() = _OnResetState;
}
