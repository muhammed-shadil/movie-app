import 'dart:async';
import 'package:flutter/material.dart';
import 'package:movie_app/model/movie_model.dart';
import 'package:movie_app/services/api.dart';

class MovieProvider with ChangeNotifier {
  List<Movie> _upcomingMovies = [];
  List<Movie> _popularMovies = [];
  List<Movie> _topratedMovies = [];
  
  bool _isLoading = false;
  String _errorMessage = '';

  List<Movie> get upcomingMovies => _upcomingMovies;
  List<Movie> get popularMovies => _popularMovies;
  List<Movie> get topratedMovies => _topratedMovies;
  bool get isLoading => _isLoading;
  String get errorMessage => _errorMessage;

  MovieProvider() {
    fetchMovies();
  } 

  Future<void> fetchMovies() async {
    _isLoading = true;
    notifyListeners();

    try {
      _upcomingMovies = await Api().getUpcomingMovies();
      _popularMovies = await Api().getPopularMovies();
      _topratedMovies = await Api().getTopratedMovies();
      _errorMessage = '';
    } catch (e) {
      _errorMessage = 'Error loading data: $e';
      retryFetchMovies();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  void retryFetchMovies() {
    Future.delayed(const Duration(seconds: 3), () {
      if (_errorMessage.isNotEmpty) {
        fetchMovies();
      }
    });
  }
}
