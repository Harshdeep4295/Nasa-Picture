import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:nasa_picture/feature/display_images/data/datasource/local_data_source.dart';
import 'package:nasa_picture/feature/display_images/data/model/images_list.dart';

class MockLocalDataSource extends LocalDataSource {
  @override
  Future<ImageDataList?> getImageList() async {
    String imageData = await rootBundle.loadString('assets/data.json');
    ImageDataList imageDtaList = ImageDataList.fromMap(json.decode(imageData));
    return imageDtaList;
  }
}
