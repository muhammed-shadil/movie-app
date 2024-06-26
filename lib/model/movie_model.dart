class Movie {
  final int id;
  final String title;
  final String backDropPath;
  final String overview;
  final String posterPath;

  Movie(
      {required this.id,
      required this.title,
      required this.backDropPath,
      required this.overview,
      required this.posterPath});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'title': title,
      'bachDropPath': backDropPath,
      'overview': overview,
      'posterPath': posterPath,
      'id': id
    };
  }

  factory Movie.fromMap(Map<String, dynamic> map) {
    return Movie(
      title: map['title'],
      backDropPath: map['backdrop_path'],
      overview: map['overview'],
      posterPath: map['poster_path'],
      id: map['id'],
    );
  }
}
