import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class MovieDetails {
  final String title;
  final String backDropPath;
  final String overview;
  final String releaseDate;
  final int runtime;
  final int budget;
  final int revenue;
  final double voteAverage;
  final List<String> genres;
  MovieDetails({
    required this.genres,
    required this.title,
    required this.backDropPath,
    required this.overview,
    required this.releaseDate,
    required this.runtime,
    required this.budget,
    required this.revenue,
    required this.voteAverage,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'title': title,
      'bachDropPath': backDropPath,
      'overview': overview,
      'releaseDate': releaseDate,
      'runtime': runtime,
      'budget': budget,
      'revenue': revenue,
      'voteAverage': voteAverage,
      'genres': genres,
    };
  }

  factory MovieDetails.fromMap(Map<String, dynamic> map) {
     var genreList = map['genres'] as List;
    List<String> genreNames = genreList.map((genre) => genre['name'] as String).toList();

    return MovieDetails(
      title: map['original_title'],
      backDropPath: map['backdrop_path'],
      overview: map['overview'],
      releaseDate: map['release_date'],
      runtime: map['runtime'],
      budget: map['budget'],
      revenue: map['revenue'],
      voteAverage: map['vote_average'],
      genres: genreNames,
    );
  }
}
