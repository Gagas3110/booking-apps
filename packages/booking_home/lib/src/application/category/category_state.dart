part of 'category_bloc.dart';

@freezed
class CategoryState with _$CategoryState {
  const factory CategoryState({
    @Default(false) bool isLoading,
    @Default([]) List<String> categoryList,
  }) = _CategoryLoaded;
}
