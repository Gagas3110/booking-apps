part of 'category_bloc.dart';

@freezed
class CategoryState with _$CategoryState {
  const factory CategoryState({
    @Default(false) bool isLoading,
    @Default(false) bool isError,
    @Default([]) List<String> categoryList,
    @Default('') String errorMessage,
  }) = _CategoryLoaded;
}
