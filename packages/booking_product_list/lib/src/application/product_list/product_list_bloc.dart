// import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:booking_product_list/src/domain/i_product_list_repository.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:booking_home/booking_home.dart';

part 'product_list_event.dart';
part 'product_list_state.dart';

part 'product_list_bloc.freezed.dart';

class ProductListBloc extends Bloc<ProductListEvent, ProductListState> {
  final IProductListRepository repository;

  ProductListBloc({required this.repository})
      : super(const ProductListState()) {
    on<_OnLoadAllProducts>(_onLoadAllProductList);
    on<_OnLoadProductsByCategory>(_onLoadProductListByCategory);
    on<_OnResetState>(_onResetState);
  }

  Future<void> _onLoadAllProductList(
    _OnLoadAllProducts event,
    Emitter<ProductListState> emit,
  ) async {
    final isEndOfList = state.counter == state.total;
    final isListEmpty = state.productList.isEmpty;

    // prevent call api if already got all products
    if (!isEndOfList || isListEmpty) {
      emit(state.copyWith(isLoading: true));

      await Future.delayed(const Duration(seconds: 3));
      final result = await repository.getAllProducts(skip: state.counter);
      result.fold(
        (failure) {
          // [important] using copyWith for not reseting all the previous states
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
              isError: false,
              productList: [...state.productList, ...data.productList],
              total: data.total,
              counter: state.counter + data.productList.length,
            ),
          );
        },
      );
    }
  }

  Future<void> _onLoadProductListByCategory(
    _OnLoadProductsByCategory event,
    Emitter<ProductListState> emit,
  ) async {
    final isEndOfList = state.counter == state.total;
    final isListEmpty = state.productList.isEmpty;

    // prevent call api if already got all products
    if (!isEndOfList || isListEmpty) {
      emit(state.copyWith(isLoading: true));

      final result = await repository.getProductsByCategory(
        category: event.category,
      );
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
              isError: false,
              productList: [...state.productList, ...data.productList],
              total: data.total,
              counter: state.counter + data.productList.length,
            ),
          );
        },
      );
    }
  }

  void _onResetState(
    _OnResetState event,
    Emitter<ProductListState> emit,
  ) {
    emit(
      const ProductListState(
        counter: 0,
        total: 0,
        productList: [],
      ),
    );
  }
}
