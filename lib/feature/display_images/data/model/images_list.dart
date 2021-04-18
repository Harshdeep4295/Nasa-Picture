import 'dart:convert';

import 'package:nasa_picture/feature/display_images/domain/entity/image_model.dart';

class ImageDataList {
  ImageDataList({
    required this.images,
  });

  List<ImageModel> images;

  factory ImageDataList.fromRawJson(String str) =>
      ImageDataList.fromJson(json.decode(str));
  factory ImageDataList.fromJson(Map<String, dynamic> json) => ImageDataList(
        images: List<ImageModel>.from(
            json["images"].map((x) => ImageModel.fromJson(x))),
      );

  ImageModel getImageModelAt(int index) {
    return images[index];
  }
}
