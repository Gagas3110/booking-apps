import 'package:booking_home/src/domain/i_home_repository.dart';
import 'package:booking_home/src/infrastructure/extensions/string_ext.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'category_event.dart';
part 'category_state.dart';

part 'category_bloc.freezed.dart';

class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  final IHomeRepository repository;

  CategoryBloc({required this.repository}) : super(const CategoryState()) {
    on<_OnBuild>(_onBuildCategory);
  }

  Future<void> _onBuildCategory(
    _OnBuild event,
    Emitter<CategoryState> emit,
  ) async {
    emit(const CategoryState(isLoading: true));

    final result = await repository.getCategories();
    result.fold(
      (failure) {
        emit(
          CategoryState(
            isLoading: false,
            isError: true,
            errorMessage: failure.message ?? '',
          ),
        );
      },
      (data) {
        emit(
          CategoryState(
            isLoading: false,
            isError: false,
            categoryList: data.map((e) => e.capitalize()).toList(),
          ),
        );
      },
    );
  }
}
