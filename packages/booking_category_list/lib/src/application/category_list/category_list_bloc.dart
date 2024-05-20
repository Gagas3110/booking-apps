import 'package:booking_category_list/src/domain/i_category_list_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'category_list_event.dart';
part 'category_list_state.dart';

part 'category_list_bloc.freezed.dart';

class CategoryListBloc extends Bloc<CategoryListEvent, CategoryListState> {
  final ICategoryListRepository repository;

  CategoryListBloc({required this.repository}) : super(const CategoryListState()) {
    on<_OnLoadCategories>(_onLoadCategories);
  }

  Future<void> _onLoadCategories(
    _OnLoadCategories event,
    Emitter<CategoryListState> emit,
  ) async {
    emit(state.copyWith(isLoading: true));

    final result = await repository.getCategories();
    result.fold(
      (failure) {
        emit(
          state.copyWith(
            isLoading: false,
            isError: true,
            errorMessage: failure.message ?? '',
          ),
        );
      },
      (data) {
        emit(
          state.copyWith(
            isLoading: false,
            categoryList: data,
          ),
        );
      },
    );
  }
}
