import 'dart:convert';

import 'show_model.dart';


class MoviesModal {
  final double? score;
  final Show? show;

  MoviesModal({
    this.score,
    this.show,
  });

  factory MoviesModal.fromRawJson(String str) =>
      MoviesModal.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory MoviesModal.fromJson(Map<String, dynamic> json) => MoviesModal(
        score: json["score"]?.toDouble(),
        show: json["show"] == null ? null : Show.fromJson(json["show"]),
      );

  Map<String, dynamic> toJson() => {
        "score": score,
        "show": show?.toJson(),
      };
}
