class BaseModel {
  bool? success;
  String? message;
  dynamic data;
  int? statusCode;
  String? error;

  BaseModel({
    this.success,
    this.message,
    this.data,
    this.statusCode,
    this.error,
  });

  bool get isSuccess => this.success ?? false;

  BaseModel.withError({
    required int statusCode,
    String? error,
    required String msg,
  })  : this.statusCode = statusCode,
        this.error = error,
        this.message = msg;

  factory BaseModel.fromJson(Map<String, dynamic> json) => BaseModel(
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
      };
}
