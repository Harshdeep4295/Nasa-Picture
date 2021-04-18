import 'package:dartz/dartz.dart';
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
      Either<Failure, ImageDataList> value = await repository.getImageList();
      yield value.fold(
          (l) => ErrorState(), (r) => LoadedState(imageDataList: r));
    } else if (event is LoadingDataEvent) {
      yield LoadingState();
    } else if (event is ImageClickEvent) {
      Routing.navigateTo(IMAGE_DETAIL_SCREEN);
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
