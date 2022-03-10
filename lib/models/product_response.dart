//     final getProductsResponse = getProductsResponseFromJson(jsonString);

import 'dart:convert';

import 'product_model.dart';

class ProductResponse {
  ProductResponse({
    this.success = false,
    this.message,
    this.statusCode,
    this.productList,
  });

  bool success = false;
  int? statusCode;
  String? message;
  List<ProductModel>? productList;

  bool get isSuccess => this.success;

  ProductResponse.withError({
    int? statusCode,
    bool success = false,
    String? msg,
  })  : this.statusCode = statusCode,
        this.success = success,
        this.message = msg;

  factory ProductResponse.fromRawJson(String str) =>
      ProductResponse.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ProductResponse.fromJson(Map<String, dynamic> json) =>
      ProductResponse(
        statusCode: json["statusCode"] == null ? null : json["statusCode"],
        message: json["message"] == null ? null : json["message"],
        success: json["success"] == null ? null : json["success"],
        productList: json["product_list"] == null
            ? null
            : List<ProductModel>.from(
                json["product_list"].map((x) => ProductModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "message": message == null ? null : message,
        "statusCode": statusCode == null ? null : statusCode,
        "success": success == null ? null : success,
        "product_list": productList == null
            ? null
            : List<dynamic>.from(productList!.map((x) => x.toJson())),
      };
}
