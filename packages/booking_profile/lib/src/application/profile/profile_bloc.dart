import 'package:booking_profile/src/domain/entities/user.dart';
import 'package:booking_profile/src/domain/usecases/get_current_user.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'profile_event.dart';
part 'profile_state.dart';

part 'profile_bloc.freezed.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final GetCurrentLoginUser getCurrentLoginUser;

  ProfileBloc({required this.getCurrentLoginUser}) : super(const ProfileState()) {
    on<_OnBuild>(_onBuildProfile);
  }

  Future<void> _onBuildProfile(
    _OnBuild event,
    Emitter<ProfileState> emit,
  ) async {
    emit(const ProfileState(isLoading: true));

    final result = getCurrentLoginUser.call();

    if (result.email != null) {
      emit(
        ProfileState(
          isLoading: false,
          isError: false,
          currentUser: result,
        ),
      );
    } else {
      emit(
        const ProfileState(
          isLoading: false,
          isError: true,
          errorMessage: '',
        ),
      );
    }
  }
}
