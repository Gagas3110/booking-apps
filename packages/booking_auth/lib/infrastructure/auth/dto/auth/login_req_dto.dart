import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../domain/auth/entities/login_request.dart';
part 'login_req_dto.g.dart';

@JsonSerializable()
class LoginReqDto extends LoginRequest {
  LoginReqDto(
      {required super.username,
      required super.password,
      required super.expiresInMins});

  factory LoginReqDto.fromJson(Map<String, dynamic> json) =>
      _$LoginReqDtoFromJson(json);

  Map<String, dynamic> toJson() => _$LoginReqDtoToJson(this);

  LoginRequest toDomain() => LoginRequest(
        username: username,
        expiresInMins: expiresInMins,
        password: password,
      );
}
