import 'dart:convert';

import 'package:dartz/dartz.dart';

import 'package:nasa_picture/core/usecase/failure.dart';
import 'package:nasa_picture/feature/display_images/data/model/images_list.dart';
import 'package:nasa_picture/feature/display_images/domain/repository/local_repository.dart';

import 'mock_data_source.dart';

class MockLocalRepositoryImp extends LocalRepository {
  MockLocalDataSource dataSource;
  MockLocalRepositoryImp({required this.dataSource});
  @override
  Future<Either<Failure, ImageDataList>> getImageList() async {
    ImageDataList? imageDataList = await dataSource.getImageList();
    if (imageDataList != null) {
      return Right(imageDataList);
    } else {
      return Left(Error("Some Error Occured"));
    }
  }
}
