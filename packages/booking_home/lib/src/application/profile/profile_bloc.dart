import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'profile_event.dart';
part 'profile_state.dart';

part 'profile_bloc.freezed.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  ProfileBloc() : super(const ProfileState()) {
    on<_OnBuild>(_onBuildProfile);
  }

  Future<void> _onBuildProfile(
    _OnBuild event,
    Emitter<ProfileState> emit,
  ) async {
    emit(const ProfileState(isLoading: true));

    await Future.delayed(const Duration(seconds: 2));

    emit(
      const ProfileState(
        name: 'false',
      ),
    );
  }
}
