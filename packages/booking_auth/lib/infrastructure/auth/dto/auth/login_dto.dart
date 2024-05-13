// ignore_for_file: use_super_parameters

import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../domain/auth/entities/login_response.dart';
part 'login_dto.g.dart';

@JsonSerializable()
class LoginDto extends LoginResponse {
  LoginDto(
      {required id,
      required username,
      required email,
      required firstName,
      required lastName,
      required gender,
      required image,
      required token})
      : super(
          image: image,
          id: id,
          username: username,
          email: email,
          firstName: firstName,
          lastName: lastName,
          gender: gender,
          token: token,
        );

  factory LoginDto.fromJson(Map<String, dynamic> json) =>
      _$LoginDtoFromJson(json);

  Map<String, dynamic> toJson() => _$LoginDtoToJson(this);

  //// using this method for convert Dto into entity
  ///to pass through domain layer
  ///
  ///
  LoginResponse toDomain() => LoginResponse(
      id: id,
      username: username,
      email: email,
      firstName: firstName,
      lastName: lastName,
      gender: gender,
      image: image,
      token: token);
}
