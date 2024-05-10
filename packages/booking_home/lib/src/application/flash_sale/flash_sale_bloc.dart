import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:booking_home/src/domain/models/product_mdl.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'flash_sale_event.dart';
part 'flash_sale_state.dart';

part 'flash_sale_bloc.freezed.dart';

class FlashSaleBloc extends Bloc<FlashSaleEvent, FlashSaleState> {
  FlashSaleBloc() : super(const FlashSaleState()) {
    on<_OnBuild>(_onBuildFlashSale);
  }

  Future<void> _onBuildFlashSale(
    _OnBuild event,
    Emitter<FlashSaleState> emit,
  ) async {
    emit(const FlashSaleState(isLoading: true));

    await Future.delayed(const Duration(seconds: 2));

    emit(
      const FlashSaleState(
        isLoading: false,
        flashSaleProductList: [
          ProductMdl(
            name: 'Suede Chukka Boots',
            company: 'River Island',
            price: 100000,
          ),
          ProductMdl(
            name: 'Platform Derby Shoes',
            company: 'River Island',
            price: 100000,
          ),
          ProductMdl(
            name: 'Samba',
            company: 'Adidas',
            price: 2000000,
          ),
          ProductMdl(
            name: 'Suede Chukka Boots',
            company: 'River Island',
            price: 100000,
          ),
          ProductMdl(
            name: 'Platform Derby Shoes',
            company: 'River Island',
            price: 100000,
          ),
        ],
      ),
    );
  }
}
