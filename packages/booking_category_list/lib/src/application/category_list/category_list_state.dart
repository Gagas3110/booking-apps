part of 'category_list_bloc.dart';

@freezed
class CategoryListState with _$CategoryListState {
  const factory CategoryListState({
    @Default(false) bool isLoading,
    @Default(false) bool isError,
    @Default([]) List<String> categoryList,
    @Default('') String errorMessage,
  }) = _CategoryListLoaded;
}
