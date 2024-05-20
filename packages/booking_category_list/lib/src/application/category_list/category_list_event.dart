part of 'category_list_bloc.dart';

@freezed
class CategoryListEvent with _$CategoryListEvent {
  const factory CategoryListEvent.onLoadCategories() = _OnLoadCategories;
}
