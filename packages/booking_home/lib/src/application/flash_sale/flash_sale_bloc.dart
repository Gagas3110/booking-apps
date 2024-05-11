import 'package:booking_home/src/domain/entities/product.dart';
import 'package:booking_home/src/domain/i_home_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'flash_sale_event.dart';
part 'flash_sale_state.dart';

part 'flash_sale_bloc.freezed.dart';

class FlashSaleBloc extends Bloc<FlashSaleEvent, FlashSaleState> {
  final IHomeRepository repository;

  FlashSaleBloc({required this.repository}) : super(const FlashSaleState()) {
    on<_OnBuild>(_onBuildFlashSale);
  }

  Future<void> _onBuildFlashSale(
    _OnBuild event,
    Emitter<FlashSaleState> emit,
  ) async {
    emit(const FlashSaleState(isLoading: true));

    final result = await repository.getFlashSale();
    result.fold(
      (failure) {
        emit(
          FlashSaleState(
            isLoading: false,
            isError: true,
            errorMessage: failure.message ?? '',
          ),
        );
      },
      (data) {
        emit(
          FlashSaleState(
            isLoading: false,
            isError: false,
            flashSaleProductList: data,
          ),
        );
      },
    );
  }
}
