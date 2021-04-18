import 'package:get_it/get_it.dart';
import 'package:nasa_picture/feature/display_images/bloc/bloc.dart';
import 'package:nasa_picture/feature/display_images/bloc/bloc_state.dart';
import 'package:nasa_picture/feature/display_images/data/datasource/local_data_source.dart';
import 'package:nasa_picture/feature/display_images/data/repository/local_repo_impl.dart';

final sl = GetIt.instance;

Future<void> init() async {
  sl.registerSingleton(
    ImageDisplayBloc(
      initialState: LoadingState(),
      repository: LocalRepositoryImp(
        dataSource: LocalDataSourceImp(),
      ),
    ),
  );
}
