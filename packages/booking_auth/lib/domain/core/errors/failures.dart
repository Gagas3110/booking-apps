import 'package:freezed_annotation/freezed_annotation.dart';

part 'failures.freezed.dart';

@freezed
abstract class Failure with _$Failure {
  const factory Failure.serverFailure(String e) = _ServerFailure;
  const factory Failure.cacheFailure(String e) = _CacheFailure;
}
