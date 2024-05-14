import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.freezed.dart';

@freezed
class EUser with _$EUser {
  const factory EUser({
    required int id,
    @Default('') String? name,
    @Default('') String? email,
    @Default('') String phoneNumber,
    @Default('') String? photoURL,
  }) = _EUser;
}
