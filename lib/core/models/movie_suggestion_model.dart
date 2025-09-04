class MovieSuggestionsResponse {
  final String? status;
  final String? statusMessage;
  final MovieSuggestionsData? data;

  MovieSuggestionsResponse({this.status, this.statusMessage, this.data});

  factory MovieSuggestionsResponse.fromJson(Map<String, dynamic> json) {
    return MovieSuggestionsResponse(
      status: json['status'],
      statusMessage: json['status_message'],
      data: json['data'] != null
          ? MovieSuggestionsData.fromJson(json['data'])
          : null,
    );
  }
}

class MovieSuggestionsData {
  final List<MovieSuggestionModel>? movies;

  MovieSuggestionsData({this.movies});

  factory MovieSuggestionsData.fromJson(Map<String, dynamic> json) {
    return MovieSuggestionsData(
      movies: json['movies'] != null
          ? (json['movies'] as List)
                .map((v) => MovieSuggestionModel.fromJson(v))
                .toList()
          : [],
    );
  }
}

class MovieSuggestionModel {
  final int id;
  final double rating;
  final String backgroundImage;

  MovieSuggestionModel({
    required this.id,
    required this.rating,
    required this.backgroundImage,
  });

  factory MovieSuggestionModel.fromJson(Map<String, dynamic> json) {
    return MovieSuggestionModel(
      id: json['id'],
      rating: (json['rating'] as num).toDouble(),
      backgroundImage: json['medium_cover_image'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {'id': id, 'rating': rating, 'medium_cover_image': backgroundImage};
  }
}
