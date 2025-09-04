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
  final String screenShot1;
  final String screenShot2;
  final String screenShot3;
  final List<Cast> cast;

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
    required this.screenShot1,
    required this.screenShot2,
    required this.screenShot3,
    required this.cast,
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
      description: json['description_full'] ?? json['description_intro'] ?? '',
      backgroundImage: json['large_cover_image'],
      screenShot1: json['large_screenshot_image1'] ?? '',
      screenShot2: json['large_screenshot_image2'] ?? '',
      screenShot3: json['large_screenshot_image3'] ?? '',
      cast:
          (json['cast'] as List<dynamic>?)
              ?.map((e) => Cast.fromJson(e))
              .toList() ??
          [],
    );
  }
}

class Cast {
  final String name;
  final String characterName;
  final String imdbCode;
  final String? imageUrl;

  Cast({
    required this.name,
    required this.characterName,
    required this.imdbCode,
    this.imageUrl,
  });

  factory Cast.fromJson(Map<String, dynamic> json) {
    return Cast(
      name: json['name'] ?? '',
      characterName: json['character_name'] ?? '',
      imdbCode: json['imdb_code'] ?? '',
      imageUrl: json['url_small_image'],
    );
  }
}
