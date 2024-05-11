import 'package:freezed_annotation/freezed_annotation.dart';

part 'failures.freezed.dart';

@freezed
class Failure with _$Failure {
  const factory Failure.onServer({String? message}) = _OnServerFailure;
  const factory Failure.onDio({String? message}) = _OnDioFailure;
}
