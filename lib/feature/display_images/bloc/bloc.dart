import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nasa_picture/feature/display_images/bloc/bloc_event.dart';
import 'package:nasa_picture/feature/display_images/bloc/bloc_state.dart';
import 'package:nasa_picture/feature/display_images/data/model/images_list.dart';
import 'package:nasa_picture/feature/display_images/domain/repository/local_repository.dart';

class ImageDisplayBloc extends Bloc<ImageScreenEvent, ImageScreenState> {
  final LocalRepository repository;
  final ImageScreenState initialState;

  ImageDisplayBloc({required this.repository, required this.initialState})
      : super(initialState) {
    this.add(LoadDataEvent());
  }

  @override
  Stream<ImageScreenState> mapEventToState(event) async* {
    if (event is LoadDataEvent) {
      yield LoadingState();
      // add method to load
      yield LoadedState(imageDataList: ImageDataList(images: []));
    } else if (event is LoadingDataEvent) {
      /// in loading state
      yield LoadingState();
    } else if (event is ImageClickEvent) {
      // navigate with index
    }
  }

  void onTap(int index) {
    this.add(ImageClickEvent(index));
  }
}
