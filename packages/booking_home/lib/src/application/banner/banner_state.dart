part of 'banner_bloc.dart';

@freezed
class BannerState with _$BannerState {
  const factory BannerState({
    @Default(false) bool isLoading,
    @Default(false) bool isError,
    @Default(<Product>[]) List<Product> bannerList,
    @Default('') String errorMessage,
  }) = _BannerLoaded;
}
