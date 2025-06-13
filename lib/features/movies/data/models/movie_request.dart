class MovieRequest {
  String language;

  MovieRequest({
    required this.language
  });

  factory MovieRequest.fromJson(Map<String, dynamic> json) => MovieRequest(
    language: json['language'],
  );

  Map<String, dynamic> toJson() => {
    'language': language,
  };
}