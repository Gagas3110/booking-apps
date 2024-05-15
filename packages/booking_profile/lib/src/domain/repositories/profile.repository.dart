import 'package:booking_profile/src/domain/entities/user.dart';
import 'package:booking_profile/src/core/failures.dart';
import 'package:dartz/dartz.dart';

abstract class ProfileRepository {
  ///interfaces which holds contracts pf what the "login" do
  ///
  ///
  ///
  ///
  ///
  ///

  Future<Either<Failure, dynamic>> getUser();
}
