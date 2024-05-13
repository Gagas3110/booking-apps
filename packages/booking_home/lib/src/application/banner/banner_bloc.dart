import 'package:booking_home/src/domain/entities/product.dart';
import 'package:booking_home/src/domain/i_home_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'banner_event.dart';
part 'banner_state.dart';

part 'banner_bloc.freezed.dart';

class BannerBloc extends Bloc<BannerEvent, BannerState> {
  final IHomeRepository repository;

  BannerBloc({required this.repository}) : super(const BannerState()) {
    on<_OnBuild>(_onBuildBanner);
  }

  Future<void> _onBuildBanner(
    _OnBuild event,
    Emitter<BannerState> emit,
  ) async {
    emit(const BannerState(isLoading: true));

    final result = await repository.getBanners();
    result.fold(
      (failure) {
        emit(
          BannerState(
            isLoading: false,
            isError: true,
            errorMessage: failure.message ?? '',
          ),
        );
      },
      (data) {
        emit(
          BannerState(
            isLoading: false,
            isError: false,
            bannerList: data,
          ),
        );
      },
    );
  }
}
