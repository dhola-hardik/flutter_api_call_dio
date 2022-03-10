import 'dart:convert';

import '../data/common/constants.dart';

class MovieDetailsModel {
  MovieDetailsModel({
    this.adult,
    this.backdropPath,
    this.id,
    this.originalLanguage,
    this.originalTitle,
    this.overview,
    this.popularity = 0.0,
    this.posterPath,
    this.releaseDate,
    this.title,
    this.video,
    this.voteAverage = 0,
    this.voteCount = 0,
    this.genreIds,
  });

  bool? adult;
  String? backdropPath;
  int? id;
  String? originalLanguage;
  String? originalTitle;
  String? overview;
  double popularity;
  String? posterPath;
  DateTime? releaseDate;
  String? title;
  bool? video;
  double voteAverage;
  int voteCount;
  List<int>? genreIds;

  factory MovieDetailsModel.fromRawJson(String str) =>
      MovieDetailsModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory MovieDetailsModel.fromJson(Map<String, dynamic> json) =>
      MovieDetailsModel(
        adult: json["adult"] == null ? null : json["adult"],
        backdropPath: json["backdrop_path"] == null
            ? null
            : constants.getBackdropImageUrl() + json["backdrop_path"],
        id: json["id"] == null ? null : json["id"],
        originalLanguage: json["original_language"] == null
            ? null
            : json["original_language"],
        originalTitle:
            json["original_title"] == null ? null : json["original_title"],
        overview: json["overview"] == null ? null : json["overview"],
        popularity:
            json["popularity"] == null ? null : json["popularity"].toDouble(),
        posterPath: json["poster_path"] == null
            ? null
            : constants.getImageUrl() + json["poster_path"],
        releaseDate: json["release_date"] == null
            ? null
            : DateTime.parse(json["release_date"]),
        title: json["title"] == null ? null : json["title"],
        video: json["video"] == null ? null : json["video"],
        voteAverage: json["vote_average"] == null
            ? null
            : json["vote_average"].toDouble(),
        voteCount: json["vote_count"] == null ? null : json["vote_count"],
        genreIds: json["genre_ids"] == null
            ? null
            : List<int>.from(json["genre_ids"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "adult": adult == null ? null : adult,
        "backdrop_path": backdropPath == null ? null : backdropPath,
        "id": id == null ? null : id,
        "original_language": originalLanguage == null ? null : originalLanguage,
        "original_title": originalTitle == null ? null : originalTitle,
        "overview": overview == null ? null : overview,
        "popularity": popularity == null ? null : popularity,
        "poster_path": posterPath == null ? null : posterPath,
        "release_date": releaseDate == null
            ? null
            : "${releaseDate!.year.toString().padLeft(4, '0')}-${releaseDate!.month.toString().padLeft(2, '0')}-${releaseDate!.day.toString().padLeft(2, '0')}",
        "title": title == null ? null : title,
        "video": video == null ? null : video,
        "vote_average": voteAverage == null ? null : voteAverage,
        "vote_count": voteCount == null ? null : voteCount,
        "genre_ids": genreIds == null
            ? null
            : List<dynamic>.from(genreIds!.map((x) => x)),
      };
}
