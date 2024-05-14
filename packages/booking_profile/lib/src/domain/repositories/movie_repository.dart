import 'package:booking_profile/src/core/errors/server_failure.dart';
import 'package:booking_profile/src/domain/entities/movie.dart';
import 'package:dartz/dartz.dart';

abstract class MovieRepository {
  Future<Either<Failure, List<Movie>>> getPopularMovies();
}
