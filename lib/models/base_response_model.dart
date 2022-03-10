abstract class BaseResponseModel {
  abstract bool? success;
  abstract String? message;

  // abstract dynamic data;
  abstract int? statusCode;

  // abstract String? error;

  // BaseResponseModel({
  //   this.success,
  //   this.message,
  //   this.data,
  //   this.statusCode,
  //   this.error,
  // });

  bool get isSuccess => this.success ?? false;

/*BaseResponseModel.withError({
    required int statusCode,
    required String error,
    required String msg,
  })  : this.statusCode = statusCode,
        this.error = error,
        this.message = msg;

  factory BaseResponseModel.fromJson(Map<String, dynamic> json) => BaseResponseModel(
        statusCode: json["statusCode"] == null ? null : json["statusCode"],
        error: json["error"] == null ? null : json["error"],
        success: json["success"] == null ? null : json["success"],
        message: json["message"] == null ? null : json["message"],
        data: json["data"] == null ? null : json["data"],
      );

  Map<String, dynamic> toJson() => {
        "success": success == null ? null : success,
        "message": message == null ? null : message,
        "data": data == null ? null : data,
        "statusCode": statusCode == null ? null : statusCode,
        "error": error == null ? null : error,
      };*/
}

class EnumValues<T> {
  Map<String, T>? map;
  Map<T, String>? reverseMap;

  EnumValues(this.map);

  Map<T, String>? get reverse {
    if (reverseMap == null) {
      reverseMap = map?.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}
