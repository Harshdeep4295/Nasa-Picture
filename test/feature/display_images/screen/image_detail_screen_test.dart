import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/route_manager.dart';
import 'package:get_it/get_it.dart';
import 'package:nasa_picture/feature/display_images/bloc/bloc.dart';
import 'package:nasa_picture/feature/display_images/bloc/bloc_state.dart';
import 'package:nasa_picture/feature/display_images/screen/image_detail_screen.dart';

import '../bloc_test/mock_data_source.dart';
import '../bloc_test/mock_local_repository.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  ImageDisplayBloc bloc = ImageDisplayBloc(
    initialState: LoadingState(),
    repository: MockLocalRepositoryImp(
      dataSource: MockLocalDataSource(),
    ),
  );
  setUp(() {
    GetIt.instance.registerSingleton(bloc);
    Get.config(
      defaultGlobalState: true,
    );
    Get.testMode = true;
  });

  Future<void> pumpWidget(
    WidgetTester tester,
  ) async {
    bloc.onTap(12);
    await tester.pumpWidget(GetMaterialApp(
      home: ImageDetailScreen(),
    ));
    await tester.pumpAndSettle();
  }

  testWidgets("testing grid image screen with copy right attribute",
      (WidgetTester tester) async {
    await pumpWidget(tester);

    final heroWidget = find.byType(Hero);
    expect(heroWidget, findsOneWidget);

    final textWigets = find.byType(Text);
    expect(textWigets, findsNWidgets(4));
  });
}
