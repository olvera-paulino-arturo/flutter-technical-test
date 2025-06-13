import 'package:contpaqi_technical_test/features/movies/data/models/availability_date.dart';
import 'package:contpaqi_technical_test/features/movies/data/models/movie.dart';

class MovieResponse {
  AvailabilityDate dates;
  int page;
  List<Movie> movies;
  int totalPages;
  int totalResults;

  MovieResponse({
    required this.dates,
    required this.page,
    required this.movies,
    required this.totalPages,
    required this.totalResults,
  });

  factory MovieResponse.fromJson(Map<String, dynamic> json) => MovieResponse(
    dates: AvailabilityDate.fromJson(json['dates']),
    page: json['page'],
    movies: List<Movie>.from(json['results'].map((x) => Movie.fromJson(x))),
    totalPages: json['total_pages'],
    totalResults: json['total_results'],
  );

}