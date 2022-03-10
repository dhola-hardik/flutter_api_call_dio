//     final movieResponse = movieResponseFromJson(jsonString);

import 'dart:convert';

import 'movie_details_model.dart';

class MovieResponse {
  MovieResponse({
    this.success,
    this.statusCode,
    this.statusMessage,
    this.page = 1,
    this.results,
    this.totalPages,
    this.totalResults,
  });

  bool? success = false;
  int? statusCode;
  String? statusMessage;

  int page = 1;
  List<MovieDetailsModel>? results;
  int? totalPages;
  int? totalResults;

  bool isSuccess() {
    return success ?? false || results != null;
  }

  MovieResponse.withError({int? statusCode, bool success = false, String? msg})
      : this.statusCode = statusCode,
        this.success = success,
        this.statusMessage = msg;

  factory MovieResponse.fromRawJson(String str) =>
      MovieResponse.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory MovieResponse.fromJson(Map<String, dynamic> json) => MovieResponse(
        statusCode: json.containsKey("status_code") || ["status_code"] == null
            ? null
            : json["status_code"],
        statusMessage:
            json.containsKey("status_message") || json["status_message"] == null
                ? null
                : json["status_message"],
        success: json.containsKey("success") || json["success"] == null
            ? null
            : json["success"],
        page: json["page"] == null ? null : json["page"],
        results: json["results"] == null
            ? null
            : List<MovieDetailsModel>.from(
                json["results"].map((x) => MovieDetailsModel.fromJson(x))),
        totalPages: json["total_pages"] == null ? null : json["total_pages"],
        totalResults:
            json["total_results"] == null ? null : json["total_results"],
      );

  Map<String, dynamic> toJson() => {
        "status_code": statusCode == null ? null : statusCode,
        "status_message": statusMessage == null ? null : statusMessage,
        "success": success == null ? null : success,
        "page": page == null ? null : page,
        "results": results == null
            ? null
            : List<dynamic>.from(results!.map((x) => x.toJson())),
        "total_pages": totalPages == null ? null : totalPages,
        "total_results": totalResults == null ? null : totalResults,
      };
}
