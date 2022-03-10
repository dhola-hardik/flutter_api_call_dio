import 'dart:convert';

class RatingModel {
  RatingModel({
    this.rate = 0,
    this.count = 0,
  });

  double rate;
  int count;

  factory RatingModel.fromRawJson(String str) =>
      RatingModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory RatingModel.fromJson(Map<String, dynamic> json) => RatingModel(
        rate: json["rate"] == null ? null : json["rate"].toDouble(),
        count: json["count"] == null ? null : json["count"],
      );

  Map<String, dynamic> toJson() => {
        "rate": rate == null ? null : rate,
        "count": count == null ? null : count,
      };
}
