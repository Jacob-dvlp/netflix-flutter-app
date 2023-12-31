import 'dart:convert';

class ImageModel {
  final String? medium;
  final String? original;

  ImageModel({
    this.medium,
    this.original,
  });

  factory ImageModel.fromRawJson(String str) => ImageModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ImageModel.fromJson(Map<String, dynamic> json) => ImageModel(
        medium: json["medium"],
        original: json["original"]??"",
      );

  Map<String, dynamic> toJson() => {
        "medium": medium,
        "original": original,
      };
}