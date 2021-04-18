import 'package:nasa_picture/feature/display_images/data/model/images_list.dart';

abstract class ImageScreenState {
  ImageDataList? imageDataList;
  int index;

  ImageScreenState(this.imageDataList, {this.index = -1});
}

class LoadingState extends ImageScreenState {
  LoadingState() : super(null);
}

class ErrorState extends ImageScreenState {
  ErrorState() : super(null);
}

class LoadedState extends ImageScreenState {
  int index;
  ImageDataList? imageDataList;
  LoadedState({this.imageDataList, this.index = -1})
      : super(imageDataList, index: index);
}
