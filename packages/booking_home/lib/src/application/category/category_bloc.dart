import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'category_event.dart';
part 'category_state.dart';

part 'category_bloc.freezed.dart';

class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  CategoryBloc() : super(const CategoryState()) {
    on<_OnBuild>(_onBuildCategory);
  }

  Future<void> _onBuildCategory(
    _OnBuild event,
    Emitter<CategoryState> emit,
  ) async {
    emit(const CategoryState(isLoading: true));

    await Future.delayed(const Duration(seconds: 2));

    emit(
      const CategoryState(
        isLoading: false,
        categoryList: [
          'Shoes',
          'Shirts',
          'Watches',
          'Jeans',
          'Clothes',
        ],
      ),
    );
  }
}
