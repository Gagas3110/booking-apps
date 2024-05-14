import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:booking_profile/src/core/errors/server_exception.dart';
import 'package:booking_profile/src/data/datasources/movie_remote_data_source.dart';
import 'package:booking_profile/src/data/models/movie_model.dart';

class MovieRemoteDataSourceImpl implements MovieRemoteDataSource {
  final http.Client client;

  MovieRemoteDataSourceImpl({required this.client});

  static const BASE_URL = "https://api.themoviedb.org/3";
  static const API_KEY = "feefd9dfdbae7ed0a59490812ba90ad8";

  @override
  Future<List<MovieModel>> getPopularMovies() async {
    final response = await client.get(
      Uri.parse("$BASE_URL/movie/popular?api_key=$API_KEY"),
    );

    if (response.statusCode == 200) {
      final responseBody = json.decode(response.body);
      final List<MovieModel> movies =
          (responseBody['results'] as List).map((movie) => MovieModel.fromJson(movie)).toList();
      return movies;
    } else {
      throw ServerException();
    }
  }
}
