import 'dart:convert';

import 'genre_model.dart';

class GenreResponse {
  GenreResponse({
    this.success,
    this.statusCode,
    this.statusMessage,
    this.genres,
  });

  bool? success = false;
  int? statusCode;
  String? statusMessage;

  List<GenreModel>? genres;

  bool isSuccess() {
    return success ?? false || genres != null;
  }

  GenreResponse.withError({int? statusCode, bool success = false, String? msg})
      : this.statusCode = statusCode,
        this.success = success,
        this.statusMessage = msg;

  factory GenreResponse.fromRawJson(String str) =>
      GenreResponse.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory GenreResponse.fromJson(Map<String, dynamic> json) => GenreResponse(
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
        genres: json["genres"] == null
            ? null
            : List<GenreModel>.from(
                json["genres"].map((x) => GenreModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status_code": statusCode == null ? null : statusCode,
        "status_message": statusMessage == null ? null : statusMessage,
        "success": success == null ? null : success,
        "genres": genres == null
            ? null
            : List<dynamic>.from(genres!.map((x) => x.toJson())),
      };

  GenreModel getGenreName(int genre) =>
      genres!.firstWhere((g) => g.id == genre);
}
