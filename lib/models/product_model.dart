//     final productModel = productModelFromJson(jsonString);

import 'dart:convert';

import 'package:flutter/services.dart';

import 'rating_model.dart';

class ProductModel {
  ProductModel({
    this.id,
    this.title,
    this.price,
    this.description,
    this.category,
    this.image,
    this.rating,
    this.qty = 0,
    this.isFav = false,
  });

  int? id;
  String? title;
  double? price;
  String? description;
  String? category;
  String? image;
  RatingModel? rating;
  int qty;
  bool isFav;

  factory ProductModel.fromRawJson(String str) =>
      ProductModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
        id: json["id"] == null ? null : json["id"],
        title: json["title"] == null ? null : json["title"],
        price: json["price"] == null ? null : json["price"].toDouble(),
        description: json["description"] == null ? null : json["description"],
        category: json["category"] == null ? null : json["category"],
        image: json["image"] == null ? null : json["image"],
        qty: json["qty"] == null ? 0 : json["qty"],
        isFav: json["isFav"] == null ? false : json["isFav"],
        rating: json["rating"] == null
            ? null
            : RatingModel.fromJson(json["rating"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "title": title == null ? null : title,
        "price": price == null ? null : price,
        "description": description == null ? null : description,
        "category": category == null ? null : category,
        "image": image == null ? null : image,
        "qty": qty == null ? 0 : qty,
        "rating": rating == null ? null : rating!.toJson(),
        "isFav": isFav == null ? null : isFav,
      };
}
