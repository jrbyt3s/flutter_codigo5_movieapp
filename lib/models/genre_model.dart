class GenreModel {
  GenreModel({
    required this.id,
    required this.name,
    required this.selected,
  });

  int id;
  String name;
  bool selected;

  factory GenreModel.fromJson(Map<String, dynamic> json) => GenreModel(
        id: json["id"],
        name: json["name"],
        selected: false,
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
      };
}
