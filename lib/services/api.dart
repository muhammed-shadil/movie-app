import 'dart:convert';

import 'package:movie_app/model/movie_details_model.dart';
import 'package:movie_app/model/movie_model.dart';
import 'package:movie_app/services/constants.dart';
import 'package:http/http.dart' as http;

class Api {
  final upComingApiUrl =
      "https://api.themoviedb.org/3/movie/upcoming?api_key=$apiKey";
  final popularApiUrl =
      "https://api.themoviedb.org/3/movie/popular?api_key=$apiKey";

  final topRatedApiUrl =
      "https://api.themoviedb.org/3/movie/top_rated?api_key=$apiKey";
  final moviesdetailsApiUrl =
      "https://api.themoviedb.org/3/movie/929590?api_key=$apiKey";

  Future<List<Movie>> getUpcomingMovies() async {
    final response = await http.get(Uri.parse(upComingApiUrl));
    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body)['results'];
      List<Movie> movies = data.map((movie) => Movie.fromMap(movie)).toList();
      return movies;
    } else {
      throw Exception("failed to load upcoming movies");
    }
  }

  Future<List<Movie>> getPopularMovies() async {
    final response = await http.get(Uri.parse(popularApiUrl));
    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body)['results'];
      List<Movie> movies = data.map((movie) => Movie.fromMap(movie)).toList();
      return movies;
    } else {
      throw Exception("failed to load upcoming movies");
    }
  }

  Future<List<Movie>> getTopratedMovies() async {
    final response = await http.get(Uri.parse(topRatedApiUrl));
    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body)['results'];
      List<Movie> movies = data.map((movie) => Movie.fromMap(movie)).toList();
      return movies;
    } else {
      throw Exception("failed to load upcoming movies");
    }
  }

  Future<MovieDetails> getMoviesdetails(int movieId) async {
    print("dddddddddddd$movieId");
    final response = await http.get(Uri.parse(
        "https://api.themoviedb.org/3/movie/$movieId?api_key=$apiKey"));
    print(response.statusCode);

    if (response.statusCode == 200) {
      print(response.body);
      final Map<String, dynamic> data = json.decode(response.body);
      print(data);
      MovieDetails movie = MovieDetails.fromMap(data);
      return movie;
      // final List<dynamic> data = json.decode(response.body);

      // List<MovieDetails> movies =
      //     // data.map((movie) => MovieDetails.fromMap(movie))
      //     .toList();
      //       print("rrrrrrrrrrrrrrrrr$movies");
      // return ;
    } else {
      throw Exception("failed to load upcoming movies");
    }
  }
}
