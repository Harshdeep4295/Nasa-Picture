import 'package:nasa_picture/feature/display_images/data/model/images_list.dart';

abstract class ImageScreenState {
  ImageDataList? imageDataList;

  ImageScreenState(this.imageDataList);
}

class LoadingState extends ImageScreenState {
  LoadingState() : super(null);
}

class ErrorState extends ImageScreenState {
  ErrorState() : super(null);
}

class LoadedState extends ImageScreenState {
  int index = -1;
  ImageDataList? imageDataList;
  LoadedState({this.imageDataList, index}) : super(imageDataList);
}
