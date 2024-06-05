import 'dart:convert';

List<AnimalsModel> animalsModelFromJson(String str) => List<AnimalsModel>.from(
    json.decode(str).map((x) => AnimalsModel.fromJson(x)));

String animalsModelToJson(List<AnimalsModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class AnimalsModel {
  int id;
  String name;
  String species;
  String family;
  String habitat;
  String placeOfFound;
  String description;
  double weightKg;
  int heightCm;
  String image;

  AnimalsModel({
    required this.id,
    required this.name,
    required this.species,
    required this.family,
    required this.habitat,
    required this.placeOfFound,
    required this.description,
    required this.weightKg,
    required this.heightCm,
    required this.image,
  });

  factory AnimalsModel.fromJson(Map<String, dynamic> json) => AnimalsModel(
        id: json["id"],
        name: json["name"],
        species: json["species"],
        family: json["family"],
        habitat: json["habitat"],
        placeOfFound: json["place_of_found"],
        description: json["description"],
        weightKg: json["weight_kg"].toDouble(),
        heightCm: json["height_cm"],
        image: json["image"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "species": species,
        "family": family,
        "habitat": habitat,
        "place_of_found": placeOfFound,
        "description": description,
        "weight_kg": weightKg,
        "height_cm": heightCm,
        "image": image,
      };
}
