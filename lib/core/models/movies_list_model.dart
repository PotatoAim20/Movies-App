class MoviesResponse {
  final String? status;
  final String? statusMessage;
  final MoviesData? data;

  MoviesResponse({this.status, this.statusMessage, this.data});

  factory MoviesResponse.fromJson(Map<String, dynamic> json) {
    return MoviesResponse(
      status: json['status'],
      statusMessage: json['status_message'],
      data: json['data'] != null ? MoviesData.fromJson(json['data']) : null,
    );
  }
}

class MoviesData {
  final int? movieCount;
  final int? limit;
  final int? pageNumber;
  final List<MoviesListModel>? movies;

  MoviesData({this.movieCount, this.limit, this.pageNumber, this.movies});

  factory MoviesData.fromJson(Map<String, dynamic> json) {
    return MoviesData(
      movieCount: json['movie_count'],
      limit: json['limit'],
      pageNumber: json['page_number'],
      movies: json['movies'] != null
          ? (json['movies'] as List)
              .map((v) => MoviesListModel.fromJson(v))
              .toList()
          : [],
    );
  }
}

class MoviesListModel {
  final int id;
  final String title;
  final int year;
  final double rating;
  final int runtime;
  final List<String> genres;
  final String backgroundImage;

  MoviesListModel({
    required this.id,
    required this.title,
    required this.year,
    required this.rating,
    required this.runtime,
    required this.genres,
    required this.backgroundImage,
  });

  factory MoviesListModel.fromJson(Map<String, dynamic> json) {
    return MoviesListModel(
      id: json['id'],
      title: json['title'],
      year: json['year'],
      rating: (json['rating'] as num).toDouble(),
      runtime: json['runtime'],
      genres: List<String>.from(json['genres']),
      backgroundImage: json['background_image'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'year': year,
      'rating': rating,
      'runtime': runtime,
      'genres': genres,
      'background_image': backgroundImage,
    };
  }
}
