import 'package:dartz/dartz.dart';
import 'package:nasa_picture/core/usecase/failure.dart';
import 'package:nasa_picture/feature/display_images/data/datasource/local_data_source.dart';
import 'package:nasa_picture/feature/display_images/data/model/images_list.dart';
import 'package:nasa_picture/feature/display_images/domain/repository/local_repository.dart';

class LocalRepositoryImp extends LocalRepository {
  LocalDataSource dataSource;
  LocalRepositoryImp({required this.dataSource});
  @override
  Either<Failure, ImageDataList> getImageList() {
    try {
      ImageDataList? imageDataList = dataSource.getImageList();
      if (imageDataList != null) {
        return Right(imageDataList);
      } else
        return Left(Error("Some Error Occured"));
    } on Exception catch (ex) {
      print(ex);
      return Left(Error("not able to get data "));
    } on Error catch (error) {
      print(error);
      return Left(Error("not able to get data "));
    }
  }
}
