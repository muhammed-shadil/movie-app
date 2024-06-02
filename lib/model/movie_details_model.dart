// ignore_for_file: public_member_api_docs, sort_constructors_first
class MovieDetails {
  final bool adult;
  final String title;
  final String backDropPath;
  final String posterPath;
  final String overview;
  final String releaseDate;
  final int runtime;
  final int budget;
  final int revenue;
  final double voteAverage;
  final List<String> genres;

  final List<String> production;
  MovieDetails({
    required this.adult,
    required this.title,
    required this.backDropPath,
    required this.posterPath,
    required this.overview,
    required this.releaseDate,
    required this.runtime,
    required this.budget,
    required this.revenue,
    required this.voteAverage,
    required this.genres,
    required this.production,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'production': production,
      'adult': adult,
      'title': title,
      'bachDropPath': backDropPath,
      'overview': overview,
      'releaseDate': releaseDate,
      'runtime': runtime,
      'budget': budget,
      'revenue': revenue,
      'voteAverage': voteAverage,
      'genres': genres,
      'posterPath': posterPath,
    };
  }

  factory MovieDetails.fromMap(Map<String, dynamic> map) {
    var genreList = map['genres'] as List;
    List<String> genreNames =
        genreList.map((genre) => genre['name'] as String).toList();

    var productionlist = map['production_companies'] as List;
    List<String> productionNames =
        productionlist.map((genre) => genre['logo_path'] as String).toList();

    return MovieDetails(
      title: map['title'],
      backDropPath: map['backdrop_path'],
      overview: map['overview'],
      releaseDate: map['release_date'],
      runtime: map['runtime'],
      budget: map['budget'],
      revenue: map['revenue'],
      voteAverage: map['vote_average'],
      genres: genreNames,
      posterPath: map['poster_path'],
      adult: map['adult'],
      production: productionNames,
    );
  }
}
