import 'package:booking_profile/src/domain/repositories/preferences_repository.dart';

class AuthUseCase {
  final PreferencesRepository _repository;

  AuthUseCase(this._repository);

  Future<dynamic> loggedIn() {
    return _repository.loggedIn();
  }
}
