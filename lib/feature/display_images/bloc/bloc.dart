import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nasa_picture/core/routes/app_routes.dart';
import 'package:nasa_picture/core/routes/route_functions.dart';
import 'package:nasa_picture/core/routes/route_names.dart';
import 'package:nasa_picture/core/usecase/failure.dart';
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
      ImageDataList? value =
          repository.getImageList().fold((l) => null, (r) => r);
      if (value != null)
        yield LoadedState(imageDataList: value);
      else
        yield ErrorState();
    } else if (event is LoadingDataEvent) {
      yield LoadingState();
    } else if (event is ImageClickEvent) {
      // navigate with index
      Routing.navigateTo(IMAGE_DETAIL_SCREEN, {"index": event.index});
      yield LoadedState(
        imageDataList: this.state.imageDataList,
        index: event.index,
      );
    }
  }

  void onTap(int index) {
    this.add(ImageClickEvent(index));
  }
}
