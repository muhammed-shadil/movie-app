import 'package:flutter/material.dart';
import 'package:movie_app/model/movie_details_model.dart';
import 'package:movie_app/services/api.dart';

class MovieDetailsProvider with ChangeNotifier {
  MovieDetails? _movieDetails;
  bool _isLoading = false;
  String? _errorMessage;

  MovieDetails? get movieDetails => _movieDetails;
  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;

  Future<void> fetchMovieDetails(int id) async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      _movieDetails = await Api().getMoviesdetails(id);
    } catch (e) {
      _errorMessage = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
