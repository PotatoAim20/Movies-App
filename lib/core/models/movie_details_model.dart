class MovieDetailsResponse {
  final Movie movie;

  MovieDetailsResponse({required this.movie});

  factory MovieDetailsResponse.fromJson(Map<String, dynamic> json) {
    return MovieDetailsResponse(movie: Movie.fromJson(json['data']['movie']));
  }
}

class Movie {
  final int id;
  final String title;
  final int year;
  final double rating;
  final int runtime;
  final List<String> genres;
  final int likeCount;
  final String description;
  final String backgroundImage;

  Movie({
    required this.id,
    required this.title,
    required this.year,
    required this.rating,
    required this.runtime,
    required this.genres,
    required this.likeCount,
    required this.description,
    required this.backgroundImage,
  });

  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(
      id: json['id'],
      title: json['title'],
      year: json['year'],
      rating: (json['rating'] as num).toDouble(),
      runtime: json['runtime'],
      genres: List<String>.from(json['genres']),
      likeCount: json['like_count'],
      description: json['description_full'] ?? '',
      backgroundImage: json['large_cover_image'],
    );
  }
}
