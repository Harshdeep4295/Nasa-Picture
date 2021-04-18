import 'package:dartz/dartz.dart';
import 'package:nasa_picture/core/usecase/failure.dart';
import 'package:nasa_picture/feature/display_images/data/model/images_list.dart';
import 'package:nasa_picture/feature/display_images/domain/entity/image_model.dart';

abstract class LocalRepository {
  Either<Failure, ImageDataList> getImageList();
}
