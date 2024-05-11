import 'package:freezed_annotation/freezed_annotation.dart';

part 'profile_mdl.freezed.dart';
part 'profile_mdl.g.dart';

@freezed
class ProfileMdl with _$ProfileMdl {
  const factory ProfileMdl({
    required String name,
  }) = _ProfileMdl;

  factory ProfileMdl.fromJson(Map<String, Object?> json) => _$ProfileMdlFromJson(json);
}
