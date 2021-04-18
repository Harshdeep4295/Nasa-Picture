import 'package:dartz/dartz.dart';

abstract class ImageScreenEvent {}

class LoadDataEvent extends ImageScreenEvent {}

class LoadingDataEvent extends ImageScreenEvent {}

class ImageClickEvent extends ImageScreenEvent {
  int index;

  ImageClickEvent(this.index);
}
