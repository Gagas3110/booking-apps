part of 'profile_bloc.dart';

@freezed
class ProfileState with _$ProfileState {
  const factory ProfileState(
      {@Default(false) bool isLoading,
      @Default("-") String name,
      @Default("-") String email,
      @Default("-") String photoURL,
      @Default("-") String phoneNumber,
      @Default(false) bool isError,
      @Default(null) User? currentUser,
      @Default('') String errorMessage}) = _ProfileLoaded;
}
