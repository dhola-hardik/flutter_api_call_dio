class GenreModel {
  GenreModel({
    this.id,
    this.name,
  });

  int? id;
  String? name;

  factory GenreModel.fromJson(Map<String, dynamic> json) => GenreModel(
        id: json["id"] == null ? null : json["id"],
        name: json["name"] == null ? null : json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "name": name == null ? null : name,
      };
}
