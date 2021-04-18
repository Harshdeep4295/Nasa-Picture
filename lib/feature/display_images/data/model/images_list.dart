import 'dart:convert';

import 'package:nasa_picture/feature/display_images/domain/entity/image_model.dart';

class ImageDataList {
  ImageDataList({
    required this.images,
  });

  List<ImageModel> images;

  factory ImageDataList.fromJson(String str) =>
      ImageDataList.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ImageDataList.fromMap(List<dynamic> json) {
    // Map<String, dynamic> jsons = {"images": json};
    return ImageDataList(
      images: List<ImageModel>.from(json.map((x) => ImageModel.fromMap(x))),
    );
  }
  Map<String, dynamic> toMap() => {
        "images": List<dynamic>.from(images.map((x) => x.toMap())),
      };
}
