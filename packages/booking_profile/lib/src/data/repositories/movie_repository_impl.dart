import 'package:booking_profile/src/core/errors/server_failure.dart';
import 'package:booking_profile/src/data/datasources/movie_remote_data_source.dart';
import 'package:booking_profile/src/data/models/movie_model.dart';
import 'package:booking_profile/src/domain/entities/movie.dart';
import 'package:booking_profile/src/domain/repositories/movie_repository.dart';
import 'package:dartz/dartz.dart';

class MovieRepositoryImpl implements MovieRepository {
  final MovieRemoteDataSource remoteDataSource;

  MovieRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<ServerFailure, List<Movie>>> getPopularMovies() async {
    try {
      final List<MovieModel> movieModels = await remoteDataSource.getPopularMovies();
      final List<Movie> movies = movieModels.map((model) => model.toEntity()).toList();
      return Right(movies);
    } catch (e) {
      return Left(ServerFailure());
    }
  }
}
