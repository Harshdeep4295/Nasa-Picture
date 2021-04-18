import 'package:flutter_test/flutter_test.dart';
import 'package:get/route_manager.dart';
import 'package:nasa_picture/feature/display_images/bloc/bloc.dart';
import 'package:nasa_picture/feature/display_images/bloc/bloc_state.dart';

import 'mock_data_source.dart';
import 'mock_local_repository.dart';

void main() {
  const loading = TypeMatcher<LoadingState>();
  const error = TypeMatcher<ErrorState>();
  const loaded = TypeMatcher<LoadedState>();
  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    Get.testMode = true;
  });
  test("When bloc is initialised, on tap function is called", () async {
    ImageDisplayBloc bloc = ImageDisplayBloc(
      initialState: LoadingState(),
      repository: MockLocalRepositoryImp(dataSource: MockLocalDataSource()),
    );

    // checking if its in loading state or not
    expect(bloc.state, loading);

    // time to get string populated from data.json
    await Future.delayed(Duration(seconds: 5));

    expect(bloc.state, loaded);
    expect(bloc.state.index, -1);
    expect(bloc.state.imageDataList!.images.length, 26);

    // when some object is clicked
    bloc.onTap(2);
    await Future.delayed(Duration(seconds: 5));
    expect(bloc.state.index, 2);

    bloc.onTap(16);
    await Future.delayed(Duration(seconds: 5));
    expect(bloc.state.index, 16);
  });
}
