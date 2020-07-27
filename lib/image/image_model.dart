// To parse this JSON data, do
//
//     final imageMadel = imageMadelFromJson(jsonString);

import 'dart:convert';

ImageMadel imageMadelFromJson(String str) => ImageMadel.fromJson(json.decode(str));

String imageMadelToJson(ImageMadel data) => json.encode(data.toJson());

class ImageMadel {
  ImageMadel({
    this.message,
  });

  String message;

  factory ImageMadel.fromJson(Map<String, dynamic> json) => ImageMadel(
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "message": message,
  };
}
